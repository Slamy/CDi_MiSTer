derive_pll_clocks
derive_clock_uncertainty

# core specific constraints

set_false_path -from {*|flag_cross_domain*|flagtoggle_clk_a*} -to {*|flag_cross_domain*|synca_clk_b*}
set_false_path -from {*|signal_cross_domain*|signal_clk_a} -to {*|signal_cross_domain*|synca_clk_b[0]}
set_false_path -from {*|ddr_to_byte_fifo:fifo_y|waddr_q*} -to {*|ddr_to_byte_fifo:fifo_y|waddr_q2*}
set_false_path -from {*|ddr_to_byte_fifo:fifo_y|raddr_q*} -to {*|ddr_to_byte_fifo:fifo_y|raddr_q2*}

set_false_path -from {*|mpeg_video:video|mpeg_stream_fifo_write_adr_syncval*} -to {*|mpeg_video:video|mpeg_stream_fifo_write_adr_clk_mpeg*}

set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frame_period_clk_mpeg*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frame_period*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|yuv_frame_adr_fifo:readyframes|valid} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|for_display_valid*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_height*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|frame_height_clkvideo*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_width*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|frame_width_clkvideo*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|pictures_in_fifo_clk_mpeg_gray_q*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|pictures_in_fifo_clk30_gray*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|linecnt*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|linecnt_clkddr*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|yuv_frame_adr_fifo:readyframes|altsyncram:ram_rtl_0|altsyncram_g3n1:auto_generated|ram_block1a0~PORT_B_WRITE_ENABLE_REG} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|first_intra_frame_of_gop_clk30}

# protected by just_decoded_commit_clk30
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_width_clk_mpeg*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_width*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_height_clk_mpeg*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|decoder_height*}


# protected by latch_frame_clkvideo
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|video_ctrl_window_height*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|frame_height_clkddr*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|video_ctrl_window_width*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|frame_width_clkddr*}

# protected by latch_frame_clkddr
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|video_ctrl_decoder_offset_y*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|window_y_clkddr*}
set_false_path -from {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|video_ctrl_decoder_offset_x*} -to {emu:emu|cditop:cditop|vmpeg:vmpeg_inst|mpeg_video:video|frameplayer:frameplayer|window_x_clkddr*}

