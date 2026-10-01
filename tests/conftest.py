import os
import subprocess
import sys

import pytest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from helpers import PNG2, PNG2_FULL, ROOT  # noqa: E402

INPUT_SHA = {
    "png2": "ed27d3379f00d6253c40f691f0b2efac05e5f52b44311e0178c7393eb04ed3c7",
    "flag.png2": "dc356fd0b7f636d4e8d3373b495954bc97e40dd5416bf1a65d3384b26ef0fced",
}


@pytest.fixture(scope="session")
def patched():
    """Path of the widened (FULLSIZE-emulating) patched copy; built from inputs/png2 if missing."""
    if not os.path.exists(PNG2_FULL):
        subprocess.run([sys.executable, os.path.join(ROOT, "tools", "patch_png2.py")], check=True)
    return PNG2_FULL


@pytest.fixture(scope="session")
def original():
    return PNG2
