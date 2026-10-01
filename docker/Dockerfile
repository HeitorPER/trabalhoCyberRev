FROM ubuntu:22.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    gdb binutils file python3 python3-pip python3-numpy python3-pil python3-pytest zlib1g ltrace imagemagick xxd \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /work
