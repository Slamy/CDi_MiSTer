verilator --top-module emu --trace --cc --assert --exe  --timing --build --trace-structs  \
    --build-jobs 8 sim_top.cpp -I../rtl \
    ../sim/fx68k_tb.sv ../rtl/*.sv ../CDi.sv ../rtl/*.v  \
    /usr/lib/x86_64-linux-gnu/libpng.so && ./obj_dir/Vemu
