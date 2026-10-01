"""Prova: recodificar flag_decoded.png com a copia patcheada reproduz flag.png2 byte a byte."""
import os, sys
import numpy as np
from PIL import Image
root = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
sys.path.insert(0, os.path.join(root, "tests"))
from helpers import PNG2_FULL, encode, sha
img = np.array(Image.open(os.path.join(root, "flag_decoded.png")).convert("RGB"))
out = encode(img, PNG2_FULL)
flag = open(os.path.join(root, "inputs", "flag.png2"), "rb").read()
print("sha256 recodificado:", sha(out))
print("sha256 flag.png2   :", sha(flag))
print("identicos byte a byte:", out == flag)
