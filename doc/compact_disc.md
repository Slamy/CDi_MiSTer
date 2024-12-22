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

### Dumping

    $ cdrdao read-cd --read-raw --read-subchan rw_raw tocfile
    $ cat tocfile

