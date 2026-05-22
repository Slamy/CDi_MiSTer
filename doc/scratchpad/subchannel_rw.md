# Analysis of subchannel RW data

Based on a Karaoke party CD with EAN13 4015625810930

## CloneCD Dump (.sub file)

The format is defined as such:

    File.SUB - 96 (60h) bytes per sector (subchannel P..W with 96 bits each)
    Contains subchannel data, recorded at 60h bytes per sector.

    00h..0Bh 12 Subchannel P (Pause-bits, usually all set, or all cleared)
    0Ch..17h 12 Subchannel Q (ADR/Control, custom info, CRC-16-CCITT)
    18h..5Fh .. Subchannel R..W (usually zero) (can be used for CD-TEXT)

Sector 4Dh * 60h = 00001ce0
Timecode 00:03:02 (the first 2 seconds are usually pregap)
4dh = 77 = 1 second of 75 frames + 2 frames. So it is correctly calculated
and matches the subchannel Q in this dump

    00001ce0  00 00 00 00 00 00 00 00  00 00 00 00 01 01 01 00
    00001cf0  01 02 00 00 03 02 48 78  00 00 00 00 00 00 00 00
    00001d00  00 10 00 00 00 00 00 00  00 00 00 00 00 00 00 00
    00001d10  80 00 00 80 00 00 80 00  00 80 00 00 00 00 00 00
    00001d20  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
    00001d30  00 00 00 00 80 00 00 80  00 00 80 00 20 a0 00 20

    00001d40  00 00 00 00 00 00 00 00  00 00 00 00 01 01 01 00
    00001d50  01 03 00 00 03 03 f2 08  00 00 00 04 00 08 14 00
    00001d60  0e 04 00 01 10 00 00 14  00 08 04 00 08 14 00 01
    00001d70  90 00 08 94 00 00 84 00  02 84 00 0a 10 00 08 04
    00001d80  00 04 34 00 04 24 00 09  20 00 00 20 00 0c 00 00
    00001d90  0a 00 00 06 90 00 28 b0  00 2c 80 00 20 b0 00 22

    00001da0  00 00 00 00 00 00 00 00  00 00 00 00 01 01 01 00
    00001db0  01 04 00 00 03 04 e5 3b  14 00 0f 14 00 01 04 00
    00001dc0  07 04 00 09 04 00 09 04  00 01 14 00 01 04 00 09
    00001dd0  94 00 02 94 00 0e a4 00  0e a4 00 06 34 00 01 24
    00001de0  00 0d 14 00 0d 04 00 01  20 00 02 20 00 0a 00 00
    00001df0  0c 00 00 00 80 00 26 a0  00 24 90 00 28 b0 00 2a

## On the CD-i as provided by the CDIC

Timecode 03:02

    09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 00 09 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 01 00 00 00 00 00 09 00 01 20 00 00 00 00
    00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00

When deinterleaving Timecode 03:02 in software, we get this

    00 00 00 00 00 00 00 00 00 10 00 00
    00 00 00 00 00 00 00 00 00 00 00 00
    80 00 00 80 00 00 80 00 00 80 00 00
    00 00 00 00 00 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 00 00 00 00 00
    80 00 00 80 00 00 80 00 20 a0 00 20

It is a match with the data from the CloneCD dump.

Timecode 03:03

    09 00 02 1d 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 01 00 0d 00 00 00 09 00 03 19 00 3c 00 00
    00 00 00 00 00 00 00 00 00 00 01 00 33 07 00 00
    09 00 04 24 00 3c 00 00 00 00 00 00 00 00 00 00
    00 00 01 00 32 24 2a 00 09 00 05 11 00 3c 00 00
    00 00 00 00 00 00 00 00 00 00 01 00 0c 02 0b 34

## cdrdao format

There are 2 options according to the manual for reading sub channels R-W

    rw_raw
      for reading raw R-W sub-channel data
      (not de-interleaved, not error corrected, L-EC data included in the track image)
    rw
      for reading packed R-W sub-channel data
      (de-interleaved and error corrected) 



A CD sector is stored as 2448 byte -> 2352 byte of Audio + 96 byte of subcode
Sector 77 would be interesting. The subcode would be at 2448*77+2352=190848 (0x2E980)

    cdrdao read-cd --read-raw --read-subchan rw_raw tocfile

The resulting data.bin will contain this at timecode 03:02

    09 00 00 00 00 00 00 40 00 00 00 00 00 00 00 40
    00 00 00 00 00 00 00 40 09 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 40 00 00 00 00 00 00 40 00
    09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 01 00 00 00 40 40 09 00 01 20 00 00 40 00

So, this indeed is a direct match with the CDIC when ignoring bits 6 and 7.
Those should represent Q and P.

    cdrdao read-cd --read-raw --read-subchan rw tocfile

    09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 00 09 00 00 00 00 00 00 00
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    00 00 01 00 00 00 00 00 09 00 01 20 00 00 00 00
    00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00

For some reason, this looks very similar... but the higher bits 6 and 7 are missing.


# References

https://problemkaputt.de/psxspx-cdrom-disk-images-ccd-img-sub-clonecd.htm