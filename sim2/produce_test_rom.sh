set -e

vasmm68k_mot -Fbin -m68000 vmpeg.asm -o vmpeg.rom

xxd -p -c2 vmpeg.rom cdi200.mem
#xxd -p -c2 cdimono1/vmpega_split.rom vmpega.mem
xxd -p -c1 ../sim/cdimono1/zx405042p__cdi_slave_2.0__b43t__zzmk9213.mc68hc705c8a_withtestrom.7206 slave.mem
#dd if=/dev/urandom of=save.bin count=16
