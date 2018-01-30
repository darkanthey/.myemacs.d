#!/bin/bash

docker build -f docker/ubuntu/Dockerfile -t remacs-build .
docker run --rm --security-opt seccomp=unconfined -v ~/Documents/libs/remacs:/home/darkanthey/remacs_src -v ~/.local:/home/darkanthey/.local -it remacs-build


### Add PATH
[[ ":$PATH:" != *":~/.local/bin:"* ]] && PATH="~/.local/bin:${PATH}"
