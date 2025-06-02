	section .text

    org $400000

vector:
	dc.l $1234
	dc.l main

main:
	move.w #$02D4,$E040DC ; FMV IVEC
	move.w #$F7CF,$E04060 ; FMV IER
	move.l #fmvirq,$168

	move.w #$807B,$E0300C ; FMA IVEC
	move.w #$013C,$E0301C ; FMA IER
	move.l #fmairq,$1EC

	move.w #$2480,$303FFC ; CDIC IVEC
	move.l #cdicirq,$200

	move #$2000,SR

	move.w #$0024,$303C00 ; Command Register = Reset Mode 2
	move.w #$8000,$303FFE ; Data buffer

	; Designed for FMVTest
	; Start reading at 00:32:34
	move.w #$002a,$303C00 ; Read Mode 2
	move.w #$0100,$303C06 ; File Register
	move.l #$0001,$303C08 ; Channel Register
	move.w #$0000,$303C0C ; Audio Channel Register
	move.l #$00323400,$303C02 ; Timer Register
	move.w #$C000,$303FFE ; Start the Read by setting bit 15 of the data buffer


endless:
	jsr waitforcdicirq
	
	; Debug print mode 2 header
	;move.b 0(a0),$80002019 ; Timecode M
	;move.b 1(a0),$80002019 ; Timecode S
	;move.b 2(a0),$80002019 ; Timecode F
	move.b 10(a0),$80002019 ; Mode 2 Header
	move.b 11(a0),$80002019 ; Coding
	;move.b 5(a0),$80002019
	;move.b 6(a0),$80002019
	;move.b 7(a0),$80002019
	
	; We need to check for the Mode 2 header now. It can be either MPEG Audio or MPEG Video
	; MPEG Video should have submode 0x62 (Real Time Sector, Form and Video)
	; followed by a coding of 0x0f (for MPEG Video)
	; MPEG Audio should have 0x64 (Real Time Sector, Form and Video)
	; followed by a coding of 0x7f (for MPEG Audio)
	move.b 10(a0),d2
	cmp.b #$64,d2
	beq audio
	cmp.b #$62,d2
	beq video

	; Continue loop if nothing matches
	bra endless

audio:
	; DMA CDIC to Memory
	move.b d0,$80004000 ; reset status
	move.l #$3000,$8000400c ; Memory Address Counter
	move.w #$480,$8000400a  ; Size for MPEG Audio
	move.b #$92,$80004005 ; Dev. to Mem., 16 Bit Words, 
	move.b #$80,$80004007 ; start DMA
	move.w d1,$303FF8 ; DMA Control Register = Start Transmission at a00

	; DMA Memory to FMA
	move.b d0,$80004040 ; reset status
	move.l #$3000,$8000404c ; Memory Address Counter
	move.w #$480,$8000404a  ; Memory Transfer Counter
	move.b #$04,$80004046 ; SCR, MAC Count Up, DAC No Change (like the CDIC on CH1)
	move.b #$12,$80004045 ; Dev. to Mem., 16 Bit Words,
	move.b #$30,$80004044 ; ACK/RDY device (like the CDIC on CH1)
	move.b #$80,$80004047 ; start DMA

	move.w #$8002,$00E03000 ; Syscmd = Start DMA

	; Continue loop
	bra endless

video:
	; DMA CDIC to Memory
	move.b d0,$80004000 ; reset status
	move.l #$3000,$8000400c ; Memory Address Counter
	move.w #$48a,$8000400a  ; Size for MPEG Video
	move.b #$92,$80004005 ; Dev. to Mem., 16 Bit Words, 
	move.b #$80,$80004007 ; start DMA
	move.w d1,$303FF8 ; DMA Control Register = Start Transmission at a00

	; DMA Memory to FMV
	; The original driver uses 0x484 for memory transfer counter
	; since the first 6 words are transferred via CPU to XFER
	; in this case we use DMA for everything
	move.b d0,$80004040 ; reset status
	move.l #$3000,$8000400c ; Memory Address Counter
	move.w #$48a,$8000404a  ; Memory Transfer Counter
	move.b #$04,$80004046 ; SCR, MAC Count Up, DAC No Change (like the CDIC on CH1)
	move.b #$12,$80004045 ; Dev. to Mem., 16 Bit Words,
	move.b #$30,$80004044 ; ACK/RDY device (like the CDIC on CH1)
	move.b #$80,$80004047 ; start DMA

	move.w #$8000,$00E040C0 ; Syscmd = Start DMA

	bra endless


waitforcdicirq:
	move #0,d0
waitforcdicirqloop:
	cmp #0,d0
	beq waitforcdicirqloop
	move.b #'O',$80002019
	rts

cdicirq:
	move.b #'I',$80002019
	move.w $303FF4,d0 ; clear flags on ABUFD
	; ignore ABUF
	move.w $303FF6,d0 ; clear flags on XBUF

	btst.l #$f,d0
	beq noint

	move.w $303FFe,d0
	btst.l #$0,d0 ; check lowest bit of data buffer
	beq lower_buf
higher_buf:
	move.w #$8a0c,d1 ; DMA Control for 0x0A0C
	move.l #$300a00,a0 ; Buffer location in CDIC memory
	bra read_data
lower_buf:
	move.w #$800c,d1 ; DMA Control for 0x000C
	move.l #$300000,a0 ; Buffer location in CDIC memory
read_data:
	; Highest bit is set
	move #1,d0
	rte
noint:
	move #0,d0
	rte

fmvirq:
	move.b #'V',$80002019
	move $00E04062,d7
	rte

fmairq:
	move.b #'A',$80002019
	move $00E0301A,d7
	rte


