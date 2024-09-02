# Servo

## SPI to Slave

500 kHZ Clock rate
Clock and CS polarity seem to be wrong.

### Without CD in tray

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

    MOSI 0xAA AA AA AA AA
    MISO 0xAB AA 01 00 00

    MOSI 0xB0 00 00 00     requested by SLAVE
    MISO 0x55 61 01 01

    MOSI 0xAA AA AA AA AA
    MISO 0x03 B0 00 00 0B

Then a pause of 1.5 seconds

    MOSI 0xAA AA AA AA AA
    MISO 0xAB B0 00 03 05

    MOSI 0xAA AA AA AA AA
    MISO 0xAB AA 02 00 00
