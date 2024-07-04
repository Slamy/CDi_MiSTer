# Selftest

Send 0x20 (Space) early on during startup.

DRAM bank 0 self test is from:
0x000000 to 0x03fffe      This is 256kB of memory. Bit 17 highest bit set.
then from
0x200000 to 0x23fffe      This is 256kB of memory

Afterwards 00000000 is read and 00000000 is expected.

DRAM bank 1 self test is from:
0x040000 to 0x07fffe      This is 256kB of memory. Bit 18 seems to be the bank switch
then from
0x240000 to 

