#!/bin/sh

set -e

wla-65c02 -qo ocmosbios.65c ocmosbios.o
wlalink -vS ocmosbios.link ocmosbios.rom

rm -f ocmosbios.cabe
./rom_to_cabe.lua ocmosbios.rom ocmosbios.cabe || (echo "Failed to create the CABE image. That's okay, use the raw ROM instead."; true)
