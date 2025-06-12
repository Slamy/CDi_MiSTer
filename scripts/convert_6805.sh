#!/bin/bash

# This script converts the 6805 VHDL code to Verilog usable by Verilator
set -e

cd "$(dirname "$0")/../rtl"

ghdl -a -fsynopsys -fexplicit 6805.vhd
ghdl synth --out=verilog -fexplicit -fsynopsys --latches ur6805  > ../sim2/ur6805.v
