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



Starting FMV
playMpeg /cd/VIDEO01.RTF 0 - 1 1
Started Play /cd/VIDEO01.RTF 7
c014 44aa cff56
c004 46e4 d03c9
c004 4932 d0865
c004 4b7b d0cf7    dez 585 dez 1170
c004 4dc5 d118a    dez 586 dez 1171
c004 501b d1638



$ cat log | grep 00e53238
00e53238  000021fc 00000000 00002328 00000036 fffffed4 00dfd3d4 0040817c 0000008e  00dc8620 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00002580 00000000 00002328 0000004d fffffdef 00dfd3d4 0040817c 0000008e  00dc8f34 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  000026ac 00000000 000026ac 00000020 fffffda5 00dfd3d4 0040817c 0000008e  00dc9848 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  000027d8 00000000 000027d8 00000001 fffffd65 00dfd3d4 0040817c 0000008e  00dca15c 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00002904 00000000 00002904 00000001 fffffd1a 00000002 ffffffff 0000008e  00dcaa70 00dfb360 00dfb180 00e04000 00d0204c 00d01faa 00001500 00dff324
00e53238  00002a30 00000000 00002a30 00000001 fffffccf 00000078 00d02030 0000008e  00dcb384 00dfb360 00dfb180 00e04000 00d011bc 00d01fe2 00001500 00dff324
00e53238  00002b5c 00000000 00002b5c 00000001 fffffc84 00000025 ffffffff 0000008e  00dcbc98 00dfb360 00dfb180 00e04000 00d02048 00d01fe2 00001500 00dff324
00e53238  00002c88 00000000 00002c88 00000001 fffffc39 0000004b 00000000 0000008e  00dcc5ac 00dfb360 00dfb180 00e04000 00d02136 00d0201c 00001500 00dff324
00e53238  00002db4 00000000 00002db4 00000001 fffffbee 00000002 fffffffc 0000008e  00dccec0 00dfb360 00dfb180 00e04000 00d02034 00d01f7a 00001500 00dff324
00e53238  00002ee0 00000000 00002ee0 00000031 fffffb9a 00dfd3d4 0040817c 0000008e  00dcd7d4 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  0000300c 00000000 0000300c 0000000d fffffb4f 00dfd3d4 0040817c 0000008e  00dce0e8 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00003138 00000000 00003138 0000004d fffffb0c 00dfd3d4 0040817c 0000008e  00dce9fc 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00003264 00000000 00003264 00000001 fffffac2 00dfd3d4 0040817c 0000008e  00dcf310 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00003390 00000000 00003390 00000001 fffffa77 00000064 00d02044 0000008e  00dcfc24 00dfb360 00dfb180 00e04000 00d02048 00d01fc6 00001500 00dff324
00e53238  000034bc 00000000 000034bc 00000001 fffffa2c 00000000 ffffffff 0000008e  00dd0538 00dfb360 00dfb180 00e04000 00d0204c 00d01faa 00001500 00dff324
00e53238  000035e8 00000000 000035e8 00000001 fffff9e1 00000001 fffffffe 0000008e  00dd0e4c 00dfb360 00dfb180 00e04000 00d02044 00d01f8a 00001500 00dff324
00e53238  00003714 00000000 00003714 00000001 fffff997 00000002 fffffffd 0000008e  00dd1760 00dfb360 00dfb180 00e04000 00d02030 00d01faa 00001500 00dff324
00e53238  00003840 00000000 00003840 00000001 fffff94b 00dfd3d4 0040817c 0000008e  00dd2074 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  0000396c 00000000 0000396c 00000001 fffff900 00000036 00000000 0000008e  00dd2988 00dfb360 00dfb180 00e04000 00d02136 00d02084 00001500 00dff324
00e53238  00003a98 00000000 00003a98 0000000a fffff8b4 00dfd3d4 0040817c 0000008e  00dd329c 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00003bc4 00000000 00003bc4 00000020 fffff85f 00dfd3d4 0040817c 0000008e  00dd3bb0 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00003f48 00000000 00003cf0 00000001 fffff789 00000025 00d02044 0000008e  00dd44c4 00dfb360 00dfb180 00e04000 00d02048 00d01fe2 00001500 00dff324
00e53238  00004074 00000000 00004074 00000001 fffff73f 00000064 00d02048 0000008e  00dd4dd8 00dfb360 00dfb180 00e04000 00d0204c 00d01fc6 00001500 00dff324
00e53238  000041a0 00000000 000041a0 00000001 fffff6f3 00000003 fffffffd 0000008e  00dd56ec 00dfb360 00dfb180 00e04000 00d02030 00d01f8a 00001500 00dff324
00e53238  000043f8 00000000 000042cc 00000008 fffff65d 00dfd3d4 0040817c 0000008e  00dd6000 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00004524 00000000 00004524 00000056 fffff609 00dfd3d4 0040817c 0000008e  00dd6914 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00004650 00000000 00004650 00000001 fffff5c7 00000025 00d0203c 0000008e  00dd7228 00dfb360 00dfb180 00e04000 00d02040 00d01fd2 00001500 00dff324
00e53238  0000477c 00000000 0000477c 00000020 fffff571 00dfd3d4 0040817c 0000008e  00dd7b3c 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  000048a8 00000000 000048a8 00000001 fffff531 00000033 00000000 0000008e  00dd8450 00dfb360 00dfb180 00e04000 00d02136 00d02084 00001500 00dff324
00e53238  00004b00 00000000 000049d4 00000001 fffff49b 00000064 ffffffff 0000008e  00dd8d64 00dfb360 00dfb180 00e04000 00d02048 00d01fe2 00001500 00dff324
00e53238  00004c2c 00000000 00004c2c 00000001 fffff450 00dfd3d4 0040817c 0000008e  00dd9678 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00004d58 00000000 00004d58 00000001 fffff405 00000025 ffffffff 0000008e  00dd9f8c 00dfb360 00dfb180 00e04000 00d02044 00d01faa 00001500 00dff324
00e53238  00004e84 00000000 00004e84 00000001 fffff3bb 00000078 00d02030 0000008e  00dda8a0 00dfb360 00dfb180 00e04000 00d02044 00d0201c 00001500 00dff324
00e53238  00004fb0 00000000 00004fb0 00000001 fffff36f 00000011 00000000 0000008e  00ddb1b4 00dfb360 00dfb180 00e04000 00d02136 00d02084 00001500 00dff324
00e53238  00005208 00000000 000050dc 00000001 fffff2d9 00000001 ffffffff 0000008e  00ddbac8 00dfb360 00dfb180 00e04000 00d02044 00d01f7a 00001500 00dff324
00e53238  00005460 00000000 00005334 0000004d fffff241 00dfd3d4 0040817c 0000008e  00ddc3dc 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00005910 00000000 0000558c 00000001 fffff260 00000064 00d02048 0000008e  00ddccf0 00dfb360 00dfb180 00e04000 00d0204c 00d01fe2 00001500 00dff324
00e53238  00005b68 00000000 00005a3c 00000032 fffff1cf 00dfd3d4 0040817c 0000008e  00ddd604 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00005eec 00000000 00005c94 0000000d fffff0fd 00dfd3d4 0040817c 0000008e  00dddf18 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00006978 00000000 00006018 00000001 ffffee74 00000001 ffffffff 0000008e  00dde82c 00dfb360 00dfb180 00e04000 00d0204c 00d01f4e 00001500 00dff324
00e53238  00006aa4 00000000 00006aa4 0000000d ffffee27 00dfd3d4 0040817c 0000008e  00ddf140 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00006bd0 00000000 00006bd0 00000020 ffffedde 00dfd3d4 0040817c 0000008e  00ddfa54 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00006cfc 00000000 00006cfc 00000020 ffffed8e 00dfd3d4 0040817c 0000008e  00de0368 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00006e28 00000000 00006e28 00000020 ffffed42 00dfd3d4 0040817c 0000008e  00de0c7c 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  00007080 00000000 00006f54 00000000 ffffecb3 00dfd3d4 0040817c 0000008e  00de1590 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  000071ac 00000000 000071ac 00000020 ffffec5d 00dfd3d4 0040817c 0000008e  00de1ea4 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324
00e53238  000071ac 00000000 000071ac 00000001 ffffeaf0 00000010 00000000 0000008e  00de1ea4 00dfb360 00dfb180 00e04000 00d02136 00d02084 00001500 00dff324
00e53238  000071ac 00000000 000071ac 00000001 ffffe979 00000025 00000000 0000008e  00de1ea4 00dfb360 00dfb180 00e04000 00d02136 00d02084 00001500 00dff324
00e53238  000071ac 00000000 000071ac 00000001 ffffe803 00000020 00d02034 0000008e  00de1ea4 00dfb360 00dfb180 00e04000 00d02038 00d0200c 00001500 00dff324
00e53238  000071ac 00000000 000071ac 00000020 ffffe68a 00dfd3d4 0040817c 0000008e  00de1ea4 00dfb360 00dfb180 00e04000 00dfcc30 00dfd3e8 00001500 00dff324


            cmpi.l    #1200/4,d4
            bgt        BlockFound
            cmpi.l    #(-20000)/4,d4
            blt        BlockFound


emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc at 00e53238 for catching
just before this

                             LAB_00e53226                                    XREF[1]:     00e53262(j)  
        00e53226 04 80 00        subi.l     #0x12c,D0
                 00 01 2c
        00e5322c 28 00           move.l     D0,D4
        00e5322e 98 aa 00 ca     sub.l      (0xca,A2),D4
        00e53232 0c 84 00        cmpi.l     #0x12c,D4
                 00 01 2c
        00e53238 6e 00 00 2c     bgt.w      LAB_00e53266
        00e5323c 0c 84 ff        cmpi.l     #-0x1388,D4
                 ff ec 78
        00e53242 6d 00 00 22     blt.w      LAB_00e53266
        00e53246 24 00           move.l     D0,D2



*****************************************************************************
*
* UpdateSCR - Update V_SCR
*
* Input:	(a2) = pointer to the static storage
*
* Output:	Nothing
*
UpdateSCR:	equ		*
			move.b	V_BufStat(a2),d0	get current state
			cmpi.b	#waitfirst,d0		waiting for a sector?
			beq.s	SetVSCR				yes, update always (maybe not valid)
			cmpi.b	#waitstart,d0		filling up buffer?
			beq.s	SetVSCR				yes, update always
			cmpi.b	#waitnormal,d0		trying to reach normal level?
			beq.s	SetVSCR				yes, update SCR always
* update V_SCR according current speed
			move.l	V_ChipSpd(a2),d1	get chipspeed
			bne.s	TestSpeeds			not normal speed, test others
			cmpi.b	#waitsector,d0		waiting for a sector?
			beq.s	SkipSCRupd			yes, it is paused => no update
	DTSRC	move.w,V_Status,d1			get current status
			andi.w	#TIMmask+PAImask,d1		was timer or pause int.?
			beq.s	SkipSCRupd			no, do not change SCR
SetVSCR		equ		*
			bsr		UpdSCR				read external source
SkipSCRupd	equ		*
			rts

SPTable		dc.w	0					speed = 1 (illegal)
			dc.w	(4*TimerVal)/2		speed = 2
			dc.w	(4*TimerVal)/3		speed = 3
			dc.w	(4*TimerVal)/4		speed = 4
			dc.w	(4*TimerVal)/5		speed = 5
			dc.w	(4*TimerVal)/6		speed = 6
			dc.w	(4*TimerVal)/7		speed = 7
			dc.w	(4*TimerVal)/8		speed = 8

TestSpeeds	equ		*




                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00e52f54()
             undefined         D0b:1          <RETURN>
                             FUN_00e52f54                                    XREF[1]:     00e52f02(c)  
        00e52f54 10 2a 01 7b     move.b     (0x17b,A2),D0b
        00e52f58 0c 00 00 20     cmpi.b     #0x20,D0b
        00e52f5c 67 22           beq.b      LAB_00e52f80
        00e52f5e 0c 00 00 21     cmpi.b     #0x21,D0b
        00e52f62 67 1c           beq.b      LAB_00e52f80
        00e52f64 0c 00 00 22     cmpi.b     #0x22,D0b
        00e52f68 67 16           beq.b      LAB_00e52f80
        00e52f6a 22 2a 01 96     move.l     (0x196,A2),D1
        00e52f6e 66 26           bne.b      LAB_00e52f96
        00e52f70 0c 00 00 23     cmpi.b     #0x23,D0b
        00e52f74 67 0e           beq.b      LAB_00e52f84
        00e52f76 32 2a 01 36     move.w     (0x136,A2),D1w
        00e52f7a 02 41 11 00     andi.w     #0x1100,D1w
        00e52f7e 67 04           beq.b      LAB_00e52f84


emu__DOT__cditop__DOT__scc68070_0__DOT__tg68__DOT__tg68kdotcinst__DOT__exe_pc at 00e53238 for catching
just before this
