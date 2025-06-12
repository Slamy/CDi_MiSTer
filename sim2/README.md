# Verilator Simulation

Verilator is much faster than ModelSim but is restricted to Verilog/SystemVerilog.
VHDL source code must be converted first.

Please use the [convert scripts](../scripts/) in case the VHDL code was changed.
To be safe, a conversion is already part of the repo.

## Prerequisites

You need CD images to use with the simulation. Only the `.bin` files are required. `.chd` is not supported.

## Usage

    ./sim_top.sh
