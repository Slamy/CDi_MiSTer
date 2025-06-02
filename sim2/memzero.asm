	section .text

    org $400000

vector:
	dc.l $300
    dc.l main

    dc.l 0,0
main:
	move.l #0,d0

	move.l #0,a0
	move.l #(1024*512/4),d1	
erasebank0:
	move.l d0,(a0)
	add.l #4,a0
	add.l #-1,d1
	bne erasebank0


	move.l #$200000,a0
	move.l #(1024*512/4),d1
erasebank1:
	move.l d0,(a0)
	add.l #4,a0
	add.l #-1,d1
	bne erasebank1

endless:
	bra endless

