# Input Device

## Sources

https://www.theworldofcdi.com/open-source/hardware-development/the-cd-i-controller-interface/
https://www.theworldofcdi.com/open-source/hardware-development/cd-i-gamepad-adapter/
https://github.com/anarterb/SNEStoCDi/blob/master/sketchSNEStoCDi.ino

Communication starts with device sending 0b11001010 to CD-i player.

Afterwards a frame of 3 is transmitted

Idle state:
0= 0b11000000
1= 0b10000000
2= 0b10000000

TODO
