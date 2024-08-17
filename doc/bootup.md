# Bootup

We need to get the ROM into the SDRAM

## How does PSX and the Mega CD do it?

Inside psx.cpp there is `load_bios()`. It is called by `psx_mount_cd()`.
But who calls it? From menu.cpp? But why is it called?

Inside megacd.cpp there is `mcd_set_image()`. Inside `MegaCD.sv` there is

```verilog
    wire rom_download = ioctl_download & (ioctl_index[5:0] <= 6'h01);
```
But where does this come from?

Ok, everything revolves around `user_io_file_tx()`
It even says something like this

```c
	// set index byte (0=bios rom, 1-n=OSD entry index)
```

## How does the CD-i do it?

Experiment:

    /media/fat/games/CD-i# hexdump  -C boot0.rom  | head
    00000000  6a 85 25 11 57 cc fd 49  4a d1 56 82 01 29 fb 21  |j.%.W..IJ.V..).!|
    00000010  91 02 3b 71 36 b1 71 d0  e7 17 52 db 19 fa e2 70  |..;q6.q...R....p|
    00000020  97 29 33 00 9e 88 f6 86  3a b8 a5 6f 70 c0 17 09  |.)3.....:..op...|
    00000030  02 68 9b 06 78 68 53 3d  55 37 24 b3 3b 33 f8 cc  |.h..xhS=U7$.;3..|
    00000040  3d fa 13 98 76 72 54 5b  e3 8c a0 46 91 9f f8 4f  |=...vrT[...F...O|
    00000050  71 39 9e e6 4b 57 47 8c  54 2c 6d 05 7a fe 4f 77  |q9..KWG.T,m.z.Ow|
    00000060  b8 b7 96 0b 5f 6e fc 55  d1 01 7f cb e6 64 4a 81  |...._n.U.....dJ.|
    00000070  57 da 80 0b 24 e5 66 8b  7d 5c 21 8a 9f d5 af b2  |W...$.f.}\!.....|
    00000080  0c f0 9e 83 9b 71 51 bb  ea 14 da 1a 1c b8 f3 14  |.....qQ.........|
    00000090  8a 99 58 aa bf e5 b1 c7  85 5a 98 98 ad 74 a6 e9  |..X......Z...t..|

    /media/fat/games/CD-i# hexdump  -C boot1.rom  | head
    00000000  00 00 15 00 00 40 04 b8  00 00 05 00 00 00 05 0a  |.....@..........|
    00000010  00 00 05 14 00 00 05 1e  00 00 05 28 00 00 05 32  |...........(...2|
    00000020  00 00 05 3c 00 00 05 46  00 00 05 50 00 00 05 5a  |...<...F...P...Z|
    00000030  00 00 05 64 00 00 05 6e  00 00 05 78 00 00 05 82  |...d...n...x....|
    00000040  00 00 05 8c 00 00 05 96  00 00 05 a0 00 00 05 aa  |................|
    00000050  00 00 05 b4 00 00 05 be  00 00 05 c8 00 00 05 d2  |................|
    00000060  00 00 05 dc 00 00 05 e6  00 00 05 f0 00 00 05 fa  |................|
    00000070  00 00 06 04 00 00 06 0e  00 00 06 18 00 00 06 22  |..............."|
    00000080  00 00 06 2c 00 00 06 36  00 00 06 40 00 00 06 4a  |...,...6...@...J|
    00000090  00 00 06 54 00 00 06 5e  00 00 06 68 00 00 06 72  |...T...^...h...r|

Let's see!

ioctl_index[15:0] starts with 0000h.
First data in word mode is 0x856a. Afterwards it is 0x1125. This means we have a little endian word here.
Boot0.rom is transmitted.

Afterwards...
ioctl_index[15:0] is set to 0040h.
First data in word mode is 0. Afterwards it is 0x0015. This means we have a little endian word here.
Boot1.rom is transmitted.

Can is use ioctl_index[6] to mark the slave worm data?

## References

https://github.com/alanswx/Tutorials_MiSTer/tree/master/basic/lesson2/rtl
https://github.com/alanswx/Tutorials_MiSTer/tree/master/basic/lesson2
https://mister-devel.github.io/MkDocs_MiSTer/developer/hps_io/#rom-and-file-loading-nvram-saving
