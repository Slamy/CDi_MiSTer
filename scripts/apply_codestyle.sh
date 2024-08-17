#!/bin/bash

# This script applys a common codestyle to all verilog files
cd "$(dirname "$0")/../rtl"

verible-verilog-format --inplace --indentation_spaces 4 \
    ../rtl/*.v  ../rtl/*.sv  ../*.v ../*.sv
