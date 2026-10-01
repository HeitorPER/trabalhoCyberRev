"""Compara pixel a pixel demo/teste.ppm (original) com demo/teste.png (decodificado)."""
import os
import numpy as np
from PIL import Image
d = os.path.dirname(__file__)
tok = open(os.path.join(d, "teste.ppm")).read().split()
w, h = int(tok[1]), int(tok[2])
orig = np.array(tok[4:], dtype=np.uint8).reshape(h, w, 3)
dec = np.array(Image.open(os.path.join(d, "teste.png")).convert("RGB"))
print("pixels identicos:", np.array_equal(orig, dec))
