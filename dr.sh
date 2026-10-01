#!/bin/sh
# run a command inside the isolated, network-less analysis container
MSYS_NO_PATHCONV=1 docker run --rm --network none -v "C:/Users/heito/Desktop/trabalhoCyberRev:/work" -w /work png2re sh -c "$*"
