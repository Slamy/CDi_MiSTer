// VCD Pixel Clock Generator according to
// Interactive Engineer Volume 5, No. 5, September/October 1996
// http://icdia.co.uk/iengineer/IE_9605.pdf
//
// "A useful hint when developing titles containing
// MPEG streams:the 'White Book' cartridges all have a
// Sample Rate Converter (SRC) on board, converting the
// MPEG pixel frequency from 15 Mhz (Green Book) to
// 13.5 Mhz. This results in slightly larger backplane
// pixels. A film on videoCD - encoded with a width of
// 352 pixels - will not show full screen on a CD-i in
// Green Book mode, while showing full screen on a CD-
// i in White Book mode. 'White Book' cartridges
// recognise the type of disc inserted into the player and
// switch to the appropriate mode. Older cartridges,
// however, can’t switch between these modes and will
// show the videoCD not full screen and in the wrong
// aspect ratio."
//
// So, this module creates 13.5 MHz pixel clock from 30 MHz system clock

module sample_rate_converter (
    input clk30,  // Must be 30 MHz
    input reset,

    input vcd_mode,
    output bit newpixel
);
    bit [9:0] phase_accumulator = 0;
    bit [1:0] phase_accu_last = 0;
    
    // A VCD has a width of 352. The CD-i uses 384.
    // 352/384*256=234,666666666667
    // 234 does cut off a whole VCD pixel, so better not
    // 235 is not 100% correct but looks alright as a first test
    // After some analysis with real hardware, a VMPEG DVC
    // is cutting 1 pixel on the left and 5 on the right,
    // when trying to go for the whole 352 horizontal pixels.
    // The Robocop VCD seems to know that, as it configures the DVC as follows:
    //   move.l #$00140000,$00E04074 ; (X=0,Y=20)
    //   move.l #$00F00159,$00E04078 ; (W=345,H=240)
    //   move.l #$00000007,$00E0407C ; (X=7,Y=0)
    // 7 pixels are removed from the footage, since 352 horizontal pixels are present
    // in the stream.
    // To actually get the correct pixel clock, we need 13.5/15*256=230.4
    // There might be a debate on what we actually want. The correct pixel clock?
    // Or the whole width of the footage?
    localparam kVcdPhaseInc = 231;

    // Use 256 to skip the phase accumulation, resulting into 30 MHz pixel clock to match the base case
    localparam kBaseCasePhaseInc = 256;

    always_ff @(posedge clk30) begin
        newpixel <= phase_accumulator[9:8] == 1 && phase_accumulator[9:8] != phase_accu_last;
        phase_accu_last <= phase_accumulator[9:8];

        if (reset) begin
            phase_accumulator <= 0;
        end else begin
            phase_accumulator <= phase_accumulator + (vcd_mode ? kVcdPhaseInc : kBaseCasePhaseInc);
        end
    end
endmodule
