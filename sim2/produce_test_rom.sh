vasmm68k_mot -Fbin -m68000 memtest.asm -o memtest.bin
vasmm68k_mot -Fbin -m68000 ramsender.asm -o ramsender.bin
vasmm68k_mot -Fbin -m68000 romsender.asm -o romsender.bin
vasmm68k_mot -Fbin -m68000 memzero.asm -o memzero.bin
vasmm68k_mot -Fbin -m68000 unaligned_video_test.asm -o unaligned_video_test.bin
vasmm68k_mot -Fbin -m68000 byte_word_test.asm -o byte_word_test.bin
vasmm68k_mot -Fbin -m68000 slavetest.asm -o slavetest.bin

xxd -p -c2 slavetest.bin cdi200.mem
xxd -p -c1 ../sim/cdimono1/zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206 slave.mem
