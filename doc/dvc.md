# Digital Video Cartridge

Decodes MPEG1 audio and video.
    * 352 x 288 pixel resolution
    * ISO 11172-1 MPEG1-Stream
    * ISO 11172-2 MPEG1-Video
    * ISO 11172-3 MPEG1-Audio

There are multiple models available

* 22ER9141 (with analog video provided to base machine)
* 22ER9956 (with digital video to the base machine)

There are different chipsets available

* GMPEG
  * Based on a custom chipset
* VMPEG
  * Based on the MCD251 which decodes only the video
  * Audio and Video decoded by different subsystems
  * Motorola DSP56001FC33 seems to be doing Audio in software
* IMPEG
  * Based on the MCD270 with audio and video decoding integrated into one
  * Uses 512kB of RAM for buffering and reconstruction

## Green Book

According to 4.3.2.2 the maximum picture size depends on the frame rate

* With 30 Hz it is 352 * 240
* With 25 Hz it is 352 * 288

If played from disc, the maximum bitrate is 1.4 Mbit/sec.
I, P and B frames are supported.
The data is stored in packs of 2324 bytes.
The minimum size of the `MPEG Video Buffer` is 512 kB.

## MPEG1

### Encoding via ffmpeg and muxing via mplex

ffmpeg defines some presets for
encoding VideoCD MPEG1 streams.
According to the [documentation](https://ffmpeg.org/ffmpeg.html#Video-Options)
these are the resulting parameters

    pal:
    -f vcd -muxrate 1411200 -muxpreload 0.44 -packetsize 2324
    -s 352x288 -r 25
    -codec:v mpeg1video -g 15 -b:v 1150k -maxrate:v 1150k -minrate:v 1150k -bufsize:v 327680
    -ar 44100 -ac 2
    -codec:a mp2 -b:a 224k

    ntsc:
    -f vcd -muxrate 1411200 -muxpreload 0.44 -packetsize 2324
    -s 352x240 -r 30000/1001
    -codec:v mpeg1video -g 18 -b:v 1150k -maxrate:v 1150k -minrate:v 1150k -bufsize:v 327680
    -ar 44100 -ac 2
    -codec:a mp2 -b:a 224k

For some reason, the CD-i bridge application will not play the
resulting MPEG stream. The [free version of TMPGEnc](https://www.chip.de/downloads/TMPGEnc-Letzte-Freeware-Version_12994868.html) can be used to remux the stream to fix
this problem.
Another method is mplex, which is also available for Linux.
On Debian you will find it in the [mjpegtools package](https://manpages.debian.org/testing/mjpegtools/mjpegtools.1.en.html)

It is possible to encode video and audio separate and mux it together.
For a simple example, we are encoding with ffmpeg, then demux with ffmpeg,
only to mux it back together with mplex.

    ffmpeg -y -i "$1" -threads 1 -target ntsc-vcd output.mpg
    ffmpeg -y -i output.mpg -vcodec copy -an output_video.m1v
    ffmpeg -y -i output.mpg -acodec copy -vn output_audio.mp2
    mplex -f 1 output_audio.mp2 output_video.m1v -o output.mpg

The resulting stream can be authored into a VideoCD with tools like vcdxbuild

### Authoring of Video CDs

Since a configuration file is required, use tools like `k3b` to create it. Usually a VideoCD can be created just with this application. Under the hood, `vcdxbuild` is used.
For fine tuning, the configuration can be exported and the tools can be called from shell. 

    vcdxbuild --cue-file=VIDEOCD.cue --bin-file=VIDEOCD.bin config.xml

Keep in mind that the CD-i bridge application must be activated in configuration!

At least on Debian, the binary files inside the `k3b-data` package were broken and were sourced from [somewhere else](https://www.icdia.co.uk/sw_app/index.html) for replacement.

### Memory Map of IMPEG

    1MB of additional system memory at 0xd00000
    412kB of MPEG memo

The DVC MPEG related registers are mapped at 0xe00000 into the CPU memory map

    0x040da Is written 0x0201 before doing anything (Reset?)
            Is written 0x005c when Microcode was transfered (Go?)
    0x04800 Video Microcode? Write ends at 0x004cd4
    0x05000 Video Microcode? Write ends at 0x0054d4
    0x05800 Video Microcode? Write ends at 0x005cd4
    0x06000 Audio Microcode?
    0x06800 Audio Microcode?
    0x07000 Audio Microcode?
    0x40000 ROM driver code for OS9 (256kB)
    0x80000 RAM for MPEG decoding (512kB)

### Registers of VMPEG

            Temporal buffer registers
    0x0000  T_STAT
    0x0002  T_PWI
    0x0004  T_PHE
    0x0006  T_PRPA
    0x0008  T_TCL
    0x000a  T_TCH
    0x000c  T_VSR
    0x000e  T_BX
    0x0010  T_BY
    0x0012  T_DCMD

            Display control buffer 0
    0x0014  B0_STAT	
    0x0016  B0_PWI	
    0x0018  B0_PHE	
    0x0020  B0_PRPA	
    0x0022  B0_TCL	
    0x0024  B0_TCH	
    0x0026  B0_VSR	
    0x0028  B0_BX	
    0x002a  B0_BY	
    0x002c  B0_DCMD

            Display control buffer 1
    0x002e  B0_STAT	
    0x0030  B0_PWI	
    0x0032  B0_PHE	
    0x0034  B0_PRPA	
    0x0036  B0_TCL	
    0x0038  B0_TCH	
    0x003a  B0_VSR	
    0x003c  B0_BX	
    0x003e  B0_BY	
    0x0040  B0_DCMD

            Display control buffer 2
    0x0042  B0_STAT	
    0x0044  B0_PWI	
    0x0046  B0_PHE	
    0x0048  B0_PRPA	
    0x005a  B0_TCL	
    0x005c  B0_TCH	
    0x005e  B0_VSR	
    0x0060  B0_BX	
    0x0062  B0_BY	
    0x0064  B0_DCMD

## Resources

https://github.com/cdifan/cdichips?tab=readme-ov-file#mpeg-chips
https://www.theworldofcdi.com/cd-i_encyclopedia/digital-video-cartridge/
https://www.icdia.co.uk/accesories/dv.html
https://retrostuff.org/2017/02/12/the-7th-guest-cd-i-dvc-compatibility-cake-puzzle-bug/
https://opencores.org/projects/mpeg2fpga
https://github.com/OldRepoPreservation/mpeg2fpga/
https://github.com/phoboslab/pl_mpeg
http://dvdnav.mplayerhq.hu/dvdinfo/mpeghdrs.html
https://ffmpeg.org/ffmpeg.html#Video-Options
ffmpeg -h encoder=mpeg1video
https://www.cs.cornell.edu/dali/overview/mpeg.html
http://www.andrewduncan.net/mpeg/mpeg-1.html
http://www.mp3-tech.org/programmer/frame_header.html
https://www.cnblogs.com/JLMobile/articles/372075.html

http://www.mplayerhq.hu/DOCS/HTML/de/menc-feat-mpeg.html
http://www.mplayerhq.hu/DOCS/HTML/de/menc-feat-vcd-dvd.html

@00E539BE(fmvdrv) FMV TIMECD => 000C0000 00:00:00.12 DROP=0
@00E539BE(fmvdrv) RD.L 00E04058 => 000C0000 [S] .TIMECD
@00E539BE(fmvdrv) FMV TIMECD => 004B0000 00:00:01.11 DROP=0
@00E539BE(fmvdrv) RD.L 00E04058 => 004B0000 [S] .TIMECD
@00E539BE(fmvdrv) FMV TIMECD => 01920000 00:00:06.18 DROP=0
@00E539BE(fmvdrv) RD.L 00E04058 => 01920000 [S] .TIMECD
@00E539BE(fmvdrv) FMV TIMECD => 01C50000 00:00:07.05 DROP=0
@00E539BE(fmvdrv) RD.L 00E04058 => 01C50000 [S] .TIMECD

@00E51E5A(fmvdrv) FMV TIMECD => 04450003 00:03:17.05 DROP=0
@00E51E5A(fmvdrv) FMV TIMECD => 04130002 00:02:16.19 DROP=0
@00E51E5A(fmvdrv) FMV TIMECD => 08570002 00:02:33.23 DROP=0
@00E51E5A(fmvdrv) FMV TIMECD => 05C60007 00:07:23.06 DROP=0
@00E539BE(fmvdrv) FMV TIMECD => 00400007 00:07:01.00 DROP=0
@00E51E5A(fmvdrv) FMV TIMECD => 00520007 00:07:01.18 DROP=0

Example MPEG Audio Header:

11111111 11111101   FF FD
  Layer II
  MPEG Version 1
10110000            B0
  224 kpbs Bitrate
  44100 Hz
  Not padded
00000100            04
  Stereo
  Copyrighted
  No emphasis
01110111 01010101 01000100 01100101


Frame Length

  Layer I    384 samples
  Layer II   1152 samples


Interrupt Service Routine for FMV:

00e52e46  00002400 00000168 00000012 00000035 00000013 00dfd3d4 0040817c 008c2000  00e52e42 00dfee60 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff350

A2 is 00dfb180 and should be the driver state
A3 is 00e04000 which is the base of FMV registers

Memory Map

  FMV (we have actually source code of this)
    00e52e46 IrqSrvc
    00e52f54 UpdateSCR
    00e52f5c PC inside UpdateSCR where D0 is V_BufStat(a2)
    00e52ffe CheckSpeed
    00e53052 CheckLevel
    00e5312a HandleData
    00e53312 H_DataExit (end of HandleData)
    00e53318 NotReady
    00e533ee WaitStart
    00e535b4 HandleWaitS
    00e536ee HandleFirst
    00e53802 CopyPack
    00e544b6 DecodTS
    00e54546 Copy_It
    00e54610 UpdPCLPtr
    

    00dfb180 FMV Driver state (A2)
    V_DataSize *(unsigned long*)(0x00dfb180 + 0x126)
    V_Stat *(unsigned short*)(0x00dfb180 + 0x134)
    V_BufStat *(unsigned char*)(0x00dfb180 + 0x17b)
    V_ExtSCR *(unsigned long*)(0x00dfb180 + 0x154)
    V_SCRF *(unsigned long*)(0x00dfb180 + 0x11c)
    V_Count90 *(unsigned long*)(0x00dfb180 + 0x118)
    V_SCR *(unsigned long*)(0x00dfb180 + 0xca)
    V_CurDelta *(unsigned long*)(0x00dfb180 + 0x104)
    V_NewDelta *(unsigned long*)(0x00dfb180 + 0x108)
    V_SCRupd *(unsigned long*)(0x00dfb180 + 0x166)
    V_Status  *(unsigned short*)(0x00dfb180 + 0x136)
    V_PICCnt *(unsigned char*)(0x00dfb180 + 0x1cd)
    V_Scroll *(unsigned short*)(0x00dfb180 + 0x16a)
    V_VCMD *(unsigned short*)(0x00dfb180 + 0x16c)

  FMA (no source code available?)

    00e502fe Stream Number transferred to register
    00e504f0 IRQ Routine
    00e5120c FMA Status 3002 is read here (ANDed with 0x38?)
    
    00dfb8f0 FMA Driver state? (A2)

    00dfb730 FMA Driver state? (A2)
    (0x120,A2) Interrupt enable mirror (written to 0x301c)
    (0x12c,A2) ?
    (0x13b,A2) ?
    (0x150,A2) Interrupt state from 0x301a stored here?
    (0x0,A2) Address of FMA (must be 00e03000)


V_BufStat

  normal		equ		1   
  slow	  	equ		2
  scanning	equ		3
  single		equ		4
  paused		equ		5
  frozen		equ		6
  decoding	equ		7
  stopped		equ		8
  stopping	equ		9
  waiting		equ		10
  released	equ		11
  error		  equ		12
  reading		equ		13
  playing		equ		14
  idle		  equ		15
  pausing		equ		16
  * The following values are only used in the V_BufStat field.
  waitfirst	equ		32   0x20 operation seems to start here 
  waitstart	equ		33   0x21 set in StrtPlay?
  waitnormal	equ		34
  waitsector	equ		35