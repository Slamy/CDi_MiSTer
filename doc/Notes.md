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

