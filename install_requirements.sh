#!/bin/bash
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update

# Install required dependencies.
sudo apt -y install make tar wget curl rpm qemu-utils golang-1.15-go genisoimage python-minimal bison gawk

# Recommended but not required: `pigz` for faster compression operations.
sudo apt -y install pigz
sudo ln -vsf /usr/lib/go-1.15/bin/go /usr/bin/go

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

rm get-docker.sh
