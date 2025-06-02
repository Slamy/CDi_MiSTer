# Notes

## Building mame for the CD-i

make SOURCES=src/mame/philips/cdi.cpp REGENIE=1 -j8

## Using mame

./mame cdimono1 -log -oslog
./mame cdimono1 -verbose -log -oslog -window &> log

## Swap 16 bit endianness

    objcopy -I binary -O binary --reverse-bytes=2 picture.bin picture2.bin

## Transmit binary

    scp 68ktest.rom root@mister:/media/fat/games/CD-i

## Ripping from CD to single CUE/BIN

In this case, a single bin

    cdrdao read-cd --read-raw --datafile cdimage.bin cdimage.toc

then byte swap and generate cue

    toc2cue -s -C cdimage2.bin cdimage.toc cdimage.cue

## Convert CUE/BIN to CHD

    chdman createcd -i cdimage.cue -o cdimage.chd

## Convert CHD to single CUE/BIN

    chdman extractcd -i cdimage.chd -o cdimage.cue 

## Convert CHD to multi bin CUE/BIN

    chdman extractcd -i cdimage.chd -sb -o cdimage.cue

## Simulation speed

Vcd:
--trace
Written video_00.png after 44.36s
-rw-rw-r-- 1 andre andre 2,5G  9. Sep 13:04 /tmp/waveform.vcd

Fst:
--trace-fst
Written video_00.png after 51.33
-rw-rw-r-- 1 andre andre 49M  9. Sep 13:02 /tmp/waveform.vcd

This means Fst is better as it is much smaller


## Auto save of NvRAM?

Seems to be not desired:
* SD Card wear out?
* Point of time to write is random?
* Unresponsive as it steals cycles from HPS IO?

https://github.com/MiSTer-devel/Main_MiSTer/issues/789
https://github.com/MiSTer-devel/Main_MiSTer/issues/760


## Boot speed and autoplay using playcdi.mod (by cdifan)

Tested using Zelda - Wand of Gamelon (with CPU turbo and seek time of 1 sector)

Normal bootup:
On frame 108, the system shell Philips logo becomes visible
On frame 109, the Play button is visible and B1 is pressed.
On frame 111, the Play button is highlighted blue
On frame 211, the first frame of the Philips logo animation is visible

With playcdi.mod:
On frame 149, the first frame of the Philips logo animation is visible

## Debug output of CD-i Emulator


    CD-i Emulator version 0.5.3-beta8 for Windows (Limited edition)
    Found 31 recent files
    Found cdi200a.rom (Philips CD-i 200 F1 system ROM)
    Found vmpega.rom (Philips VMPEG digital video cartridge ROM 4.1)
    Building system: model=cdi200a dvcart=vmpeg...
    Reading cdisys.bld...
    Reading cdi200a.mdl...
    Reading mono1.brd...
    Installed planea memory at $0
    Installed planeb memory at $200000
    Using cdi200a.rom...
    Installed sysrom memory at $400000
    Found 73 modules in memory
    Configured reset vector at $400000
    Installed cdic device at $300000
    Installed cdicram memory at $300000
    Installed slave device at $310000
    Installed null device at $318000
    Installed nvr device at $320000
    Installed nvram memory at $320000
    Cannot load cdi200a.nvr into NVRAM
    Installed vdsc device at $4fffe0
    Installed 68070 device at $80000000
    Installed lic device at $80001001
    Installed pic device at $80002040
    Installed dma device at $80004000
    Installed i2c device at $80002000
    Installed uart device at $80002010
    Installed timer device at $80002020
    Reading vmpeg.dvc...
    Installed sysram memory at $d00000
    Installed vcd device at $e01000
    Installed fma device at $e03000
    Installed fmv device at $e04000
    Installed fmvprg1 device at $e04800
    Installed fmvprg2 device at $e05000
    Using vmpega.rom...
    Installed dvcrom memory at $e40000
    Found 30 modules in memory
    Installed dvcram memory at $e80000
    Mono-I detected, clearing time limit
    Listening for terminal on uart (CD-i UART)...
    BUS RESET

    processor reset
    dn: FFFFFFFF FFFFFFFF  FFFFFFFF FFFFFFFF   FFFFFFFF FFFFFFFF  FFFFFFFF FFFFFFFF
    an: FFFFFFFF FFFFFFFF  FFFFFFFF FFFFFFFF   FFFFFFFF FFFFFFFF  FFFFFFFF 00001500
    pc: 004004B8  sr:2700  (--S--7 --------)                  usp:00004A72   ^ssp^
    0x4004b8            >60000182         bra $40063c
    Found known Philips CD-i 220 F2 system ROM

    Resuming emulation...
    @00400FE4 VIDEO ENABLE PLANE A
    @00400FE4 VIDEO SETMODE 384x280 (384) 50Hz /2
    @00400FE4 VIDEO START
    @00400FEA VIDEO ENABLE PLANE B

    et fun fmv
    et dev fmv
    et trp

    @00E40A66(fmvconf) FMV PROG 0001
    @00E40A66(fmvconf) WR.W 00E040DA <= 0001 .PROG
    @00E40B42(fmvconf) FMV PROG 0004
    @00E40B42(fmvconf) WR.W 00E040DA <= 0004 .PROG
    @00E40698(fmvconf) FMV VOFF 001A
    @00E40698(fmvconf) WR.W 00E0406C <= 001A .VOFF
    @00E406A4(fmvconf) FMV HOFF 004A
    @00E406A4(fmvconf) WR.W 00E0406E <= 004A .HOFF
    @00E406B0(fmvconf) FMV VPIX 0118
    @00E406B0(fmvconf) WR.W 00E04070 <= 0118 .VPIX
    @00E406B8(fmvconf) FMV HPIX 0180
    @00E406B8(fmvconf) WR.W 00E04072 <= 0180 .HPIX




00405ba0  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00003fb8 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405ba2  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00003fb8 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   511
00405ba4  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00003fb8 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   511
00405ba6  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00003fb8 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b18  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00003fb8 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b1a  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b1e  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b20  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b3e  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405b46  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405baa  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0
00405bac  00003fb8 00000000 00000001 00000003 00000100 00000000 00002010 00e80000   00e80000 00eff36c 00efd398 000018fc 00003fa8 00efd34c 00001500 00efd314   0


dn: 00003FB8 00000000  00000001 00000003   00000100 00000000  00002010 00D00090
an: 00D00090 00DFF36C  00DFD398 000018FC   00003FA8 00DFD34C  00001500 00DFD314
pc: 00405B1E  sr:2710  (--S--7 ---X----)                  usp:00D0008C   ^ssp^
kernel:0x405B1E     >B090             cmp.l (a0),d0

kernel:0x405B18     >2047             movea.l d7,a0              [7]
kernel:0x405B1A     >202F0008         move.l 8(sp),d0            [22]
kernel:0x405B1E     >B090             cmp.l (a0),d0              [15]
kernel:0x405B20     >661C             bne $405b3e                [17]
kernel:0x405B22     >7010             moveq #$10,d0              [7]
kernel:0x405B24     >D08C             add.l a4,d0                [7]
kernel:0x405B26     >7200             moveq #0,d1                [7]
kernel:0x405B28     >9081             sub.l d1,d0                [7]


a0 cdiemu 00D00090 != a0 MAME 00e80000

objcopy -I binary -O binary --reverse-bytes=2 cdimono1/cdi200.rom cdimono1/cdi200_swap.rom
objcopy -I binary -O binary --reverse-bytes=2 cdimono1/vmpega_split.rom cdimono1/vmpega_split_swap.rom

bcompare cdimono1/cdi200_swap.rom 0/romdump0.bin
bcompare cdimono1/vmpega_split_swap.rom 0/romdump1.bin


cat log | grep 'FMV INT\|XFER' > log2
cat log | grep 'FMV INT\|XFER\|DVC Read e04062\|PIC2\|GOP' > log2
