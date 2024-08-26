verilator --top-module emu --trace --cc --assert --exe --timing --build   \
    --build-jobs 8 sim_top.cpp -I../rtl   \
    ../rtl/*.sv ../CDi.sv ../rtl/*.v  \
    /usr/lib/x86_64-linux-gnu/libpng.so && ./obj_dir/Vemu

# -DDISABLE_MAIN_CPU -DDISABLE_SLAVE_UC