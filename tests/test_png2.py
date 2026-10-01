"""pytest suite: decode(encode(img)) == img, container validation, permutation, filters, large sizes.

Run inside the isolated container:  python3 -m pytest -q tests
"""
import ast
import hashlib
import os
import re
import struct
import zlib

import numpy as np
import pytest
from PIL import Image

from conftest import INPUT_SHA
from helpers import (ROOT, encode, png2_decode, ppm_bytes, raw_stream, ref_encode,
                     ref_filtered_stream, run_encoder)

decode = png2_decode.decode_bytes
PNG2Error = png2_decode.PNG2Error
SIZES = [1, 2, 4, 8, 16, 32, 64, 128]


def roundtrip(img, binary=None):
    out = encode(img) if binary is None else encode(img, binary)
    dec = decode(out)
    assert dec.shape == img.shape
    assert np.array_equal(dec, img)
    return out


# ------------------------------------------------------------------ inputs
@pytest.mark.parametrize("name", sorted(INPUT_SHA))
def test_input_hashes(name):
    with open(os.path.join(ROOT, "inputs", name), "rb") as f:
        assert hashlib.sha256(f.read()).hexdigest() == INPUT_SHA[name]


# ------------------------------------------------------------------ step 6: synthetic cases
def test_1x1():
    out = roundtrip(np.array([[[1, 2, 3]]], np.uint8))
    assert raw_stream(out) == bytes([0xE0, 1, 2, 3])


def test_2x2_hilbert_order():
    img = np.array([[[10] * 3, [40] * 3], [[20] * 3, [30] * 3]], np.uint8)
    roundtrip(img)


@pytest.mark.parametrize("n", SIZES)
def test_flat_colour(n):
    roundtrip(np.full((n, n, 3), (200, 17, 99), np.uint8))


@pytest.mark.parametrize("pos", range(64))
def test_single_lit_pixel_8x8(pos):
    img = np.zeros((8, 8, 3), np.uint8)
    img[pos // 8, pos % 8] = (255, 128, 1)
    roundtrip(img)


@pytest.mark.parametrize("n", SIZES)
@pytest.mark.parametrize("kind", ["h", "v", "diag"])
def test_gradients(n, kind):
    i, j = np.meshgrid(np.arange(n), np.arange(n), indexing="ij")
    base = {"h": j * 7, "v": i * 5, "diag": i + j * 3}[kind]
    img = (np.stack([base, base * 2, base * 3 + 11], -1) % 256).astype(np.uint8)
    roundtrip(img)


@pytest.mark.parametrize("n", SIZES)
def test_noise(n):
    roundtrip(np.random.default_rng(n).integers(0, 256, (n, n, 3), dtype=np.uint8))


@pytest.mark.parametrize("n", SIZES)
def test_unique_colours_reveal_permutation(n):
    idx = np.arange(n * n)
    roundtrip(np.stack([idx // n, idx % n, idx * 37], -1).reshape(n, n, 3).astype(np.uint8))


@pytest.mark.parametrize("w,h", [(1, 4), (4, 1), (1, 8), (8, 1), (3, 3), (5, 5), (7, 7),
                                 (4, 8), (8, 4), (6, 6), (0, 0), (256, 256)])
def test_encoder_rejects_non_square_non_pow2_or_too_big(w, h):
    rc, msg, out = run_encoder(("P3\n%d %d\n255\n" % (w, h) + "1 2 3\n" * (w * h)).encode())
    assert rc == 1 and out in (None, b"")
    assert "supported" in msg or "large picture" in msg


def test_encoder_deterministic():
    img = np.random.default_rng(7).integers(0, 256, (64, 64, 3), dtype=np.uint8)
    assert len({encode(img) for _ in range(3)}) == 1


def test_128x128():
    roundtrip(np.random.default_rng(128).integers(0, 256, (128, 128, 3), dtype=np.uint8))


# ------------------------------------------------------------------ >= 200 random images
def _random_image(seed):
    rng = np.random.default_rng(1000 + seed)
    n = int(rng.choice(SIZES))
    kind = seed % 4
    if kind == 0:
        return rng.integers(0, 256, (n, n, 3), dtype=np.uint8)
    if kind == 1:                       # few colours -> long runs, exercises xor/sub filters
        pal = rng.integers(0, 256, (4, 3), dtype=np.uint8)
        return pal[rng.integers(0, 4, (n, n))]
    if kind == 2:                       # smooth field + noise
        i, j = np.meshgrid(np.arange(n), np.arange(n), indexing="ij")
        f = (np.stack([i * rng.integers(1, 9), j * rng.integers(1, 9), i + j], -1)
             + rng.integers(0, 6, (n, n, 3)))
        return (f % 256).astype(np.uint8)
    return rng.integers(0, 256, (n, n, 3), dtype=np.uint8) & rng.integers(0, 256, 3, dtype=np.uint8)


@pytest.mark.parametrize("seed", range(220))
def test_random_roundtrip(seed):
    img = _random_image(seed)
    out = roundtrip(img)
    # the reference re-implementation of the filter heuristic is byte exact too
    assert raw_stream(out) == ref_filtered_stream(img)


# ------------------------------------------------------------------ step 7: patched copy, large sizes
@pytest.mark.parametrize("n", [256, 512, 1024])
@pytest.mark.parametrize("seed", [0, 1])
def test_large_random_with_patched_copy(patched, n, seed):
    img = np.random.default_rng(n + seed).integers(0, 256, (n, n, 3), dtype=np.uint8)
    if seed == 1:                        # smoother content -> different filter mix
        img = (img // 32 + np.arange(n)[:, None, None]).astype(np.uint8)
    roundtrip(img, patched)


def test_patched_copy_matches_original_up_to_128(patched):
    for n in SIZES:
        img = np.random.default_rng(n).integers(0, 256, (n, n, 3), dtype=np.uint8)
        assert encode(img) == encode(img, patched)


def test_original_untouched():
    with open(os.path.join(ROOT, "inputs", "png2"), "rb") as f:
        assert hashlib.sha256(f.read()).hexdigest() == INPUT_SHA["png2"]


# ------------------------------------------------------------------ permutation as an algorithm
@pytest.mark.parametrize("n", [1, 2, 4, 8, 64, 1024])
def test_hilbert_is_bijective_and_continuous(n):
    x, y = png2_decode.hilbert_d2xy(n, np.arange(n * n))
    assert len(set(zip(x.tolist(), y.tolist()))) == n * n
    assert x.min() >= 0 and y.min() >= 0 and x.max() < n and y.max() < n
    if n > 1:
        assert np.all(np.abs(np.diff(x)) + np.abs(np.diff(y)) == 1)   # unit steps
        assert (x[0], y[0]) == (0, 0) and (x[-1], y[-1]) == (n - 1, 0)


# ------------------------------------------------------------------ container validation
@pytest.fixture(scope="module")
def sample():
    return encode(np.random.default_rng(3).integers(0, 256, (8, 8, 3), dtype=np.uint8))


def _chunk(t, body, crc=None):
    crc = zlib.crc32(t + body) if crc is None else crc
    return struct.pack(">I", len(body)) + t + body + struct.pack(">I", crc)


def _file(ihdr=None, raw=None, n=2):
    ihdr = ihdr if ihdr is not None else struct.pack(">IIBBBBB", n, n, 8, 2, 0, 0xC0, 0xDE)
    raw = raw if raw is not None else bytes([0x00] + [0] * 3 * n) * n
    return (png2_decode.SIGNATURE + _chunk(b"IHDR", ihdr) + _chunk(b"IDAT", zlib.compress(raw))
            + _chunk(b"IEND", b""))


def test_reference_encoder_file_decodes():
    img = np.random.default_rng(5).integers(0, 256, (16, 16, 3), dtype=np.uint8)
    assert np.array_equal(decode(ref_encode(img)), img)


@pytest.mark.parametrize("mutate,msg", [
    (lambda b: b"\x88" + b[1:], "signature"),
    (lambda b: b[:20] + bytes([b[20] ^ 1]) + b[21:], "CRC mismatch in chunk b'IHDR'"),
    (lambda b: b[:45] + bytes([b[45] ^ 0x40]) + b[46:], "CRC mismatch in chunk b'IDAT'"),
    (lambda b: b[:-1] + bytes([b[-1] ^ 1]), "CRC mismatch in chunk b'IEND'"),
    (lambda b: b[:-20], "past end"),
    (lambda b: b[:-12], "truncated"),
    (lambda b: b + b"x", "trailing"),
])
def test_corruption_detected(sample, mutate, msg):
    with pytest.raises(PNG2Error, match=re.escape(msg)):
        decode(mutate(sample))


@pytest.mark.parametrize("ihdr,msg", [
    (struct.pack(">IIBBBBB", 2, 2, 8, 2, 0, 0, 0), "unsupported IHDR"),
    (struct.pack(">IIBBBBB", 2, 2, 16, 2, 0, 0xC0, 0xDE), "unsupported IHDR"),
    (struct.pack(">IIBBBBB", 2, 4, 8, 2, 0, 0xC0, 0xDE), "2\\^n x 2\\^n"),
    (struct.pack(">IIBBBBB", 3, 3, 8, 2, 0, 0xC0, 0xDE), "2\\^n x 2\\^n"),
    (struct.pack(">IIBBBB", 2, 2, 8, 2, 0, 0xC0), "IHDR length"),
])
def test_bad_header(ihdr, msg):
    with pytest.raises(PNG2Error, match=msg):
        decode(_file(ihdr=ihdr))


def test_bad_filter_byte():
    with pytest.raises(PNG2Error, match="unknown filter type 0x03"):
        decode(_file(raw=bytes([0x03] + [0] * 6) * 2))


def test_wrong_inflated_size():
    with pytest.raises(PNG2Error, match="inflated size"):
        decode(_file(raw=bytes(13)))


def test_corrupt_zlib_with_valid_crc():
    f = (png2_decode.SIGNATURE + _chunk(b"IHDR", struct.pack(">IIBBBBB", 2, 2, 8, 2, 0, 0xC0, 0xDE))
         + _chunk(b"IDAT", b"\x78\x9cnot deflate") + _chunk(b"IEND", b""))
    with pytest.raises(PNG2Error, match="zlib"):
        decode(f)


def test_cli_reports_corruption(tmp_path, sample):
    bad = tmp_path / "bad.png2"
    bad.write_bytes(sample[:30] + bytes([sample[30] ^ 0xFF]) + sample[31:])
    import subprocess, sys
    p = subprocess.run([sys.executable, os.path.join(ROOT, "png2_decode.py"), str(bad), str(tmp_path / "o.png")],
                       capture_output=True, text=True)
    assert p.returncode == 1 and "CRC mismatch" in p.stderr and not (tmp_path / "o.png").exists()


# ------------------------------------------------------------------ independence of the decoder
def test_decoder_never_calls_the_binary():
    src = open(os.path.join(ROOT, "png2_decode.py")).read()
    mods = {a.name.split(".")[0] for node in ast.walk(ast.parse(src))
            if isinstance(node, (ast.Import, ast.ImportFrom))
            for a in (node.names if isinstance(node, ast.Import) else [ast.alias(node.module or "")])}
    assert mods <= {"struct", "sys", "zlib", "numpy", "PIL"}, mods
    assert "png2\"" not in src and "subprocess" not in src


# ------------------------------------------------------------------ the challenge file
def test_flag_decodes_and_reencodes_identically(patched, tmp_path):
    flag = open(os.path.join(ROOT, "inputs", "flag.png2"), "rb").read()
    img = decode(flag)
    assert img.shape == (1024, 1024, 3)
    # strongest possible check without the answer key: the patched encoder maps the decoded
    # image back to the exact bytes of flag.png2
    assert encode(img, patched) == flag
    out = tmp_path / "flag.png"
    Image.fromarray(img).save(out)
    assert np.array_equal(np.array(Image.open(out).convert("RGB")), img)
