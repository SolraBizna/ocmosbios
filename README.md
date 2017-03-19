This is the standard BIOS for OCMOS, the OpenComputers 65C02 architecture module. It implements a simple, not very friendly (but better than nothing) monitor, and supports booting from the clipboard as well as both managed and unmanaged filesystems. It is fully OETF #1 compliant.

Building it requires [WLA-DX](http://www.villehelin.com/wla.html). Build by running `build.sh` or `build.bat`, depending on your OS. If you have Lua installed, it will build a CABE image (`ocmosbios.cabe`), which will print a nice error message if it's used in the wrong kind of computer. Otherwise, you can flash `ocmosbios.rom` instead.

It's ugly, partly because it had to fit in 4KiB and partly because it was made in a rush. It's also not thoroughly tested; there may be obscure edge cases. It should, however, support everything up to and including use of User Mode.

It behaves as documented in the [J6502 repository](https://github.com/SolraBizna/j6502/blob/master/OCMOS.md).
