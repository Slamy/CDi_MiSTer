# Addams Family Disc 2

## Division by Zero problem

Regression notes

Working with 176e9b6403b82f3e62a0379f44110ee49baf92ba
Crashing with 594bae844ef81a836fbeeaee652605899d7cd68f

Original commit message of the fix in main 76ce55a0ae1f5972d45b56189df75bad507fed42

    VMPEG: Fixed image size registers 00E04002 and 00E04004

    Written values were stored but could not be read back

    Concerning "Addams Family" - Disc 2, it crashed when entering the menu.
    This was caused by a "Division by Zero" exception, resetting the machine.
    This was caused by corrupted data, caused by double execution of the instructions
    at 0x0275ed0 (program of the movie player) which causes a zero value at 0xD01D8A.
    This problem already manifests even before the movie starts playback, but the crash itself is only occurring when the value is read.
    This happens only when the movie player menu is opened.

    All of this was caused by the values in mentioned registers being not the written ones but artificial ones when the VMPEG verilog implementation was first conceived.

    0027e0a0  0000000f 00000000 00000000 00000003 0000000f 00000000 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401a
    0027e0a2  0000000f 00000000 00000000 00000003 0000000f 00000000 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0400e
    0027e0a4  0000000f 00000000 00000000 00000003 0000000f 00000000 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0400e
    Exception - Division by zero
    Writing 0/video_ramdump.bin!


    0027e0a0 24 01           move.l     D1,D2
    0027e0a2 66 06           bne.b      LAB_0027e0aa
    0027e0a4 81 fc 00 00     divs.w     #0x0,D0
    0027e0a8 60 6e           bra.b      LAB_0027e118
                            LAB_0027e0aa                                    XREF[1]:     0027e0a2(j)  
    0027e0aa 53 81           subq.l     #0x1,D1
    0027e0ac 67 6a           beq.b      LAB_0027e118

zuvor

    002761a0 22 05           move.l     D5,D1

davor

    00276108 2a 2e 9d 8a     move.l     (-0x6276,A6),D5

zuvor?

    00275ed0 2d 44 9d 8a     move.l     D4,(-0x6276,A6)

According to `cat log | grep -e 0276108 -e V_AsyStat -e MV_ | uniq`
there never is a NIS event. That should not be the case!


    V_AsyStat = 2020 hex  8224 dez
    V_AsyStat = 8a0c hex 35340 dez
    FMV Write FMV_DECOFF Y 203e 0000 ?
    FMV Write FMV_DECOFF X 203f 0000 ?
    FMV Write FMV_DECWIN H 203c 0001 ?
    FMV Write FMV_DECWIN W 203d 0000 ?
    Syscall @ 27831a 8d I$GetStt 00000006 00000130 00000001 00000003 00000001 00000020 00004160 00000000  002711d4 00000000 00d02fa8 0007fde0 00d04158 00d04098 00d08000 00dfd428 GetStt MV_Create
    Syscall @ 2783e4 8d I$GetStt 00000006 00000131 00000001 00000003 00000001 00000020 00004160 00000000  002711d4 00000000 00d02fa8 0007fde0 00d04158 00d04098 00d08000 00dfd428 GetStt MV_Info
    Syscall @ 2784de 8e I$SetStt 00000006 0000010c 00000001 00000000 00000001 00000000 00004160 00000000  002711d4 00000000 00d02fa8 0007fde0 00d04158 00d04098 00d08000 00dfd428 SetStt MV_Org
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002016 00000001 00000020 00004160 00000000  00273960 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002116 00000001 00000020 00004160 00000000  002738de 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002117 00000001 00000020 00004160 00000000  0027393e 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  00273304 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 27820e 8e I$SetStt 00000006 00000101 00000001 00101010 00000001 00000020 00004160 00000000  00274672 00000000 00d02fa8 0007fde0 00d04158 00d04098 00d08000 00dfd428 SetStt MV_BColor
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000000 00002317 00000001 00000020 00004160 00000000  002718c8 00217b52 00d02fa8 0007fde0 00d04158 00d03fc0 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000000 00002317 00000001 00000020 00004160 00000000  0027320e 00217b52 00d01108 0007fde0 00d04158 00d03f88 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 2786e2 8e I$SetStt 00000006 00000111 00000001 00000000 030001e0 00000017 00004160 00000000  00000300 00217b52 00d01108 0007d09a 00d04158 00d03fb0 00d08000 00dfd428 SetStt MV_SelStrm
    Syscall @ 27862c 8e I$SetStt 00000006 0000010f 00000001 00000028 00000001 00000000 00004160 00000000  00000300 00217b52 00d01108 0007d09a 00d04158 00d03f90 00d08000 00dfd428 SetStt MV_Pos
    Syscall @ 2787e2 8e I$SetStt 00000006 00000114 00000001 00000000 030001e0 00000000 00004160 00000000  00000300 00217b52 00d01108 0007d09a 00d04158 00d03f90 00d08000 00dfd428 SetStt MV_Window 768 480 
    Syscall @ 278560 8e I$SetStt 00000006 0000010e 00000001 00000000 00000000 00000000 00000007 00000000  00000000 00d014ce 00d01108 0007d09a 00d01bb2 00d03fb0 00d08000 00dfd428 SetStt MV_Play
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 000e hex    14 dez
    Syscall @ 278708 8e I$SetStt 00000006 00000112 00000000 00000003 00000001 00000020 00004160 00000000  0027320e 00062cca 00d02fa8 0007fdf0 00d04158 00d040d8 00d08000 00dfd428 SetStt MV_Show
    FMV Write FMV_DECWIN H 203c 00f0 ?
    FMV Write FMV_DECWIN W 203d 0180 ?
    FMV Write FMV_DECOFF Y 203e 0000 ?
    FMV Write FMV_DECOFF X 203f 0000 ?
    V_AsyStat = 000e hex    14 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  0027320e 00062cca 00d02fa8 0007fe00 00d04158 00d040c4 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 2781c4 8e I$SetStt 00000006 00000100 00000001 00000003 00000001 00000020 00004160 00000000  002731d2 00062cca 00d02fa8 0007fe00 00d04158 00d040c4 00d08000 00dfd428 SetStt MV_Abort
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  002731d2 00062cca 00d02fa8 0007fe10 00d04158 00d040c0 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 2786e2 8e I$SetStt 00000006 00000111 00000001 00000000 030001e0 00000017 00004160 00000000  00000300 00062cca 00d01108 0007d09a 00d04158 00d040c0 00d08000 00dfd428 SetStt MV_SelStrm
    Syscall @ 27862c 8e I$SetStt 00000006 0000010f 00000001 00000028 00000001 00000000 00004160 00000000  00000300 00062cca 00d01108 0007d09a 00d04158 00d040a0 00d08000 00dfd428 SetStt MV_Pos
    Syscall @ 2787e2 8e I$SetStt 00000006 00000114 00000001 00000000 030001e0 00000000 00004160 00000000  00000300 00062cca 00d01108 0007d09a 00d04158 00d040a0 00d08000 00dfd428 SetStt MV_Window 768 480 
    Syscall @ 278560 8e I$SetStt 00000006 0000010e 00000001 00000000 00000000 00000000 00000007 00000000  00000000 00d014ce 00d01108 0007d09a 00d01bb2 00d040c0 00d08000 00dfd428 SetStt MV_Play
    FMV Write FMV_DECWIN H 203c 00f0 ?
    FMV Write FMV_DECWIN W 203d 0180 ?
    FMV Write FMV_DECOFF Y 203e 0000 ?
    FMV Write FMV_DECOFF X 203f 0000 ?
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 000e hex    14 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    Syscall @ 278754 8e I$SetStt 00000006 00000113 f5022002 00002317 00000001 00000001 00004160 00000000  002718c8 00062cca 00df39d6 0007fe10 00d04158 00d04008 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278708 8e I$SetStt 00000006 00000112 00000001 00000001 00000001 00000001 00004160 00000000  002718c8 00062cca 00df39d6 0007fe10 00d04158 00d04008 00d08000 00dfd428 SetStt MV_Show
    FMV Write FMV_DECWIN H 203c 00f0 ?
    FMV Write FMV_DECWIN W 203d 0180 ?
    FMV Write FMV_DECOFF Y 203e 0000 ?
    FMV Write FMV_DECOFF X 203f 0000 ?
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 000e hex    14 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 000e hex    14 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 000e hex    14 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    V_AsyStat = 0000 hex     0 dez
    V_AsyStat = 0002 hex     2 dez
    00276108  00000000 0003640f 00000001 00000003 00000001 00000020 00004160 00000000  00271c8c 00062cca 00d02fa8 0007fe40 00d04158 00d04070 00d08000 00d0404c
    V_AsyStat = 0002 hex     2 dez

In working condition on 176e9b6403b82f3e62a0379f44110ee49baf92ba
Just before a check of D1 for 0, resulting into the division by 0

    $ cat log_working | grep 0027e0a0
    0027e0a0  00000003 0000001e 00000000 0000001f f5022006 00000003 00004160 00000000  00d01c82 00062cca 0027320e 00d02fa8 0007fdf0 00d03fec 00d08000 00d03fc4
    0027e0a0  00000004 0000001e 00000000 0000001f f5022002 00000001 00004160 00000000  00d01c82 00062cca 0027320e 00d02fa8 0007fe00 00d03fec 00d08000 00d03fc4
    0027e0a0  00000005 0000001e 00000000 00000003 00000000 000000d8 00004160 00000000  00273840 00062cca 002731d2 00d02fa8 0007fe10 00d03fee 00d08000 00d03fc6
    0027e0a0  00000006 0000001e 00000000 0000001f 00000000 00000000 00000000 00000000  0000016e 00062cca 0027078c 00d02fa8 0007fe20 00d04000 00d08000 00d03fd8
    0027e0a0  00000007 0000001e 00000000 00000003 00000000 00000020 00004160 00000000  0027078c 00062cca 00271c18 00d02fa8 0007fe30 00d0409c 00d08000 00d04074
    0027e0a0  00000008 0000001e 00000000 00000004 ff010004 000001a0 00d02c30 000000ff  00017490 0006acb2 0026f030 00d02fa8 0007fe40 00002bbe 00d08000 00002b96
    0027e0a0  000116fd 00000018 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401a
    0027e0a0  000116fd 00000018 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401e
    0027e0a0  00000b9f 0000003c 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401a
    0027e0a0  000116fd 000005a0 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401e
    0027e0a0  00000031 0000003c 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401a
    0027e0a0  000116fd 00015180 00000000 00000003 000116fd 00000018 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00dfd430
    0027e0a0  00000031 0000000a 00000000 00000003 00000031 00000018 00004160 00000000  00276a4c 00062cca 00d04036 00d0402a 00d04158 00d0401e 00d08000 00d04002
    0027e0a0  00000031 0000000a 00000000 00000003 00000031 00000018 00004160 00000000  00276a4c 00062cca 00d04037 00d0402a 00d04158 00d0401e 00d08000 00d03ffe
    0027e0a0  00000023 0000000a 00000000 00000003 00000023 00000018 00004160 00000000  00276a4c 00062cca 00d04039 00d0402a 00d04158 00d0401e 00d08000 00d04002
    0027e0a0  00000023 0000000a 00000000 00000003 00000023 00000018 00004160 00000000  00276a4c 00062cca 00d0403a 00d0402a 00d04158 00d0401e 00d08000 00d03ffe
    0027e0a0  00000009 0000001e 00000000 00070100 ff010100 0000002a 0005a64a 00000008  0006a980 0006acb2 0026aeba 00d02fa8 0007fe50 00002bbe 00d08000 00002b96

    $ cat log_broken | grep 0027e0a0
    0027e0a0  00000003 0000001e 00000000 0000001f f5022006 00000003 00004160 00000000  00d01c82 00062cca 0027320e 00d02fa8 0007fdf0 00d03fec 00d08000 00d03fc4
    0027e0a0  00000004 0000001e 00000000 0000001f f5022002 00000001 00004160 00000000  00d01c82 00062cca 0027320e 00d02fa8 0007fe00 00d03fec 00d08000 00d03fc4
    0027e0a0  00000005 0000001e 00000000 00000003 00000000 000000d8 00004160 00000000  00273840 00062cca 002731d2 00d02fa8 0007fe10 00d03fee 00d08000 00d03fc6
    0027e0a0  00000006 0000001e 00000000 0000001f 00000000 00000000 00000000 00000000  0000016e 00062cca 0027078c 00d02fa8 0007fe20 00d04000 00d08000 00d03fd8
    0027e0a0  00000007 0000001e 00000000 00000003 00000000 00000020 00004160 00000000  0027078c 00062cca 00271c18 00d02fa8 0007fe30 00d0409c 00d08000 00d04074
    0027e0a0  00000018 00000018 00000000 0000001f 00000000 000000d8 00004160 00000000  00dfa3a0 00062cca 00df39fe 0007fe30 00d04158 00d04044 00d08000 00d04028
    0027e0a0  00000008 0000001e 00000000 00000004 ff010004 000001a0 00d02c30 000000ff  00017490 0006acb2 0026f030 00d02fa8 0007fe40 00002bbe 00d08000 00002b96
    0027e0a0  0000000f 00000000 00000000 00000003 0000000f 00000000 00004160 00000000  00271c8c 00062cca 00d04036 00d0402a 00d04158 00d04070 00d08000 00d0401a

In the working state, 00275ed0 is never executed.

What was changed in 594bae844ef81a836fbeeaee652605899d7cd68f?

    FMV: Fixed timing of frame events and parameters

    - Decoupled SEQ event from GOP event.
    Now behaves like real VMPEG hardware
    - Fixes Lost Ride gameplay after vehicle charge intro
    - Fixes timing accuracy of temp ref and time code
    Measurable with mv_status()
    
Experimental rollback? Yes. SEQ GOP will not affect. Addams Family always has a SEQ with a GOP on Disc 2
Timing of tempref? Since the crash occurs when opening the playback controls, it has to...


## Playback control hangup

Addams Family Disc 2 can be broken by repeatedly pausing and resuming the movie.
At some point the playback controls will freeze, the mouse cursor will disappear,
but the movie will continue to play for a while until the system crashes.

Sometimes, the PBC graphics are replaced with rainbow pixels.

Can be replicated with simulation by pressing B1 every 5 frames.

When the issue occurs, DC_WrLCT is called very often and doesn't stop.
Can be made visible rather well with this

    cat log | grep -e png -e DC_WrLCT > log2

    cat log | grep -e png  -e DC_WrLCT -e "Syscall @ 27" -e 'Syscall @ 26' -e 'F$Send' > log3


    Written video_514.png
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007ff80 00d04158 00d04030 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 135 134
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007ff90 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1636 296
    Written video_515.png
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007ffa0 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 895 21
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fdd0 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1656 59
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fde0 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 252 142
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fdf0 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 523 189
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe00 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 657 293
    Written video_516.png
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe10 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 403 18
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe20 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1595 55
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe30 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1008 122
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe40 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 303 187
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe50 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1741 293
    Written video_517.png
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe60 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1601 18
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe70 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 267 100
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe80 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1471 173
    Syscall @ 27cf80 8e I$SetStt 00000003 00000056 00000008 00000002 000001de 00000005 00000001 00000002  00d0078c 000680ca 00d02fa8 0007fe90 00d04158 00d04084 00d08000 00dfd428 SetStt SS_DC DC_WrLCT at video pos 1401 211

Finally some module analysis added

    Found module at 73b60 - 7c448 cdi_video.config
    Found module at 7c448 - 7cdc0 cdi_video.states
    Found module at 7cdc0 - 7d016 cdi_controls.map
    Found module at 7d016 - 7eb1e cdi_seq2.epd
    Found module at 7eb1e - 7fdc2 cdi_bpsys
    Found module at 2625b0 - 27fff4 cdi_video
    Found module at 404600 - 40ae1a kernel
    Found module at 40ae1a - 40f4bc cio
    Found module at 40f4bc - 41006c FONT8X8
    Found module at 41006c - 41094a pipeman
    Found module at 41094a - 411f22 nrf
    Found module at 411f22 - 412a42 ucm
    Found module at 412a42 - 413be0 cdfm
    Found module at 413be0 - 41436e scf
    Found module at 41436e - 4161e4 math
    Found module at 4161e4 - 4162e4 copyright
    Found module at 4162e4 - 416436 init
    Found module at 416436 - 4165d8 sysgo
    Found module at 416650 - 416c8e u68070
    Found module at 416c8e - 416eb4 sgstom
    Found module at 416f3c - 417050 tim070driv
    Found module at 4170c6 - 417172 null
    Found module at 417172 - 4171d8 pipe
    Found module at 4171d8 - 4174de nvdrv
    Found module at 41753c - 42799e video
    Found module at 42799e - 427a20 vid
    Found module at 427a20 - 427aa2 vd2
    Found module at 427aa2 - 427b28 vdk
    Found module at 427b28 - 427bac v12
    Found module at 427bac - 427c30 v96
    Found module at 427c30 - 42809a msuart
    Found module at 42811c - 4284b2 gtuart
    Found module at 4285c2 - 428704 ckeydriv
    Found module at 428788 - 428ea8 pck2driv
    Found module at 428f32 - 429542 kb1driv
    Found module at 4295c8 - 42dcde cdapdriv
    Found module at 42ddee - 42deae csd_220
    Found module at 42deae - 42f418 csdinit
    Found module at 42f418 - 431354 config
    Found module at 431354 - 431a28 kbdrvr
    Found module at 431aa8 - 431de2 pointer
    Found module at 431e62 - 4325b6 sldriv
    Found module at 432638 - 4380b0 sv
    Found module at 4380b0 - 43a086 launcher
    Found module at 43a086 - 43afe2 upslbd11.ai1
    Found module at 43afe2 - 43be9e rhobd10.ai1
    Found module at 43be9e - 43c8ae sigmbc7.ai1
    Found module at 43c8ae - 43d462 upslbd10.ai1
    Found module at 43d462 - 43ebae genevas11.fnt
    Found module at 43ebae - 4437ae audiocd
    Found module at 4437ae - 44806e dsett319
    Found module at 44806e - 44b54e dmem319x
    Found module at 44b54e - 44e0ee dinfo319
    Found module at 44e0ee - 44f11e english
    Found module at 44f11e - 45038e espanol
    Found module at 45038e - 45168e francais
    Found module at 45168e - 45297e deutsch
    Found module at 45297e - 4539ce nederlands
    Found module at 4539ce - 454c8e italiano
    Found module at 454c8e - 45cddc cdgrj
    Found module at 45cddc - 46161c phil
    Found module at 46161c - 4660cc magnavox
    Found module at 4660cc - 47e8c2 play
    Found module at 47e8c2 - 47fff2 dummy
    Found module at 480000 - 4801e6 sysgo
    Found module at 4801e6 - 480276 csd_fmvvm
    Found module at 480276 - 481e82 fmvconf
    Found module at 481e82 - 482d82 vmpeg
    Found module at 482d82 - 4842e4 vcd
    Found module at 4842e4 - 489ce6 fmvll
    Found module at 489ce6 - 48dd66 dspcode
    Found module at 48dd66 - 48fbb8 MoviMan
    Found module at 48fc20 - 491a14 madriv
    Found module at 491a8c - 494c60 fmvdrv
    Found module at 494c60 - 494d3a fmvvolset
    Found module at 494d3a - 4957b6 ramtest4
    Found module at 4957b6 - 49fff6 dummy
    Found module at e40000 - e401e6 sysgo
    Found module at e401e6 - e40276 csd_fmvvm
    Found module at e40276 - e41e82 fmvconf
    Found module at e41e82 - e42d82 vmpeg
    Found module at e42d82 - e442e4 vcd
    Found module at e442e4 - e49ce6 fmvll
    Found module at e49ce6 - e4dd66 dspcode
    Found module at e4dd66 - e4fbb8 MoviMan
    Found module at e4fc20 - e51a14 madriv
    Found module at e51a8c - e54c60 fmvdrv
    Found module at e54c60 - e54d3a fmvvolset
    Found module at e54d3a - e557b6 ramtest4
    Found module at e557b6 - e5fff6 dummy


We could extract all the Signal Senders?
    
    cat log | grep -e png -e SS_Cont -e 'F$Send' -e 'MV_Cont' > log4


    cat log | grep MV_Tri
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002016 00000001 00000020 00004160 00000000  00273960 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002116 00000001 00000020 00004160 00000000  002738de 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002117 00000001 00000020 00004160 00000000  0027393e 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  00273304 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  002718c8 00217b52 00d02fa8 0007fed0 00d04158 00d04060 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  0027320e 00217b52 00d01108 0007fed0 00d04158 00d04028 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  0027320e 00062cca 00d02fa8 0007fef0 00d04158 00d040c4 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 00000001 00002317 00000001 00000020 00004160 00000000  002731d2 00062cca 00d02fa8 0007ff00 00d04158 00d040c0 00d08000 00dfd428 SetStt MV_Trigger
    Syscall @ 278754 8e I$SetStt 00000006 00000113 f5022002 00002317 00000001 00000001 00004160 00000000  002718c8 00062cca 00df39d6 0007ff00 00d04158 00d04008 00d08000 00dfd428 SetStt MV_Trigger

The signal base for MV is 0x2000 and the events are DER, PIC, GOP, LPD, BUF, NIS

    cat log | grep MA_Trigg
    Syscall @ 278b1c 8e I$SetStt 00000007 00000126 00000001 00002808 00000001 00000020 00004160 00000000  002738ea 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MA_Trigger
    Syscall @ 278b1c 8e I$SetStt 00000007 00000126 00000001 00002809 00000001 00000020 00004160 00000000  002738f6 00000000 00d02fa8 0007fde0 00d04158 00d0407c 00d08000 00dfd428 SetStt MA_Trigger

The signal base for MA is 0x2800 and the events are EOI and UNF. This means that MA events are non cared for in this application.

F$Send uses D1 as signal

Syscall @ 27cf1a 8e I$SetStt 00000003 00000056 00000011 00001800 00000000 000000f6 00004160 00000000  0027233c 000680ca 00212d12 0007ff70 00d04158 00d04028 00d08000 00dfd428 SetStt SS_DC DC_SSig at video pos 1277 269

The signal base for video is 0x1800


What is this?

Syscall @ e53d72 8 F$Send 03000002 0a122006 00002000 00001800 00000000 000000f6 00004160 0000008e  00dfa3a0 00dfbaf0 00dfa7a0 00e04000 00d04158 00d04028 00001500 00dff31c

