	section .text

    org $400000

vector:
	dc.l $1234
    dc.l main

main:
	; Make a pause at the start to relax the UART on the linux side
	move #4000,d0
start_delay:
	add #-1,d0
	bne start_delay

	; Send lower bank
	move.l #0,a0
	move.l #524288,d1
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

	; Send upper bank
	move.l #$200000,a0
	move.l #524288,d1
loop2:

wait_till_ready2:
	move.b $80002013,d0
	btst.l #$2,d0
	beq wait_till_ready2

	move.b (a0),d0
	move.b d0,$80002019
	adda.l #1,a0
	add.l #-1,d1
	bne loop2

end:
	bra end

