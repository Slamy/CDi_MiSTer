#!/bin/bash

# This script converts the 6805 VHDL code to Verilog usable by Verilator

cd "$(dirname "$0")/../rtl"

ghdl_mcode -a -fsynopsys -fexplicit 6805.vhd
ghdl_mcode synth --out=verilog -fexplicit -fsynopsys --latches ur6805  > ur6805.v
