"""Cria demo/corrompido.png2: copia do flag.png2 com 1 bit trocado dentro do IDAT."""
import os
d = os.path.dirname(__file__)
data = bytearray(open(os.path.join(d, "..", "inputs", "flag.png2"), "rb").read())
data[100] ^= 1
open(os.path.join(d, "corrompido.png2"), "wb").write(data)
print("demo/corrompido.png2 criado (bit 0 do byte 100 invertido)")
