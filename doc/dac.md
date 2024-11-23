# Audio Mixer

* for both AD7528, the input A is the same side while the input B is the other side
    * 7530 AD7528 produces Audio Right
        * VrefA is DAC Right
        * VrefB is DAC Left
    * 7550 AD7528 produces Audio Left
        * VrefA is DAC Left
        * VrefB is DAC Right


## Zelda - Wand of Gamelon

Philips Logo (Stereo Music)

    Left  A 00
        B FF
    Right A 00
        B FF
    
    Atten: ca  7f 0 7f 0

Map (Stereo Music)

    Left  A 00
        B 00
    Right A 00
        B 00
    
    Atten: ca  7f 0 7f 0

Ingame (2 Mono mixed in one)

    Left  A FF
        B FF
    Right A FF
        B FF

    Atten: c0  0 0 0 0

Ingame (2 Mono but both damped)

    Left  A 40
        B 40
    Right A 40
        B 40

    Atten: c0  c c c c
    


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
