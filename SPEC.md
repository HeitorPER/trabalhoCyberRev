# Especificação do formato PNG2

Derivada exclusivamente da análise estática de `png2` (SHA-256 `ed27d337…3c7`) e de experimentos
de caixa-preta. Endereços são endereços virtuais do ELF (em `.text`, endereço = offset no arquivo).
Experimentos `E1`–`E11` estão em `tools/experiments.py`, com saída em `analysis/experiments.log`;
testes, em `tests/test_png2.py`.

## 1. Visão geral

```
PPM P3 (n×n, n = 2^k)
  └─ pixels em ordem raster  ──►  permutação pela curva de Hilbert  ──►  sequência S[0..n²-1]
       S é cortada em n "linhas" de n pixels; cada linha recebe um filtro (1 de 11) escolhido
       por uma heurística de custo; saída = [tipo do filtro][3n bytes de resíduo] por linha
  └─ zlib compress() do bloco inteiro  ──►  um chunk IDAT
Arquivo = assinatura PNG + IHDR + IDAT + IEND, chunks iguais aos do PNG (len BE, tipo, dados, CRC-32)
```

Para decodificar basta: validar os chunks, fazer o inflate, desfazer o filtro de cada linha (o tipo
está gravado no próprio arquivo, então a heurística de escolha **não** é necessária) e aplicar a
permutação inversa.

## 2. Interface do encoder (para contexto)

| Item | Comportamento | Evidência |
|---|---|---|
| Uso | `png2 encode IN.ppm OUT.png2`. `argc != 4` ou subcomando desconhecido imprime `Usage: %s [encode \| decode] INFILE OUTFILE` e retorna 1 | `main` 0x10f0–0x1180; E1 |
| Ordem | os **dois arquivos são abertos antes** de olhar o subcomando (`rb`/`wb`), então a saída é truncada/criada mesmo em erro | 0x1102–0x1134; E1 (`out-file-created=True`) |
| `decode` | não implementado: imprime "Please buy PNG 2.0 Pro…" e retorna 1 | 0x1181; E1 |
| Magia | `fscanf("%4s")`; só `buf[0]=='P'` e `buf[1]=='3'` são checados (`P3x` também passa); P6/P2 são rejeitados | 0x1c2e–0x1c68; E2 |
| Dimensões | `fscanf("%zu %zu")` → largura, altura. Exige `w == h`, `w != 0`, `w & (w-1) == 0`, senão "Only 2^n by 2^n…" | 0x1c80–0x1c9d; E2 |
| Limite | `w > 0x80` → "Why would you want to process such a large picture?" (build sem `-DFULLSIZE`) | 0x1c9f `cmp r13,0x80`; E2 |
| maxval | `fscanf("%d")` precisa ser 255, senão "This file is not supported." | 0x1cbd–0x1cce; E2 |
| Comentários | não suportados: um `#` faz o `%zu` falhar e cai em "Only 2^n…" | E2 |
| Pixels | `n²` vezes `fscanf("%d %d %d")`, `pix = r<<16 \| g<<8 \| b` (int32, sem clamp e sem checar o retorno do `fscanf`) | 0x1d90–0x1dd4 |
| Espaços | qualquer layout de whitespace dá saída idêntica | E2 |
| Determinismo | sem aleatoriedade; o único estado é o contador global de filtros (zerado no `.bss`) | E3 |

## 3. Contêiner

### 3.1 Layout byte a byte

| Offset | Tam. | Conteúdo |
|---|---|---|
| 0 | 8 | Assinatura `89 50 4E 47 0D 0A 1A 0A` (`movabs rax,0x0a1a0a0d474e5089` em 0x1f85) |
| 8 | 25 | chunk `IHDR` |
| 33 | 12+L | chunk `IDAT` com o stream zlib completo (L bytes) |
| … | 12 | chunk `IEND` (vazio): `00 00 00 00 49 45 4E 44 AE 42 60 82` |

### 3.2 Chunk (função `write_chunk` em 0x1680)

```
u32be length          (bswap em 0x1691; length = só os dados, sem o tipo)
u8[4] type
u8[length] data
u32be crc             CRC-32 sobre type ‖ data
```
CRC: CRC-32 refletido, polinômio `0xEDB88320` (tabela de 256 entradas u64 em `.bss` 0x5120, gerada de
forma preguiçosa em 0x16d8–0x176f, com flag em 0x5100), valor inicial `0xFFFFFFFF`, XOR final
`0xFFFFFFFF` (0x178f, 0x17b1). É o mesmo CRC do PNG/zlib (`zlib.crc32`); E4 e os testes validam o
CRC de todo arquivo gerado.

### 3.3 IHDR (13 bytes; montado em 0x1fa7–0x1fea)

| Offset nos dados | Tam. | Valor | Observação |
|---|---|---|---|
| 0 | 4 | largura (u32be) | `bswap r13d`, duplicado com `pshufd` |
| 4 | 4 | altura (u32be) | sempre igual à largura |
| 8 | 1 | `0x08` | profundidade de bits |
| 9 | 1 | `0x02` | tipo de cor RGB |
| 10 | 1 | `0x00` | compressão (deflate) |
| 11 | 1 | `0xC0` | "filtro": marca o esquema PNG2 (não é um valor PNG válido) |
| 12 | 1 | `0xDE` | "entrelaçamento": marca a permutação de Hilbert (não é PNG válido) |

`mov DWORD [rsp+0x9c],0xc0000208` grava `08 02 00 C0` e `mov BYTE [rsp+0xa0],0xde` grava `DE`.
`flag.png2` traz `00000400 00000400 08 02 00 C0 DE`, ou seja, 1024×1024.

### 3.4 IDAT / compressão

* Tamanho do bloco sem compressão: `n·(3n+1)` bytes (`malloc(3·n² + n)` em 0x1ee0–0x1efc; E5).
* `compress(dest+4, &destLen, src, n·(3n+1))` em 0x202c: formato **zlib** (cabeçalho `78 9C`,
  nível padrão `Z_DEFAULT_COMPRESSION` = 6), **um único stream**, gravado num **único** IDAT com
  `length = destLen` (0x2031). O retorno de `compress` não é checado.
* O decoder deve concatenar os IDATs (só existe um) e fazer o inflate; o resultado tem que ter
  exatamente `n·(3n+1)` bytes.

## 4. Stream filtrado

O bloco descomprimido tem `n` registros de `1 + 3n` bytes:

```
registro r (0 ≤ r < n):  [ftype][R0 G0 B0][R1 G1 B1] … [R(n-1) G(n-1) B(n-1)]   (resíduos)
```

O registro `r` codifica os pixels `S[r·n … r·n+n-1]` da sequência permutada (seção 5); `prev` é o
registro `r-1` **já decodificado** (os valores originais, não os resíduos), inexistente para `r=0`.
O loop de linhas fica em 0x1f30–0x2084 (`cur = perm + (r<<k)`, `prev = perm + ((r-1)<<k)` e `NULL`
na linha 0).

### 4.1 Vizinhos (função `filter_row`, 0x17f0)

Para o pixel `i` do registro, em cada canal `c ∈ {R,G,B}` (byte do canal = `(pix >> sh) & 0xFF`,
com `sh = 16, 8, 0`, nessa ordem de emissão, 0x1883–0x18f7):

| Nome | Valor | Fora da borda |
|---|---|---|
| X  | `cur[i]` | – |
| L1 | `cur[i-1]` | 0 se `i < 1` |
| L2 | `cur[i-2]` | 0 se `i < 2` |
| L3 | `cur[i-3]` | 0 se `i < 3` |
| U  | `prev[i]` | 0 se não há `prev` (registro 0) |
| UL | `prev[i-1]` | 0 se `i = 0` ou não há `prev` |

Evidência: 0x1830–0x1876 e os casos de borda em 0x1950–0x19b9. Os canais são independentes; não
há interação entre canais.

### 4.2 Os 11 filtros

Tabelas paralelas em `.data`: tipos em 0x5070 (`e0 e1 e2 e3 e4 e5 e6 e7 01 02 00`) e ponteiros de
função em 0x5080. Cada função recebe `(X, L1, U, UL, L2, L3)` em
`(edi, esi, edx, ecx, r8d, r9d)` e o resultado é truncado para byte (`mov [rbp],al`, 0x18df).

| idx | tipo | função | resíduo `r` | inversão (decoder), tudo mod 256 |
|---|---|---|---|---|
| 0 | `0xE0` | 0x12f0 | `X ^ L1` | `X = r ^ L1` |
| 1 | `0xE1` | 0x1300 | `X ^ U` | `X = r ^ U` |
| 2 | `0xE2` | 0x1310 | `X ^ L1 ^ U ^ UL` | `X = r ^ L1 ^ U ^ UL` |
| 3 | `0xE3` | 0x1320 | `X - L2` | `X = r + L2` |
| 4 | `0xE4` | 0x1330 | `X - L3` | `X = r + L3` |
| 5 | `0xE5` | 0x1340 | `X ^ L2` | `X = r ^ L2` |
| 6 | `0xE6` | 0x1350 | `X ^ L3` | `X = r ^ L3` |
| 7 | `0xE7` | 0x1360 | `X ^ L1 ^ L2 ^ L3` | `X = r ^ L1 ^ L2 ^ L3` |
| 8 | `0x01` | 0x12d0 | `X - L1` (PNG Sub) | `X = r + L1` |
| 9 | `0x02` | 0x12e0 | `X - U` (PNG Up) | `X = r + U` |
| 10 | `0x00` | 0x12c0 | `X` (PNG None) | `X = r` |

Todos os 11 tipos aparecem em imagens de teste (E5, E9) e em `flag.png2`. Qualquer outro byte de
tipo é inválido.

Pseudocódigo do decodificador de um registro:

```
for i in 0 .. n-1:
    for c in (R, G, B):
        X[i][c] = invert(ftype, r[i][c], L1, L2, L3, U, UL)   # vizinhos com valores já decodificados
```

### 4.3 Escolha do filtro (`select_filter`, 0x19d0). Só o encoder precisa disto

Estado global: `count[11]` (u64, `.bss` 0x5920), iniciado em 0 e mantido durante toda a imagem.

```
for each registro (cur, prev):
    mn = min(count[0..10])                                   # 0x19ec–0x1a90
    best = UINT64_MAX; best_i = 0
    for i in 0..10:
        cost = Σ_canais_e_pixels  (b <= 127 ? b : 256 - b)   # b = byte de resíduo; 0x18dc–0x1944
        score = (uint64)( (double)cost * pow(1.01, (double)(count[i] - mn)) )   # 0x1b01–0x1b59
        if score < best: best = score; best_i = i            # estritamente menor: empate → menor idx
    out[0] = type[best_i]; count[best_i] += 1                # 0x1ba0–0x1bc1
    out[1..3n] = filter_row(fn[best_i])                      # 0x1bd8
```
A constante `1.01` fica em 0x3198 (`0x3FF028F5C28F5C29`) e `2^63` em 0x31a0 (para a conversão
double→u64 com sinal). As conversões u64→double usam a sequência sem sinal do GCC. Um encoder de
referência em Python com esse pseudocódigo reproduz byte a byte o stream do binário em todas as
imagens testadas (E9, 220 imagens aleatórias em `test_random_roundtrip`) e também o stream de
`flag.png2`.

## 5. Permutação espacial: curva de Hilbert

O buffer de pixels lido do PPM está em ordem raster (`src[y·n + x]`, linha `y`, coluna `x`). O
encoder monta `S[d] = src[y·n + x]` com `(x, y) = d2xy(n, d)` para `d = 0 … n²-1` (loop inline em
0x1e30–0x1eb9; uma cópia não usada da mesma rotina está em 0x15f0):

```
d2xy(n, d):                      # n = 2^k
    x = y = 0; t = d; s = 1
    while s < n:
        rx = (t >> 1) & 1
        ry = (t ^ rx) & 1
        if ry == 0:
            if rx == 1:
                x = s-1-x;  y = s-1-y
            swap(x, y)
        x += s*rx;  y += s*ry
        t >>= 2;  s *= 2
    return (x, y)
index = (y << k) | x             # 0x1e91–0x1ea3, k = bsr(n) (0x1e07)
```

Mapeamento de registradores: `r9d = x`, `edi = y`, `edx = s`, `cx = t`. O ramo 0x1ec0 é o
"flip+swap" (`x' = s-1-y, y' = s-1-x`) e 0x1e50 é o "swap". `n = 1` é tratado à parte (0x1e33,
`S[0] = src[0]`).

A curva começa em (0,0), desce pela primeira coluna e termina em (x=n-1, y=0). Ordem para 8×8
(célula = índice `d` do pixel na linha/coluna da imagem; E6):

```
 0  3  4  5 58 59 60 63
 1  2  7  6 57 56 61 62
14 13  8  9 54 55 50 49
15 12 11 10 53 52 51 48
16 17 30 31 32 33 46 47
19 18 29 28 35 34 45 44
20 23 24 27 36 39 40 43
21 22 25 26 37 38 41 42
```

Evidências de caixa-preta: E7 (um pixel aceso em cada uma das 64 posições de um 8×8 aparece no
índice `d` previsto), E6 (imagens com cor única por pixel, n = 2…128, reconstruídas exatamente),
E8 (2×2: ordem (0,0), (1,0), (1,1), (0,1) em coordenadas (linha, coluna)).

### 5.1 Tamanhos não quadrados ou que não são potência de 2

Não existem: o encoder rejeita (E2, `test_encoder_rejects_non_square_non_pow2_or_too_big`). O
decoder também rejeita IHDR com `w ≠ h` ou `w` que não seja potência de 2.

### 5.2 Generalização para 1024×1024

O algoritmo é definido para qualquer `n = 2^k`: o laço roda `k` vezes e só depende de `n` pelo
limite `s < n`. No build distribuído, porém, os **tipos** limitam a 128: `n` é comparado como byte
(`cmp r11b`, `cmp dl,r11b`), `t` é deslocado como 16 bits (`shr cx,2`), `x`/`y` são truncados para
`uint8` (`movzx dil`, `movzx r9b`) e a largura passada às rotinas de filtro é `uint8`
(`movzx esi,sil` 0x19fe, `test sil,sil` 0x1803, `movzx edi,sil` 0x1810,
`movzx eax,byte[rsp+0x1c]` 0x1bdd). Com n=256, `uint8(n) = 0`. O build `-DFULLSIZE` tem que usar
tipos largos, senão não conseguiria gerar um stream válido de 1024. Evidências:

1. Só elevar o limite de 128 (cópia `png2-naive-sizepatch`) gera, para 256×256, um arquivo cujos
   registros vêm vazios (E10). Logo o build FULLSIZE não é "o mesmo código só com outro limite".
2. Com os 11 pontos alargados para 32 bits (cópia `png2-full-patched`, ver NOTES.md), o encoder
   bate com este algoritmo em 256, 512 e 1024 (E11 e `test_large_random_with_patched_copy`), e
   continua byte-idêntico ao original até 128.
3. `flag.png2` descomprime para exatamente `1024·3073` bytes, todos os bytes de tipo de registro
   são válidos e, principalmente, **recodificar a imagem decodificada com a cópia patcheada
   reproduz `flag.png2` byte a byte** (`test_flag_decodes_and_reencodes_identically`).

## 6. Algoritmo completo do decoder

```
1. data[0:8] == 89 50 4E 47 0D 0A 1A 0A, senão erro
2. ler chunks (len BE, tipo, dados, CRC) até IEND; checar CRC-32(tipo‖dados) de cada um;
   erro se truncado, se IEND não estiver vazio ou se houver bytes depois de IEND
3. o primeiro chunk deve ser IHDR (único, 13 bytes); depth/colour/comp/filter/interlace
   = 8/2/0/0xC0/0xDE; w == h, w = 2^k > 0
4. raw = zlib_inflate(concat(IDAT)); len(raw) deve ser w·(3w+1)
5. prev = None
   for r in 0..w-1:
       ftype = raw[r·(3w+1)]  (tem que estar na tabela 4.2)
       cur = desfaz_filtro(ftype, resíduos, prev)    # seção 4
       S[r·w : r·w+w] = cur; prev = cur
6. for d in 0..w²-1: (x, y) = d2xy(w, d); img[y][x] = S[d]
7. gravar img como PNG RGB 8 bits
```

Implementação: `png2_decode.py`. Os filtros que dependem de `L*` viram varreduras vetorizadas:
`XOR`/soma acumulada com passo 1, 2 ou 3. Para `0xE7` usa-se `P_i = X_0 ^ … ^ X_i`, o que dá
`P_i = r_i ^ P_{i-4}` e `X_i = P_i ^ P_{i-1}`.
