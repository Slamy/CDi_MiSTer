# Audio Mixer

* for both AD7528, the input A is the same side while the input B is the other side
    * 7530 AD7528 produces Audio Right
        * VrefA is DAC Right
        * VrefB is DAC Left
    * 7550 AD7528 produces Audio Left
        * VrefA is DAC Left
        * VrefB is DAC Right


Muting results into all DAC values being 0

## Audio CD

The system settings have 5 volume levels

Level 0

    factor_left_a   0x00
    factor_left_b   0x40
    factor_right_a  0x00
    factor_right_b  0x40

Level 1

    factor_left_a   0x00
    factor_left_b   0x5B
    factor_right_a  0x00
    factor_right_b  0x5B

Level 3

    factor_left_a   0x00
    factor_left_b   0x80
    factor_right_a  0x00
    factor_right_b  0x80

Level 4

    factor_left_a   0x00
    factor_left_b   0xB5
    factor_right_a  0x00
    factor_right_b  0xB5

Level 5

    factor_left_a   0x00
    factor_left_b   0xFF
    factor_right_a  0x00
    factor_right_b  0xFF

Note: For some reason, these settings are not transported using the Cx command

## Zelda - Wand of Gamelon

Philips Logo (Stereo Music)

    Atten: ca  7f 0 7f 0
    DAC Left 0   0
    DAC Left 1 255
    DAC Right 0   0
    DAC Right 1 255

Intro Logo

    Atten: c0  0 0 0 0
    DAC Right 0 255
    DAC Left 1 255
    DAC Left 0 255
    DAC Right 1 255

King Opening Cutscene

    Atten: c0  0 0 0 0
    DAC Right 0 255
    DAC Left 1 255
    DAC Left 0 255
    DAC Right 1 255

Map (Stereo Music)

    Atten: ca  7f 0 7f 0
    DAC Left 0   0
    DAC Left 1 255
    DAC Right 0   0
    DAC Right 1 255

Ingame (2 Mono mixed in one)

    Atten: c0  0 0 0 0
    DAC Right 0 255
    DAC Left 1 255
    DAC Left 0 255
    DAC Right 1 255

Ingame (2 Mono but both damped)

    Atten: c0  c c c c
    DAC Right 0  64
    DAC Left 1  64
    DAC Left 0  64
    DAC Right 1  64

## Zelda's Adventure

Philips Logo + Intro Cutscene

    Atten: c5  0 0 0 0
    DAC Left 0 255
    DAC Left 1   0
    DAC Right 0 255
    DAC Right 1   0

BGM is on the left channel. SFX is on the right channel.

	Atten: c0  0 0  0 12   Zelda at right edge

    DAC Left 0 255
    DAC Left 1 255
    DAC Right 0 255
    DAC Right 1  64

	Atten: c0  0 0 12  0   Zelda at left edge

    DAC Left 0  64
    DAC Left 1 255
    DAC Right 0 255
    DAC Right 1 255

	Atten: c0  0 0  0  0   Zelda in center

    DAC Left 1 255
    DAC Left 0 255
    DAC Right 0 255
    DAC Right 1 255

## Hotel Mario

Philips Logo, Intro, Menu and ingame

    Atten: c0  0 0 0 0

    factor_left_a   0xFF
    factor_left_b   0xFF
    factor_right_a  0xFF
    factor_right_b  0xFF

## Experiments with SDK API

According to the green book, the bit 7 mutes the Audio.
Let's test that. Both of these cause a factor of 00 on mixer.

    sc_atten(Sound, 0xe0e0e0e0);

    Unmute 83
    Atten: cf  60 60 60 60
    Atten: cf  60 60 60 60
    Mute   82

or this

    sc_atten(Sound, 0x80808080);

    Unmute 83
    Atten: cf  0 0 0 0
    Atten: cf  0 0 0 0
    Mute   82


This here is used by Frog Feast.
All A factors are 0xff while B factors are 00 causing a full stereo signal.

    /* Set maximum volume in left-left and right-right channels */
    sc_atten(Sound, 0x00800080);

    Unmute 83
    Atten: c5  0 0 0 0
    Atten: c5  0 0 0 0
    Mute   82


This here does factor 0xff on all 4 parameters.
It transforms stereo into mono:

    sc_atten(Sound, 0x0);

    Unmute 83
    Atten: c0  0 0 0 0
    Atten: c0  0 0 0 0
    Mute   82

It can't hear it but this should swap the channels:

	sc_atten(Sound, 0x80008000);

    Unmute 83
    Atten: ca  0 0 0 0
    Atten: ca  0 0 0 0
    Mute   82

At least this is what I assume, considering that all A factors are 00 while all B factors are 0xff.

This also means that there is a translation layer in the software.
