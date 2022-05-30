wla-65c02 -o ocmosbios.o ocmosbios.65c
wlalink -v ocmosbios.link ocmosbios.rom
del ocmosbios.cabe
lua rom_to_cabe.lua ocmosbios.rom ocmosbios.cabe
