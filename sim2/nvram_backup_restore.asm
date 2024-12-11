	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
    move.b #34,$320400

    nop
    nop
    nop
    nop
    nop
    nop
    nop

    move.b $320000,$80002019
    move.b $320002,$80002019
    move.b $320004,$80002019
    move.b $320006,$80002019

    move.b $323ff8,$80002019
    move.b $323ffa,$80002019
    move.b $323ffc,$80002019
    move.b $323ffe,$80002019

    nop
    nop
    nop
    nop
    nop
    nop

    move.b #$34,$320400

    move.b #$12,$320000
    move.b #$34,$320002
    move.b #$56,$320004
    move.b #$78,$320006

    move.b #$12,$323ff8
    move.b #$34,$323ffa
    move.b #$56,$323ffc
    move.b #$78,$323ffe

endless:
	bra endless
