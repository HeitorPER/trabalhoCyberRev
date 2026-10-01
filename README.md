# PNG2: engenharia reversa (Google CTF 2023, `rev-png2`)

Engenharia reversa do encoder `png2`, um ELF64 que converte imagens PPM para um formato
"PNG 2.0" próprio e não traz decoder ("Please buy PNG 2.0 Pro…"). O objetivo foi documentar o
formato, escrever um decoder independente e recuperar a imagem de `flag.png2`.

**Resultado:** `flag.png2` (1024×1024) foi decodificado em [`flag_decoded.png`](flag_decoded.png).
Para provar que o decoder está correto, a imagem decodificada foi recodificada com uma cópia
patcheada do binário, e a saída é **idêntica byte a byte** a `flag.png2`.

## O formato em resumo

```
PPM P3 (n×n, n = 2^k)
  → permutação dos pixels pela curva de Hilbert
  → a sequência é cortada em n linhas; cada linha usa 1 de 11 filtros (XOR/subtração com vizinhos)
  → zlib compress() de tudo  → um único chunk IDAT
Arquivo = assinatura PNG + IHDR + IDAT + IEND (chunks no estilo PNG, com CRC-32)
```

O IHDR marca o formato com `filter = 0xC0` e `interlace = 0xDE`, valores que não existem no PNG.
A especificação completa, com endereços e evidências para cada afirmação, está em
[SPEC.md](SPEC.md).

## Estrutura do repositório

| Caminho | Conteúdo |
|---|---|
| [SPEC.md](SPEC.md) | Especificação do formato PNG2 (contêiner, filtros, curva de Hilbert, algoritmo do decoder) |
| [NOTES.md](NOTES.md) | Diário da análise: proveniência, funções identificadas, hipóteses descartadas, patches |
| [png2_decode.py](png2_decode.py) | Decoder independente em Python + NumPy (não chama o binário) |
| [flag_decoded.png](flag_decoded.png) | Imagem recuperada de `flag.png2` |
| [inputs/](inputs/) | Arquivos originais do desafio: `png2` (encoder) e `flag.png2` |
| [build/](build/) | Cópias patcheadas do binário (geradas por `tools/patch_png2.py`) |
| [analysis/](analysis/) | Disassembly (`objdump`), dados de `.data`/`.rodata`, relocações e o log dos experimentos |
| [tools/](tools/) | `patch_png2.py` (gera as cópias em `build/`) e `experiments.py` (experimentos E1–E11) |
| [tests/](tests/) | Suíte `pytest`: round-trip, permutação, filtros, validação do contêiner, flag |
| [demo/](demo/) | Scripts curtos para demonstrar o decoder |
| [docker/](docker/) | `Dockerfile` do ambiente isolado de análise |
| [dr.sh](dr.sh) | Roda um comando dentro do container, sem rede |

## Ambiente

O binário do desafio só é executado dentro de um container Docker (Ubuntu 22.04) com
`--network none`, montando apenas esta pasta.

```sh
docker build -t png2re docker/
./dr.sh "python3 -m pytest -q tests"
```

> `dr.sh` tem o caminho da pasta de trabalho fixo (`C:/Users/heito/Desktop/trabalhoCyberRev`).
> Ajuste-o se o repositório estiver em outro lugar.

O decoder sozinho não depende do binário e roda fora do container; só precisa de Python 3,
`numpy` e `Pillow`.

## Uso

### Decodificar um arquivo PNG2

```sh
python3 png2_decode.py inputs/flag.png2 flag_decoded.png
# decoded 1024x1024 -> flag_decoded.png
```

O decoder valida assinatura, CRC de cada chunk, campos do IHDR, tamanho após o inflate e o byte de
filtro de cada linha. Um arquivo corrompido gera uma mensagem de erro e código de saída 1.

### Gerar as cópias patcheadas

```sh
./dr.sh "python3 tools/patch_png2.py"
```

O build distribuído limita imagens a 128×128. Duas cópias são criadas em `build/` (o original
nunca é alterado, o script confere o hash antes e depois):

* `png2-naive-sizepatch`: só eleva o limite para 1024. Mostra que isso **não basta**: acima de
  128 a saída é lixo, por causa de truncamentos para 8/16 bits no código.
* `png2-full-patched`: eleva o limite e alarga esses 11 pontos para 32 bits, emulando o build
  `-DFULLSIZE` usado para gerar a flag. Para n ≤ 128 é byte-idêntica ao original.

Os patches estão tabelados em [NOTES.md §4](NOTES.md).

### Experimentos e testes

```sh
./dr.sh "python3 tools/experiments.py"     # E1–E11; saída de referência em analysis/experiments.log
./dr.sh "python3 -m pytest -q tests"
```

Os testes cobrem, entre outros:

* `decode(encode(img)) == img` para vários tamanhos (1 a 128 com o original; 256, 512 e 1024 com a
  cópia patcheada), cores únicas, gradientes e ruído;
* a ordem de Hilbert (pixel aceso em cada posição de um 8×8, bijeção e continuidade da curva);
* um encoder de referência em Python que reproduz byte a byte o stream do binário;
* detecção de corrupção (CRC, IHDR inválido, byte de filtro inválido, zlib quebrado);
* que o decoder nunca chama o binário;
* a decodificação de `flag.png2` e a recodificação idêntica.

### Demonstração rápida

```sh
python3 demo/gerar_ppm.py 64                                # cria demo/teste.ppm aleatório
./dr.sh "inputs/png2 encode demo/teste.ppm demo/teste.png2" # codifica com o binário original
python3 png2_decode.py demo/teste.png2 demo/teste.png       # decodifica
python3 demo/comparar.py                                    # pixels identicos: True

python3 demo/corromper.py                                   # inverte 1 bit dentro do IDAT
python3 png2_decode.py demo/corrompido.png2 x.png           # error: CRC mismatch ...

./dr.sh "python3 demo/reencode_flag.py"                     # identicos byte a byte: True
```

## Metodologia

* Os arquivos do desafio vieram do `sajjadium/ctf-archives`, e os SHA-256 são conferidos pelos
  testes. Não foram consultados writeups nem o repositório oficial do Google CTF.
* Análise estática feita só com `objdump`. Cada hipótese foi confirmada ou descartada com
  experimentos de caixa-preta; as descartadas estão registradas em [NOTES.md §3](NOTES.md).

| Arquivo | SHA-256 |
|---|---|
| `inputs/png2` | `ed27d3379f00d6253c40f691f0b2efac05e5f52b44311e0178c7393eb04ed3c7` |
| `inputs/flag.png2` | `dc356fd0b7f636d4e8d3373b495954bc97e40dd5416bf1a65d3384b26ef0fced` |
