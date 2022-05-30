#!/bin/sh

set -e

wla-65c02 -o ocmosbios.o ocmosbios.65c
wlalink -v ocmosbios.link ocmosbios.rom

rm -f ocmosbios.cabe
./rom_to_cabe.lua ocmosbios.rom ocmosbios.cabe || (echo "Failed to create the CABE image. That's okay, use the raw ROM instead."; true)
