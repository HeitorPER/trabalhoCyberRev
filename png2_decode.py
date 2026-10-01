#!/usr/bin/env python3
"""Independent PNG2 decoder (see SPEC.md).

Usage: python3 png2_decode.py INPUT.png2 OUTPUT.png

Never invokes the png2 binary.  Pipeline:
  container (PNG-style chunks + CRC-32)  ->  zlib inflate of the IDAT data
  ->  per-row "unfiltering" with the 11 PNG2 filters
  ->  inverse Hilbert-curve permutation  ->  RGB image.
"""
import struct
import sys
import zlib

import numpy as np

SIGNATURE = b"\x89PNG\r\n\x1a\n"

# filter-type byte -> name (order matches the encoder table at .data 0x5070 / 0x5080)
FILTERS = {
    0xE0: "xor_left",       # X ^ L1
    0xE1: "xor_up",         # X ^ U
    0xE2: "xor_left_up_ul", # X ^ L1 ^ U ^ UL
    0xE3: "sub_left2",      # X - L2
    0xE4: "sub_left3",      # X - L3
    0xE5: "xor_left2",      # X ^ L2
    0xE6: "xor_left3",      # X ^ L3
    0xE7: "xor_left123",    # X ^ L1 ^ L2 ^ L3
    0x01: "sub_left",       # X - L1   (PNG "Sub")
    0x02: "sub_up",         # X - U    (PNG "Up")
    0x00: "none",           # X        (PNG "None")
}


class PNG2Error(Exception):
    pass


# ---------------------------------------------------------------- container
def read_chunks(data):
    if len(data) < 8 or data[:8] != SIGNATURE:
        raise PNG2Error("bad signature: not a PNG2 file")
    pos, chunks = 8, []
    while True:
        if pos + 8 > len(data):
            raise PNG2Error(f"truncated chunk header at offset {pos}")
        length, ctype = struct.unpack(">I4s", data[pos:pos + 8])
        end = pos + 8 + length + 4
        if end > len(data):
            raise PNG2Error(f"chunk {ctype!r} at offset {pos} runs past end of file")
        body = data[pos + 8:pos + 8 + length]
        (crc,) = struct.unpack(">I", data[end - 4:end])
        calc = zlib.crc32(ctype + body) & 0xFFFFFFFF
        if crc != calc:
            raise PNG2Error(f"CRC mismatch in chunk {ctype!r} at offset {pos}: "
                            f"stored {crc:08x}, computed {calc:08x}")
        chunks.append((ctype, body))
        pos = end
        if ctype == b"IEND":
            if length != 0:
                raise PNG2Error("IEND chunk must be empty")
            if pos != len(data):
                raise PNG2Error(f"{len(data) - pos} trailing bytes after IEND")
            return chunks


def parse_header(body):
    if len(body) != 13:
        raise PNG2Error(f"IHDR length {len(body)}, expected 13")
    w, h, depth, ctype, comp, filt, interlace = struct.unpack(">IIBBBBB", body)
    if (depth, ctype, comp, filt, interlace) != (8, 2, 0, 0xC0, 0xDE):
        raise PNG2Error("unsupported IHDR fields: depth=%d colour=%d comp=%d filter=0x%02x "
                        "interlace=0x%02x (PNG2 requires 8/2/0/0xC0/0xDE)"
                        % (depth, ctype, comp, filt, interlace))
    if w != h or w == 0 or w & (w - 1):
        raise PNG2Error(f"image must be 2^n x 2^n, got {w}x{h}")
    return w


# ---------------------------------------------------------------- Hilbert curve
def hilbert_d2xy(n, d):
    """Vectorised Hilbert d -> (x, y) for an n x n grid (n a power of two).

    Same algorithm as the inlined loop at 0x1e30..0x1e8f of the encoder."""
    t = np.asarray(d, dtype=np.int64).copy()
    x = np.zeros_like(t)
    y = np.zeros_like(t)
    s = 1
    while s < n:
        rx = (t >> 1) & 1
        ry = (t ^ rx) & 1
        flip = (ry == 0) & (rx == 1)
        x = np.where(flip, s - 1 - x, x)
        y = np.where(flip, s - 1 - y, y)
        swap = ry == 0
        x, y = np.where(swap, y, x), np.where(swap, x, y)
        x += s * rx
        y += s * ry
        t >>= 2
        s *= 2
    return x, y


# ---------------------------------------------------------------- unfiltering
def _xor_scan(a, stride):
    """out[i] = a[i] ^ out[i-stride]  (out[<0] = 0), along axis 0."""
    out = np.empty_like(a)
    for start in range(stride):
        out[start::stride] = np.bitwise_xor.accumulate(a[start::stride], axis=0)
    return out


def _add_scan(a, stride):
    """out[i] = (a[i] + out[i-stride]) mod 256, along axis 0."""
    out = np.empty_like(a)
    for start in range(stride):
        out[start::stride] = (np.cumsum(a[start::stride].astype(np.int64), axis=0) & 0xFF)
    return out.astype(np.uint8)


def unfilter_row(ftype, res, prev):
    """res: (w, 3) uint8 residuals. prev: (w, 3) uint8 previous decoded row or None."""
    w = res.shape[0]
    up = prev if prev is not None else np.zeros_like(res)
    ul = np.zeros_like(res)
    if prev is not None and w > 1:
        ul[1:] = prev[:-1]
    if ftype == 0x00:
        return res.copy()
    if ftype == 0x02:
        return ((res.astype(np.int64) + up) & 0xFF).astype(np.uint8)
    if ftype == 0xE1:
        return res ^ up
    if ftype == 0xE0:
        return _xor_scan(res, 1)
    if ftype == 0xE5:
        return _xor_scan(res, 2)
    if ftype == 0xE6:
        return _xor_scan(res, 3)
    if ftype == 0xE2:
        return _xor_scan(res ^ up ^ ul, 1)
    if ftype == 0x01:
        return _add_scan(res, 1)
    if ftype == 0xE3:
        return _add_scan(res, 2)
    if ftype == 0xE4:
        return _add_scan(res, 3)
    if ftype == 0xE7:
        # X_i ^ X_{i-1} ^ X_{i-2} ^ X_{i-3} = r_i.  With P_i = X_0 ^ .. ^ X_i this is
        # P_i = r_i ^ P_{i-4}, and X_i = P_i ^ P_{i-1}.
        p = _xor_scan(res, 4)
        x = p.copy()
        x[1:] ^= p[:-1]
        return x
    raise PNG2Error(f"unknown filter type 0x{ftype:02x}")


def decode_bytes(data):
    chunks = read_chunks(data)
    if not chunks or chunks[0][0] != b"IHDR":
        raise PNG2Error("first chunk must be IHDR")
    if sum(1 for t, _ in chunks if t == b"IHDR") != 1:
        raise PNG2Error("exactly one IHDR chunk is required")
    w = parse_header(chunks[0][1])
    idat = b"".join(body for t, body in chunks if t == b"IDAT")
    if not idat:
        raise PNG2Error("no IDAT chunk")
    try:
        raw = zlib.decompress(idat)
    except zlib.error as e:
        raise PNG2Error(f"IDAT zlib stream is corrupt: {e}") from None
    stride = 1 + 3 * w
    if len(raw) != w * stride:
        raise PNG2Error(f"inflated size {len(raw)}, expected {w * stride} for {w}x{w}")

    rows = np.frombuffer(raw, dtype=np.uint8).reshape(w, stride)
    seq = np.empty((w, w, 3), dtype=np.uint8)      # Hilbert-ordered pixels, chunked in rows of w
    prev = None
    for r in range(w):
        ftype = int(rows[r, 0])
        if ftype not in FILTERS:
            raise PNG2Error(f"row {r}: unknown filter type 0x{ftype:02x}")
        cur = unfilter_row(ftype, rows[r, 1:].reshape(w, 3), prev)
        seq[r] = cur
        prev = cur

    seq = seq.reshape(w * w, 3)
    x, y = hilbert_d2xy(w, np.arange(w * w))
    img = np.empty((w, w, 3), dtype=np.uint8)
    img[y, x] = seq                                 # pixel d sits at row y, column x
    return img


def decode_file(path):
    with open(path, "rb") as f:
        return decode_bytes(f.read())


def main(argv):
    if len(argv) != 3:
        print(f"usage: {argv[0]} INPUT.png2 OUTPUT.png", file=sys.stderr)
        return 2
    try:
        img = decode_file(argv[1])
    except (PNG2Error, OSError) as e:
        print(f"error: {e}", file=sys.stderr)
        return 1
    from PIL import Image
    Image.fromarray(img, "RGB").save(argv[2])
    print(f"decoded {img.shape[1]}x{img.shape[0]} -> {argv[2]}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
