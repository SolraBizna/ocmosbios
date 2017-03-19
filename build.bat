wla-65c02 -qo ocmosbios.65c ocmosbios.o
wlalink -vS ocmosbios.link ocmosbios.rom
del ocmosbios.cabe
lua rom_to_cabe.lua ocmosbios.rom ocmosbios.cabe
