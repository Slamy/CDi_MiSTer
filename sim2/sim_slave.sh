verilator --top-module tb_slave --trace --cc --assert --exe  --timing --build \
    --build-jobs 8 sim_slave.cpp \
    tb_slave.sv ../rtl/ur6805.v ../rtl/u3090mg.sv \
    ../rtl/uc_68hc05.sv && ./obj_dir/Vtb_slave
