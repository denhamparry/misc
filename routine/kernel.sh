#!/bin/bash

# Current Kerenl

uname -mrs

# Avaialble Kernels

# dpkg --list | grep linux-image

## Update Kernel

# echo deb http://deb.debian.org/debian buster-backports main contrib non-free | sudo tee /etc/apt/sources.list.d/buster-backports.list
# sudo apt install -t buster-backports linux-image-amd64
# sudo apt install -t buster-backports firmware-linux firmware-linux-nonfree
