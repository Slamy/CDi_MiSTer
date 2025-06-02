	section .text

    org $400000

vector:
	dc.l $301000 ; Use CDIC memory for stack
    dc.l main

    dc.l 0,0
main:
	;Check ROMS
	move.w #$4afc,d0
	cmp.w ($e40000),d0
	bne error

	move.w #$ee2f,d0
	cmp.w ($e5fffe),d0
	bne error

	move.w #$4afc,d0
	cmp.w ($e60000),d0
	bne error

	move.w #$ee2f,d0
	cmp.w ($e7fffe),d0
	bne error

	move.b #'g',$80002019

	;DRAM Bank 0 Lower 256kB -> 0x000000 to 0x03ffff
	;DRAM Bank 1 Lower 256kB -> 0x040000 to 0x07FFFF
	move.l #0,a0
	move.l #(1024*512/4),d1
	move.b #'a',$80002019
	jsr memwrite

	;DRAM Bank 0 Upper 256kB -> 0x080000 to 0x0BFFFF
	;DRAM Bank 1 Upper 256kB -> 0x0C0000 to 0x0FFFFF
	move.l #$200000,a0
	move.l #(1024*512/4),d1
	move.b #'b',$80002019
	jsr memwrite

	;DVC RAM block 1 (according to mame) 1MB
	move.l #$d00000,a0
	move.l #(1024*1024/4),d1
	move.b #'c',$80002019
	jsr memwrite

	;DVC RAM block 2 (according to mame) 512kB
	move.l #$e80000,a0
	move.l #(1024*512/4),d1
	move.b #'d',$80002019
	jsr memwrite

	;DRAM Bank 0 Lower 256kB -> 0x000000 to 0x03ffff
	;DRAM Bank 1 Lower 256kB -> 0x040000 to 0x07FFFF
	move.l #0,a0
	move.l #(1024*512/4),d1
	move.b #'A',$80002019
	jsr memcmp

	;DRAM Bank 0 Upper 256kB -> 0x080000 to 0x0BFFFF
	;DRAM Bank 1 Upper 256kB -> 0x0C0000 to 0x0FFFFF
	move.l #$200000,a0
	move.l #(1024*512/4),d1
	move.b #'B',$80002019
	jsr memcmp

	;DVC RAM block 1 (according to mame) 1MB
	move.l #$d00000,a0
	move.l #(1024*1024/4),d1
	move.b #'C',$80002019
	jsr memcmp

	;DVC RAM block 2 (according to mame) 512kB
	move.l #$e80000,a0
	move.l #(1024*512/4),d1
	move.b #'D',$80002019
	jsr memcmp

	move.b #'G',$80002019

endless:
	bra endless

memwrite:
	move.l a0,d0
	move.l d0,(a0)
	add.l #4,a0
	add.l #-1,d1
	bne memwrite
	rts

memcmp:
	move.l a0,d0
	cmp.l (a0),d0
	bne error
	add.l #4,a0
	add.l #-1,d1
	bne memcmp
	rts

error:
	move.b #'Z',$80002019
	bra endless
	
