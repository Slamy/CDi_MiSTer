# Analysis of Lost Ride

@00407FB2(kernel)   Found cdi_LostRide module at $dd7710 (revision 1, crc $B1DE13, 125950 bytes)

4076ec

DVC ROM Addresses

00e52944 PSOrg      15018308
00e5297c PSPos      15018364
00e52a50 PSWndw     15018576
00e54386 IndicNIS   15025030

PSWndw
D3 0
D4 04800160    1152x352


PSOrg
D3 ff24005e
   ffe60038
   
setstt
  MV_Org = 0x10c   d3 H:V origin

00ded4ac Wrapper function for PSOrg / MV_Org?
  Called from d0879c (jump table?)
    Called from de279a (inside function FUN_00de2122) dez 14559130

When broken at the start
    de279a calls d0879c calls 00ded4ac

So what is the problem? A failing test?

00ded4ac is a wrapper function for MV_Org! The parameter D3 is taken from stack.

uVar2 = (*(code *)(unaff_A6 + 0x79c))((int)*(short *)(unaff_A6 + -0x320a),iVar1,0);


a6 d08000

unaff_A6 + -0x320a
unaff_A6 + -0x3206

d0bab6 ffff ffac    dez 13679286
d0baba 0000 005e    dez 13679290


(short*)-0x320a,A6     d04df6 horizontal pos? used for MV_Org 13651446
(char*) -0x446f,A6            joystick controls maybe?
(short*)-0x3206,A6     d04dfa allowed limit? is 0 when broken  dez 13651450


at 00de1cb8 there is a write to (A6-0x320a)    dez 14556344
at 00dde56a there is a read to (A6-0x320a)
at 00de2720 there is a read to (A6-0x320a) and a write, the one for position setting? dez 14559008

at 00de272E there is a clear of (A6-0x320a)   dez 14559022
It seems to trigger whenever one touches the left side of the screen during working condition

at 0de2742 there is an overwrite of (A6-0x320a)  with (A6-0x3206)?    dez 14559042


At df6bca event handler for MPEG?
At df0de2 another event handler for MPEG?


(short*)-0x3206,A6 / d04dfa is preloaded with FE80 when loading a save file

(short*)-0x3206,A6 is
  written at de1cc4 during loading of save
  read at 0xdde562 even when paused but also during game
  read at de273c during game


  

