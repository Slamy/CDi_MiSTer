# Servo

## SPI to Slave recorded on Philips CD-i 210/05

500 kHZ Clock rate

### With no CD in closed tray

    B0 00 00 22
    B0 00 00 25
    Now the SLAVE is asking for B0
    B0 00 00 25 as response on request
    B0 00 03 25 after 1.5s settled

### With CD-i in closed tray

    B0 00 00 22
    B0 00 00 25
    Now the SLAVE is asking for B0
    B0 00 00 25 as response on request
    B0 00 04 25 Settled

Now the Eject button is pressed

    A6 00 00 00 is transmitted to SERVO (Eject?)
    B0 00 03 26 is the response to SLAVE
    B0 00 03 27 after 1.25 seconds
    B0 00 03 28 after 102 ms
    B0 00 03 29 after 1 second
    B0 00 03 21 directly after

Now Eject is pressed again to close the tray

    A7 00 00 00 is transmitted to SERVO (Load?)
    B0 00 03 22 as response
    B0 00 03 23 after 100ms
    B0 00 03 24 after 1s
    B0 00 03 25 afterwards
    B0 00 00 25 afterwards
    B0 00 04 25 settled


### With Audio CD in closed tray

Ends with status `B0 00 01 25`

## SPI to Slave recorded on Philips CD-i 210/20

500 kHZ Clock rate
Clock and CS polarity seem to be wrong.
CS seems to be used by the SERVO to indicate it wants to talk to the SLAVE.
The slave will ask for exactly 4 bytes afterwards.

### Without CD in closed tray

After power on

    MOSI 0xff
    MISO 0xff

Then a pause of 250ms

    MOSI 0xDD
    MISO 0xEE

Then a short pause of 500µs
Is this the release number?

    MOSI 0xAA AA AA AA AA
    MISO 0xBB A3 41 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB AA 02 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 02

Then a pause of 600ms

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 11

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 0B

Then a pause of 40ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB AA 01 00 00

    MOSI 0xB0 00 00 00     requested by SLAVE
    MISO 0x55 61 01 01

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0x03 B0 00 00 0B

Then a pause of 1.5 seconds

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 03 05

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB AA 02 00 00


### With CD in closed tray

After power on

    MOSI 0xff
    MISO 0xff

Then a pause of 250ms

    MOSI 0xDD
    MISO 0xEE


Then a short pause of 500µs
Is this the release number?

    MOSI 0xAA AA AA AA AA
    MISO 0xBB A3 41 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB AA 02 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 02

Then a pause of 600ms

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 11

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 0B

Then a pause of 40ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB AA 01 00 00

    MOSI 0xB0 00 00 00     requested by SLAVE
    MISO 0x55 61 01 01

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0x03 B0 00 00 0B

Then a pause of 347ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 0C

Then a pause of 398ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 0D

Then a pause of 24ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 10

Then a pause of 1 second

    MOSI 0xAA AA AA AA AA requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 785ms

    MOSI 0xE1 00 02 13 requested by SLAVE
    MISO 0x55 C3 01 05

Then a pause of 1.8 second

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0x4F B0 00 06 10

Then a pause of 27ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 20ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 30ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 49ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 28ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 10

Then a pause of 132ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 06 0E

Afterwards there is silence



### With Hotel Mario in closed tray

After power on

    MOSI 0xff
    MISO 0xff

Then a pause of 250ms

    MOSI 0xDD
    MISO 0xEE

Then a short pause of 500µs
Is this the release number?

    MOSI 0xAA AA AA AA AA
    MISO 0xBB A3 41 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB AA 02 00 00

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 02

Then a pause of 600ms

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 11

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 00 0B

Then a pause of 40ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB AA 01 00 00

    MOSI 0xB0 00 00 00     requested by SLAVE
    MISO 0x55 61 01 01

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0x03 B0 00 00 0B
    
Then a pause of 347ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 0C

Then a pause of 398ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 0D


Then a pause of 24ms

    MOSI 0xAA AA AA AA AA  requested by SERVO
    MISO 0xAB B0 00 00 10

Then a pause of 341ms

    MOSI 0xAA AA AA AA AA requested by SERVO
    MISO 0xAB B0 00 04 10

The system now waits for user interaction. The cursor is centered on the Play button.
The CD-i knows that this is a CD-i disc with interactive content.
The user presses button 1 followed by:

    MOSI 0xE1 00 02 13 requested by SLAVE
    MISO 0x55 C3 01 05

After 1 second

    MOSI 0xAA AA AA AA AA requested by SERVO
    MISO 0xAB B0 00 04 10

After 360ms

    MOSI 0xAA AA AA AA AA requested by SERVO
    MISO 0xAB B0 00 04 0E

After 60ms 

    MOSI 0xE1 00 02 13 requested by SLAVE
    MISO 0x55 C3 01 05

    MOSI 0xAA AA AA AA AA requested by SERVO
    MISO 0xAB B0 00 04 10