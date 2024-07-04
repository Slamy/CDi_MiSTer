#!/bin/bash
cd "$(dirname "$0")/../rtl"

ghdl_mcode -a -fsynopsys -fexplicit 6805.vhd
ghdl_mcode synth --out=verilog -fexplicit -fsynopsys --latches ur6805  > ur6805.v
