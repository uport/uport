#! /bin/bash

# Zsync daily build image
ISO_FILE="ubuntu-15.04-server-amd64.iso"

mkdir -p zsync
(cd zsync && zsync -k $ISO_FILE.zsync -i $ISO_FILE http://releases.ubuntu.com/15.04/ubuntu-15.04-server-amd64.iso.zsync)

# Packer to create VM
time packer build -force packer.json | tee build.log
