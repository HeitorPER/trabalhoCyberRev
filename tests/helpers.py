"""Shared helpers for experiments and tests (run inside the isolated container)."""
import hashlib
import math
import os
import struct
import subprocess
import sys
import tempfile
import zlib

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

import png2_decode  # noqa: E402

PNG2 = os.path.join(ROOT, "inputs", "png2")
PNG2_FULL = os.path.join(ROOT, "build", "png2-full-patched")
PNG2_NAIVE = os.path.join(ROOT, "build", "png2-naive-sizepatch")


def ppm_bytes(img):
    """P3 ASCII PPM, the same layout `convert -compress none` produces (no comments)."""
    h, w, _ = img.shape
    vals = img.reshape(-1).tolist()
    lines = [" ".join(map(str, vals[i:i + 12])) for i in range(0, len(vals), 12)]
    return ("P3\n%d %d\n255\n" % (w, h) + "\n".join(lines) + "\n").encode()


def run_encoder(ppm, binary=PNG2):
    """Encode PPM bytes with the binary; returns (returncode, stdout, png2 bytes or None)."""
    with tempfile.TemporaryDirectory() as d:
        src, dst = os.path.join(d, "in.ppm"), os.path.join(d, "out.png2")
        with open(src, "wb") as f:
            f.write(ppm)
        p = subprocess.run([binary, "encode", src, dst], capture_output=True, timeout=600)
        out = open(dst, "rb").read() if os.path.exists(dst) else None
        return p.returncode, p.stdout.decode(errors="replace"), out


def encode(img, binary=PNG2):
    rc, msg, out = run_encoder(ppm_bytes(img), binary)
    assert rc == 0 and out, f"encoder failed rc={rc}: {msg}"
    return out


def raw_stream(png2):
    """Inflated IDAT payload (filter bytes + residuals) of a png2 file."""
    chunks = png2_decode.read_chunks(png2)
    return zlib.decompress(b"".join(b for t, b in chunks if t == b"IDAT"))


def sha(b):
    return hashlib.sha256(b).hexdigest()


# ------------------------------------------------------------------ reference encoder
# Independent re-implementation of the encoder's filtering stage (0x17f0 / 0x19d0),
# used only to prove the SPEC's description of the filter-selection heuristic is exact.
TYPE_BYTES = [0xE0, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0x01, 0x02, 0x00]


def _shift(a, k):
    out = np.zeros_like(a)
    if k < len(a):
        out[k:] = a[:len(a) - k]
    return out


def filter_row(idx, cur, prev):
    X = cur.astype(np.int64)
    L1, L2, L3 = _shift(X, 1), _shift(X, 2), _shift(X, 3)
    U = prev.astype(np.int64) if prev is not None else np.zeros_like(X)
    UL = _shift(U, 1)
    r = [X ^ L1, X ^ U, X ^ L1 ^ U ^ UL, X - L2, X - L3,
         X ^ L2, X ^ L3, X ^ L1 ^ L2 ^ L3, X - L1, X - U, X][idx] & 0xFF
    cost = int(np.where(r > 127, 256 - r, r).sum())
    return r.astype(np.uint8), cost


def ref_filtered_stream(img):
    n = img.shape[0]
    x, y = png2_decode.hilbert_d2xy(n, np.arange(n * n))
    seq = img[y, x].reshape(n, n, 3)
    counts = [0] * 11
    out = bytearray()
    for row in range(n):
        prev = seq[row - 1] if row else None
        mn = min(counts)
        best, best_i = 2 ** 64 - 1, 0
        for i in range(11):
            _, cost = filter_row(i, seq[row], prev)
            score = int(float(cost) * math.pow(1.01, float(counts[i] - mn)))
            if score < best:
                best, best_i = score, i
        counts[best_i] += 1
        res, _ = filter_row(best_i, seq[row], prev)
        out.append(TYPE_BYTES[best_i])
        out += res.tobytes()
    return bytes(out)


def ref_encode(img):
    """Full reference encoder producing a PNG2 file (zlib level 6 like compress())."""
    n = img.shape[0]

    def chunk(t, body):
        return struct.pack(">I", len(body)) + t + body + struct.pack(">I", zlib.crc32(t + body))

    ihdr = struct.pack(">IIBBBBB", n, n, 8, 2, 0, 0xC0, 0xDE)
    return (png2_decode.SIGNATURE + chunk(b"IHDR", ihdr)
            + chunk(b"IDAT", zlib.compress(ref_filtered_stream(img), 6)) + chunk(b"IEND", b""))
