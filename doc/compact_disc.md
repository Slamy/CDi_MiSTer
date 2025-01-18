# The Compact Disc

A sector is 2352 bytes of user data in size. This is 0x930.
This might explain why FROG.BIN has one sector header every 0x930 byte.

The cue file says:

    FILE FROG.BIN BINARY
    TRACK 01 MODE2/2352
        INDEX 01 00:00:00

Mode 1

Sync Pattern 

Sync Pattern    00 ff ff ff ff ff   ff ff ff ff ff 00
MSF             00 32 18
Mode            01
User Data       2048 bytes
Error Detection Padding to fill up 2336 bytes

Mode 2

Sync Pattern    00 ff ff ff ff ff   ff ff ff ff ff 00
MSF             00 32 18
Mode            02
User Data       2336 bytes

Audio channel mask register


For some reason, the CD-i has a different format.

The user data always starts with two copies of a header of 4 bytes.

SECTOR_FILE
    Single byte to identify a file? As a filter?
SECTOR_CHAN
    Defines channels 0 to 31?
SECTOR_SUBMODE
    SUBMODE_EOF        = 0x80,  Causes reading to stop. CDIC does that automatically.
    SUBMODE_RT         = 0x40,
    SUBMODE_FORM       = 0x20,
    SUBMODE_TRIG       = 0x10,
    SUBMODE_DATA       = 0x08,  Sector must be one of these
    SUBMODE_AUDIO      = 0x04,  Sector must be one of these
    SUBMODE_VIDEO      = 0x02,  Sector must be one of these
    SUBMODE_EOR        = 0x01,
SECTOR_CODING

## Subcode

### Q Channel

* https://bani.anime.net/iec958/q_subcode/project.htm
* https://github.com/carrotIndustries/redbook
* https://problemkaputt.de/psxspx-cdrom-subchannels.htm
* IEC 60908 (Audio recording - Compact disc digital audio system)

### Dumping

    $ cdrdao read-cd --read-raw --read-subchan rw_raw tocfile
    $ cat tocfile

### Example TOC

Extracted using custom software on a CD-i 210/05

#### Audio CD - Richie - Lach Isch, Oda Was?

CUE File from ripping tool

    FILE "Audio-CD-swap.bin" BINARY
    TRACK 01 AUDIO
        INDEX 01 00:00:00
    TRACK 02 AUDIO
        INDEX 00 03:26:36
        INDEX 01 03:26:45
    TRACK 03 AUDIO
        INDEX 00 07:01:39
        INDEX 01 07:01:60
    TRACK 04 AUDIO
        INDEX 00 12:10:32
        INDEX 01 12:10:47

TOC data buffered without missing sectors.
TOC repeats over and over

    0  01 00 02 01 14 11 00 03 28 45 db 2d Track 2 starts at 3:28:45
    1  01 00 02 01 14 12 00 03 28 45 35 ff
    2  01 00 02 01 14 13 00 03 28 45 9f ae
    3  01 00 03 01 14 14 00 07 03 60 cd b2 Track 3 starts at 7:03:60
    4  01 00 03 01 14 15 00 07 03 60 67 e3
    5  01 00 03 01 14 16 00 07 03 60 89 31
    6  01 00 04 01 14 17 00 12 12 47 28 2c Track 4 starts at 12:12:47
    7  01 00 04 01 14 18 00 12 12 47 4d d5
    8  01 00 04 01 14 19 00 12 12 47 e7 84
    9  01 00 a0 01 14 20 00 01 00 00 8d 93 First track is 1
    10  01 00 a0 01 14 21 00 01 00 00 27 c2
    11  01 00 a0 01 14 22 00 01 00 00 c9 10
    12  01 00 a1 01 14 23 00 04 00 00 cf 62 Last track is 4
    13  01 00 a1 01 14 24 00 04 00 00 a8 b6
    14  01 00 a1 01 14 25 00 04 00 00 02 e7
    15  01 00 a2 01 14 26 00 15 37 65 f0 12 Lead out. Total length of Audio
    16  01 00 a2 01 14 27 00 15 37 65 5a 43
    17  01 00 a2 01 14 28 00 15 37 65 3f ba
    18  01 00 01 01 14 29 00 00 02 00 b5 87 Track 1 starts at 00:02:00
    19  01 00 01 01 14 30 00 00 02 00 19 a1
    20  01 00 01 01 14 31 00 00 02 00 b3 f0
    21  01 00 02 01 14 32 00 03 28 45 3d 4b Now the TOC repeats with different timecode
    22  01 00 02 01 14 13 00 03 28 45 97 1a

Another recording without buffering. Missing sectors but shows the end of the Lead-In area
and start of track 1

    01 00 a0 02 17 69 00 01 00 00 22 e5
    01 00 a0 02 17 70 00 01 00 00 8e c3
    01 00 a1 02 17 72 00 04 00 00 66 63
    01 01 00 00 01 68 00 00 00 07 55 2f Lead In has ended. Pregap of 2 seconds seems to have started
    01 01 00 00 01 66 00 00 00 09 7b 49
    01 01 00 00 01 64 00 00 00 11 ac f3 The timecode is backwards and counts down. Track is now 1. Index is 0.

After 2 seconds, the index 1 of track 1 starts

    01 01 00 00 00 13 00 00 01 62 ee c4
    01 01 00 00 00 02 00 00 01 73 42 df
    01 01 01 00 00 00 00 00 02 00 5a 28 Index number has switched to 1. Probably audio data. Timecode 00:00:00. Absolute time 00:02:00
    01 01 01 00 00 01 00 00 02 01 e0 58
    01 01 01 00 00 03 00 00 02 03 84 99
    01 01 01 00 00 05 00 00 02 05 29 da
    01 01 01 00 00 07 00 00 02 07 4d 1b

### Play CDDA

Recording of "Play CDDA" command.
Extracted using custom software on a CD-i 210/05.

    01 01 01 01 14 56 00 01 16 56 e4 6f
    01 01 01 01 14 58 00 01 16 58 ca 09
    01 01 01 01 14 59 00 01 16 59 70 79
    01 01 01 01 14 70 00 01 16 70 64 7a
    01 01 01 01 14 72 00 01 16 72 01 3b
    01 01 01 01 14 73 00 01 16 73 bb 4b
    01 01 01 01 15 00 00 01 17 00 70 7a
    01 01 01 01 15 01 00 01 17 01 ca 0a

It turns out that every sector get's an IRQ. From the source code
of MAME it seemed to only cause an IRQ every sector with Frame=0.
This seems to be not the case on a real machine.
Thinking about this, it might also make sense concerning CD+G
will have visual data on every sector.
