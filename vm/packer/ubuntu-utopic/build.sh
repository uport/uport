#! /bin/bash

# Zsync daily build image
ISO_FILE="ubuntu-14.10-server-amd64.iso"

mkdir -p zsync
(cd zsync && zsync -k $ISO_FILE.zsync -i $ISO_FILE http://releases.ubuntu.com/14.10/ubuntu-14.10-server-amd64.iso.zsync)

# Packer to create VM
time packer build -force packer.json | tee build.log
