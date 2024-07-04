	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

    dc.l 0,0
main:
	move #$2000,SR  

	move.l #timerisr,$f8
	move.b #06,$80002045 ; PICR1
	move.w #$fff0,$80002024 ; Timer0



	nop
endless:
	bra endless

timerisr:
	move.b #$ff,$80002020 ; Timer Reset IRQ

	rte
