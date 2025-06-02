# Memory of the CDi

According to CDi 210 service manual: Two DRAM chips of 256K x 16
This should indicate TD=0 acxcording to MCD212 datasheet.

## Map

Based on MCD212 datasheet and [mame source code](https://github.com/dankan1890/mewui/blob/master/src/mame/drivers/cdi.cpp).
Also lots of info from [cdifan](https://github.com/cdifan/cdichips)

    0x000000 to 0x03ffff    DRAM Bank 0 Lower 256kB -> MiSTer SDRAM 0x000000 to 0x03ffff
    0x040000 to 0x07ffff    DRAM Bank 1 Lower 256kB -> MiSTer SDRAM 0x040000 to 0x07ffff
    0x200000 to 0x23ffff    DRAM Bank 0 Upper 256kB -> MiSTer SDRAM 0x080000 to 0x0bffff
    0x240000 to 0x27ffff    DRAM Bank 1 Upper 256kB -> MiSTer SDRAM 0x0C0000 to 0x0fffff

According to MCD212 the DRAM goes until 0x3fffff. But this can't be true.
I assume the ATTEX limits the DRAM to 0x27fffe as these do now follow.

    0x300000 to 0x303ffe    CDIC
    0x310000                SLAVE
    0x320000 to 0x323fff    NVRAM (according to mame)

    0x400000 to 0x4ffbff    ROM but only 512kB so it ends 0x80000 -> MiSTer SDRAM 0x400000 to 0x47FFFF
    0x4ffc00 to 0x4fffdf    MCD212 SystemIO (is this even used? at least not mentioned in MAME)
    0x4fffe0 to 0x4fffff    MCD212 according to MAME, channels 1+2 according to datasheet

    0xd00000 to 0xdfffff    DVC RAM block 1 (according to mame) 1MB -> MiSTer SDRAM 0x100000 to 0x1fffff
    0xe40000 to 0xe5ffff    Philips VMPEG digital video cartridge ROM (128K vmpega.rom) -> MiSTer SDRAM 0x480000
    0xe60000 to 0xe7ffff    Mirror of vmpega.rom (due to missing address line)
    0xe80000 to 0xefffff    DVC RAM block 2 (according to mame) 512kB -> MiSTer SDRAM 0x200000 to 0x27ffff

    0xf00000 to 0xf00068    Dummy player shell which starts a CD-i application (by cdifan)

## Bus Error

Some locations are not mapped to memory and will cause a bus error exception on a CDI 210/05

    0x080000 to 0x1fffff
    0x500000 to 0xcfffff

## CPU Internal

    0x80001001  LIR priority
    0x80002011  UART Mode
    0x80002013  UART Status
    0x80002015  UART Clock Select
    0x80002017  UART Command
    0x80002019  UART Transmit Holding
    0x8000201B  UART Receive Holding
    0x80002020  Timer Status
    0x80002021  Timer Control
    0x80002022  Reload Register High
    0x80002023  Reload Register Low
    0x80002024  Timer 0 High
    0x80002025  Timer 0 Low
    0x80002026  Timer 1 High
    0x80002027  Timer 1 Low
    0x80002028  Timer 2 High
    0x80002029  Timer 2 Low
    0x80002045  PICR1
    0x80002047  PICR2
    0x80004000  DMA Channel 0 Status
    0x80004001  DMA Channel 0 Error
    0x80004004  DMA Channel 0 Device Control
    0x80004005  DMA Channel 0 Operation Control
    0x80004006  DMA Channel 0 Sequence Control
    0x80004007  DMA Channel 0 Channel Control
    0x8000400a  DMA Channel 0 Memory Transfer Counter High
    0x8000400b  DMA Channel 0 Memory Transfer Counter Low
    0x8000400c  DMA Channel 0 Memory Address Counter High
    0x8000400d  DMA Channel 0 Memory Address Counter
    0x8000400e  DMA Channel 0 Memory Address Counter
    0x8000400f  DMA Channel 0 Memory Address Counter Low
    0x80004014  DMA Channel 0 Device Address Counter High
    0x80004015  DMA Channel 0 Device Address Counter
    0x80004016  DMA Channel 0 Device Address Counter
    0x80004017  DMA Channel 0 Device Address Counter Low
    0x80004040  DMA Channel 1 Status
    0x80004041  DMA Channel 1 Error
    0x80004044  DMA Channel 1 Device Control
    0x80004045  DMA Channel 1 Operation Control
    0x80004046  DMA Channel 1 Sequence Control
    0x80004047  DMA Channel 1 Channel Control
    0x8000404a  DMA Channel 1 Memory Transfer Counter High
    0x8000404b  DMA Channel 1 Memory Transfer Counter Low
    0x8000404c  DMA Channel 1 Memory Address Counter High
    0x8000404d  DMA Channel 1 Memory Address Counter
    0x8000404e  DMA Channel 1 Memory Address Counter
    0x8000404f  DMA Channel 1 Memory Address Counter Low
    0x80004054  DMA Channel 1 Device Address Counter High
    0x80004055  DMA Channel 1 Device Address Counter
    0x80004056  DMA Channel 1 Device Address Counter
    0x80004057  DMA Channel 1 Device Address Counter Low

## Auto refresh

According to the datasheet of the SDRAM it is required to perform 8192 auto refresh cycles within 64ms.
The CD-i connected to a TV has 64µs per scanline. This is standard for PAL and NTSC. This would indicate
that 8-9 refresh cycles are required per scanline.

Source: AllianceMemory_512M_SDRAM_Bdie_AS4C32M16SB_7TXN_6T-1826888.pdf

