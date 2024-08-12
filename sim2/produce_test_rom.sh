/opt/m68k-amigaos3/bin/vasmm68k_mot -Fbin -m68000 memtest.asm -o memtest.bin
/opt/m68k-amigaos3/bin/vasmm68k_mot -Fbin -m68000 ramsender.asm -o ramsender.bin
/opt/m68k-amigaos3/bin/vasmm68k_mot -Fbin -m68000 romsender.asm -o romsender.bin

xxd -p -c2 68ktest.bin cdi200.mem
xxd -p -c1 ../sim/cdimono1/zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206 slave.mem
