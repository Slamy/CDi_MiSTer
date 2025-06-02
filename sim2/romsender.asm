	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
	; Make a pause at the start to relax the UART on the linux side
	move.l $e40000,d0
	move.l $e60000,d0

	move #4000,d0
start_delay:
	add #-1,d0
	bne start_delay

	move.l #$e40000,a0
	move.l #524288/2,d1
loop:

wait_till_ready:
	move.b $80002013,d0
	btst.l #$2,d0
	beq wait_till_ready

	move.b (a0),d0
	move.b d0,$80002019
	adda.l #1,a0
	add.l #-1,d1
	bne loop

end:
	bra end

