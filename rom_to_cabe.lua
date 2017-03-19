#!/usr/bin/env lua

local HEADER = "--[==[CABE:OCMOS:"
local FOOTER = "]==]error'This EEPROM requires an OCMOS computer.'"
local VECTOR_LENGTH = 6
local MAX_EEPROM_SIZE = 4096

if #arg ~= 2 then
   print("Usage: rom_to_cabe input.rom output.cabe")
   os.exit(1)
end

local f = assert(io.open(arg[1], "rb"))
local a = f:read("*a")
f:close()

local prefix_len = #a - VECTOR_LENGTH
while prefix_len > 0 and a:sub(prefix_len, prefix_len) == "\xFF" do
   prefix_len = prefix_len - 1
end
if #HEADER + prefix_len + VECTOR_LENGTH + #FOOTER > MAX_EEPROM_SIZE then
   print("Warning: Source image + CABE shim is bigger than the default maximum EEPROM size.")
   if prefix_len == #a - VECTOR_LENGTH then
      print("(Did you forget `.EMPTYFILL $FF`?)")
   end
end

f = assert(io.open(arg[2], "wb"))
f:write(HEADER, a:sub(1, prefix_len), a:sub(-VECTOR_LENGTH, -1), FOOTER)
f:close()
