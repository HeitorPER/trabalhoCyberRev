# Diário da análise: PNG2 (Google CTF 2023, rev-png2)

## 0. Proveniência e ambiente
* `inputs/png2` e `inputs/flag.png2` baixados de `sajjadium/ctf-archives` @ `4152fe44…`,
  `ctfs/GoogleCTF/2023/rev/PNG2`. SHA-256 conferidos antes de qualquer outra coisa (ambos batem;
  `test_input_hashes` repete a checagem).
* Nada do repositório `google/google-ctf` nem writeups foram consultados.
* Toda execução do ELF roda em container Docker `png2re` (Ubuntu 22.04, `docker/Dockerfile`) com
  `--network none`, montando só a pasta de trabalho (`dr.sh`). Análise estática com `objdump`
  (`analysis/png2.asm`, `analysis/png2_raw.asm`, `analysis/data.txt`), sem Ghidra ou r2.

## 1. Reconhecimento
* ELF64 PIE stripped, GCC 12.2 (Debian). Importa `fscanf, fopen, fwrite, malloc, strcmp, printf,
  puts, fclose` (libc), `compress, compressBound` (zlib) e `pow` (libm).
* Strings: `encode`/`decode`, as mensagens de erro do PPM, `IHDR`, `IDAT`, `IEND`.
* `flag.png2` parece um PNG: IHDR 1024×1024, 8 bits, RGB, mas filter=`0xC0` e interlace=`0xDE`.

## 2. Funções (nomes dados por mim)
| Endereço | Nome | Papel |
|---|---|---|
| 0x10f0 | `main` | argc, fopen ×2, `encode` → 0x1c00, `decode` → upsell |
| 0x1c00 | `encode` | parse PPM, Hilbert inline, loop de linhas, escrita dos chunks |
| 0x1680 | `write_chunk` | len BE + tipo + dados + CRC-32 (tabela preguiçosa inline) |
| 0x19d0 | `select_filter` | testa os 11 filtros, custo × 1.01^(uso-min), grava o melhor |
| 0x17f0 | `filter_row` | aplica um filtro a uma linha e devolve a soma de \|resíduo\| |
| 0x12c0–0x1360 | `f_none … f_xor_l123` | os 11 preditores (1–3 instruções cada) |
| 0x1370 / 0x1410 / 0x1500 | `crc_init` / `crc_update` / `crc32` | **código morto** (não há `call`) |
| 0x15f0 | `hilbert_d2xy` | **código morto**; a versão usada está inline em 0x1e30 |
| `.data` 0x5070 / 0x5080 | `filter_type[11]` / `filter_fn[11]` | tabelas paralelas |
| `.bss` 0x5920 | `filter_count[11]` (u64) | estado global da heurística |
| `.bss` 0x5120 / 0x5100 | `crc_table[256]` / `crc_table_ready` | |

## 3. Hipóteses, incluindo as descartadas
* **H: o 0x1c80 lê altura e largura nessa ordem.** Irrelevante, porque precisam ser iguais.
* **H: a permutação é Z-order/Morton** (comum em "interlace" caseiro). *Descartada*: o loop inline
  tem o par flip/swap condicionado a `rx`/`ry`, que é o `d2xy` de Hilbert. E6/E7 confirmam.
* **H: x = `edi`.** *Descartada*: o ramo `ry==1` soma `s` em `edi` e o `rx==1` soma em `r9d`,
  então `r9d = x` e `edi = y`, e o índice é `(y<<k)|x`. E8 (2×2) confirma a orientação.
* **H: o filtro é escolhido por pixel ou por bloco.** *Descartada*: um byte de tipo a cada `3n+1`
  bytes (E5) e um único `call filter_row` final por linha.
* **H: a heurística é o "minimum sum of absolute differences" do PNG.** Quase: o custo é esse
  mesmo, mas multiplicado por `pow(1.01, count[i]-min(count))`, uma penalidade para filtros muito
  usados. Confirmado por reprodução byte a byte (E9).
* **H: a ordem de emissão dos canais é B,G,R** (o pixel é `r<<16|g<<8|b` em little endian).
  *Descartada*: o deslocamento começa em 16 e cai para 0, então a ordem é R,G,B (E4: `e0 11 22 33`).
* **H: basta trocar `0x80` por `0x400` para codificar 1024.** *Descartada*, ver E10 e a seção 4.
* **H: o FULLSIZE poderia ter mantido `t` em 16 bits**, o que daria uma curva "quebrada" acima de
  256. *Descartada pelos dados*: com a curva correta, `flag.png2` recodifica byte a byte.

## 4. Patch aplicado (só em cópias; `tools/patch_png2.py`)
O original `inputs/png2` nunca é escrito (o script confere o hash antes e depois). Offsets são de
arquivo (= VA em `.text`).

**`build/png2-naive-sizepatch`** (só o limite):

| Offset | Original | Novo | Instrução |
|---|---|---|---|
| 0x1c9f | `49 81 fd 80 00 00 00` | `49 81 fd 00 04 00 00` | `cmp r13,0x80` → `cmp r13,0x400` |

Resultado (E10): para 256×256 sai um arquivo "válido" que decodifica para lixo. `uint8(256) = 0`,
então `filter_row` não grava resíduos e cada linha avança 1 byte. O `compress` comprime o buffer
inteiro do `malloc`, por isso o tamanho até parece certo.

**`build/png2-full-patched`** (limite + alargamento para 32 bits, emulando `-DFULLSIZE`):

| Offset | Original | Novo | Efeito |
|---|---|---|---|
| 0x1c9f | `49 81 fd 80 00 00 00` | `49 81 fd 00 04 00 00` | limite 1024 |
| 0x1e33 | `41 80 fb 01` | `41 83 fb 01` | `cmp r11b,1` → `cmp r11d,1` |
| 0x1e5f | `66 c1 e9 02` | `c1 e9 02 90` | `shr cx,2` → `shr ecx,2` |
| 0x1e63 | `44 38 da` | `44 39 da` | `cmp dl,r11b` → `cmp edx,r11d` |
| 0x1e88 | `66 c1 e9 02` | `c1 e9 02 90` | `shr cx,2` → `shr ecx,2` |
| 0x1e8c | `44 38 da` | `44 39 da` | `cmp dl,r11b` → `cmp edx,r11d` |
| 0x1e91 | `40 0f b6 ff` | `0f 1f 40 00` | remove `movzx edi,dil` (y em 32 bits) |
| 0x1e97 | `45 0f b6 c9` | `0f 1f 40 00` | remove `movzx r9d,r9b` (x em 32 bits) |
| 0x19fe | `40 0f b6 f6` | `0f 1f 40 00` | remove `movzx esi,sil` (largura) |
| 0x1bdd | `0f b6 44 24 1c` | `8b 44 24 1c 90` | avanço `3w+1` com `w` de 32 bits |
| 0x1803 | `40 84 f6` | `85 f6 90` | `test sil,sil` → `test esi,esi` |
| 0x1810 | `40 0f b6 fe` | `89 f7 66 90` | `movzx edi,sil` → `mov edi,esi` |

SHA-256 das cópias: naive `c1323173…a8da`, full `253c53f1…73d5`. O contador de linhas
(`cmp bp,r15w`, 16 bits) e os tamanhos dos `malloc` já comportam 1024 sem alteração. Verificação:
a cópia é byte-idêntica ao original para n ≤ 128 e o decoder reconstrói 256/512/1024 aleatórios.

## 5. Resultado em `flag.png2`
* Estrutura: IHDR/IDAT/IEND com CRCs válidos, inflate = 3 146 752 bytes = 1024·3073, todos os
  1024 bytes de tipo válidos (os 11 tipos aparecem).
* `flag_decoded.png`: 1024×1024 RGB, SHA-256
  `cd502ee73e1f3497d43bf563195d47fa66fec48b8891e614a2ec748963750da7` (PNG gerado pelo Pillow do
  container; o hash depende do encoder PNG, os pixels não).
* Recodificar `flag_decoded.png` com `png2-full-patched` gera exatamente os 1 574 641 bytes de
  `flag.png2` (inclusive o stream zlib).

## 6. Curiosidades e bugs do encoder (não afetam o decoder)
* Saída aberta (truncada) antes de validar o subcomando; `decode` destrói o arquivo de saída.
* Valores de pixel > 255 vazam para o canal vizinho (`r<<16 | g<<8 | b` sem máscara); retornos de
  `fscanf`/`compress` não são checados. Isso vem da leitura do código em 0x1dab–0x1dc8 e 0x202c
  e não foi testado.
* `%4s` aceita `P3x…`.
