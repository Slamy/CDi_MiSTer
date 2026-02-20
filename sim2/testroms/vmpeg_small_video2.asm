	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main

main:
	move.w #$0000,$303FFE ; Data buffer

	move.w #$2000,$E040C0 ; FMV SYSCMD - Decoder off
	nop
	move.w #$0100,$E040C0 ; FMV SYSCMD - Clear FIFO
	nop
	move.w #$1000,$E040C0 ; FMV SYSCMD - Decoder on

	move.w #$02D4,$E040DC ; FMV IVEC
	move.w #$F7CF,$E04060 ; FMV IER
	move.l #fmvirq,$168

	move.w #$807B,$E0300C ; FMA IVEC
	move.w #$013C,$E0301C ; FMA IER
	move.l #fmairq,$1EC

	move #$2000,SR

	move.b d0,$80004040 ; reset status
	move.l #mpeg_bin,$8000400c ; Memory Address Counter
	move.w #2324/2,$8000404a  ; Memory Transfer Counter
	move.b #$04,$80004046 ; SCR, MAC Count Up, DAC No Change (like the CDIC on CH1)
	move.b #$12,$80004045 ; Dev. to Mem., 16 Bit Words,
	move.b #$30,$80004044 ; ACK/RDY device (like the CDIC on CH1)
	move.b #$80,$80004047 ; start DMA

	move.l #0,$0E0407C ;FMV_DECOFF
	move.l #$01180180,$0E04078 ;FMV_DECWIN 384 x 280
	move.l #0,$0E04074 ;FMV_DECOFF
	move.w #$8,$0E040C2; Request Update

	move.w #$8000,$00E040C0 ; Syscmd = Start DMA

	; Usually one would use the DTS and SCR to start playback
	; But I feel lazy and use the number of pics instead
waitforpics:
	cmp.w #2,$00E040A4 ; Compare 1 against pictures in FIFO
	bmi waitforpics

	move.b #'B',$80002019

	move.w #$0008,$E040C0 ; FMV SYSCMD - Play
	move.w #$0420,$E040C2 ; FMV VIDCMD - Show on next frame

endless:
	bra endless


fmvirq:
	move.b #'V',$80002019
	move $00E04062,d7
	rte

fmairq:
	move.b #'A',$80002019
	move $00E0301A,d7
	rte

mpeg_bin:
    dc.b $00, $00, $01, $ba, $21, $00, $01, $00, $01, $80, $17, $c9
    dc.b $00, $00, $01, $bb, $00, $09, $80, $17, $c9, $00, $21, $ff
    dc.b $e0, $e0, $2e, $00, $00, $01, $e0, $02, $e6, $31, $00, $03
    dc.b $51, $81, $11, $00, $03, $35, $61, $00, $00, $01, $b3, $08
    dc.b $00, $10, $13, $02, $ce, $e0, $a0, $00, $00, $01, $b8, $00
    dc.b $08, $00, $40, $00, $00, $01, $00, $00, $0f, $ff, $f8, $00
    dc.b $00, $01, $01, $13, $f8, $7d, $29, $48, $8b, $94, $a5, $22
    dc.b $2e, $52, $94, $88, $b9, $4a, $52, $22, $e5, $29, $48, $8b
    dc.b $94, $a5, $22, $2e, $52, $94, $88, $bf, $db, $74, $a5, $22
    dc.b $20, $00, $00, $01, $00, $00, $57, $ff, $f9, $00, $00, $00
    dc.b $01, $01, $12, $72, $62, $08, $00, $1f, $e0, $81, $00, $a6
    dc.b $08, $77, $e0, $0b, $81, $1c, $cc, $01, $f0, $25, $f2, $80
    dc.b $17, $c0, $80, $01, $fe, $08, $10, $0a, $60, $87, $7e, $00
    dc.b $b8, $11, $cc, $c0, $1f, $02, $5f, $28, $01, $7d, $1f, $da
    dc.b $ef, $ce, $c0, $80, $01, $6e, $08, $67, $80, $0e, $41, $1f
    dc.b $78, $04, $e0, $96, $20, $00, $f2, $fd, $13, $7e, $76, $04
    dc.b $00, $0b, $70, $43, $3c, $00, $72, $08, $fb, $c0, $27, $04
    dc.b $b1, $00, $07, $91, $14, $81, $9c, $00, $00, $01, $00, $00
    dc.b $97, $ff, $f8, $80, $00, $00, $01, $01, $12, $74, $c4, $10
    dc.b $1b, $41, $02, $01, $d0, $10, $d9, $41, $03, $3c, $12, $08
    dc.b $01, $2f, $5c, $01, $44, $08, $0d, $a0, $81, $00, $e8, $08
    dc.b $6c, $a0, $81, $9e, $09, $04, $00, $97, $ae, $00, $a2, $8f
    dc.b $ed, $77, $88, $04, $00, $08, $c0, $43, $ab, $00, $28, $04
    dc.b $8e, $d0, $4b, $17, $00, $ce, $f6, $f7, $88, $04, $00, $08
    dc.b $c0, $43, $ab, $00, $28, $04, $8e, $d0, $4b, $17, $00, $ce
    dc.b $22, $8f, $f2, $dd, $29, $48, $8a, $39, $4a, $52, $22, $9c
    dc.b $00, $00, $01, $00, $00, $d7, $ff, $f9, $00, $00, $00, $01
    dc.b $01, $12, $7b, $10, $40, $6d, $04, $08, $07, $40, $43, $65
    dc.b $04, $0c, $f0, $48, $20, $04, $bd, $70, $05, $10, $20, $36
    dc.b $82, $04, $03, $a0, $21, $b2, $82, $06, $78, $24, $10, $02
    dc.b $5e, $b8, $02, $8a, $3f, $b5, $de, $20, $10, $00, $23, $01
    dc.b $0e, $ac, $00, $a0, $12, $3b, $41, $2c, $5c, $03, $3b, $db
    dc.b $de, $20, $10, $00, $23, $01, $0e, $ac, $00, $a0, $12, $3b
    dc.b $41, $2c, $5c, $03, $38, $8a, $47, $c8, $1d, $d1, $c0, $00
    dc.b $00, $01, $00, $01, $17, $ff, $f9, $00, $00, $00, $01, $01
    dc.b $12, $3f, $b5, $d2, $94, $88, $a4, $7c, $81, $dc, $8e, $00
    dc.b $00, $01, $00, $01, $57, $ff, $f9, $80, $00, $00, $01, $01
    dc.b $12, $41, $6e, $21, $fd, $ae, $94, $a4, $44, $00, $00, $01
    dc.b $00, $01, $97, $ff, $f9, $00, $00, $00, $01, $01, $12, $72
    dc.b $62, $08, $00, $1f, $e0, $81, $00, $a6, $08, $77, $e0, $0b
    dc.b $81, $1c, $cc, $01, $f0, $25, $f2, $80, $17, $c0, $80, $01
    dc.b $fe, $08, $10, $0a, $60, $87, $7e, $00, $b8, $11, $cc, $c0
    dc.b $1f, $02, $5f, $28, $01, $7d, $1f, $da, $ef, $ce, $c0, $80
    dc.b $01, $6e, $08, $67, $80, $0e, $41, $1f, $78, $04, $e0, $96
    dc.b $20, $00, $f2, $fd, $13, $7e, $76, $04, $00, $0b, $70, $43
    dc.b $3c, $00, $72, $08, $fb, $c0, $27, $04, $b1, $00, $07, $91
    dc.b $14, $81, $9c, $00, $00, $01, $00, $01, $d7, $ff, $f8, $80
    dc.b $00, $00, $01, $01, $12, $74, $c4, $10, $1b, $41, $02, $01
    dc.b $d0, $10, $d9, $41, $03, $3c, $12, $08, $01, $2f, $5c, $01
    dc.b $44, $08, $0d, $a0, $81, $00, $e8, $08, $6c, $a0, $81, $9e
    dc.b $09, $04, $00, $97, $ae, $00, $a2, $8f, $ed, $77, $88, $04
    dc.b $00, $08, $c0, $43, $ab, $00, $28, $04, $8e, $d0, $4b, $17
    dc.b $00, $ce, $f6, $f7, $88, $04, $00, $08, $c0, $43, $ab, $00
    dc.b $28, $04, $8e, $d0, $4b, $17, $00, $ce, $22, $8f, $f2, $dd
    dc.b $29, $48, $8a, $39, $4a, $52, $22, $9c, $00, $00, $01, $00
    dc.b $02, $17, $ff, $f9, $00, $00, $00, $01, $01, $12, $7b, $10
    dc.b $40, $6d, $04, $08, $07, $40, $43, $65, $04, $0c, $f0, $48
    dc.b $20, $04, $bd, $70, $05, $10, $20, $36, $82, $04, $03, $a0
    dc.b $21, $b2, $82, $06, $78, $24, $10, $02, $5e, $b8, $02, $8a
    dc.b $3f, $b5, $de, $20, $10, $00, $23, $01, $0e, $ac, $00, $a0
    dc.b $12, $3b, $41, $2c, $5c, $03, $3b, $db, $de, $20, $10, $00
    dc.b $23, $01, $0e, $ac, $00, $a0, $12, $3b, $41, $2c, $5c, $03
    dc.b $38, $8a, $47, $c8, $1d, $d1, $c0, $00, $00, $01, $00, $02
    dc.b $57, $ff, $f9, $00, $00, $00, $01, $01, $12, $3f, $b5, $d2
    dc.b $94, $88, $a4, $7c, $81, $dc, $8e, $00, $00, $01, $be, $06
    dc.b $07, $0f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
    dc.b $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
