	section .text

    org $400000

vector:
	dc.l $300
    dc.l main

    dc.l 0,0

main:
	;move.b #'A',$80002019

    ; Write 16 bit and read 8 bit
    move.w #$1234,$100
    move.b $100,d0
    cmp.b #$12,d0
    bne error

    move.w #$abcd,$100
    move.b $101,d0
    cmp.b #$cd,d0
    bne error

    ; Write two 8 bit and read as 16 bit

    move.b #$12,$102
    move.b #$34,$103
    move.w $102,d0
    cmp.w #$1234,d0
    bne error

    move.b #$ab,$103
    move.b #$cd,$102
    move.w $102,d0
    cmp.w #$cdab,d0
    bne error

	move.b #'O',$80002019

endless:
	bra endless

error:
	move.b #'Z',$80002019
	bra endless
