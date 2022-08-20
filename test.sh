#!/bin/bash
docker build -t dotfiles . && docker run --rm -it dotfiles
