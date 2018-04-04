#!/bin/bash

REMACS_DIR=~/Documents/libs/remacs

./docker/generate

cp -v ./docker/rust-toolchain $REMACS_DIR

docker build -f docker/ubuntu/Dockerfile -t remacs-build .
docker run --rm --security-opt seccomp=unconfined -v $REMACS_DIR:/home/darkanthey/remacs_src -v ~/.local:/home/darkanthey/.local -it remacs-build

### Add PATH
[[ ":$PATH:" != *":~/.local/bin:"* ]] && PATH="~/.local/bin:${PATH}"
