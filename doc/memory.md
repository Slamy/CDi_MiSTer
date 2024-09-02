# Memory of the CDi

According to CDi 210 service manual: Two DRAM chips of 256K x 16
This should indicate TD=0 acxcording to MCD212 datasheet.

## Map

Based on MCD212 datasheet and [mame source code](https://github.com/dankan1890/mewui/blob/master/src/mame/drivers/cdi.cpp).
Also lots of info from [cdifan](https://github.com/cdifan/cdichips)

0x000000 to 0x03ffff    DRAM Bank 0 Lower 256kB -> 0x000000 to 0x03ffff 
0x040000 to 0x07ffff    DRAM Bank 1 Lower 256kB -> 0x080000 to 0x0BFFFF
0x200000 to 0x23ffff    DRAM Bank 0 Upper 256kB -> 0x040000 to 0x07ffff
0x240000 to 0x27ffff    DRAM Bank 1 Upper 256kB -> 0x0C0000 to 0x0FFFFF

According to MCD212 the DRAM goes until 0x3fffff. But this can't be true.
I assume the ATTEX limits the DRAM to 0x27fffe as these do now follow.

0x300000 to 0x303ffe    CDIC
0x310000                SLAVE
0x320000 to 0x323fff    NVRAM (according to mame)

0x400000 to 0x4ffbff    ROM but only 512kB so it ends 0x80000
0x4ffc00 to 0x4fffdf    MCD212 SystemIO (is this even used? at least not mentioned in MAME)
0x4fffe0 to 0x4fffff    MCD212 according to MAME, channels 1+2 according to datasheet

0xd00000 to 0xdfffff    DVC RAM block 1 (according to mame) 1MB
0xe80000 to 0xefffff    DVC RAM block 2 (according to mame) 512kB

## CPU Internal

0x80002011  UART Mode
0x80002013  UART Status

## Auto refresh

According to the datasheet of the SDRAM it is required to perform 8192 auto refresh cycles within 64ms.
The CD-i connected to a TV has 64µs per scanline. This is standard for PAL and NTSC. This would indicate
that 8-9 refresh cycles are required per scanline.

Source: AllianceMemory_512M_SDRAM_Bdie_AS4C32M16SB_7TXN_6T-1826888.pdf

