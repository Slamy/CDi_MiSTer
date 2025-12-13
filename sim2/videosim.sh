mkdir -p videosim
rm videosim/*.png
verilator --top-module emu  \
     --trace --trace-fst --trace-structs --cc --assert --exe --build   \
    --build-jobs 8 videosim_top.cpp -I../rtl  \
    ../rtl/*.sv ../CDi.sv ../rtl/*.v  \
    -I../rtl/mpeg -I../rtl/mpeg/fma ../rtl/mpeg/*.v ../rtl/mpeg/*.sv \
    ../rtl/mpeg/fma/*.sv  ../rtl/mpeg/fmv/*.sv  \
    tg68kdotc_verilog_wrapper.v ur6805.v \
    /usr/lib/x86_64-linux-gnu/libpng.so && ./obj_dir/Vemu $*

