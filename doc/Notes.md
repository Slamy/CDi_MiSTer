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

# Convert CUE/BIN to CHD

    chdman createcd -i a.cue -o a.chd

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

