`ifndef VIDEO_TYPES_SVH
`define VIDEO_TYPES_SVH

typedef struct packed {
    bit [5:0] r;
    bit [5:0] g;
    bit [5:0] b;
} clut_entry_s;

typedef struct {
    bit [7:0] r;
    bit [7:0] g;
    bit [7:0] b;
} rgb888_s;

typedef struct packed {
    bit [7:0] y;
    bit [7:0] u;
    bit [7:0] v;
} yuv_s;

`endif