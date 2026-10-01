"""Gera demo/teste.ppm: imagem P3 aleatoria NxN (padrao 64)."""
import os, sys
import numpy as np
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tests"))
from helpers import ppm_bytes
n = int(sys.argv[1]) if len(sys.argv) > 1 else 64
img = np.random.default_rng(1).integers(0, 256, (n, n, 3), dtype=np.uint8)
open(os.path.join(os.path.dirname(__file__), "teste.ppm"), "wb").write(ppm_bytes(img))
print(f"demo/teste.ppm gerado ({n}x{n})")
