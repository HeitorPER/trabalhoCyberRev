#!/usr/bin/env python3
"""Create patched COPIES of inputs/png2 in build/ (the original is never written).

build/png2-naive-sizepatch : only the 128-px limit raised to 1024 (shows that is not enough).
build/png2-full-patched    : limit raised + the 8/16-bit truncations that the size limit
                             was masking widened to 32 bit, emulating a -DFULLSIZE build.

In .text the virtual address equals the file offset (sh_addr 0x10f0 == sh_offset 0x10f0).
"""
import hashlib
import os
import shutil
import stat

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "inputs", "png2")
SRC_SHA = "ed27d3379f00d6253c40f691f0b2efac05e5f52b44311e0178c7393eb04ed3c7"

NOP4 = "0f 1f 40 00"
SIZE_PATCH = [
    # offset, original bytes, new bytes, description
    (0x1c9f, "49 81 fd 80 00 00 00", "49 81 fd 00 04 00 00", "encode: cmp r13,0x80 -> cmp r13,0x400 (max side 1024)"),
]
WIDEN_PATCHES = [
    (0x1e33, "41 80 fb 01", "41 83 fb 01", "hilbert: cmp r11b,1 -> cmp r11d,1 (n compared as 32 bit)"),
    (0x1e5f, "66 c1 e9 02", "c1 e9 02 90", "hilbert: shr cx,2 -> shr ecx,2 (d no longer truncated to 16 bit)"),
    (0x1e63, "44 38 da", "44 39 da", "hilbert: cmp dl,r11b -> cmp edx,r11d (s < n in 32 bit)"),
    (0x1e88, "66 c1 e9 02", "c1 e9 02 90", "hilbert: shr cx,2 -> shr ecx,2"),
    (0x1e8c, "44 38 da", "44 39 da", "hilbert: cmp dl,r11b -> cmp edx,r11d"),
    (0x1e91, "40 0f b6 ff", NOP4, "hilbert: drop movzx edi,dil (y kept 32 bit)"),
    (0x1e97, "45 0f b6 c9", NOP4, "hilbert: drop movzx r9d,r9b (x kept 32 bit)"),
    (0x19fe, "40 0f b6 f6", NOP4, "select_filter: drop movzx esi,sil (width kept 32 bit)"),
    (0x1bdd, "0f b6 44 24 1c", "8b 44 24 1c 90", "select_filter: movzx eax,byte[rsp+0x1c] -> mov eax,dword[rsp+0x1c] (row advance 3*w+1)"),
    (0x1803, "40 84 f6", "85 f6 90", "filter_row: test sil,sil -> test esi,esi"),
    (0x1810, "40 0f b6 fe", "89 f7 66 90", "filter_row: movzx edi,sil -> mov edi,esi (pixel loop bound)"),
]


def build(dst, patches):
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    data = bytearray(open(SRC, "rb").read())
    assert hashlib.sha256(data).hexdigest() == SRC_SHA, "inputs/png2 hash mismatch"
    for off, old, new, why in patches:
        old_b, new_b = bytes.fromhex(old), bytes.fromhex(new)
        assert len(old_b) == len(new_b), why
        assert data[off:off + len(old_b)] == old_b, f"unexpected bytes at 0x{off:x}: {why}"
        data[off:off + len(new_b)] = new_b
    with open(dst, "wb") as f:
        f.write(data)
    os.chmod(dst, os.stat(dst).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
    print(f"{dst}: {len(patches)} patch(es), sha256 {hashlib.sha256(data).hexdigest()}")


if __name__ == "__main__":
    build(os.path.join(ROOT, "build", "png2-naive-sizepatch"), SIZE_PATCH)
    build(os.path.join(ROOT, "build", "png2-full-patched"), SIZE_PATCH + WIDEN_PATCHES)
    # sanity: the original is untouched
    assert hashlib.sha256(open(SRC, "rb").read()).hexdigest() == SRC_SHA
    for off, old, new, why in SIZE_PATCH + WIDEN_PATCHES:
        print(f"  0x{off:04x}: {old:<22} -> {new:<22} {why}")
