	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
	move.w #$1234,$0
	move.w #$5678,$2
	move.b #$12,$4
	move.b #$34,$5
	move.w $0,d0
	move.w $2,d0

	move.b $4,d0
	move.b d0,$80002019
	move.b $5,d0
	move.b d0,$80002019
	move.b $0,d0
	move.b d0,$80002019
	move.b $1,d0
	move.b d0,$80002019

loop:
	bra loop