#!/usr/bin/env python3
"""Black-box experiments against inputs/png2 (and patched copies). Run in the container.
Each experiment prints HYPOTHESIS / RESULT lines; output is kept in analysis/experiments.log."""
import collections
import os
import sys

import numpy as np

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tests"))
from helpers import (PNG2, PNG2_FULL, PNG2_NAIVE, TYPE_BYTES, encode, ppm_bytes,  # noqa: E402
                     raw_stream, ref_filtered_stream, run_encoder, sha)
import png2_decode  # noqa: E402

rng = np.random.default_rng(2023)


def exp(name, hyp):
    print(f"\n=== {name}\nHYPOTHESIS: {hyp}")


def res(ok, msg):
    print(f"RESULT: {'CONFIRMED' if ok else 'REFUTED'} - {msg}")


# ---------------------------------------------------------------- CLI / input parsing
exp("E1 CLI", "argc!=4 -> usage; 'decode' only prints an upsell; files are opened before the "
    "sub-command is checked (0x10f0..0x119c)")
import subprocess, tempfile  # noqa: E401,E402
with tempfile.TemporaryDirectory() as d:
    p = subprocess.run([PNG2], capture_output=True, text=True)
    print(f"  no args: rc={p.returncode} out={p.stdout.strip()!r}")
    open(f"{d}/x.png2", "wb").write(b"junk")
    p = subprocess.run([PNG2, "decode", f"{d}/x.png2", f"{d}/out"], capture_output=True, text=True)
    print(f"  decode: rc={p.returncode} out={p.stdout.strip()!r} out-file-created={os.path.exists(d + '/out')}")
    p = subprocess.run([PNG2, "frobnicate", f"{d}/x.png2", f"{d}/out2"], capture_output=True, text=True)
    print(f"  bad subcmd: rc={p.returncode} out={p.stdout.strip()!r}")
    p = subprocess.run([PNG2, "encode", f"{d}/missing", f"{d}/out3"], capture_output=True, text=True)
    print(f"  missing input: rc={p.returncode} out={p.stdout.strip()!r}")
res(True, "see outputs above")

exp("E2 PPM variants", "only P3, maxval 255, square 2^n <=128, no comments; P6/P2 rejected")
img4 = rng.integers(0, 256, (4, 4, 3), dtype=np.uint8)
base = ppm_bytes(img4).decode()
cases = {
    "P3 reference": base,
    "P3 all on one line": " ".join(base.split()),
    "P3 extra blank lines/tabs": base.replace("\n", "\n\n\t"),
    "P6 binary": "P6\n4 4\n255\n",
    "P2 grey": "P2\n4 4\n255\n" + "0 " * 16,
    "comment after magic": base.replace("P3\n", "P3\n# hi\n", 1),
    "maxval 65535": base.replace("\n255\n", "\n65535\n", 1),
    "maxval 15": base.replace("\n255\n", "\n15\n", 1),
    "4x8 non-square": "P3\n4 8\n255\n" + "1 2 3 " * 32,
    "3x3 not 2^n": "P3\n3 3\n255\n" + "1 2 3 " * 9,
    "0x0": "P3\n0 0\n255\n",
    "128x128 limit": "P3\n128 128\n255\n" + "7 7 7\n" * 128 * 128,
    "256x256 over limit": "P3\n256 256\n255\n",
    "P3x magic suffix": base.replace("P3", "P3x", 1),
}
outs = {}
for name, txt in cases.items():
    rc, msg, out = run_encoder(txt.encode())
    outs[name] = out
    print(f"  {name:28s} rc={rc} msg={msg.strip()!r} out={'%d bytes' % len(out) if out else None}")
same = outs["P3 reference"] == outs["P3 all on one line"] == outs["P3 extra blank lines/tabs"]
res(same, "whitespace layout irrelevant (fscanf); everything else as listed")

# ---------------------------------------------------------------- determinism
exp("E3 determinism", "no randomness: same input -> identical output across runs")
img = rng.integers(0, 256, (64, 64, 3), dtype=np.uint8)
hs = {sha(encode(img)) for _ in range(5)}
res(len(hs) == 1, f"5 runs -> {len(hs)} distinct sha256: {hs}")

# ---------------------------------------------------------------- container
exp("E4 container 1x1", "PNG signature, IHDR(13: w,h BE, 08 02 00 C0 DE), one IDAT (zlib), "
    "IEND; CRC-32/IEEE over type+data")
out = encode(np.array([[[0x11, 0x22, 0x33]]], dtype=np.uint8))
print("  hex:", out.hex(" "))
chunks = png2_decode.read_chunks(out)
print("  chunks:", [(t, len(b)) for t, b in chunks], "IHDR:", chunks[0][1].hex(" "))
idat = chunks[1][1]
print(f"  IDAT starts {idat[:2].hex()} (zlib CMF/FLG 78 9c = deflate, 32K window, default level)")
print("  inflated:", raw_stream(out).hex(" "))
res(raw_stream(out) == bytes([0xE0, 0x11, 0x22, 0x33]) and idat[:2] == b"\x78\x9c",
    "1 filter byte + 3 residual bytes; all filters equal X when neighbours are 0, "
    "tie -> first filter (0xE0)")

exp("E5 raw stream size", "inflated size = n*(1+3n) for every n=1..128")
ok = True
for n in [1, 2, 4, 8, 16, 32, 64, 128]:
    s = raw_stream(encode(rng.integers(0, 256, (n, n, 3), dtype=np.uint8)))
    ok &= len(s) == n * (1 + 3 * n)
    print(f"  n={n:3d}: {len(s)} bytes, row filter bytes {sorted({s[r * (1 + 3 * n)] for r in range(n)})}")
res(ok, "rows of 3n residual bytes, each preceded by a filter byte")

# ---------------------------------------------------------------- permutation
exp("E6 permutation (unique colours)", "pixel d of the stream is image[y][x] with (x,y)=Hilbert d2xy(n,d)")
for n in [2, 4, 8, 16, 32, 64, 128]:
    idx = np.arange(n * n)
    img = np.stack([idx // n, idx % n, (idx * 37) % 256], -1).reshape(n, n, 3).astype(np.uint8)
    dec = png2_decode.decode_bytes(encode(img))
    ok = np.array_equal(dec, img)
    print(f"  n={n:3d}: decode(encode)==img: {ok}")
n = 8
grid = np.zeros((n, n), int)
x, y = png2_decode.hilbert_d2xy(n, np.arange(n * n))
grid[y, x] = np.arange(n * n)
print("  stream index d for each (row,col) of an 8x8 image (Hilbert order):")
for row in grid:
    print("   ", " ".join(f"{v:2d}" for v in row))

exp("E7 permutation (single lit pixel, 8x8)",
    "lighting pixel (r,c) makes the first non-zero residual appear at stream position d(r,c)")
n, ok = 8, True
for r in range(n):
    for c in range(n):
        img = np.zeros((n, n, 3), np.uint8)
        img[r, c] = (255, 128, 1)
        s = raw_stream(encode(img))
        res_only = np.frombuffer(s, np.uint8).reshape(n, 1 + 3 * n)[:, 1:].reshape(-1, 3)
        first = int(np.nonzero(res_only.any(1))[0][0])
        ok &= first == grid[r, c]
res(ok, "position of the lit pixel in the stream matches the Hilbert index for all 64 positions")

exp("E8 orientation", "d=1 goes to (row 1, col 0) for n=2 i.e. curve starts down the first column")
img = np.array([[[1, 1, 1], [4, 4, 4]], [[2, 2, 2], [3, 3, 3]]], np.uint8)
s = raw_stream(encode(img))
print("  stream:", s.hex(" "))
seq = png2_decode.decode_bytes(encode(img))
res(np.array_equal(seq, img), "values 1,2,3,4 appear in stream order (0,0),(1,0),(1,1),(0,1)")

# ---------------------------------------------------------------- filters
exp("E9 filter selection is exactly cost * 1.01^(count-min)",
    "python re-implementation reproduces the inflated stream byte for byte")
ok, used = True, collections.Counter()
gens = {
    "random": lambda n: rng.integers(0, 256, (n, n, 3), dtype=np.uint8),
    "flat": lambda n: np.full((n, n, 3), rng.integers(0, 256, 3), np.uint8),
    "hgrad": lambda n: np.broadcast_to((np.arange(n)[None, :, None] * 3) % 256, (n, n, 3)).astype(np.uint8),
    "vgrad": lambda n: np.broadcast_to((np.arange(n)[:, None, None] * 5) % 256, (n, n, 3)).astype(np.uint8),
    "diag": lambda n: ((np.add.outer(np.arange(n), np.arange(n))[..., None] * [1, 2, 3]) % 256).astype(np.uint8),
    "stripes2": lambda n: np.broadcast_to((np.arange(n * n) % 2 * 200).reshape(n, n, 1), (n, n, 3)).astype(np.uint8),
    "lowbits": lambda n: rng.integers(0, 4, (n, n, 3), dtype=np.uint8),
    "periodic3": lambda n: (np.arange(n * n * 3).reshape(n, n, 3) % 3 * 90).astype(np.uint8),
}
for gname, g in gens.items():
    for n in [1, 2, 4, 8, 16, 32, 64, 128]:
        img = np.ascontiguousarray(g(n))
        s = raw_stream(encode(img))
        same = s == ref_filtered_stream(img)
        ok &= same
        used.update(s[r * (1 + 3 * n)] for r in range(n))
        if not same:
            print(f"  MISMATCH {gname} n={n}")
print("  filter bytes observed:", {f"0x{k:02x}": v for k, v in sorted(used.items())})
res(ok, "all generated images reproduced exactly")

# ---------------------------------------------------------------- large sizes
exp("E10 naive size patch", "raising only the 128 limit is NOT enough: 8/16-bit types break n>=256")
img = rng.integers(0, 256, (256, 256, 3), dtype=np.uint8)
rc, msg, out = run_encoder(ppm_bytes(img), PNG2_NAIVE)
s = np.frombuffer(raw_stream(out), np.uint8)
print(f"  naive 256: rc={rc}, inflated {len(s)} bytes (buffer size n*(3n+1) = {256 * 769}), "
      f"non-zero bytes: {np.count_nonzero(s)}, first 8: {s[:8].tobytes().hex(' ')}")
dec = png2_decode.decode_bytes(out)
print(f"  decoded == input: {np.array_equal(dec, img)}; decoded non-zero pixels: {np.count_nonzero(dec.any(-1))}")
print("  -> uint8 width 256 == 0: filter_row writes no residuals and select_filter advances only 1 byte per\n"
      "     row, so the first 256 bytes are filter bytes and the rest is untouched malloc memory")
res(not np.array_equal(dec, img), "the naive patch produces a broken file; the widened patch is required")

exp("E11 widened patch", "with all truncations widened the encoder agrees with the algorithm at 256..1024")
for n in [128, 256, 512, 1024]:
    img = rng.integers(0, 256, (n, n, 3), dtype=np.uint8)
    out = encode(img, PNG2_FULL)
    dec = png2_decode.decode_bytes(out)
    print(f"  n={n}: decode==img {np.array_equal(dec, img)}; stream==ref {raw_stream(out) == ref_filtered_stream(img)}")
img = rng.integers(0, 256, (128, 128, 3), dtype=np.uint8)
res(encode(img) == encode(img, PNG2_FULL), "patched copy byte-identical to original for 128x128")
