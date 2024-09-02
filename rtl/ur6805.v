module fadd
  (input  a,
   input  b,
   input  cin,
   output s,
   output cout);
  wire n4169_o;
  wire n4170_o;
  wire n4171_o;
  wire n4172_o;
  wire n4173_o;
  wire n4174_o;
  wire n4175_o;
  assign s = n4170_o;
  assign cout = n4175_o;
  /* 6805.vhd:19:10  */
  assign n4169_o = a ^ b;
  /* 6805.vhd:19:16  */
  assign n4170_o = n4169_o ^ cin;
  /* 6805.vhd:20:14  */
  assign n4171_o = a & b;
  /* 6805.vhd:20:27  */
  assign n4172_o = a & cin;
  /* 6805.vhd:20:21  */
  assign n4173_o = n4171_o | n4172_o;
  /* 6805.vhd:20:42  */
  assign n4174_o = b & cin;
  /* 6805.vhd:20:36  */
  assign n4175_o = n4173_o | n4174_o;
endmodule

module add8
  (input  [7:0] a,
   input  [7:0] b,
   input  cin,
   output [7:0] sum,
   output cout);
  wire [6:0] c;
  wire n4094_o;
  wire n4095_o;
  wire a0_n4096;
  wire a0_n4097;
  wire a0_s;
  wire a0_cout;
  wire n4102_o;
  wire n4103_o;
  wire n4104_o;
  wire stage_n1_as_n4105;
  wire stage_n1_as_n4106;
  wire stage_n1_as_s;
  wire stage_n1_as_cout;
  wire n4111_o;
  wire n4112_o;
  wire n4113_o;
  wire stage_n2_as_n4114;
  wire stage_n2_as_n4115;
  wire stage_n2_as_s;
  wire stage_n2_as_cout;
  wire n4120_o;
  wire n4121_o;
  wire n4122_o;
  wire stage_n3_as_n4123;
  wire stage_n3_as_n4124;
  wire stage_n3_as_s;
  wire stage_n3_as_cout;
  wire n4129_o;
  wire n4130_o;
  wire n4131_o;
  wire stage_n4_as_n4132;
  wire stage_n4_as_n4133;
  wire stage_n4_as_s;
  wire stage_n4_as_cout;
  wire n4138_o;
  wire n4139_o;
  wire n4140_o;
  wire stage_n5_as_n4141;
  wire stage_n5_as_n4142;
  wire stage_n5_as_s;
  wire stage_n5_as_cout;
  wire n4147_o;
  wire n4148_o;
  wire n4149_o;
  wire stage_n6_as_n4150;
  wire stage_n6_as_n4151;
  wire stage_n6_as_s;
  wire stage_n6_as_cout;
  wire n4156_o;
  wire n4157_o;
  wire n4158_o;
  wire a31_n4159;
  wire a31_n4160;
  wire a31_s;
  wire a31_cout;
  wire [6:0] n4165_o;
  wire [7:0] n4166_o;
  assign sum = n4166_o;
  assign cout = a31_n4160;
  /* 6805.vhd:34:10  */
  assign c = n4165_o; // (signal)
  /* 6805.vhd:43:33  */
  assign n4094_o = a[0];
  /* 6805.vhd:43:39  */
  assign n4095_o = b[0];
  /* 6805.vhd:43:49  */
  assign a0_n4096 = a0_s; // (signal)
  /* 6805.vhd:43:57  */
  assign a0_n4097 = a0_cout; // (signal)
  /* 6805.vhd:43:3  */
  fadd a0 (
    .a(n4094_o),
    .b(n4095_o),
    .cin(cin),
    .s(a0_s),
    .cout(a0_cout));
  /* 6805.vhd:45:33  */
  assign n4102_o = a[1];
  /* 6805.vhd:45:39  */
  assign n4103_o = b[1];
  /* 6805.vhd:45:45  */
  assign n4104_o = c[6];
  /* 6805.vhd:45:53  */
  assign stage_n1_as_n4105 = stage_n1_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n1_as_n4106 = stage_n1_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n1_as (
    .a(n4102_o),
    .b(n4103_o),
    .cin(n4104_o),
    .s(stage_n1_as_s),
    .cout(stage_n1_as_cout));
  /* 6805.vhd:45:33  */
  assign n4111_o = a[2];
  /* 6805.vhd:45:39  */
  assign n4112_o = b[2];
  /* 6805.vhd:45:45  */
  assign n4113_o = c[5];
  /* 6805.vhd:45:53  */
  assign stage_n2_as_n4114 = stage_n2_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n2_as_n4115 = stage_n2_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n2_as (
    .a(n4111_o),
    .b(n4112_o),
    .cin(n4113_o),
    .s(stage_n2_as_s),
    .cout(stage_n2_as_cout));
  /* 6805.vhd:45:33  */
  assign n4120_o = a[3];
  /* 6805.vhd:45:39  */
  assign n4121_o = b[3];
  /* 6805.vhd:45:45  */
  assign n4122_o = c[4];
  /* 6805.vhd:45:53  */
  assign stage_n3_as_n4123 = stage_n3_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n3_as_n4124 = stage_n3_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n3_as (
    .a(n4120_o),
    .b(n4121_o),
    .cin(n4122_o),
    .s(stage_n3_as_s),
    .cout(stage_n3_as_cout));
  /* 6805.vhd:45:33  */
  assign n4129_o = a[4];
  /* 6805.vhd:45:39  */
  assign n4130_o = b[4];
  /* 6805.vhd:45:45  */
  assign n4131_o = c[3];
  /* 6805.vhd:45:53  */
  assign stage_n4_as_n4132 = stage_n4_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n4_as_n4133 = stage_n4_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n4_as (
    .a(n4129_o),
    .b(n4130_o),
    .cin(n4131_o),
    .s(stage_n4_as_s),
    .cout(stage_n4_as_cout));
  /* 6805.vhd:45:33  */
  assign n4138_o = a[5];
  /* 6805.vhd:45:39  */
  assign n4139_o = b[5];
  /* 6805.vhd:45:45  */
  assign n4140_o = c[2];
  /* 6805.vhd:45:53  */
  assign stage_n5_as_n4141 = stage_n5_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n5_as_n4142 = stage_n5_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n5_as (
    .a(n4138_o),
    .b(n4139_o),
    .cin(n4140_o),
    .s(stage_n5_as_s),
    .cout(stage_n5_as_cout));
  /* 6805.vhd:45:33  */
  assign n4147_o = a[6];
  /* 6805.vhd:45:39  */
  assign n4148_o = b[6];
  /* 6805.vhd:45:45  */
  assign n4149_o = c[1];
  /* 6805.vhd:45:53  */
  assign stage_n6_as_n4150 = stage_n6_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n6_as_n4151 = stage_n6_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n6_as (
    .a(n4147_o),
    .b(n4148_o),
    .cin(n4149_o),
    .s(stage_n6_as_s),
    .cout(stage_n6_as_cout));
  /* 6805.vhd:47:33  */
  assign n4156_o = a[7];
  /* 6805.vhd:47:39  */
  assign n4157_o = b[7];
  /* 6805.vhd:47:45  */
  assign n4158_o = c[0];
  /* 6805.vhd:47:51  */
  assign a31_n4159 = a31_s; // (signal)
  /* 6805.vhd:47:59  */
  assign a31_n4160 = a31_cout; // (signal)
  /* 6805.vhd:47:3  */
  fadd a31 (
    .a(n4156_o),
    .b(n4157_o),
    .cin(n4158_o),
    .s(a31_s),
    .cout(a31_cout));
  assign n4165_o = {a0_n4097, stage_n1_as_n4106, stage_n2_as_n4115, stage_n3_as_n4124, stage_n4_as_n4133, stage_n5_as_n4142, stage_n6_as_n4151};
  assign n4166_o = {a31_n4159, stage_n6_as_n4150, stage_n5_as_n4141, stage_n4_as_n4132, stage_n3_as_n4123, stage_n2_as_n4114, stage_n1_as_n4105, a0_n4096};
endmodule

module add8c
  (input  b,
   input  [7:0] a,
   input  [7:0] sum_in,
   input  [7:0] cin,
   output [7:0] sum_out,
   output [7:0] cout);
  reg [7:0] zero;
  reg [7:0] aa;
  wire [7:0] n4017_o;
  wire n4018_o;
  wire n4019_o;
  wire n4020_o;
  wire stage_n1_sta_n4021;
  wire stage_n1_sta_n4022;
  wire stage_n1_sta_s;
  wire stage_n1_sta_cout;
  wire n4027_o;
  wire n4028_o;
  wire n4029_o;
  wire stage_n2_sta_n4030;
  wire stage_n2_sta_n4031;
  wire stage_n2_sta_s;
  wire stage_n2_sta_cout;
  wire n4036_o;
  wire n4037_o;
  wire n4038_o;
  wire stage_n3_sta_n4039;
  wire stage_n3_sta_n4040;
  wire stage_n3_sta_s;
  wire stage_n3_sta_cout;
  wire n4045_o;
  wire n4046_o;
  wire n4047_o;
  wire stage_n4_sta_n4048;
  wire stage_n4_sta_n4049;
  wire stage_n4_sta_s;
  wire stage_n4_sta_cout;
  wire n4054_o;
  wire n4055_o;
  wire n4056_o;
  wire stage_n5_sta_n4057;
  wire stage_n5_sta_n4058;
  wire stage_n5_sta_s;
  wire stage_n5_sta_cout;
  wire n4063_o;
  wire n4064_o;
  wire n4065_o;
  wire stage_n6_sta_n4066;
  wire stage_n6_sta_n4067;
  wire stage_n6_sta_s;
  wire stage_n6_sta_cout;
  wire n4072_o;
  wire n4073_o;
  wire n4074_o;
  wire stage_n7_sta_n4075;
  wire stage_n7_sta_n4076;
  wire stage_n7_sta_s;
  wire stage_n7_sta_cout;
  wire n4081_o;
  wire n4082_o;
  wire n4083_o;
  wire stage_n8_sta_n4084;
  wire stage_n8_sta_n4085;
  wire stage_n8_sta_s;
  wire stage_n8_sta_cout;
  wire [7:0] n4090_o;
  wire [7:0] n4091_o;
  assign sum_out = n4090_o;
  assign cout = n4091_o;
  /* 6805.vhd:65:10  */
  always @*
    zero = 8'b00000000; // (isignal)
  initial
    zero = 8'b00000000;
  /* 6805.vhd:66:10  */
  always @*
    aa = n4017_o; // (isignal)
  initial
    aa = 8'b00000000;
  /* 6805.vhd:75:11  */
  assign n4017_o = b ? a : zero;
  /* 6805.vhd:77:26  */
  assign n4018_o = aa[0];
  /* 6805.vhd:77:37  */
  assign n4019_o = sum_in[0];
  /* 6805.vhd:77:45  */
  assign n4020_o = cin[0];
  /* 6805.vhd:77:51  */
  assign stage_n1_sta_n4021 = stage_n1_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n1_sta_n4022 = stage_n1_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n1_sta (
    .a(n4018_o),
    .b(n4019_o),
    .cin(n4020_o),
    .s(stage_n1_sta_s),
    .cout(stage_n1_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4027_o = aa[1];
  /* 6805.vhd:77:37  */
  assign n4028_o = sum_in[1];
  /* 6805.vhd:77:45  */
  assign n4029_o = cin[1];
  /* 6805.vhd:77:51  */
  assign stage_n2_sta_n4030 = stage_n2_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n2_sta_n4031 = stage_n2_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n2_sta (
    .a(n4027_o),
    .b(n4028_o),
    .cin(n4029_o),
    .s(stage_n2_sta_s),
    .cout(stage_n2_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4036_o = aa[2];
  /* 6805.vhd:77:37  */
  assign n4037_o = sum_in[2];
  /* 6805.vhd:77:45  */
  assign n4038_o = cin[2];
  /* 6805.vhd:77:51  */
  assign stage_n3_sta_n4039 = stage_n3_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n3_sta_n4040 = stage_n3_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n3_sta (
    .a(n4036_o),
    .b(n4037_o),
    .cin(n4038_o),
    .s(stage_n3_sta_s),
    .cout(stage_n3_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4045_o = aa[3];
  /* 6805.vhd:77:37  */
  assign n4046_o = sum_in[3];
  /* 6805.vhd:77:45  */
  assign n4047_o = cin[3];
  /* 6805.vhd:77:51  */
  assign stage_n4_sta_n4048 = stage_n4_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n4_sta_n4049 = stage_n4_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n4_sta (
    .a(n4045_o),
    .b(n4046_o),
    .cin(n4047_o),
    .s(stage_n4_sta_s),
    .cout(stage_n4_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4054_o = aa[4];
  /* 6805.vhd:77:37  */
  assign n4055_o = sum_in[4];
  /* 6805.vhd:77:45  */
  assign n4056_o = cin[4];
  /* 6805.vhd:77:51  */
  assign stage_n5_sta_n4057 = stage_n5_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n5_sta_n4058 = stage_n5_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n5_sta (
    .a(n4054_o),
    .b(n4055_o),
    .cin(n4056_o),
    .s(stage_n5_sta_s),
    .cout(stage_n5_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4063_o = aa[5];
  /* 6805.vhd:77:37  */
  assign n4064_o = sum_in[5];
  /* 6805.vhd:77:45  */
  assign n4065_o = cin[5];
  /* 6805.vhd:77:51  */
  assign stage_n6_sta_n4066 = stage_n6_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n6_sta_n4067 = stage_n6_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n6_sta (
    .a(n4063_o),
    .b(n4064_o),
    .cin(n4065_o),
    .s(stage_n6_sta_s),
    .cout(stage_n6_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4072_o = aa[6];
  /* 6805.vhd:77:37  */
  assign n4073_o = sum_in[6];
  /* 6805.vhd:77:45  */
  assign n4074_o = cin[6];
  /* 6805.vhd:77:51  */
  assign stage_n7_sta_n4075 = stage_n7_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n7_sta_n4076 = stage_n7_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n7_sta (
    .a(n4072_o),
    .b(n4073_o),
    .cin(n4074_o),
    .s(stage_n7_sta_s),
    .cout(stage_n7_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4081_o = aa[7];
  /* 6805.vhd:77:37  */
  assign n4082_o = sum_in[7];
  /* 6805.vhd:77:45  */
  assign n4083_o = cin[7];
  /* 6805.vhd:77:51  */
  assign stage_n8_sta_n4084 = stage_n8_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n8_sta_n4085 = stage_n8_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n8_sta (
    .a(n4081_o),
    .b(n4082_o),
    .cin(n4083_o),
    .s(stage_n8_sta_s),
    .cout(stage_n8_sta_cout));
  assign n4090_o = {stage_n8_sta_n4084, stage_n7_sta_n4075, stage_n6_sta_n4066, stage_n5_sta_n4057, stage_n4_sta_n4048, stage_n3_sta_n4039, stage_n2_sta_n4030, stage_n1_sta_n4021};
  assign n4091_o = {stage_n8_sta_n4085, stage_n7_sta_n4076, stage_n6_sta_n4067, stage_n5_sta_n4058, stage_n4_sta_n4049, stage_n3_sta_n4040, stage_n2_sta_n4031, stage_n1_sta_n4022};
endmodule

module mul8
  (input  [7:0] a,
   input  [7:0] b,
   output [15:0] prod);
  reg [7:0] zero;
  wire [63:0] s;
  wire [63:0] c;
  wire [63:0] ss;
  wire n3898_o;
  wire [7:0] st0_n3899;
  wire [7:0] st0_n3900;
  wire [7:0] st0_sum_out;
  wire [7:0] st0_cout;
  wire [6:0] n3905_o;
  wire [7:0] n3907_o;
  wire n3908_o;
  wire n3909_o;
  wire [7:0] n3910_o;
  wire [7:0] n3911_o;
  wire [7:0] stage_n1_st_n3912;
  wire [7:0] stage_n1_st_n3913;
  wire [7:0] stage_n1_st_sum_out;
  wire [7:0] stage_n1_st_cout;
  wire [6:0] n3918_o;
  wire [7:0] n3920_o;
  wire n3921_o;
  wire n3922_o;
  wire [7:0] n3923_o;
  wire [7:0] n3924_o;
  wire [7:0] stage_n2_st_n3925;
  wire [7:0] stage_n2_st_n3926;
  wire [7:0] stage_n2_st_sum_out;
  wire [7:0] stage_n2_st_cout;
  wire [6:0] n3931_o;
  wire [7:0] n3933_o;
  wire n3934_o;
  wire n3935_o;
  wire [7:0] n3936_o;
  wire [7:0] n3937_o;
  wire [7:0] stage_n3_st_n3938;
  wire [7:0] stage_n3_st_n3939;
  wire [7:0] stage_n3_st_sum_out;
  wire [7:0] stage_n3_st_cout;
  wire [6:0] n3944_o;
  wire [7:0] n3946_o;
  wire n3947_o;
  wire n3948_o;
  wire [7:0] n3949_o;
  wire [7:0] n3950_o;
  wire [7:0] stage_n4_st_n3951;
  wire [7:0] stage_n4_st_n3952;
  wire [7:0] stage_n4_st_sum_out;
  wire [7:0] stage_n4_st_cout;
  wire [6:0] n3957_o;
  wire [7:0] n3959_o;
  wire n3960_o;
  wire n3961_o;
  wire [7:0] n3962_o;
  wire [7:0] n3963_o;
  wire [7:0] stage_n5_st_n3964;
  wire [7:0] stage_n5_st_n3965;
  wire [7:0] stage_n5_st_sum_out;
  wire [7:0] stage_n5_st_cout;
  wire [6:0] n3970_o;
  wire [7:0] n3972_o;
  wire n3973_o;
  wire n3974_o;
  wire [7:0] n3975_o;
  wire [7:0] n3976_o;
  wire [7:0] stage_n6_st_n3977;
  wire [7:0] stage_n6_st_n3978;
  wire [7:0] stage_n6_st_sum_out;
  wire [7:0] stage_n6_st_cout;
  wire [6:0] n3983_o;
  wire [7:0] n3985_o;
  wire n3986_o;
  wire n3987_o;
  wire [7:0] n3988_o;
  wire [7:0] n3989_o;
  wire [7:0] stage_n7_st_n3990;
  wire [7:0] stage_n7_st_n3991;
  wire [7:0] stage_n7_st_sum_out;
  wire [7:0] stage_n7_st_cout;
  wire [6:0] n3996_o;
  wire [7:0] n3998_o;
  wire n3999_o;
  wire [7:0] n4000_o;
  wire [7:0] n4001_o;
  localparam n4002_o = 1'b0;
  wire [7:0] add_n4003;
  wire [7:0] add_sum;
  wire add_cout;
  wire [63:0] n4009_o;
  wire [63:0] n4010_o;
  wire [63:0] n4011_o;
  wire [15:0] n4012_o;
  assign prod = n4012_o;
  /* 6805.vhd:92:10  */
  always @*
    zero = 8'b00000000; // (isignal)
  initial
    zero = 8'b00000000;
  /* 6805.vhd:95:10  */
  assign s = n4009_o; // (signal)
  /* 6805.vhd:96:10  */
  assign c = n4010_o; // (signal)
  /* 6805.vhd:97:10  */
  assign ss = n4011_o; // (signal)
  /* 6805.vhd:115:24  */
  assign n3898_o = b[0];
  /* 6805.vhd:115:45  */
  assign st0_n3899 = st0_sum_out; // (signal)
  /* 6805.vhd:115:51  */
  assign st0_n3900 = st0_cout; // (signal)
  /* 6805.vhd:115:3  */
  add8c st0 (
    .b(n3898_o),
    .a(a),
    .sum_in(zero),
    .cin(zero),
    .sum_out(st0_sum_out),
    .cout(st0_cout));
  /* 6805.vhd:116:22  */
  assign n3905_o = s[63:57];
  /* 6805.vhd:116:16  */
  assign n3907_o = {1'b0, n3905_o};
  /* 6805.vhd:117:18  */
  assign n3908_o = s[56];
  /* 6805.vhd:120:25  */
  assign n3909_o = b[1];
  /* 6805.vhd:120:35  */
  assign n3910_o = ss[63:56];
  /* 6805.vhd:120:44  */
  assign n3911_o = c[63:56];
  /* 6805.vhd:120:51  */
  assign stage_n1_st_n3912 = stage_n1_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n1_st_n3913 = stage_n1_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n1_st (
    .b(n3909_o),
    .a(a),
    .sum_in(n3910_o),
    .cin(n3911_o),
    .sum_out(stage_n1_st_sum_out),
    .cout(stage_n1_st_cout));
  /* 6805.vhd:121:24  */
  assign n3918_o = s[55:49];
  /* 6805.vhd:121:18  */
  assign n3920_o = {1'b0, n3918_o};
  /* 6805.vhd:122:20  */
  assign n3921_o = s[48];
  /* 6805.vhd:120:25  */
  assign n3922_o = b[2];
  /* 6805.vhd:120:35  */
  assign n3923_o = ss[55:48];
  /* 6805.vhd:120:44  */
  assign n3924_o = c[55:48];
  /* 6805.vhd:120:51  */
  assign stage_n2_st_n3925 = stage_n2_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n2_st_n3926 = stage_n2_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n2_st (
    .b(n3922_o),
    .a(a),
    .sum_in(n3923_o),
    .cin(n3924_o),
    .sum_out(stage_n2_st_sum_out),
    .cout(stage_n2_st_cout));
  /* 6805.vhd:121:24  */
  assign n3931_o = s[47:41];
  /* 6805.vhd:121:18  */
  assign n3933_o = {1'b0, n3931_o};
  /* 6805.vhd:122:20  */
  assign n3934_o = s[40];
  /* 6805.vhd:120:25  */
  assign n3935_o = b[3];
  /* 6805.vhd:120:35  */
  assign n3936_o = ss[47:40];
  /* 6805.vhd:120:44  */
  assign n3937_o = c[47:40];
  /* 6805.vhd:120:51  */
  assign stage_n3_st_n3938 = stage_n3_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n3_st_n3939 = stage_n3_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n3_st (
    .b(n3935_o),
    .a(a),
    .sum_in(n3936_o),
    .cin(n3937_o),
    .sum_out(stage_n3_st_sum_out),
    .cout(stage_n3_st_cout));
  /* 6805.vhd:121:24  */
  assign n3944_o = s[39:33];
  /* 6805.vhd:121:18  */
  assign n3946_o = {1'b0, n3944_o};
  /* 6805.vhd:122:20  */
  assign n3947_o = s[32];
  /* 6805.vhd:120:25  */
  assign n3948_o = b[4];
  /* 6805.vhd:120:35  */
  assign n3949_o = ss[39:32];
  /* 6805.vhd:120:44  */
  assign n3950_o = c[39:32];
  /* 6805.vhd:120:51  */
  assign stage_n4_st_n3951 = stage_n4_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n4_st_n3952 = stage_n4_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n4_st (
    .b(n3948_o),
    .a(a),
    .sum_in(n3949_o),
    .cin(n3950_o),
    .sum_out(stage_n4_st_sum_out),
    .cout(stage_n4_st_cout));
  /* 6805.vhd:121:24  */
  assign n3957_o = s[31:25];
  /* 6805.vhd:121:18  */
  assign n3959_o = {1'b0, n3957_o};
  /* 6805.vhd:122:20  */
  assign n3960_o = s[24];
  /* 6805.vhd:120:25  */
  assign n3961_o = b[5];
  /* 6805.vhd:120:35  */
  assign n3962_o = ss[31:24];
  /* 6805.vhd:120:44  */
  assign n3963_o = c[31:24];
  /* 6805.vhd:120:51  */
  assign stage_n5_st_n3964 = stage_n5_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n5_st_n3965 = stage_n5_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n5_st (
    .b(n3961_o),
    .a(a),
    .sum_in(n3962_o),
    .cin(n3963_o),
    .sum_out(stage_n5_st_sum_out),
    .cout(stage_n5_st_cout));
  /* 6805.vhd:121:24  */
  assign n3970_o = s[23:17];
  /* 6805.vhd:121:18  */
  assign n3972_o = {1'b0, n3970_o};
  /* 6805.vhd:122:20  */
  assign n3973_o = s[16];
  /* 6805.vhd:120:25  */
  assign n3974_o = b[6];
  /* 6805.vhd:120:35  */
  assign n3975_o = ss[23:16];
  /* 6805.vhd:120:44  */
  assign n3976_o = c[23:16];
  /* 6805.vhd:120:51  */
  assign stage_n6_st_n3977 = stage_n6_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n6_st_n3978 = stage_n6_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n6_st (
    .b(n3974_o),
    .a(a),
    .sum_in(n3975_o),
    .cin(n3976_o),
    .sum_out(stage_n6_st_sum_out),
    .cout(stage_n6_st_cout));
  /* 6805.vhd:121:24  */
  assign n3983_o = s[15:9];
  /* 6805.vhd:121:18  */
  assign n3985_o = {1'b0, n3983_o};
  /* 6805.vhd:122:20  */
  assign n3986_o = s[8];
  /* 6805.vhd:120:25  */
  assign n3987_o = b[7];
  /* 6805.vhd:120:35  */
  assign n3988_o = ss[15:8];
  /* 6805.vhd:120:44  */
  assign n3989_o = c[15:8];
  /* 6805.vhd:120:51  */
  assign stage_n7_st_n3990 = stage_n7_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n7_st_n3991 = stage_n7_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n7_st (
    .b(n3987_o),
    .a(a),
    .sum_in(n3988_o),
    .cin(n3989_o),
    .sum_out(stage_n7_st_sum_out),
    .cout(stage_n7_st_cout));
  /* 6805.vhd:121:24  */
  assign n3996_o = s[7:1];
  /* 6805.vhd:121:18  */
  assign n3998_o = {1'b0, n3996_o};
  /* 6805.vhd:122:20  */
  assign n3999_o = s[0];
  /* 6805.vhd:125:24  */
  assign n4000_o = ss[7:0];
  /* 6805.vhd:125:30  */
  assign n4001_o = c[7:0];
  /* 6805.vhd:125:41  */
  assign add_n4003 = add_sum; // (signal)
  /* 6805.vhd:125:3  */
  add8 add (
    .a(n4000_o),
    .b(n4001_o),
    .cin(n4002_o),
    .sum(add_sum),
    .cout());
  assign n4009_o = {st0_n3899, stage_n1_st_n3912, stage_n2_st_n3925, stage_n3_st_n3938, stage_n4_st_n3951, stage_n5_st_n3964, stage_n6_st_n3977, stage_n7_st_n3990};
  assign n4010_o = {st0_n3900, stage_n1_st_n3913, stage_n2_st_n3926, stage_n3_st_n3939, stage_n4_st_n3952, stage_n5_st_n3965, stage_n6_st_n3978, stage_n7_st_n3991};
  assign n4011_o = {n3907_o, n3920_o, n3933_o, n3946_o, n3959_o, n3972_o, n3985_o, n3998_o};
  assign n4012_o = {add_n4003, n3999_o, n3986_o, n3973_o, n3960_o, n3947_o, n3934_o, n3921_o, n3908_o};
endmodule

module UR6805
  (input  clk,
   input  clken,
   input  rst,
   input  extirq,
   input  timerirq,
   input  sciirq,
   input  [7:0] datain,
   output [15:0] addr,
   output wr,
   output [3:0] state,
   output [7:0] dataout);
  wire [63:0] mask0;
  wire [63:0] mask1;
  wire [7:0] rega;
  wire [7:0] regx;
  wire [15:0] regsp;
  wire [15:0] regpc;
  wire flagh;
  wire flagi;
  wire flagn;
  wire flagz;
  wire flagc;
  wire [7:0] help;
  wire [15:0] temp;
  wire [3:0] mainfsm;
  wire [2:0] addrmux;
  wire [3:0] datamux;
  wire [7:0] opcode;
  wire [15:0] prod;
  wire extirq_d;
  wire timerirq_d;
  wire sciirq_d;
  wire extirqrequest;
  wire timerirqrequest;
  wire sciirqrequest;
  wire trace;
  wire trace_i;
  wire [7:0] traceopcode;
  wire [15:0] mul_n4;
  wire [15:0] mul_prod;
  wire n8_o;
  wire [15:0] n9_o;
  wire n11_o;
  wire [15:0] n12_o;
  wire [15:0] n14_o;
  wire n16_o;
  wire [15:0] n17_o;
  wire n19_o;
  wire [15:0] n20_o;
  wire [15:0] n22_o;
  wire [15:0] n23_o;
  wire n25_o;
  wire [15:0] n26_o;
  wire [15:0] n27_o;
  wire n29_o;
  wire [15:0] n30_o;
  wire [15:0] n32_o;
  wire [7:0] n33_o;
  wire [15:0] n35_o;
  wire [15:0] n36_o;
  wire n38_o;
  wire [15:0] n39_o;
  wire [7:0] n40_o;
  wire [15:0] n42_o;
  wire [15:0] n43_o;
  wire n45_o;
  wire [7:0] n46_o;
  wire n48_o;
  wire [7:0] n49_o;
  wire n51_o;
  wire [7:0] n52_o;
  wire [7:0] n53_o;
  wire n55_o;
  wire [7:0] n56_o;
  wire [7:0] n57_o;
  wire n59_o;
  wire [7:0] n60_o;
  wire [7:0] n61_o;
  wire n63_o;
  wire [7:0] n64_o;
  wire [7:0] n65_o;
  wire n67_o;
  wire [7:0] n68_o;
  wire [7:0] n69_o;
  wire n71_o;
  wire [7:0] n72_o;
  wire [7:0] n73_o;
  wire n75_o;
  wire [7:0] n76_o;
  wire n78_o;
  wire [7:0] n79_o;
  wire n100_o;
  wire n103_o;
  wire n104_o;
  wire n106_o;
  wire n108_o;
  wire n109_o;
  wire n111_o;
  wire n113_o;
  wire n114_o;
  wire n116_o;
  wire [15:0] n118_o;
  wire n120_o;
  wire n122_o;
  wire n123_o;
  wire n124_o;
  wire [15:0] n126_o;
  wire n128_o;
  wire [15:0] n130_o;
  wire n132_o;
  wire n134_o;
  wire n135_o;
  wire n137_o;
  wire n138_o;
  wire n140_o;
  wire n141_o;
  wire n143_o;
  wire n144_o;
  wire n146_o;
  wire n147_o;
  wire n149_o;
  wire n150_o;
  wire n152_o;
  wire n153_o;
  wire n155_o;
  wire n156_o;
  wire n158_o;
  wire n159_o;
  wire n161_o;
  wire n162_o;
  wire n164_o;
  wire n165_o;
  wire n167_o;
  wire n168_o;
  wire n170_o;
  wire n171_o;
  wire n173_o;
  wire n174_o;
  wire n176_o;
  wire n177_o;
  wire n179_o;
  wire n180_o;
  wire n182_o;
  wire n183_o;
  wire n185_o;
  wire n186_o;
  wire n188_o;
  wire n189_o;
  wire n191_o;
  wire n192_o;
  wire n194_o;
  wire n195_o;
  wire n197_o;
  wire n198_o;
  wire n200_o;
  wire n201_o;
  wire n203_o;
  wire n204_o;
  wire n206_o;
  wire n207_o;
  wire n209_o;
  wire n210_o;
  wire n212_o;
  wire n213_o;
  wire n215_o;
  wire n216_o;
  wire n218_o;
  wire n219_o;
  wire n221_o;
  wire n222_o;
  wire n224_o;
  wire n225_o;
  wire n227_o;
  wire n228_o;
  wire n230_o;
  wire n231_o;
  wire n233_o;
  wire n234_o;
  wire n236_o;
  wire n237_o;
  wire n239_o;
  wire n240_o;
  wire n242_o;
  wire n243_o;
  wire n245_o;
  wire n246_o;
  wire n248_o;
  wire n249_o;
  wire n251_o;
  wire n252_o;
  wire n254_o;
  wire n255_o;
  wire n257_o;
  wire n258_o;
  wire n260_o;
  wire n261_o;
  wire n263_o;
  wire n264_o;
  wire n266_o;
  wire n267_o;
  wire n269_o;
  wire n270_o;
  wire n272_o;
  wire n273_o;
  wire n275_o;
  wire n276_o;
  wire n278_o;
  wire n279_o;
  wire n281_o;
  wire n282_o;
  wire n284_o;
  wire n285_o;
  wire n287_o;
  wire n288_o;
  wire n290_o;
  wire n291_o;
  wire n293_o;
  wire n294_o;
  wire n296_o;
  wire n297_o;
  wire n299_o;
  wire n300_o;
  wire n302_o;
  wire n303_o;
  wire [15:0] n305_o;
  wire n307_o;
  wire n309_o;
  wire n310_o;
  wire n312_o;
  wire n313_o;
  wire n315_o;
  wire n316_o;
  wire n318_o;
  wire n319_o;
  wire n321_o;
  wire n322_o;
  wire n324_o;
  wire n325_o;
  wire n327_o;
  wire n328_o;
  wire n330_o;
  wire n331_o;
  wire n333_o;
  wire n334_o;
  wire n336_o;
  wire n337_o;
  wire n339_o;
  wire n340_o;
  wire n342_o;
  wire n343_o;
  wire n345_o;
  wire n346_o;
  wire n348_o;
  wire n349_o;
  wire n351_o;
  wire n352_o;
  wire n354_o;
  wire n355_o;
  wire n357_o;
  wire n358_o;
  wire n360_o;
  wire n361_o;
  wire n363_o;
  wire n364_o;
  wire n366_o;
  wire n367_o;
  wire n369_o;
  wire n370_o;
  wire n372_o;
  wire n373_o;
  wire n375_o;
  wire n376_o;
  wire n378_o;
  wire n379_o;
  wire n381_o;
  wire n382_o;
  wire n384_o;
  wire n385_o;
  wire n387_o;
  wire n388_o;
  wire n390_o;
  wire n391_o;
  wire n393_o;
  wire n394_o;
  wire n396_o;
  wire n397_o;
  wire n399_o;
  wire n400_o;
  wire n402_o;
  wire n403_o;
  wire n405_o;
  wire n406_o;
  wire n408_o;
  wire n409_o;
  wire n411_o;
  wire n412_o;
  wire n414_o;
  wire n415_o;
  wire n417_o;
  wire n418_o;
  wire n420_o;
  wire n421_o;
  wire n423_o;
  wire n424_o;
  wire n426_o;
  wire n427_o;
  wire n429_o;
  wire n430_o;
  wire n432_o;
  wire n433_o;
  wire n435_o;
  wire n436_o;
  wire n438_o;
  wire n439_o;
  wire n441_o;
  wire n442_o;
  wire [15:0] n444_o;
  wire n446_o;
  wire n448_o;
  wire n449_o;
  wire n451_o;
  wire n452_o;
  wire n454_o;
  wire n455_o;
  wire n457_o;
  wire n458_o;
  wire n460_o;
  wire n461_o;
  wire n463_o;
  wire n464_o;
  wire n466_o;
  wire n467_o;
  wire n469_o;
  wire n470_o;
  wire n472_o;
  wire n473_o;
  wire [15:0] n475_o;
  wire n477_o;
  wire n479_o;
  wire n480_o;
  wire n482_o;
  wire n483_o;
  wire n485_o;
  wire n486_o;
  wire n488_o;
  wire n489_o;
  wire n491_o;
  wire n492_o;
  wire n494_o;
  wire n495_o;
  wire n497_o;
  wire n498_o;
  wire n500_o;
  wire n501_o;
  wire n503_o;
  wire n504_o;
  wire n506_o;
  wire n507_o;
  wire n509_o;
  wire n510_o;
  wire [15:0] n512_o;
  wire n514_o;
  wire n516_o;
  wire n517_o;
  wire n519_o;
  wire n520_o;
  wire n522_o;
  wire n523_o;
  wire n525_o;
  wire n526_o;
  wire n528_o;
  wire n529_o;
  wire n531_o;
  wire n532_o;
  wire n534_o;
  wire n535_o;
  wire n537_o;
  wire n538_o;
  wire n540_o;
  wire n541_o;
  wire n543_o;
  wire n544_o;
  wire n546_o;
  wire n547_o;
  wire n549_o;
  wire n550_o;
  wire n552_o;
  wire n553_o;
  wire n555_o;
  wire n556_o;
  wire [15:0] n558_o;
  wire n560_o;
  wire n562_o;
  wire n563_o;
  wire n565_o;
  wire n566_o;
  wire n568_o;
  wire n569_o;
  wire n571_o;
  wire n572_o;
  wire n574_o;
  wire n575_o;
  wire n577_o;
  wire n578_o;
  wire n580_o;
  wire n581_o;
  wire n583_o;
  wire n584_o;
  wire n586_o;
  wire n587_o;
  wire n589_o;
  wire n590_o;
  wire n592_o;
  wire n593_o;
  wire [15:0] n595_o;
  wire n597_o;
  wire n598_o;
  wire n600_o;
  wire n603_o;
  wire [15:0] n605_o;
  wire n607_o;
  wire n608_o;
  wire n610_o;
  wire n613_o;
  wire [15:0] n615_o;
  wire n617_o;
  wire [7:0] n619_o;
  wire [7:0] n621_o;
  wire n622_o;
  wire n624_o;
  wire n627_o;
  wire n630_o;
  wire [15:0] n632_o;
  wire n634_o;
  wire [7:0] n635_o;
  wire [7:0] n636_o;
  wire [15:0] n638_o;
  wire n640_o;
  wire [7:0] n642_o;
  wire [7:0] n644_o;
  wire n645_o;
  wire n647_o;
  wire n650_o;
  wire [15:0] n652_o;
  wire n654_o;
  wire [6:0] n655_o;
  wire [7:0] n657_o;
  wire [6:0] n658_o;
  wire [7:0] n660_o;
  wire n661_o;
  wire n663_o;
  wire n666_o;
  wire [15:0] n668_o;
  wire n670_o;
  wire [6:0] n671_o;
  wire [7:0] n672_o;
  wire [6:0] n673_o;
  wire [7:0] n674_o;
  wire n675_o;
  wire n677_o;
  wire n680_o;
  wire [15:0] n682_o;
  wire n684_o;
  wire n685_o;
  wire [6:0] n686_o;
  wire [7:0] n687_o;
  wire n688_o;
  wire [6:0] n689_o;
  wire [7:0] n690_o;
  wire n691_o;
  wire n692_o;
  wire n694_o;
  wire n697_o;
  wire [15:0] n699_o;
  wire n701_o;
  wire [6:0] n702_o;
  wire [7:0] n704_o;
  wire [6:0] n705_o;
  wire [7:0] n707_o;
  wire n708_o;
  wire n709_o;
  wire n711_o;
  wire n714_o;
  wire [15:0] n716_o;
  wire n718_o;
  wire [6:0] n719_o;
  wire [7:0] n720_o;
  wire [6:0] n721_o;
  wire [7:0] n722_o;
  wire n723_o;
  wire n724_o;
  wire n726_o;
  wire n729_o;
  wire [15:0] n731_o;
  wire n733_o;
  wire [7:0] n735_o;
  wire [7:0] n737_o;
  wire n738_o;
  wire n740_o;
  wire n743_o;
  wire [15:0] n745_o;
  wire n747_o;
  wire [7:0] n749_o;
  wire [7:0] n751_o;
  wire n752_o;
  wire n754_o;
  wire n757_o;
  wire [15:0] n759_o;
  wire n761_o;
  wire n762_o;
  wire n764_o;
  wire n767_o;
  wire [15:0] n769_o;
  wire n771_o;
  wire [15:0] n773_o;
  wire n775_o;
  wire [7:0] n777_o;
  wire [7:0] n779_o;
  wire n780_o;
  wire n782_o;
  wire n785_o;
  wire n788_o;
  wire [15:0] n790_o;
  wire n792_o;
  wire [7:0] n794_o;
  wire [7:0] n796_o;
  wire n797_o;
  wire n799_o;
  wire n802_o;
  wire [15:0] n804_o;
  wire n806_o;
  wire [6:0] n807_o;
  wire [7:0] n809_o;
  wire [6:0] n810_o;
  wire [7:0] n812_o;
  wire n813_o;
  wire n815_o;
  wire n818_o;
  wire [15:0] n820_o;
  wire n822_o;
  wire [6:0] n823_o;
  wire [7:0] n824_o;
  wire [6:0] n825_o;
  wire [7:0] n826_o;
  wire n827_o;
  wire n829_o;
  wire n832_o;
  wire [15:0] n834_o;
  wire n836_o;
  wire n837_o;
  wire [6:0] n838_o;
  wire [7:0] n839_o;
  wire n840_o;
  wire [6:0] n841_o;
  wire [7:0] n842_o;
  wire n843_o;
  wire n844_o;
  wire n846_o;
  wire n849_o;
  wire [15:0] n851_o;
  wire n853_o;
  wire [6:0] n854_o;
  wire [7:0] n856_o;
  wire [6:0] n857_o;
  wire [7:0] n859_o;
  wire n860_o;
  wire n861_o;
  wire n863_o;
  wire n866_o;
  wire [15:0] n868_o;
  wire n870_o;
  wire [6:0] n871_o;
  wire [7:0] n872_o;
  wire [6:0] n873_o;
  wire [7:0] n874_o;
  wire n875_o;
  wire n876_o;
  wire n878_o;
  wire n881_o;
  wire [15:0] n883_o;
  wire n885_o;
  wire [7:0] n887_o;
  wire [7:0] n889_o;
  wire n890_o;
  wire n892_o;
  wire n895_o;
  wire [15:0] n897_o;
  wire n899_o;
  wire [7:0] n901_o;
  wire [7:0] n903_o;
  wire n904_o;
  wire n906_o;
  wire n909_o;
  wire [15:0] n911_o;
  wire n913_o;
  wire n914_o;
  wire n916_o;
  wire n919_o;
  wire [15:0] n921_o;
  wire n923_o;
  wire [15:0] n925_o;
  wire n927_o;
  wire [15:0] n929_o;
  wire [15:0] n931_o;
  wire n933_o;
  wire n935_o;
  wire n936_o;
  wire n938_o;
  wire n939_o;
  wire n941_o;
  wire n942_o;
  wire n944_o;
  wire n945_o;
  wire n947_o;
  wire n948_o;
  wire n950_o;
  wire n951_o;
  wire n953_o;
  wire n954_o;
  wire n956_o;
  wire n957_o;
  wire n959_o;
  wire n960_o;
  wire n962_o;
  wire n963_o;
  wire [15:0] n965_o;
  wire n967_o;
  wire [15:0] n969_o;
  wire n971_o;
  wire n973_o;
  wire n974_o;
  wire [15:0] n976_o;
  wire n978_o;
  wire [15:0] n980_o;
  wire n982_o;
  wire [15:0] n984_o;
  wire n986_o;
  wire [15:0] n988_o;
  wire n990_o;
  wire n991_o;
  wire [15:0] n993_o;
  wire n995_o;
  wire n997_o;
  wire n998_o;
  wire n999_o;
  wire [15:0] n1001_o;
  wire n1003_o;
  wire n1005_o;
  wire n1006_o;
  wire [15:0] n1008_o;
  wire n1010_o;
  wire [15:0] n1012_o;
  wire n1014_o;
  wire n1016_o;
  wire n1017_o;
  wire n1019_o;
  wire n1020_o;
  wire n1022_o;
  wire n1023_o;
  wire n1025_o;
  wire n1026_o;
  wire n1028_o;
  wire n1029_o;
  wire n1031_o;
  wire n1032_o;
  wire n1034_o;
  wire n1035_o;
  wire n1037_o;
  wire n1038_o;
  wire n1040_o;
  wire n1041_o;
  wire n1043_o;
  wire n1044_o;
  wire n1046_o;
  wire n1047_o;
  wire n1049_o;
  wire n1050_o;
  wire n1052_o;
  wire n1053_o;
  wire n1055_o;
  wire n1056_o;
  wire n1058_o;
  wire n1059_o;
  wire n1061_o;
  wire n1062_o;
  wire n1064_o;
  wire n1065_o;
  wire n1067_o;
  wire n1068_o;
  wire n1070_o;
  wire n1071_o;
  wire n1073_o;
  wire n1074_o;
  wire n1076_o;
  wire n1077_o;
  wire n1079_o;
  wire n1080_o;
  wire n1082_o;
  wire n1083_o;
  wire n1085_o;
  wire n1086_o;
  wire n1088_o;
  wire n1089_o;
  wire n1091_o;
  wire n1092_o;
  wire n1094_o;
  wire n1095_o;
  wire n1097_o;
  wire n1098_o;
  wire n1100_o;
  wire n1101_o;
  wire n1103_o;
  wire n1104_o;
  wire n1106_o;
  wire n1107_o;
  wire n1109_o;
  wire n1110_o;
  wire n1112_o;
  wire n1113_o;
  wire n1115_o;
  wire n1116_o;
  wire n1118_o;
  wire n1119_o;
  wire n1121_o;
  wire n1122_o;
  wire n1124_o;
  wire n1125_o;
  wire n1127_o;
  wire n1128_o;
  wire n1130_o;
  wire n1131_o;
  wire n1133_o;
  wire n1134_o;
  wire n1136_o;
  wire n1137_o;
  wire n1139_o;
  wire n1140_o;
  wire [15:0] n1142_o;
  wire n1144_o;
  wire [15:0] n1146_o;
  wire [15:0] n1148_o;
  wire n1150_o;
  wire n1152_o;
  wire n1153_o;
  wire n1155_o;
  wire n1156_o;
  wire [15:0] n1158_o;
  wire [15:0] n1160_o;
  wire n1162_o;
  wire n1164_o;
  wire n1165_o;
  wire [15:0] n1167_o;
  wire [15:0] n1169_o;
  wire n1171_o;
  wire [47:0] n1172_o;
  reg n1177_o;
  reg [7:0] n1179_o;
  reg [7:0] n1181_o;
  reg [15:0] n1183_o;
  reg [15:0] n1184_o;
  reg n1186_o;
  reg n1187_o;
  reg n1193_o;
  reg n1197_o;
  reg n1201_o;
  reg [7:0] n1203_o;
  reg [15:0] n1205_o;
  reg [3:0] n1255_o;
  reg [2:0] n1265_o;
  reg [3:0] n1270_o;
  reg n1272_o;
  wire n1274_o;
  wire [7:0] n1275_o;
  wire [7:0] n1276_o;
  wire [15:0] n1277_o;
  wire [15:0] n1278_o;
  wire n1279_o;
  wire n1280_o;
  wire n1281_o;
  wire n1282_o;
  wire n1283_o;
  wire [7:0] n1284_o;
  wire [15:0] n1285_o;
  wire [3:0] n1287_o;
  wire [2:0] n1289_o;
  wire [3:0] n1290_o;
  wire [7:0] n1292_o;
  wire n1293_o;
  wire n1295_o;
  wire [7:0] n1296_o;
  wire [7:0] n1297_o;
  wire [15:0] n1298_o;
  wire [15:0] n1299_o;
  wire n1300_o;
  wire n1301_o;
  wire n1302_o;
  wire n1303_o;
  wire n1304_o;
  wire [7:0] n1305_o;
  wire [15:0] n1306_o;
  wire [3:0] n1308_o;
  wire [2:0] n1310_o;
  wire [3:0] n1311_o;
  wire [7:0] n1313_o;
  wire n1314_o;
  wire [7:0] n1315_o;
  wire n1318_o;
  wire [15:0] n1320_o;
  wire n1322_o;
  wire n1324_o;
  wire n1325_o;
  wire n1327_o;
  wire n1328_o;
  wire n1330_o;
  wire n1331_o;
  wire n1333_o;
  wire n1334_o;
  wire n1336_o;
  wire n1337_o;
  wire n1339_o;
  wire n1340_o;
  wire n1342_o;
  wire n1343_o;
  wire n1345_o;
  wire n1346_o;
  wire n1348_o;
  wire n1349_o;
  wire n1351_o;
  wire n1352_o;
  wire n1354_o;
  wire n1355_o;
  wire n1357_o;
  wire n1358_o;
  wire n1360_o;
  wire n1361_o;
  wire n1363_o;
  wire n1364_o;
  wire n1366_o;
  wire n1367_o;
  wire n1369_o;
  wire n1370_o;
  wire n1372_o;
  wire n1373_o;
  wire n1375_o;
  wire n1376_o;
  wire n1378_o;
  wire n1379_o;
  wire n1381_o;
  wire n1382_o;
  wire n1384_o;
  wire n1385_o;
  wire n1387_o;
  wire n1388_o;
  wire n1390_o;
  wire n1391_o;
  wire n1393_o;
  wire n1394_o;
  wire n1396_o;
  wire n1397_o;
  wire n1399_o;
  wire n1400_o;
  wire n1402_o;
  wire n1403_o;
  wire n1405_o;
  wire n1406_o;
  wire n1408_o;
  wire n1409_o;
  wire n1411_o;
  wire n1412_o;
  wire n1414_o;
  wire n1415_o;
  wire n1417_o;
  wire n1418_o;
  wire n1420_o;
  wire n1421_o;
  wire n1423_o;
  wire n1424_o;
  wire n1426_o;
  wire n1427_o;
  wire n1429_o;
  wire n1430_o;
  wire n1432_o;
  wire n1433_o;
  wire n1435_o;
  wire n1436_o;
  wire n1438_o;
  wire n1439_o;
  wire n1441_o;
  wire n1442_o;
  wire n1444_o;
  wire n1445_o;
  wire [15:0] n1447_o;
  wire n1449_o;
  wire n1451_o;
  wire n1452_o;
  wire n1454_o;
  wire n1455_o;
  wire n1457_o;
  wire n1458_o;
  wire n1460_o;
  wire n1461_o;
  wire n1463_o;
  wire n1464_o;
  wire n1466_o;
  wire n1467_o;
  wire n1469_o;
  wire n1470_o;
  wire n1472_o;
  wire n1473_o;
  wire n1475_o;
  wire n1476_o;
  wire n1478_o;
  wire n1479_o;
  wire n1481_o;
  wire n1482_o;
  wire n1484_o;
  wire n1485_o;
  wire n1487_o;
  wire n1488_o;
  wire n1490_o;
  wire n1491_o;
  wire n1493_o;
  wire n1494_o;
  wire n1496_o;
  wire n1497_o;
  wire n1499_o;
  wire n1500_o;
  wire n1502_o;
  wire n1503_o;
  wire n1505_o;
  wire n1506_o;
  wire n1508_o;
  wire n1509_o;
  wire n1511_o;
  wire n1512_o;
  wire n1514_o;
  wire n1515_o;
  wire n1517_o;
  wire n1518_o;
  wire n1520_o;
  wire n1521_o;
  wire n1523_o;
  wire n1524_o;
  wire n1526_o;
  wire n1527_o;
  wire n1529_o;
  wire n1530_o;
  wire n1532_o;
  wire n1533_o;
  wire n1535_o;
  wire n1536_o;
  wire [15:0] n1538_o;
  wire n1540_o;
  wire [15:0] n1542_o;
  wire n1544_o;
  wire [15:0] n1546_o;
  wire n1548_o;
  wire n1550_o;
  wire n1551_o;
  wire n1553_o;
  wire n1554_o;
  wire n1556_o;
  wire n1557_o;
  wire n1559_o;
  wire n1560_o;
  wire n1562_o;
  wire n1563_o;
  wire n1565_o;
  wire n1566_o;
  wire n1568_o;
  wire n1569_o;
  wire n1571_o;
  wire n1572_o;
  wire n1574_o;
  wire n1575_o;
  wire n1577_o;
  wire n1578_o;
  wire n1580_o;
  wire n1581_o;
  wire n1582_o;
  wire n1583_o;
  wire [15:0] n1585_o;
  wire [15:0] n1586_o;
  wire [15:0] n1588_o;
  wire [15:0] n1590_o;
  wire [15:0] n1591_o;
  wire [15:0] n1593_o;
  wire [15:0] n1594_o;
  wire n1596_o;
  wire [15:0] n1598_o;
  wire n1600_o;
  wire n1601_o;
  wire n1602_o;
  wire n1603_o;
  wire n1604_o;
  wire n1605_o;
  wire [15:0] n1607_o;
  wire [15:0] n1608_o;
  wire [15:0] n1610_o;
  wire [15:0] n1612_o;
  wire [15:0] n1613_o;
  wire [15:0] n1615_o;
  wire [15:0] n1616_o;
  wire [15:0] n1618_o;
  wire [15:0] n1619_o;
  wire n1621_o;
  wire n1623_o;
  wire n1624_o;
  wire n1625_o;
  wire n1626_o;
  wire n1627_o;
  wire n1628_o;
  wire [15:0] n1630_o;
  wire [15:0] n1631_o;
  wire [15:0] n1633_o;
  wire [15:0] n1635_o;
  wire [15:0] n1636_o;
  wire [15:0] n1638_o;
  wire [15:0] n1639_o;
  wire [15:0] n1641_o;
  wire [15:0] n1642_o;
  wire n1644_o;
  wire n1646_o;
  wire n1647_o;
  wire n1648_o;
  wire n1649_o;
  wire n1650_o;
  wire n1651_o;
  wire [15:0] n1653_o;
  wire [15:0] n1654_o;
  wire [15:0] n1656_o;
  wire [15:0] n1658_o;
  wire [15:0] n1659_o;
  wire [15:0] n1661_o;
  wire [15:0] n1662_o;
  wire [15:0] n1664_o;
  wire [15:0] n1665_o;
  wire n1667_o;
  wire n1669_o;
  wire n1670_o;
  wire n1671_o;
  wire n1672_o;
  wire n1673_o;
  wire n1674_o;
  wire [15:0] n1676_o;
  wire [15:0] n1677_o;
  wire [15:0] n1679_o;
  wire [15:0] n1681_o;
  wire [15:0] n1682_o;
  wire [15:0] n1684_o;
  wire [15:0] n1685_o;
  wire [15:0] n1687_o;
  wire [15:0] n1688_o;
  wire n1690_o;
  wire n1692_o;
  wire n1693_o;
  wire n1694_o;
  wire n1695_o;
  wire n1696_o;
  wire n1697_o;
  wire [15:0] n1699_o;
  wire [15:0] n1700_o;
  wire [15:0] n1702_o;
  wire [15:0] n1704_o;
  wire [15:0] n1705_o;
  wire [15:0] n1707_o;
  wire [15:0] n1708_o;
  wire [15:0] n1710_o;
  wire [15:0] n1711_o;
  wire n1713_o;
  wire n1715_o;
  wire n1716_o;
  wire n1717_o;
  wire n1718_o;
  wire n1719_o;
  wire n1720_o;
  wire [15:0] n1722_o;
  wire [15:0] n1723_o;
  wire [15:0] n1725_o;
  wire [15:0] n1727_o;
  wire [15:0] n1728_o;
  wire [15:0] n1730_o;
  wire [15:0] n1731_o;
  wire [15:0] n1733_o;
  wire [15:0] n1734_o;
  wire n1736_o;
  wire n1738_o;
  wire n1739_o;
  wire n1740_o;
  wire n1741_o;
  wire n1742_o;
  wire n1743_o;
  wire [15:0] n1745_o;
  wire [15:0] n1746_o;
  wire [15:0] n1748_o;
  wire [15:0] n1750_o;
  wire [15:0] n1751_o;
  wire [15:0] n1753_o;
  wire [15:0] n1754_o;
  wire [15:0] n1756_o;
  wire [15:0] n1757_o;
  wire n1759_o;
  wire n1761_o;
  wire n1762_o;
  wire n1764_o;
  wire [15:0] n1766_o;
  wire [15:0] n1767_o;
  wire n1769_o;
  wire [1:0] n1770_o;
  wire [7:0] n1771_o;
  reg [7:0] n1773_o;
  wire [7:0] n1774_o;
  wire [7:0] n1776_o;
  reg [7:0] n1777_o;
  wire [15:0] n1779_o;
  wire n1781_o;
  wire n1783_o;
  wire n1784_o;
  wire [15:0] n1786_o;
  wire [15:0] n1787_o;
  wire [15:0] n1789_o;
  wire n1791_o;
  wire n1793_o;
  wire n1794_o;
  wire n1796_o;
  wire n1797_o;
  wire n1799_o;
  wire n1800_o;
  wire n1802_o;
  wire n1803_o;
  wire n1805_o;
  wire n1806_o;
  wire n1808_o;
  wire n1809_o;
  wire n1811_o;
  wire n1812_o;
  wire n1814_o;
  wire n1815_o;
  wire n1817_o;
  wire n1818_o;
  wire n1820_o;
  wire n1821_o;
  wire n1822_o;
  wire n1823_o;
  wire n1824_o;
  wire n1825_o;
  wire [15:0] n1827_o;
  wire n1829_o;
  wire n1831_o;
  wire n1832_o;
  wire [15:0] n1834_o;
  wire n1836_o;
  wire n1838_o;
  wire [15:0] n1840_o;
  wire n1842_o;
  wire n1844_o;
  wire n1845_o;
  wire n1847_o;
  wire n1848_o;
  wire [15:0] n1850_o;
  wire n1852_o;
  wire [15:0] n1854_o;
  wire n1856_o;
  wire n1858_o;
  wire n1859_o;
  wire [22:0] n1860_o;
  reg n1867_o;
  reg [15:0] n1868_o;
  wire [7:0] n1869_o;
  wire [7:0] n1870_o;
  wire [7:0] n1871_o;
  wire [7:0] n1872_o;
  wire [7:0] n1873_o;
  wire [7:0] n1874_o;
  wire [7:0] n1875_o;
  wire [7:0] n1876_o;
  wire [7:0] n1877_o;
  wire [7:0] n1878_o;
  wire [7:0] n1879_o;
  wire [7:0] n1880_o;
  wire [7:0] n1881_o;
  wire [7:0] n1882_o;
  wire [7:0] n1883_o;
  wire [7:0] n1884_o;
  wire [7:0] n1885_o;
  wire [7:0] n1886_o;
  wire [7:0] n1887_o;
  wire [7:0] n1888_o;
  reg [7:0] n1889_o;
  wire [7:0] n1890_o;
  wire [7:0] n1891_o;
  wire [7:0] n1892_o;
  wire [7:0] n1893_o;
  wire [7:0] n1894_o;
  wire [7:0] n1895_o;
  wire [7:0] n1896_o;
  wire [7:0] n1897_o;
  wire [7:0] n1898_o;
  wire [7:0] n1899_o;
  wire [7:0] n1900_o;
  wire [7:0] n1901_o;
  wire [7:0] n1902_o;
  wire [7:0] n1903_o;
  wire [7:0] n1904_o;
  wire [7:0] n1905_o;
  wire [7:0] n1906_o;
  wire [7:0] n1907_o;
  wire [7:0] n1908_o;
  wire [7:0] n1909_o;
  reg [7:0] n1910_o;
  reg n1911_o;
  reg n1912_o;
  reg n1914_o;
  reg n1916_o;
  reg n1917_o;
  reg [7:0] n1919_o;
  wire [7:0] n1920_o;
  wire [7:0] n1921_o;
  reg [7:0] n1922_o;
  wire [7:0] n1923_o;
  wire [7:0] n1924_o;
  reg [7:0] n1925_o;
  reg [3:0] n1950_o;
  reg [2:0] n1959_o;
  reg [3:0] n1965_o;
  wire n1967_o;
  wire [2:0] n1968_o;
  wire [2:0] n1971_o;
  wire [7:0] n1974_o;
  wire n1976_o;
  wire n1979_o;
  wire n1981_o;
  wire n1983_o;
  wire n1984_o;
  wire n1986_o;
  wire n1987_o;
  wire n1989_o;
  wire n1990_o;
  wire n1992_o;
  wire n1993_o;
  wire n1995_o;
  wire n1996_o;
  wire n1998_o;
  wire n1999_o;
  wire n2001_o;
  wire n2002_o;
  wire n2004_o;
  wire n2005_o;
  wire n2007_o;
  wire n2008_o;
  wire n2010_o;
  wire n2011_o;
  wire n2013_o;
  wire n2014_o;
  wire n2016_o;
  wire n2017_o;
  wire n2019_o;
  wire n2020_o;
  wire n2022_o;
  wire n2023_o;
  wire n2025_o;
  wire n2026_o;
  wire n2027_o;
  wire n2028_o;
  wire [2:0] n2029_o;
  wire [2:0] n2032_o;
  wire [7:0] n2035_o;
  wire [2:0] n2036_o;
  wire [2:0] n2039_o;
  wire [7:0] n2042_o;
  wire [7:0] n2043_o;
  wire n2045_o;
  wire n2047_o;
  wire n2048_o;
  wire n2050_o;
  wire n2051_o;
  wire n2053_o;
  wire n2054_o;
  wire n2056_o;
  wire n2057_o;
  wire n2059_o;
  wire n2060_o;
  wire n2062_o;
  wire n2063_o;
  wire n2065_o;
  wire n2066_o;
  wire n2068_o;
  wire n2069_o;
  wire n2071_o;
  wire n2072_o;
  wire n2074_o;
  wire n2075_o;
  wire n2077_o;
  wire n2078_o;
  wire n2080_o;
  wire n2081_o;
  wire n2083_o;
  wire n2084_o;
  wire n2086_o;
  wire n2087_o;
  wire n2089_o;
  wire n2090_o;
  wire [3:0] n2091_o;
  wire n2093_o;
  wire n2095_o;
  wire n2097_o;
  wire [2:0] n2098_o;
  reg [2:0] n2102_o;
  wire [15:0] n2104_o;
  wire n2106_o;
  wire n2108_o;
  wire n2109_o;
  wire n2111_o;
  wire n2112_o;
  wire n2114_o;
  wire n2115_o;
  wire n2117_o;
  wire n2118_o;
  wire n2120_o;
  wire n2121_o;
  wire n2123_o;
  wire n2124_o;
  wire n2126_o;
  wire n2127_o;
  wire n2129_o;
  wire n2130_o;
  wire n2132_o;
  wire n2133_o;
  wire n2135_o;
  wire n2136_o;
  wire n2138_o;
  wire n2139_o;
  wire n2141_o;
  wire n2142_o;
  wire n2144_o;
  wire n2145_o;
  wire n2147_o;
  wire n2148_o;
  wire n2150_o;
  wire n2151_o;
  wire n2153_o;
  wire n2154_o;
  wire n2156_o;
  wire n2157_o;
  wire n2159_o;
  wire n2160_o;
  wire n2162_o;
  wire n2163_o;
  wire n2165_o;
  wire n2166_o;
  wire n2168_o;
  wire n2169_o;
  wire n2171_o;
  wire n2172_o;
  wire n2174_o;
  wire n2175_o;
  wire n2177_o;
  wire n2178_o;
  wire n2180_o;
  wire n2181_o;
  wire n2183_o;
  wire n2184_o;
  wire n2186_o;
  wire n2187_o;
  wire n2189_o;
  wire n2190_o;
  wire n2192_o;
  wire n2193_o;
  wire n2195_o;
  wire n2196_o;
  wire n2198_o;
  wire n2199_o;
  wire n2201_o;
  wire n2202_o;
  wire n2204_o;
  wire n2205_o;
  wire n2207_o;
  wire n2208_o;
  wire n2210_o;
  wire n2211_o;
  wire [7:0] n2212_o;
  wire [15:0] n2213_o;
  wire n2215_o;
  wire [7:0] n2216_o;
  wire [15:0] n2217_o;
  wire [15:0] n2219_o;
  wire [15:0] n2220_o;
  wire n2222_o;
  wire [15:0] n2224_o;
  wire [15:0] n2226_o;
  wire [15:0] n2227_o;
  wire n2229_o;
  wire n2230_o;
  wire n2232_o;
  wire n2235_o;
  wire [15:0] n2237_o;
  wire n2239_o;
  wire n2240_o;
  wire n2242_o;
  wire n2245_o;
  wire [15:0] n2247_o;
  wire n2249_o;
  wire n2250_o;
  wire n2252_o;
  wire n2255_o;
  wire [15:0] n2257_o;
  wire n2259_o;
  wire n2260_o;
  wire n2262_o;
  wire n2265_o;
  wire [15:0] n2267_o;
  wire n2269_o;
  wire n2270_o;
  wire n2272_o;
  wire n2275_o;
  wire [15:0] n2277_o;
  wire n2279_o;
  wire n2280_o;
  wire n2282_o;
  wire n2285_o;
  wire [15:0] n2287_o;
  wire n2289_o;
  wire [7:0] n2291_o;
  wire [7:0] n2293_o;
  wire n2294_o;
  wire n2296_o;
  wire n2299_o;
  wire n2302_o;
  wire n2304_o;
  wire n2306_o;
  wire n2307_o;
  wire n2309_o;
  wire n2310_o;
  wire [7:0] n2312_o;
  wire [7:0] n2314_o;
  wire n2315_o;
  wire n2317_o;
  wire n2320_o;
  wire n2322_o;
  wire n2324_o;
  wire n2325_o;
  wire n2327_o;
  wire n2328_o;
  wire [6:0] n2329_o;
  wire [7:0] n2331_o;
  wire [6:0] n2332_o;
  wire [7:0] n2334_o;
  wire n2335_o;
  wire n2337_o;
  wire n2340_o;
  wire n2342_o;
  wire n2344_o;
  wire n2345_o;
  wire n2347_o;
  wire n2348_o;
  wire [6:0] n2349_o;
  wire [7:0] n2350_o;
  wire [6:0] n2351_o;
  wire [7:0] n2352_o;
  wire n2353_o;
  wire n2355_o;
  wire n2358_o;
  wire n2360_o;
  wire n2362_o;
  wire n2363_o;
  wire n2365_o;
  wire n2366_o;
  wire n2367_o;
  wire [6:0] n2368_o;
  wire [7:0] n2369_o;
  wire n2370_o;
  wire [6:0] n2371_o;
  wire [7:0] n2372_o;
  wire n2373_o;
  wire n2374_o;
  wire n2376_o;
  wire n2379_o;
  wire n2381_o;
  wire n2383_o;
  wire n2384_o;
  wire n2386_o;
  wire n2387_o;
  wire [6:0] n2388_o;
  wire [7:0] n2390_o;
  wire [6:0] n2391_o;
  wire [7:0] n2393_o;
  wire n2394_o;
  wire n2395_o;
  wire n2397_o;
  wire n2400_o;
  wire n2402_o;
  wire n2404_o;
  wire n2405_o;
  wire n2407_o;
  wire n2408_o;
  wire [6:0] n2409_o;
  wire [7:0] n2410_o;
  wire [6:0] n2411_o;
  wire [7:0] n2412_o;
  wire n2413_o;
  wire n2414_o;
  wire n2416_o;
  wire n2419_o;
  wire n2421_o;
  wire n2423_o;
  wire n2424_o;
  wire n2426_o;
  wire n2427_o;
  wire [7:0] n2429_o;
  wire [7:0] n2431_o;
  wire n2432_o;
  wire n2434_o;
  wire n2437_o;
  wire n2439_o;
  wire n2441_o;
  wire n2442_o;
  wire n2444_o;
  wire n2445_o;
  wire [7:0] n2447_o;
  wire [7:0] n2449_o;
  wire n2450_o;
  wire n2452_o;
  wire n2455_o;
  wire n2457_o;
  wire n2459_o;
  wire n2460_o;
  wire n2462_o;
  wire n2463_o;
  wire n2464_o;
  wire n2466_o;
  wire n2469_o;
  wire n2471_o;
  wire n2473_o;
  wire n2474_o;
  wire n2476_o;
  wire n2477_o;
  wire n2479_o;
  wire n2481_o;
  wire n2482_o;
  wire [15:0] n2484_o;
  wire n2486_o;
  wire n2488_o;
  wire n2489_o;
  wire n2491_o;
  wire [15:0] n2493_o;
  wire n2495_o;
  wire [15:0] n2497_o;
  wire n2499_o;
  wire n2501_o;
  wire n2502_o;
  wire n2504_o;
  wire n2505_o;
  wire [15:0] n2507_o;
  wire n2509_o;
  wire [15:0] n2511_o;
  wire n2513_o;
  wire n2515_o;
  wire n2516_o;
  wire [28:0] n2517_o;
  reg n2536_o;
  reg [7:0] n2537_o;
  reg [15:0] n2538_o;
  wire [7:0] n2539_o;
  wire [7:0] n2540_o;
  wire [7:0] n2541_o;
  wire [7:0] n2542_o;
  wire [7:0] n2543_o;
  wire [7:0] n2544_o;
  wire [7:0] n2545_o;
  wire [7:0] n2546_o;
  wire [7:0] n2547_o;
  wire [7:0] n2548_o;
  wire [7:0] n2549_o;
  wire [7:0] n2550_o;
  reg [7:0] n2551_o;
  wire [7:0] n2552_o;
  wire [7:0] n2553_o;
  wire [7:0] n2554_o;
  wire [7:0] n2555_o;
  wire [7:0] n2556_o;
  wire [7:0] n2557_o;
  wire [7:0] n2558_o;
  wire [7:0] n2559_o;
  wire [7:0] n2560_o;
  wire [7:0] n2561_o;
  wire [7:0] n2562_o;
  wire [7:0] n2563_o;
  reg [7:0] n2564_o;
  reg n2566_o;
  reg n2567_o;
  reg n2569_o;
  reg [7:0] n2570_o;
  wire [7:0] n2571_o;
  reg [7:0] n2572_o;
  reg [3:0] n2603_o;
  reg [2:0] n2615_o;
  reg [3:0] n2636_o;
  wire n2639_o;
  wire n2640_o;
  wire n2641_o;
  wire n2642_o;
  wire n2643_o;
  wire [15:0] n2645_o;
  wire [15:0] n2646_o;
  wire [15:0] n2648_o;
  wire [15:0] n2650_o;
  wire [15:0] n2651_o;
  wire [15:0] n2653_o;
  wire [15:0] n2654_o;
  wire [15:0] n2656_o;
  wire [15:0] n2657_o;
  wire n2659_o;
  wire n2661_o;
  wire n2662_o;
  wire n2664_o;
  wire n2665_o;
  wire n2667_o;
  wire n2668_o;
  wire n2670_o;
  wire n2671_o;
  wire n2673_o;
  wire n2674_o;
  wire n2676_o;
  wire n2677_o;
  wire n2679_o;
  wire n2680_o;
  wire n2682_o;
  wire n2683_o;
  wire n2685_o;
  wire n2686_o;
  wire n2688_o;
  wire n2689_o;
  wire n2691_o;
  wire n2692_o;
  wire n2694_o;
  wire n2695_o;
  wire n2697_o;
  wire n2698_o;
  wire n2700_o;
  wire n2701_o;
  wire n2703_o;
  wire n2704_o;
  wire n2706_o;
  wire n2708_o;
  wire n2709_o;
  wire n2711_o;
  wire n2712_o;
  wire n2714_o;
  wire n2715_o;
  wire n2717_o;
  wire n2718_o;
  wire n2720_o;
  wire n2721_o;
  wire n2723_o;
  wire n2724_o;
  wire n2726_o;
  wire n2727_o;
  wire n2729_o;
  wire n2730_o;
  wire n2732_o;
  wire n2733_o;
  wire n2735_o;
  wire n2736_o;
  wire n2738_o;
  wire n2739_o;
  wire n2741_o;
  wire n2742_o;
  wire n2744_o;
  wire n2745_o;
  wire n2747_o;
  wire n2748_o;
  wire n2750_o;
  wire n2751_o;
  wire n2753_o;
  wire n2754_o;
  wire n2756_o;
  wire n2757_o;
  wire n2759_o;
  wire n2760_o;
  wire n2762_o;
  wire n2763_o;
  wire n2765_o;
  wire n2766_o;
  wire n2768_o;
  wire n2769_o;
  wire n2771_o;
  wire n2772_o;
  wire n2774_o;
  wire n2775_o;
  wire n2777_o;
  wire n2778_o;
  wire n2780_o;
  wire n2781_o;
  wire n2783_o;
  wire n2784_o;
  wire n2786_o;
  wire n2787_o;
  wire n2789_o;
  wire n2790_o;
  wire n2792_o;
  wire n2793_o;
  wire n2795_o;
  wire n2796_o;
  wire n2798_o;
  wire n2799_o;
  wire n2801_o;
  wire n2802_o;
  wire n2804_o;
  wire n2805_o;
  wire n2807_o;
  wire n2808_o;
  wire n2810_o;
  wire n2811_o;
  wire n2813_o;
  wire n2814_o;
  wire n2816_o;
  wire n2817_o;
  wire n2819_o;
  wire n2820_o;
  wire n2822_o;
  wire n2823_o;
  wire n2825_o;
  wire n2826_o;
  wire n2828_o;
  wire n2829_o;
  wire n2831_o;
  wire n2832_o;
  wire n2834_o;
  wire n2835_o;
  wire n2837_o;
  wire n2838_o;
  wire n2840_o;
  wire n2841_o;
  wire n2843_o;
  wire n2844_o;
  wire n2846_o;
  wire n2847_o;
  wire n2849_o;
  wire n2850_o;
  wire n2852_o;
  wire n2853_o;
  wire n2855_o;
  wire n2856_o;
  wire n2858_o;
  wire n2859_o;
  wire n2861_o;
  wire n2862_o;
  wire [15:0] n2864_o;
  wire n2866_o;
  wire n2868_o;
  wire n2869_o;
  wire [15:0] n2871_o;
  wire n2876_o;
  wire [7:0] n2877_o;
  wire [7:0] n2878_o;
  wire n2879_o;
  wire n2881_o;
  wire n2884_o;
  wire n2885_o;
  wire n2886_o;
  wire n2887_o;
  wire n2888_o;
  wire n2889_o;
  wire n2890_o;
  wire n2891_o;
  wire n2892_o;
  wire n2893_o;
  wire n2894_o;
  wire n2895_o;
  wire n2896_o;
  wire n2897_o;
  wire n2899_o;
  wire [15:0] n2901_o;
  wire [15:0] n2902_o;
  wire n2904_o;
  wire n2906_o;
  wire n2907_o;
  wire n2909_o;
  wire n2910_o;
  wire n2912_o;
  wire n2913_o;
  wire n2915_o;
  wire n2916_o;
  wire n2918_o;
  wire n2919_o;
  wire [7:0] n2920_o;
  wire n2921_o;
  wire n2923_o;
  wire n2926_o;
  wire n2927_o;
  wire n2928_o;
  wire n2929_o;
  wire n2930_o;
  wire n2931_o;
  wire n2932_o;
  wire n2933_o;
  wire n2934_o;
  wire n2935_o;
  wire n2936_o;
  wire n2937_o;
  wire n2938_o;
  wire n2939_o;
  wire n2941_o;
  wire [15:0] n2943_o;
  wire [15:0] n2944_o;
  wire n2946_o;
  wire n2948_o;
  wire n2949_o;
  wire n2951_o;
  wire n2952_o;
  wire n2954_o;
  wire n2955_o;
  wire n2957_o;
  wire n2958_o;
  wire n2960_o;
  wire n2961_o;
  wire [7:0] n2962_o;
  wire [7:0] n2964_o;
  wire [7:0] n2965_o;
  wire [7:0] n2966_o;
  wire [7:0] n2968_o;
  wire [7:0] n2969_o;
  wire n2970_o;
  wire n2972_o;
  wire n2975_o;
  wire n2976_o;
  wire n2977_o;
  wire n2978_o;
  wire n2979_o;
  wire n2980_o;
  wire n2981_o;
  wire n2982_o;
  wire n2983_o;
  wire n2984_o;
  wire n2985_o;
  wire n2986_o;
  wire n2987_o;
  wire n2988_o;
  wire n2990_o;
  wire [15:0] n2992_o;
  wire [15:0] n2993_o;
  wire n2995_o;
  wire n2997_o;
  wire n2998_o;
  wire n3000_o;
  wire n3001_o;
  wire n3003_o;
  wire n3004_o;
  wire n3006_o;
  wire n3007_o;
  wire n3009_o;
  wire n3010_o;
  wire [7:0] n3011_o;
  wire n3012_o;
  wire n3014_o;
  wire n3017_o;
  wire n3018_o;
  wire n3019_o;
  wire n3020_o;
  wire n3021_o;
  wire n3022_o;
  wire n3023_o;
  wire n3024_o;
  wire n3025_o;
  wire n3026_o;
  wire n3027_o;
  wire n3028_o;
  wire n3029_o;
  wire n3030_o;
  wire n3032_o;
  wire [15:0] n3034_o;
  wire [15:0] n3035_o;
  wire n3037_o;
  wire n3039_o;
  wire n3040_o;
  wire n3042_o;
  wire n3043_o;
  wire n3045_o;
  wire n3046_o;
  wire n3048_o;
  wire n3049_o;
  wire n3051_o;
  wire n3052_o;
  wire [7:0] n3053_o;
  wire [7:0] n3054_o;
  wire n3055_o;
  wire n3057_o;
  wire n3060_o;
  wire n3062_o;
  wire [15:0] n3064_o;
  wire [15:0] n3065_o;
  wire n3067_o;
  wire n3069_o;
  wire n3070_o;
  wire n3072_o;
  wire n3073_o;
  wire n3075_o;
  wire n3076_o;
  wire n3078_o;
  wire n3079_o;
  wire n3081_o;
  wire n3082_o;
  wire [7:0] n3083_o;
  wire n3084_o;
  wire n3086_o;
  wire n3089_o;
  wire n3091_o;
  wire [15:0] n3093_o;
  wire [15:0] n3094_o;
  wire n3096_o;
  wire n3098_o;
  wire n3099_o;
  wire n3101_o;
  wire n3102_o;
  wire n3104_o;
  wire n3105_o;
  wire n3107_o;
  wire n3108_o;
  wire n3110_o;
  wire n3111_o;
  wire n3112_o;
  wire n3114_o;
  wire n3117_o;
  wire n3119_o;
  wire [15:0] n3121_o;
  wire [15:0] n3122_o;
  wire n3124_o;
  wire n3126_o;
  wire n3127_o;
  wire n3129_o;
  wire n3130_o;
  wire n3132_o;
  wire n3133_o;
  wire n3135_o;
  wire n3136_o;
  wire n3138_o;
  wire n3139_o;
  wire [7:0] n3140_o;
  wire [7:0] n3141_o;
  wire n3142_o;
  wire n3144_o;
  wire n3147_o;
  wire n3149_o;
  wire [15:0] n3151_o;
  wire [15:0] n3152_o;
  wire n3154_o;
  wire n3156_o;
  wire n3157_o;
  wire n3159_o;
  wire n3160_o;
  wire n3162_o;
  wire n3163_o;
  wire n3165_o;
  wire n3166_o;
  wire n3168_o;
  wire n3169_o;
  wire [7:0] n3170_o;
  wire [7:0] n3172_o;
  wire [7:0] n3173_o;
  wire [7:0] n3174_o;
  wire [7:0] n3176_o;
  wire [7:0] n3177_o;
  wire n3178_o;
  wire n3180_o;
  wire n3183_o;
  wire n3184_o;
  wire n3185_o;
  wire n3186_o;
  wire n3187_o;
  wire n3188_o;
  wire n3189_o;
  wire n3190_o;
  wire n3191_o;
  wire n3192_o;
  wire n3193_o;
  wire n3194_o;
  wire n3195_o;
  wire n3196_o;
  wire n3197_o;
  wire n3198_o;
  wire n3199_o;
  wire n3200_o;
  wire n3201_o;
  wire n3202_o;
  wire n3203_o;
  wire n3204_o;
  wire n3205_o;
  wire n3206_o;
  wire n3207_o;
  wire n3208_o;
  wire n3209_o;
  wire n3211_o;
  wire [15:0] n3213_o;
  wire [15:0] n3214_o;
  wire n3216_o;
  wire n3218_o;
  wire n3219_o;
  wire n3221_o;
  wire n3222_o;
  wire n3224_o;
  wire n3225_o;
  wire n3227_o;
  wire n3228_o;
  wire n3230_o;
  wire n3231_o;
  wire [7:0] n3232_o;
  wire [7:0] n3233_o;
  wire n3234_o;
  wire n3236_o;
  wire n3239_o;
  wire n3241_o;
  wire [15:0] n3243_o;
  wire [15:0] n3244_o;
  wire n3246_o;
  wire n3248_o;
  wire n3249_o;
  wire n3251_o;
  wire n3252_o;
  wire n3254_o;
  wire n3255_o;
  wire n3257_o;
  wire n3258_o;
  wire n3260_o;
  wire n3261_o;
  wire [7:0] n3262_o;
  wire [7:0] n3263_o;
  wire n3264_o;
  wire n3266_o;
  wire n3269_o;
  wire n3270_o;
  wire n3271_o;
  wire n3272_o;
  wire n3273_o;
  wire n3274_o;
  wire n3275_o;
  wire n3276_o;
  wire n3277_o;
  wire n3278_o;
  wire n3279_o;
  wire n3280_o;
  wire n3281_o;
  wire n3282_o;
  wire n3283_o;
  wire n3284_o;
  wire n3285_o;
  wire n3286_o;
  wire n3287_o;
  wire n3288_o;
  wire n3289_o;
  wire n3290_o;
  wire n3291_o;
  wire n3292_o;
  wire n3293_o;
  wire n3294_o;
  wire n3295_o;
  wire n3297_o;
  wire [15:0] n3299_o;
  wire [15:0] n3300_o;
  wire n3302_o;
  wire n3304_o;
  wire n3305_o;
  wire n3307_o;
  wire n3308_o;
  wire n3310_o;
  wire n3311_o;
  wire n3313_o;
  wire n3314_o;
  wire n3316_o;
  wire n3317_o;
  wire n3318_o;
  wire n3320_o;
  wire n3323_o;
  wire n3325_o;
  wire [15:0] n3327_o;
  wire [15:0] n3328_o;
  wire n3330_o;
  wire n3332_o;
  wire n3333_o;
  wire n3335_o;
  wire n3336_o;
  wire n3338_o;
  wire n3339_o;
  wire n3341_o;
  wire n3342_o;
  wire n3344_o;
  wire n3345_o;
  wire n3346_o;
  wire n3347_o;
  wire [15:0] n3349_o;
  wire [15:0] n3350_o;
  wire [15:0] n3352_o;
  wire [15:0] n3353_o;
  wire [15:0] n3354_o;
  wire [15:0] n3356_o;
  wire n3358_o;
  wire [15:0] n3360_o;
  wire [15:0] n3362_o;
  wire n3364_o;
  wire [15:0] n3366_o;
  wire n3368_o;
  wire n3370_o;
  wire n3371_o;
  wire [15:0] n3373_o;
  wire [15:0] n3375_o;
  wire [15:0] n3376_o;
  wire [15:0] n3378_o;
  wire n3380_o;
  wire [15:0] n3382_o;
  wire [15:0] n3384_o;
  wire n3386_o;
  wire [20:0] n3387_o;
  reg n3393_o;
  reg [7:0] n3394_o;
  reg [7:0] n3395_o;
  reg [15:0] n3396_o;
  reg [15:0] n3397_o;
  reg n3398_o;
  reg n3399_o;
  reg n3400_o;
  reg n3401_o;
  wire n3402_o;
  reg n3403_o;
  wire n3404_o;
  reg n3405_o;
  wire n3406_o;
  reg n3407_o;
  wire n3408_o;
  reg n3409_o;
  wire n3410_o;
  reg n3411_o;
  wire n3412_o;
  reg n3413_o;
  wire n3414_o;
  reg n3415_o;
  wire n3416_o;
  reg n3417_o;
  reg [3:0] n3440_o;
  reg [2:0] n3459_o;
  reg [3:0] n3462_o;
  wire n3465_o;
  wire [15:0] n3467_o;
  wire n3469_o;
  wire n3471_o;
  wire n3472_o;
  wire [15:0] n3474_o;
  wire n3476_o;
  wire [15:0] n3478_o;
  wire n3480_o;
  wire [15:0] n3482_o;
  wire [15:0] n3484_o;
  wire [15:0] n3485_o;
  wire n3487_o;
  wire [3:0] n3488_o;
  reg n3491_o;
  reg [15:0] n3492_o;
  wire [7:0] n3493_o;
  wire [7:0] n3494_o;
  wire [7:0] n3495_o;
  reg [7:0] n3496_o;
  wire [7:0] n3497_o;
  wire [7:0] n3498_o;
  wire [7:0] n3499_o;
  reg [7:0] n3500_o;
  reg [3:0] n3506_o;
  reg [2:0] n3509_o;
  reg [3:0] n3511_o;
  wire n3513_o;
  wire n3515_o;
  wire n3517_o;
  wire n3518_o;
  wire [15:0] n3520_o;
  wire n3521_o;
  wire [15:0] n3524_o;
  wire n3526_o;
  wire [15:0] n3528_o;
  wire n3530_o;
  wire n3531_o;
  wire [15:0] n3533_o;
  wire n3535_o;
  wire n3536_o;
  wire n3537_o;
  wire [15:0] n3539_o;
  wire [3:0] n3542_o;
  wire n3543_o;
  wire n3544_o;
  wire n3545_o;
  wire n3547_o;
  wire [1:0] n3548_o;
  reg [15:0] n3549_o;
  wire [7:0] n3550_o;
  reg [7:0] n3551_o;
  reg n3553_o;
  reg [15:0] n3554_o;
  reg [3:0] n3557_o;
  reg [2:0] n3559_o;
  reg [3:0] n3561_o;
  reg n3562_o;
  reg n3563_o;
  reg n3564_o;
  wire n3566_o;
  wire [15:0] n3568_o;
  wire n3570_o;
  reg n3572_o;
  reg [15:0] n3573_o;
  reg [3:0] n3576_o;
  reg [2:0] n3578_o;
  wire n3580_o;
  wire [15:0] n3582_o;
  wire n3584_o;
  wire [7:0] n3585_o;
  reg [7:0] n3586_o;
  reg [15:0] n3587_o;
  reg [3:0] n3590_o;
  wire n3592_o;
  wire n3594_o;
  wire [7:0] n3595_o;
  reg [7:0] n3596_o;
  reg [3:0] n3599_o;
  reg [2:0] n3601_o;
  wire n3603_o;
  wire [15:0] n3605_o;
  wire n3607_o;
  wire [11:0] n3608_o;
  reg n3609_o;
  reg [7:0] n3610_o;
  reg [7:0] n3611_o;
  reg [15:0] n3612_o;
  wire [7:0] n3613_o;
  wire [7:0] n3614_o;
  wire [7:0] n3615_o;
  reg [7:0] n3616_o;
  wire [7:0] n3617_o;
  wire [7:0] n3618_o;
  wire [7:0] n3619_o;
  reg [7:0] n3620_o;
  reg n3621_o;
  reg n3622_o;
  reg n3623_o;
  reg n3624_o;
  reg n3625_o;
  wire n3626_o;
  wire n3627_o;
  wire n3628_o;
  wire n3629_o;
  reg n3630_o;
  wire n3631_o;
  wire n3632_o;
  wire n3633_o;
  wire n3634_o;
  reg n3635_o;
  wire n3636_o;
  wire n3637_o;
  wire n3638_o;
  wire n3639_o;
  reg n3640_o;
  wire n3641_o;
  wire n3642_o;
  wire n3643_o;
  wire n3644_o;
  reg n3645_o;
  wire n3646_o;
  wire n3647_o;
  wire n3648_o;
  wire n3649_o;
  reg n3650_o;
  wire n3651_o;
  wire n3652_o;
  wire n3653_o;
  wire n3654_o;
  reg n3655_o;
  wire n3656_o;
  wire n3657_o;
  wire n3658_o;
  wire n3659_o;
  reg n3660_o;
  wire n3661_o;
  wire n3662_o;
  wire n3663_o;
  wire n3664_o;
  reg n3665_o;
  wire [7:0] n3666_o;
  wire [7:0] n3667_o;
  wire [7:0] n3668_o;
  wire [7:0] n3669_o;
  wire [7:0] n3670_o;
  reg [7:0] n3671_o;
  wire [7:0] n3672_o;
  wire [7:0] n3673_o;
  wire [7:0] n3674_o;
  wire [7:0] n3675_o;
  wire [7:0] n3676_o;
  reg [7:0] n3677_o;
  reg [3:0] n3682_o;
  reg [2:0] n3684_o;
  reg [3:0] n3686_o;
  reg [7:0] n3687_o;
  reg n3688_o;
  reg n3689_o;
  reg n3690_o;
  reg n3692_o;
  reg n3694_o;
  reg [7:0] n3695_o;
  wire [15:0] n3701_o;
  wire [7:0] n3708_o;
  wire [15:0] n3710_o;
  wire n3716_o;
  wire n3717_o;
  wire n3718_o;
  wire [63:0] n3802_o;
  wire [63:0] n3803_o;
  wire [7:0] n3804_o;
  reg [7:0] n3805_q;
  wire [7:0] n3806_o;
  reg [7:0] n3807_q;
  wire [15:0] n3808_o;
  reg [15:0] n3809_q;
  wire [15:0] n3810_o;
  reg [15:0] n3811_q;
  wire n3812_o;
  reg n3813_q;
  wire n3814_o;
  reg n3815_q;
  wire n3816_o;
  reg n3817_q;
  wire n3818_o;
  reg n3819_q;
  wire n3820_o;
  reg n3821_q;
  wire [7:0] n3822_o;
  reg [7:0] n3823_q;
  wire [15:0] n3824_o;
  reg [15:0] n3825_q;
  wire [3:0] n3826_o;
  reg [3:0] n3827_q;
  wire [2:0] n3828_o;
  reg [2:0] n3829_q;
  wire [3:0] n3830_o;
  reg [3:0] n3831_q;
  wire n3832_o;
  wire n3833_o;
  wire [7:0] n3834_o;
  reg [7:0] n3835_q;
  reg n3836_q;
  reg n3837_q;
  wire n3838_o;
  wire n3839_o;
  reg n3840_q;
  reg n3841_q;
  reg n3842_q;
  reg n3843_q;
  wire n3844_o;
  reg n3845_q;
  wire n3846_o;
  reg n3847_q;
  wire n3848_o;
  wire n3849_o;
  wire [7:0] n3850_o;
  reg [7:0] n3851_q;
  wire n3852_o;
  reg n3853_q;
  wire [7:0] n3854_o;
  wire [7:0] n3855_o;
  wire [7:0] n3856_o;
  wire [7:0] n3857_o;
  wire [7:0] n3858_o;
  wire [7:0] n3859_o;
  wire [7:0] n3860_o;
  wire [7:0] n3861_o;
  wire [1:0] n3862_o;
  reg [7:0] n3863_o;
  wire [1:0] n3864_o;
  reg [7:0] n3865_o;
  wire n3866_o;
  wire [7:0] n3867_o;
  wire [7:0] n3868_o;
  wire [7:0] n3869_o;
  wire [7:0] n3870_o;
  wire [7:0] n3871_o;
  wire [7:0] n3872_o;
  wire [7:0] n3873_o;
  wire [7:0] n3874_o;
  wire [7:0] n3875_o;
  wire [1:0] n3876_o;
  reg [7:0] n3877_o;
  wire [1:0] n3878_o;
  reg [7:0] n3879_o;
  wire n3880_o;
  wire [7:0] n3881_o;
  wire [7:0] n3882_o;
  wire [7:0] n3883_o;
  wire [7:0] n3884_o;
  wire [7:0] n3885_o;
  wire [7:0] n3886_o;
  wire [7:0] n3887_o;
  wire [7:0] n3888_o;
  wire [7:0] n3889_o;
  wire [1:0] n3890_o;
  reg [7:0] n3891_o;
  wire [1:0] n3892_o;
  reg [7:0] n3893_o;
  wire n3894_o;
  wire [7:0] n3895_o;
  assign addr = n9_o;
  assign wr = n3853_q;
  assign state = mainfsm;
  assign dataout = n46_o;
  /* 6805.vhd:182:10  */
  assign mask0 = n3802_o; // (signal)
  /* 6805.vhd:183:10  */
  assign mask1 = n3803_o; // (signal)
  /* 6805.vhd:184:10  */
  assign rega = n3805_q; // (signal)
  /* 6805.vhd:185:10  */
  assign regx = n3807_q; // (signal)
  /* 6805.vhd:186:10  */
  assign regsp = n3809_q; // (signal)
  /* 6805.vhd:187:10  */
  assign regpc = n3811_q; // (signal)
  /* 6805.vhd:188:10  */
  assign flagh = n3813_q; // (signal)
  /* 6805.vhd:189:10  */
  assign flagi = n3815_q; // (signal)
  /* 6805.vhd:190:10  */
  assign flagn = n3817_q; // (signal)
  /* 6805.vhd:191:10  */
  assign flagz = n3819_q; // (signal)
  /* 6805.vhd:192:10  */
  assign flagc = n3821_q; // (signal)
  /* 6805.vhd:193:10  */
  assign help = n3823_q; // (signal)
  /* 6805.vhd:194:10  */
  assign temp = n3825_q; // (signal)
  /* 6805.vhd:195:10  */
  assign mainfsm = n3827_q; // (signal)
  /* 6805.vhd:196:10  */
  assign addrmux = n3829_q; // (signal)
  /* 6805.vhd:197:10  */
  assign datamux = n3831_q; // (signal)
  /* 6805.vhd:198:10  */
  assign opcode = n3835_q; // (signal)
  /* 6805.vhd:199:10  */
  assign prod = mul_n4; // (signal)
  /* 6805.vhd:200:10  */
  assign extirq_d = n3836_q; // (signal)
  /* 6805.vhd:201:10  */
  assign timerirq_d = n3837_q; // (signal)
  /* 6805.vhd:202:10  */
  assign sciirq_d = n3840_q; // (signal)
  /* 6805.vhd:203:10  */
  assign extirqrequest = n3841_q; // (signal)
  /* 6805.vhd:204:10  */
  assign timerirqrequest = n3842_q; // (signal)
  /* 6805.vhd:205:10  */
  assign sciirqrequest = n3843_q; // (signal)
  /* 6805.vhd:208:10  */
  assign trace = n3845_q; // (signal)
  /* 6805.vhd:209:10  */
  assign trace_i = n3847_q; // (signal)
  /* 6805.vhd:210:10  */
  assign traceopcode = n3851_q; // (signal)
  /* 6805.vhd:217:13  */
  assign mul_n4 = mul_prod; // (signal)
  /* 6805.vhd:214:3  */
  mul8 mul (
    .a(rega),
    .b(regx),
    .prod(mul_prod));
  /* 6805.vhd:220:39  */
  assign n8_o = addrmux == 3'b000;
  /* 6805.vhd:220:26  */
  assign n9_o = n8_o ? regpc : n12_o;
  /* 6805.vhd:221:39  */
  assign n11_o = addrmux == 3'b001;
  /* 6805.vhd:220:48  */
  assign n12_o = n11_o ? regsp : n17_o;
  /* 6805.vhd:222:17  */
  assign n14_o = {8'b00000000, regx};
  /* 6805.vhd:222:39  */
  assign n16_o = addrmux == 3'b010;
  /* 6805.vhd:221:48  */
  assign n17_o = n16_o ? n14_o : n20_o;
  /* 6805.vhd:223:39  */
  assign n19_o = addrmux == 3'b011;
  /* 6805.vhd:222:48  */
  assign n20_o = n19_o ? temp : n26_o;
  /* 6805.vhd:224:19  */
  assign n22_o = {8'b00000000, regx};
  /* 6805.vhd:224:27  */
  assign n23_o = n22_o + temp;
  /* 6805.vhd:224:48  */
  assign n25_o = addrmux == 3'b100;
  /* 6805.vhd:223:48  */
  assign n26_o = n25_o ? n23_o : n30_o;
  /* 6805.vhd:225:18  */
  assign n27_o = regsp + temp;
  /* 6805.vhd:225:39  */
  assign n29_o = addrmux == 3'b101;
  /* 6805.vhd:224:57  */
  assign n30_o = n29_o ? n27_o : n39_o;
  /* 6805.vhd:226:19  */
  assign n32_o = {8'b00000000, regx};
  /* 6805.vhd:226:42  */
  assign n33_o = temp[7:0];
  /* 6805.vhd:226:36  */
  assign n35_o = {8'b00000000, n33_o};
  /* 6805.vhd:226:27  */
  assign n36_o = n32_o + n35_o;
  /* 6805.vhd:226:70  */
  assign n38_o = addrmux == 3'b110;
  /* 6805.vhd:225:48  */
  assign n39_o = n38_o ? n36_o : n43_o;
  /* 6805.vhd:227:33  */
  assign n40_o = temp[7:0];
  /* 6805.vhd:227:27  */
  assign n42_o = {8'b00000000, n40_o};
  /* 6805.vhd:227:18  */
  assign n43_o = regsp + n42_o;
  /* 6805.vhd:228:46  */
  assign n45_o = datamux == 4'b0000;
  /* 6805.vhd:228:33  */
  assign n46_o = n45_o ? rega : n49_o;
  /* 6805.vhd:229:46  */
  assign n48_o = datamux == 4'b0001;
  /* 6805.vhd:228:53  */
  assign n49_o = n48_o ? regx : n52_o;
  /* 6805.vhd:230:46  */
  assign n51_o = datamux == 4'b0010;
  /* 6805.vhd:229:53  */
  assign n52_o = n51_o ? regx : n56_o;
  /* 6805.vhd:231:19  */
  assign n53_o = regsp[7:0];
  /* 6805.vhd:231:46  */
  assign n55_o = datamux == 4'b0011;
  /* 6805.vhd:230:53  */
  assign n56_o = n55_o ? n53_o : n60_o;
  /* 6805.vhd:232:19  */
  assign n57_o = regsp[15:8];
  /* 6805.vhd:232:46  */
  assign n59_o = datamux == 4'b0100;
  /* 6805.vhd:231:55  */
  assign n60_o = n59_o ? n57_o : n64_o;
  /* 6805.vhd:233:19  */
  assign n61_o = regpc[7:0];
  /* 6805.vhd:233:46  */
  assign n63_o = datamux == 4'b0101;
  /* 6805.vhd:232:55  */
  assign n64_o = n63_o ? n61_o : n68_o;
  /* 6805.vhd:234:19  */
  assign n65_o = regpc[15:8];
  /* 6805.vhd:234:46  */
  assign n67_o = datamux == 4'b0110;
  /* 6805.vhd:233:55  */
  assign n68_o = n67_o ? n65_o : n72_o;
  /* 6805.vhd:235:19  */
  assign n69_o = temp[7:0];
  /* 6805.vhd:235:46  */
  assign n71_o = datamux == 4'b0111;
  /* 6805.vhd:234:55  */
  assign n72_o = n71_o ? n69_o : n76_o;
  /* 6805.vhd:236:19  */
  assign n73_o = temp[15:8];
  /* 6805.vhd:236:46  */
  assign n75_o = datamux == 4'b1000;
  /* 6805.vhd:235:55  */
  assign n76_o = n75_o ? n73_o : n79_o;
  /* 6805.vhd:237:46  */
  assign n78_o = datamux == 4'b1001;
  /* 6805.vhd:236:55  */
  assign n79_o = n78_o ? help : traceopcode;
  /* 6805.vhd:264:12  */
  assign n100_o = ~rst;
  /* 6805.vhd:294:20  */
  assign n103_o = $unsigned(extirq) <= $unsigned(1'b0);
  /* 6805.vhd:294:28  */
  assign n104_o = extirq_d & n103_o;
  /* 6805.vhd:294:9  */
  assign n106_o = n104_o ? 1'b1 : extirqrequest;
  /* 6805.vhd:298:22  */
  assign n108_o = $unsigned(timerirq) <= $unsigned(1'b0);
  /* 6805.vhd:298:30  */
  assign n109_o = timerirq_d & n108_o;
  /* 6805.vhd:298:9  */
  assign n111_o = n109_o ? 1'b1 : timerirqrequest;
  /* 6805.vhd:302:20  */
  assign n113_o = $unsigned(sciirq) <= $unsigned(1'b0);
  /* 6805.vhd:302:28  */
  assign n114_o = sciirq_d & n113_o;
  /* 6805.vhd:302:9  */
  assign n116_o = n114_o ? 1'b1 : sciirqrequest;
  /* 6805.vhd:310:29  */
  assign n118_o = temp + 16'b0000000000000001;
  /* 6805.vhd:308:11  */
  assign n120_o = mainfsm == 4'b0000;
  /* 6805.vhd:312:11  */
  assign n122_o = mainfsm == 4'b0001;
  /* 6805.vhd:324:39  */
  assign n123_o = extirqrequest | timerirqrequest;
  /* 6805.vhd:324:65  */
  assign n124_o = n123_o | sciirqrequest;
  /* 6805.vhd:333:36  */
  assign n126_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:331:17  */
  assign n128_o = datain == 8'b10000010;
  /* 6805.vhd:349:36  */
  assign n130_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:336:17  */
  assign n132_o = datain == 8'b00000000;
  /* 6805.vhd:336:28  */
  assign n134_o = datain == 8'b00000010;
  /* 6805.vhd:336:28  */
  assign n135_o = n132_o | n134_o;
  /* 6805.vhd:336:36  */
  assign n137_o = datain == 8'b00000100;
  /* 6805.vhd:336:36  */
  assign n138_o = n135_o | n137_o;
  /* 6805.vhd:336:44  */
  assign n140_o = datain == 8'b00000110;
  /* 6805.vhd:336:44  */
  assign n141_o = n138_o | n140_o;
  /* 6805.vhd:336:52  */
  assign n143_o = datain == 8'b00001000;
  /* 6805.vhd:336:52  */
  assign n144_o = n141_o | n143_o;
  /* 6805.vhd:336:60  */
  assign n146_o = datain == 8'b00001010;
  /* 6805.vhd:336:60  */
  assign n147_o = n144_o | n146_o;
  /* 6805.vhd:336:68  */
  assign n149_o = datain == 8'b00001100;
  /* 6805.vhd:336:68  */
  assign n150_o = n147_o | n149_o;
  /* 6805.vhd:336:76  */
  assign n152_o = datain == 8'b00001110;
  /* 6805.vhd:336:76  */
  assign n153_o = n150_o | n152_o;
  /* 6805.vhd:336:84  */
  assign n155_o = datain == 8'b00000001;
  /* 6805.vhd:336:84  */
  assign n156_o = n153_o | n155_o;
  /* 6805.vhd:337:28  */
  assign n158_o = datain == 8'b00000011;
  /* 6805.vhd:337:28  */
  assign n159_o = n156_o | n158_o;
  /* 6805.vhd:337:36  */
  assign n161_o = datain == 8'b00000101;
  /* 6805.vhd:337:36  */
  assign n162_o = n159_o | n161_o;
  /* 6805.vhd:337:44  */
  assign n164_o = datain == 8'b00000111;
  /* 6805.vhd:337:44  */
  assign n165_o = n162_o | n164_o;
  /* 6805.vhd:337:52  */
  assign n167_o = datain == 8'b00001001;
  /* 6805.vhd:337:52  */
  assign n168_o = n165_o | n167_o;
  /* 6805.vhd:337:60  */
  assign n170_o = datain == 8'b00001011;
  /* 6805.vhd:337:60  */
  assign n171_o = n168_o | n170_o;
  /* 6805.vhd:337:68  */
  assign n173_o = datain == 8'b00001101;
  /* 6805.vhd:337:68  */
  assign n174_o = n171_o | n173_o;
  /* 6805.vhd:337:76  */
  assign n176_o = datain == 8'b00001111;
  /* 6805.vhd:337:76  */
  assign n177_o = n174_o | n176_o;
  /* 6805.vhd:337:84  */
  assign n179_o = datain == 8'b00010000;
  /* 6805.vhd:337:84  */
  assign n180_o = n177_o | n179_o;
  /* 6805.vhd:338:28  */
  assign n182_o = datain == 8'b00010010;
  /* 6805.vhd:338:28  */
  assign n183_o = n180_o | n182_o;
  /* 6805.vhd:338:36  */
  assign n185_o = datain == 8'b00010100;
  /* 6805.vhd:338:36  */
  assign n186_o = n183_o | n185_o;
  /* 6805.vhd:338:44  */
  assign n188_o = datain == 8'b00010110;
  /* 6805.vhd:338:44  */
  assign n189_o = n186_o | n188_o;
  /* 6805.vhd:338:52  */
  assign n191_o = datain == 8'b00011000;
  /* 6805.vhd:338:52  */
  assign n192_o = n189_o | n191_o;
  /* 6805.vhd:338:60  */
  assign n194_o = datain == 8'b00011010;
  /* 6805.vhd:338:60  */
  assign n195_o = n192_o | n194_o;
  /* 6805.vhd:338:68  */
  assign n197_o = datain == 8'b00011100;
  /* 6805.vhd:338:68  */
  assign n198_o = n195_o | n197_o;
  /* 6805.vhd:338:76  */
  assign n200_o = datain == 8'b00011110;
  /* 6805.vhd:338:76  */
  assign n201_o = n198_o | n200_o;
  /* 6805.vhd:338:84  */
  assign n203_o = datain == 8'b00010001;
  /* 6805.vhd:338:84  */
  assign n204_o = n201_o | n203_o;
  /* 6805.vhd:339:28  */
  assign n206_o = datain == 8'b00010011;
  /* 6805.vhd:339:28  */
  assign n207_o = n204_o | n206_o;
  /* 6805.vhd:339:36  */
  assign n209_o = datain == 8'b00010101;
  /* 6805.vhd:339:36  */
  assign n210_o = n207_o | n209_o;
  /* 6805.vhd:339:44  */
  assign n212_o = datain == 8'b00010111;
  /* 6805.vhd:339:44  */
  assign n213_o = n210_o | n212_o;
  /* 6805.vhd:339:52  */
  assign n215_o = datain == 8'b00011001;
  /* 6805.vhd:339:52  */
  assign n216_o = n213_o | n215_o;
  /* 6805.vhd:339:60  */
  assign n218_o = datain == 8'b00011011;
  /* 6805.vhd:339:60  */
  assign n219_o = n216_o | n218_o;
  /* 6805.vhd:339:68  */
  assign n221_o = datain == 8'b00011101;
  /* 6805.vhd:339:68  */
  assign n222_o = n219_o | n221_o;
  /* 6805.vhd:339:76  */
  assign n224_o = datain == 8'b00011111;
  /* 6805.vhd:339:76  */
  assign n225_o = n222_o | n224_o;
  /* 6805.vhd:339:84  */
  assign n227_o = datain == 8'b00110000;
  /* 6805.vhd:339:84  */
  assign n228_o = n225_o | n227_o;
  /* 6805.vhd:340:28  */
  assign n230_o = datain == 8'b00110011;
  /* 6805.vhd:340:28  */
  assign n231_o = n228_o | n230_o;
  /* 6805.vhd:340:36  */
  assign n233_o = datain == 8'b00110100;
  /* 6805.vhd:340:36  */
  assign n234_o = n231_o | n233_o;
  /* 6805.vhd:340:44  */
  assign n236_o = datain == 8'b00110110;
  /* 6805.vhd:340:44  */
  assign n237_o = n234_o | n236_o;
  /* 6805.vhd:341:28  */
  assign n239_o = datain == 8'b00110111;
  /* 6805.vhd:341:28  */
  assign n240_o = n237_o | n239_o;
  /* 6805.vhd:341:36  */
  assign n242_o = datain == 8'b00111000;
  /* 6805.vhd:341:36  */
  assign n243_o = n240_o | n242_o;
  /* 6805.vhd:341:44  */
  assign n245_o = datain == 8'b00111001;
  /* 6805.vhd:341:44  */
  assign n246_o = n243_o | n245_o;
  /* 6805.vhd:342:28  */
  assign n248_o = datain == 8'b00111010;
  /* 6805.vhd:342:28  */
  assign n249_o = n246_o | n248_o;
  /* 6805.vhd:342:36  */
  assign n251_o = datain == 8'b00111100;
  /* 6805.vhd:342:36  */
  assign n252_o = n249_o | n251_o;
  /* 6805.vhd:342:44  */
  assign n254_o = datain == 8'b00111101;
  /* 6805.vhd:342:44  */
  assign n255_o = n252_o | n254_o;
  /* 6805.vhd:343:28  */
  assign n257_o = datain == 8'b00111111;
  /* 6805.vhd:343:28  */
  assign n258_o = n255_o | n257_o;
  /* 6805.vhd:343:36  */
  assign n260_o = datain == 8'b10110000;
  /* 6805.vhd:343:36  */
  assign n261_o = n258_o | n260_o;
  /* 6805.vhd:344:28  */
  assign n263_o = datain == 8'b10110001;
  /* 6805.vhd:344:28  */
  assign n264_o = n261_o | n263_o;
  /* 6805.vhd:344:36  */
  assign n266_o = datain == 8'b10110010;
  /* 6805.vhd:344:36  */
  assign n267_o = n264_o | n266_o;
  /* 6805.vhd:344:44  */
  assign n269_o = datain == 8'b10110011;
  /* 6805.vhd:344:44  */
  assign n270_o = n267_o | n269_o;
  /* 6805.vhd:344:52  */
  assign n272_o = datain == 8'b10110100;
  /* 6805.vhd:344:52  */
  assign n273_o = n270_o | n272_o;
  /* 6805.vhd:345:28  */
  assign n275_o = datain == 8'b10110101;
  /* 6805.vhd:345:28  */
  assign n276_o = n273_o | n275_o;
  /* 6805.vhd:345:36  */
  assign n278_o = datain == 8'b10110110;
  /* 6805.vhd:345:36  */
  assign n279_o = n276_o | n278_o;
  /* 6805.vhd:345:44  */
  assign n281_o = datain == 8'b10110111;
  /* 6805.vhd:345:44  */
  assign n282_o = n279_o | n281_o;
  /* 6805.vhd:345:52  */
  assign n284_o = datain == 8'b10111000;
  /* 6805.vhd:345:52  */
  assign n285_o = n282_o | n284_o;
  /* 6805.vhd:346:28  */
  assign n287_o = datain == 8'b10111001;
  /* 6805.vhd:346:28  */
  assign n288_o = n285_o | n287_o;
  /* 6805.vhd:346:36  */
  assign n290_o = datain == 8'b10111010;
  /* 6805.vhd:346:36  */
  assign n291_o = n288_o | n290_o;
  /* 6805.vhd:346:44  */
  assign n293_o = datain == 8'b10111011;
  /* 6805.vhd:346:44  */
  assign n294_o = n291_o | n293_o;
  /* 6805.vhd:346:52  */
  assign n296_o = datain == 8'b10111100;
  /* 6805.vhd:346:52  */
  assign n297_o = n294_o | n296_o;
  /* 6805.vhd:347:28  */
  assign n299_o = datain == 8'b10111110;
  /* 6805.vhd:347:28  */
  assign n300_o = n297_o | n299_o;
  /* 6805.vhd:347:36  */
  assign n302_o = datain == 8'b10111111;
  /* 6805.vhd:347:36  */
  assign n303_o = n300_o | n302_o;
  /* 6805.vhd:361:34  */
  assign n305_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:351:17  */
  assign n307_o = datain == 8'b00100000;
  /* 6805.vhd:351:28  */
  assign n309_o = datain == 8'b00100001;
  /* 6805.vhd:351:28  */
  assign n310_o = n307_o | n309_o;
  /* 6805.vhd:351:36  */
  assign n312_o = datain == 8'b00100010;
  /* 6805.vhd:351:36  */
  assign n313_o = n310_o | n312_o;
  /* 6805.vhd:351:44  */
  assign n315_o = datain == 8'b00100011;
  /* 6805.vhd:351:44  */
  assign n316_o = n313_o | n315_o;
  /* 6805.vhd:351:52  */
  assign n318_o = datain == 8'b00100100;
  /* 6805.vhd:351:52  */
  assign n319_o = n316_o | n318_o;
  /* 6805.vhd:351:60  */
  assign n321_o = datain == 8'b00100101;
  /* 6805.vhd:351:60  */
  assign n322_o = n319_o | n321_o;
  /* 6805.vhd:351:68  */
  assign n324_o = datain == 8'b00100110;
  /* 6805.vhd:351:68  */
  assign n325_o = n322_o | n324_o;
  /* 6805.vhd:351:76  */
  assign n327_o = datain == 8'b00100111;
  /* 6805.vhd:351:76  */
  assign n328_o = n325_o | n327_o;
  /* 6805.vhd:351:84  */
  assign n330_o = datain == 8'b00101000;
  /* 6805.vhd:351:84  */
  assign n331_o = n328_o | n330_o;
  /* 6805.vhd:352:28  */
  assign n333_o = datain == 8'b00101001;
  /* 6805.vhd:352:28  */
  assign n334_o = n331_o | n333_o;
  /* 6805.vhd:352:36  */
  assign n336_o = datain == 8'b00101010;
  /* 6805.vhd:352:36  */
  assign n337_o = n334_o | n336_o;
  /* 6805.vhd:352:44  */
  assign n339_o = datain == 8'b00101011;
  /* 6805.vhd:352:44  */
  assign n340_o = n337_o | n339_o;
  /* 6805.vhd:352:52  */
  assign n342_o = datain == 8'b00101100;
  /* 6805.vhd:352:52  */
  assign n343_o = n340_o | n342_o;
  /* 6805.vhd:352:60  */
  assign n345_o = datain == 8'b00101101;
  /* 6805.vhd:352:60  */
  assign n346_o = n343_o | n345_o;
  /* 6805.vhd:352:68  */
  assign n348_o = datain == 8'b00101110;
  /* 6805.vhd:352:68  */
  assign n349_o = n346_o | n348_o;
  /* 6805.vhd:352:76  */
  assign n351_o = datain == 8'b00101111;
  /* 6805.vhd:352:76  */
  assign n352_o = n349_o | n351_o;
  /* 6805.vhd:352:84  */
  assign n354_o = datain == 8'b11000000;
  /* 6805.vhd:352:84  */
  assign n355_o = n352_o | n354_o;
  /* 6805.vhd:353:28  */
  assign n357_o = datain == 8'b11000001;
  /* 6805.vhd:353:28  */
  assign n358_o = n355_o | n357_o;
  /* 6805.vhd:353:36  */
  assign n360_o = datain == 8'b11000010;
  /* 6805.vhd:353:36  */
  assign n361_o = n358_o | n360_o;
  /* 6805.vhd:353:44  */
  assign n363_o = datain == 8'b11000011;
  /* 6805.vhd:353:44  */
  assign n364_o = n361_o | n363_o;
  /* 6805.vhd:353:52  */
  assign n366_o = datain == 8'b11000100;
  /* 6805.vhd:353:52  */
  assign n367_o = n364_o | n366_o;
  /* 6805.vhd:354:28  */
  assign n369_o = datain == 8'b11000101;
  /* 6805.vhd:354:28  */
  assign n370_o = n367_o | n369_o;
  /* 6805.vhd:354:36  */
  assign n372_o = datain == 8'b11000110;
  /* 6805.vhd:354:36  */
  assign n373_o = n370_o | n372_o;
  /* 6805.vhd:354:44  */
  assign n375_o = datain == 8'b11000111;
  /* 6805.vhd:354:44  */
  assign n376_o = n373_o | n375_o;
  /* 6805.vhd:354:52  */
  assign n378_o = datain == 8'b11001000;
  /* 6805.vhd:354:52  */
  assign n379_o = n376_o | n378_o;
  /* 6805.vhd:355:28  */
  assign n381_o = datain == 8'b11001001;
  /* 6805.vhd:355:28  */
  assign n382_o = n379_o | n381_o;
  /* 6805.vhd:355:36  */
  assign n384_o = datain == 8'b11001010;
  /* 6805.vhd:355:36  */
  assign n385_o = n382_o | n384_o;
  /* 6805.vhd:355:44  */
  assign n387_o = datain == 8'b11001011;
  /* 6805.vhd:355:44  */
  assign n388_o = n385_o | n387_o;
  /* 6805.vhd:355:52  */
  assign n390_o = datain == 8'b11001100;
  /* 6805.vhd:355:52  */
  assign n391_o = n388_o | n390_o;
  /* 6805.vhd:356:28  */
  assign n393_o = datain == 8'b11001110;
  /* 6805.vhd:356:28  */
  assign n394_o = n391_o | n393_o;
  /* 6805.vhd:356:36  */
  assign n396_o = datain == 8'b11001111;
  /* 6805.vhd:356:36  */
  assign n397_o = n394_o | n396_o;
  /* 6805.vhd:356:44  */
  assign n399_o = datain == 8'b11010000;
  /* 6805.vhd:356:44  */
  assign n400_o = n397_o | n399_o;
  /* 6805.vhd:357:28  */
  assign n402_o = datain == 8'b11010001;
  /* 6805.vhd:357:28  */
  assign n403_o = n400_o | n402_o;
  /* 6805.vhd:357:36  */
  assign n405_o = datain == 8'b11010010;
  /* 6805.vhd:357:36  */
  assign n406_o = n403_o | n405_o;
  /* 6805.vhd:357:44  */
  assign n408_o = datain == 8'b11010011;
  /* 6805.vhd:357:44  */
  assign n409_o = n406_o | n408_o;
  /* 6805.vhd:357:52  */
  assign n411_o = datain == 8'b11010100;
  /* 6805.vhd:357:52  */
  assign n412_o = n409_o | n411_o;
  /* 6805.vhd:358:28  */
  assign n414_o = datain == 8'b11010101;
  /* 6805.vhd:358:28  */
  assign n415_o = n412_o | n414_o;
  /* 6805.vhd:358:36  */
  assign n417_o = datain == 8'b11010110;
  /* 6805.vhd:358:36  */
  assign n418_o = n415_o | n417_o;
  /* 6805.vhd:358:44  */
  assign n420_o = datain == 8'b11010111;
  /* 6805.vhd:358:44  */
  assign n421_o = n418_o | n420_o;
  /* 6805.vhd:358:52  */
  assign n423_o = datain == 8'b11011000;
  /* 6805.vhd:358:52  */
  assign n424_o = n421_o | n423_o;
  /* 6805.vhd:359:28  */
  assign n426_o = datain == 8'b11011001;
  /* 6805.vhd:359:28  */
  assign n427_o = n424_o | n426_o;
  /* 6805.vhd:359:36  */
  assign n429_o = datain == 8'b11011010;
  /* 6805.vhd:359:36  */
  assign n430_o = n427_o | n429_o;
  /* 6805.vhd:359:44  */
  assign n432_o = datain == 8'b11011011;
  /* 6805.vhd:359:44  */
  assign n433_o = n430_o | n432_o;
  /* 6805.vhd:359:52  */
  assign n435_o = datain == 8'b11011100;
  /* 6805.vhd:359:52  */
  assign n436_o = n433_o | n435_o;
  /* 6805.vhd:360:28  */
  assign n438_o = datain == 8'b11011110;
  /* 6805.vhd:360:28  */
  assign n439_o = n436_o | n438_o;
  /* 6805.vhd:360:36  */
  assign n441_o = datain == 8'b11011111;
  /* 6805.vhd:360:36  */
  assign n442_o = n439_o | n441_o;
  /* 6805.vhd:366:36  */
  assign n444_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:363:17  */
  assign n446_o = datain == 8'b01110000;
  /* 6805.vhd:363:28  */
  assign n448_o = datain == 8'b01110011;
  /* 6805.vhd:363:28  */
  assign n449_o = n446_o | n448_o;
  /* 6805.vhd:363:36  */
  assign n451_o = datain == 8'b01110100;
  /* 6805.vhd:363:36  */
  assign n452_o = n449_o | n451_o;
  /* 6805.vhd:363:44  */
  assign n454_o = datain == 8'b01110110;
  /* 6805.vhd:363:44  */
  assign n455_o = n452_o | n454_o;
  /* 6805.vhd:363:52  */
  assign n457_o = datain == 8'b01110111;
  /* 6805.vhd:363:52  */
  assign n458_o = n455_o | n457_o;
  /* 6805.vhd:363:60  */
  assign n460_o = datain == 8'b01111000;
  /* 6805.vhd:363:60  */
  assign n461_o = n458_o | n460_o;
  /* 6805.vhd:364:28  */
  assign n463_o = datain == 8'b01111001;
  /* 6805.vhd:364:28  */
  assign n464_o = n461_o | n463_o;
  /* 6805.vhd:364:36  */
  assign n466_o = datain == 8'b01111010;
  /* 6805.vhd:364:36  */
  assign n467_o = n464_o | n466_o;
  /* 6805.vhd:364:44  */
  assign n469_o = datain == 8'b01111100;
  /* 6805.vhd:364:44  */
  assign n470_o = n467_o | n469_o;
  /* 6805.vhd:364:52  */
  assign n472_o = datain == 8'b01111101;
  /* 6805.vhd:364:52  */
  assign n473_o = n470_o | n472_o;
  /* 6805.vhd:372:34  */
  assign n475_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:368:17  */
  assign n477_o = datain == 8'b10100000;
  /* 6805.vhd:368:28  */
  assign n479_o = datain == 8'b10100001;
  /* 6805.vhd:368:28  */
  assign n480_o = n477_o | n479_o;
  /* 6805.vhd:368:36  */
  assign n482_o = datain == 8'b10100010;
  /* 6805.vhd:368:36  */
  assign n483_o = n480_o | n482_o;
  /* 6805.vhd:368:44  */
  assign n485_o = datain == 8'b10100011;
  /* 6805.vhd:368:44  */
  assign n486_o = n483_o | n485_o;
  /* 6805.vhd:368:52  */
  assign n488_o = datain == 8'b10100100;
  /* 6805.vhd:368:52  */
  assign n489_o = n486_o | n488_o;
  /* 6805.vhd:369:28  */
  assign n491_o = datain == 8'b10100101;
  /* 6805.vhd:369:28  */
  assign n492_o = n489_o | n491_o;
  /* 6805.vhd:369:36  */
  assign n494_o = datain == 8'b10100110;
  /* 6805.vhd:369:36  */
  assign n495_o = n492_o | n494_o;
  /* 6805.vhd:369:44  */
  assign n497_o = datain == 8'b10101000;
  /* 6805.vhd:369:44  */
  assign n498_o = n495_o | n497_o;
  /* 6805.vhd:370:28  */
  assign n500_o = datain == 8'b10101001;
  /* 6805.vhd:370:28  */
  assign n501_o = n498_o | n500_o;
  /* 6805.vhd:370:36  */
  assign n503_o = datain == 8'b10101010;
  /* 6805.vhd:370:36  */
  assign n504_o = n501_o | n503_o;
  /* 6805.vhd:370:44  */
  assign n506_o = datain == 8'b10101011;
  /* 6805.vhd:370:44  */
  assign n507_o = n504_o | n506_o;
  /* 6805.vhd:370:52  */
  assign n509_o = datain == 8'b10101110;
  /* 6805.vhd:370:52  */
  assign n510_o = n507_o | n509_o;
  /* 6805.vhd:378:34  */
  assign n512_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:374:17  */
  assign n514_o = datain == 8'b11100000;
  /* 6805.vhd:374:28  */
  assign n516_o = datain == 8'b11100001;
  /* 6805.vhd:374:28  */
  assign n517_o = n514_o | n516_o;
  /* 6805.vhd:374:36  */
  assign n519_o = datain == 8'b11100010;
  /* 6805.vhd:374:36  */
  assign n520_o = n517_o | n519_o;
  /* 6805.vhd:374:44  */
  assign n522_o = datain == 8'b11100011;
  /* 6805.vhd:374:44  */
  assign n523_o = n520_o | n522_o;
  /* 6805.vhd:374:52  */
  assign n525_o = datain == 8'b11100100;
  /* 6805.vhd:374:52  */
  assign n526_o = n523_o | n525_o;
  /* 6805.vhd:375:28  */
  assign n528_o = datain == 8'b11100101;
  /* 6805.vhd:375:28  */
  assign n529_o = n526_o | n528_o;
  /* 6805.vhd:375:36  */
  assign n531_o = datain == 8'b11100110;
  /* 6805.vhd:375:36  */
  assign n532_o = n529_o | n531_o;
  /* 6805.vhd:375:44  */
  assign n534_o = datain == 8'b11100111;
  /* 6805.vhd:375:44  */
  assign n535_o = n532_o | n534_o;
  /* 6805.vhd:375:52  */
  assign n537_o = datain == 8'b11101000;
  /* 6805.vhd:375:52  */
  assign n538_o = n535_o | n537_o;
  /* 6805.vhd:376:28  */
  assign n540_o = datain == 8'b11101001;
  /* 6805.vhd:376:28  */
  assign n541_o = n538_o | n540_o;
  /* 6805.vhd:376:36  */
  assign n543_o = datain == 8'b11101010;
  /* 6805.vhd:376:36  */
  assign n544_o = n541_o | n543_o;
  /* 6805.vhd:376:44  */
  assign n546_o = datain == 8'b11101011;
  /* 6805.vhd:376:44  */
  assign n547_o = n544_o | n546_o;
  /* 6805.vhd:376:52  */
  assign n549_o = datain == 8'b11101100;
  /* 6805.vhd:376:52  */
  assign n550_o = n547_o | n549_o;
  /* 6805.vhd:377:28  */
  assign n552_o = datain == 8'b11101110;
  /* 6805.vhd:377:28  */
  assign n553_o = n550_o | n552_o;
  /* 6805.vhd:377:36  */
  assign n555_o = datain == 8'b11101111;
  /* 6805.vhd:377:36  */
  assign n556_o = n553_o | n555_o;
  /* 6805.vhd:385:36  */
  assign n558_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:380:17  */
  assign n560_o = datain == 8'b11110000;
  /* 6805.vhd:380:28  */
  assign n562_o = datain == 8'b11110001;
  /* 6805.vhd:380:28  */
  assign n563_o = n560_o | n562_o;
  /* 6805.vhd:380:36  */
  assign n565_o = datain == 8'b11110010;
  /* 6805.vhd:380:36  */
  assign n566_o = n563_o | n565_o;
  /* 6805.vhd:380:44  */
  assign n568_o = datain == 8'b11110011;
  /* 6805.vhd:380:44  */
  assign n569_o = n566_o | n568_o;
  /* 6805.vhd:380:52  */
  assign n571_o = datain == 8'b11110100;
  /* 6805.vhd:380:52  */
  assign n572_o = n569_o | n571_o;
  /* 6805.vhd:381:28  */
  assign n574_o = datain == 8'b11110101;
  /* 6805.vhd:381:28  */
  assign n575_o = n572_o | n574_o;
  /* 6805.vhd:381:36  */
  assign n577_o = datain == 8'b11110110;
  /* 6805.vhd:381:36  */
  assign n578_o = n575_o | n577_o;
  /* 6805.vhd:381:44  */
  assign n580_o = datain == 8'b11111000;
  /* 6805.vhd:381:44  */
  assign n581_o = n578_o | n580_o;
  /* 6805.vhd:382:28  */
  assign n583_o = datain == 8'b11111001;
  /* 6805.vhd:382:28  */
  assign n584_o = n581_o | n583_o;
  /* 6805.vhd:382:36  */
  assign n586_o = datain == 8'b11111010;
  /* 6805.vhd:382:36  */
  assign n587_o = n584_o | n586_o;
  /* 6805.vhd:382:44  */
  assign n589_o = datain == 8'b11111011;
  /* 6805.vhd:382:44  */
  assign n590_o = n587_o | n589_o;
  /* 6805.vhd:382:52  */
  assign n592_o = datain == 8'b11111110;
  /* 6805.vhd:382:52  */
  assign n593_o = n590_o | n592_o;
  /* 6805.vhd:388:34  */
  assign n595_o = {8'b00000000, regx};
  /* 6805.vhd:387:17  */
  assign n597_o = datain == 8'b11111100;
  /* 6805.vhd:392:32  */
  assign n598_o = rega[7];
  /* 6805.vhd:393:27  */
  assign n600_o = rega == 8'b00000000;
  /* 6805.vhd:393:19  */
  assign n603_o = n600_o ? 1'b1 : 1'b0;
  /* 6805.vhd:400:34  */
  assign n605_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:390:17  */
  assign n607_o = datain == 8'b11110111;
  /* 6805.vhd:404:32  */
  assign n608_o = regx[7];
  /* 6805.vhd:405:27  */
  assign n610_o = regx == 8'b00000000;
  /* 6805.vhd:405:19  */
  assign n613_o = n610_o ? 1'b1 : 1'b0;
  /* 6805.vhd:412:34  */
  assign n615_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:402:17  */
  assign n617_o = datain == 8'b11111111;
  /* 6805.vhd:415:36  */
  assign n619_o = 8'b00000000 - rega;
  /* 6805.vhd:416:36  */
  assign n621_o = 8'b00000000 - rega;
  /* 6805.vhd:417:34  */
  assign n622_o = n621_o[7];
  /* 6805.vhd:418:27  */
  assign n624_o = n621_o == 8'b00000000;
  /* 6805.vhd:418:19  */
  assign n627_o = n624_o ? 1'b1 : 1'b0;
  /* 6805.vhd:418:19  */
  assign n630_o = n624_o ? 1'b0 : 1'b1;
  /* 6805.vhd:425:34  */
  assign n632_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:414:17  */
  assign n634_o = datain == 8'b01000000;
  /* 6805.vhd:430:32  */
  assign n635_o = prod[7:0];
  /* 6805.vhd:431:32  */
  assign n636_o = prod[15:8];
  /* 6805.vhd:432:34  */
  assign n638_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:427:17  */
  assign n640_o = datain == 8'b01000010;
  /* 6805.vhd:435:35  */
  assign n642_o = rega ^ 8'b11111111;
  /* 6805.vhd:436:35  */
  assign n644_o = rega ^ 8'b11111111;
  /* 6805.vhd:438:34  */
  assign n645_o = n644_o[7];
  /* 6805.vhd:439:27  */
  assign n647_o = n644_o == 8'b00000000;
  /* 6805.vhd:439:19  */
  assign n650_o = n647_o ? 1'b1 : 1'b0;
  /* 6805.vhd:444:34  */
  assign n652_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:434:17  */
  assign n654_o = datain == 8'b01000011;
  /* 6805.vhd:447:40  */
  assign n655_o = rega[7:1];
  /* 6805.vhd:447:34  */
  assign n657_o = {1'b0, n655_o};
  /* 6805.vhd:448:40  */
  assign n658_o = rega[7:1];
  /* 6805.vhd:448:34  */
  assign n660_o = {1'b0, n658_o};
  /* 6805.vhd:450:34  */
  assign n661_o = rega[0];
  /* 6805.vhd:451:27  */
  assign n663_o = n660_o == 8'b00000000;
  /* 6805.vhd:451:19  */
  assign n666_o = n663_o ? 1'b1 : 1'b0;
  /* 6805.vhd:456:34  */
  assign n668_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:446:17  */
  assign n670_o = datain == 8'b01000100;
  /* 6805.vhd:459:42  */
  assign n671_o = rega[7:1];
  /* 6805.vhd:459:36  */
  assign n672_o = {flagc, n671_o};
  /* 6805.vhd:460:42  */
  assign n673_o = rega[7:1];
  /* 6805.vhd:460:36  */
  assign n674_o = {flagc, n673_o};
  /* 6805.vhd:462:34  */
  assign n675_o = rega[0];
  /* 6805.vhd:463:27  */
  assign n677_o = n674_o == 8'b00000000;
  /* 6805.vhd:463:19  */
  assign n680_o = n677_o ? 1'b1 : 1'b0;
  /* 6805.vhd:468:34  */
  assign n682_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:458:17  */
  assign n684_o = datain == 8'b01000110;
  /* 6805.vhd:471:34  */
  assign n685_o = rega[7];
  /* 6805.vhd:471:44  */
  assign n686_o = rega[7:1];
  /* 6805.vhd:471:38  */
  assign n687_o = {n685_o, n686_o};
  /* 6805.vhd:472:34  */
  assign n688_o = rega[7];
  /* 6805.vhd:472:44  */
  assign n689_o = rega[7:1];
  /* 6805.vhd:472:38  */
  assign n690_o = {n688_o, n689_o};
  /* 6805.vhd:473:34  */
  assign n691_o = rega[7];
  /* 6805.vhd:474:34  */
  assign n692_o = rega[0];
  /* 6805.vhd:475:27  */
  assign n694_o = n690_o == 8'b00000000;
  /* 6805.vhd:475:19  */
  assign n697_o = n694_o ? 1'b1 : 1'b0;
  /* 6805.vhd:480:34  */
  assign n699_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:470:17  */
  assign n701_o = datain == 8'b01000111;
  /* 6805.vhd:483:34  */
  assign n702_o = rega[6:0];
  /* 6805.vhd:483:47  */
  assign n704_o = {n702_o, 1'b0};
  /* 6805.vhd:484:34  */
  assign n705_o = rega[6:0];
  /* 6805.vhd:484:47  */
  assign n707_o = {n705_o, 1'b0};
  /* 6805.vhd:485:34  */
  assign n708_o = rega[6];
  /* 6805.vhd:486:34  */
  assign n709_o = rega[7];
  /* 6805.vhd:487:27  */
  assign n711_o = n707_o == 8'b00000000;
  /* 6805.vhd:487:19  */
  assign n714_o = n711_o ? 1'b1 : 1'b0;
  /* 6805.vhd:492:34  */
  assign n716_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:482:17  */
  assign n718_o = datain == 8'b01001000;
  /* 6805.vhd:495:34  */
  assign n719_o = rega[6:0];
  /* 6805.vhd:495:47  */
  assign n720_o = {n719_o, flagc};
  /* 6805.vhd:496:34  */
  assign n721_o = rega[6:0];
  /* 6805.vhd:496:47  */
  assign n722_o = {n721_o, flagc};
  /* 6805.vhd:497:34  */
  assign n723_o = rega[6];
  /* 6805.vhd:498:34  */
  assign n724_o = rega[7];
  /* 6805.vhd:499:27  */
  assign n726_o = n722_o == 8'b00000000;
  /* 6805.vhd:499:19  */
  assign n729_o = n726_o ? 1'b1 : 1'b0;
  /* 6805.vhd:504:34  */
  assign n731_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:494:17  */
  assign n733_o = datain == 8'b01001001;
  /* 6805.vhd:507:35  */
  assign n735_o = rega - 8'b00000001;
  /* 6805.vhd:508:35  */
  assign n737_o = rega - 8'b00000001;
  /* 6805.vhd:509:34  */
  assign n738_o = n737_o[7];
  /* 6805.vhd:510:27  */
  assign n740_o = n737_o == 8'b00000000;
  /* 6805.vhd:510:19  */
  assign n743_o = n740_o ? 1'b1 : 1'b0;
  /* 6805.vhd:515:34  */
  assign n745_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:506:17  */
  assign n747_o = datain == 8'b01001010;
  /* 6805.vhd:518:35  */
  assign n749_o = rega + 8'b00000001;
  /* 6805.vhd:519:35  */
  assign n751_o = rega + 8'b00000001;
  /* 6805.vhd:520:34  */
  assign n752_o = n751_o[7];
  /* 6805.vhd:521:27  */
  assign n754_o = n751_o == 8'b00000000;
  /* 6805.vhd:521:19  */
  assign n757_o = n754_o ? 1'b1 : 1'b0;
  /* 6805.vhd:526:34  */
  assign n759_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:517:17  */
  assign n761_o = datain == 8'b01001100;
  /* 6805.vhd:529:34  */
  assign n762_o = rega[7];
  /* 6805.vhd:530:27  */
  assign n764_o = rega == 8'b00000000;
  /* 6805.vhd:530:19  */
  assign n767_o = n764_o ? 1'b1 : 1'b0;
  /* 6805.vhd:535:34  */
  assign n769_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:528:17  */
  assign n771_o = datain == 8'b01001101;
  /* 6805.vhd:541:34  */
  assign n773_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:537:17  */
  assign n775_o = datain == 8'b01001111;
  /* 6805.vhd:544:33  */
  assign n777_o = 8'b00000000 - regx;
  /* 6805.vhd:545:33  */
  assign n779_o = 8'b00000000 - regx;
  /* 6805.vhd:546:34  */
  assign n780_o = n779_o[7];
  /* 6805.vhd:547:27  */
  assign n782_o = n779_o == 8'b00000000;
  /* 6805.vhd:547:19  */
  assign n785_o = n782_o ? 1'b1 : 1'b0;
  /* 6805.vhd:547:19  */
  assign n788_o = n782_o ? 1'b0 : 1'b1;
  /* 6805.vhd:554:34  */
  assign n790_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:543:17  */
  assign n792_o = datain == 8'b01010000;
  /* 6805.vhd:557:32  */
  assign n794_o = regx ^ 8'b11111111;
  /* 6805.vhd:558:32  */
  assign n796_o = regx ^ 8'b11111111;
  /* 6805.vhd:560:34  */
  assign n797_o = n796_o[7];
  /* 6805.vhd:561:27  */
  assign n799_o = n796_o == 8'b00000000;
  /* 6805.vhd:561:19  */
  assign n802_o = n799_o ? 1'b1 : 1'b0;
  /* 6805.vhd:566:34  */
  assign n804_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:556:17  */
  assign n806_o = datain == 8'b01010011;
  /* 6805.vhd:569:37  */
  assign n807_o = regx[7:1];
  /* 6805.vhd:569:31  */
  assign n809_o = {1'b0, n807_o};
  /* 6805.vhd:570:37  */
  assign n810_o = regx[7:1];
  /* 6805.vhd:570:31  */
  assign n812_o = {1'b0, n810_o};
  /* 6805.vhd:572:34  */
  assign n813_o = regx[0];
  /* 6805.vhd:573:27  */
  assign n815_o = n812_o == 8'b00000000;
  /* 6805.vhd:573:19  */
  assign n818_o = n815_o ? 1'b1 : 1'b0;
  /* 6805.vhd:578:34  */
  assign n820_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:568:17  */
  assign n822_o = datain == 8'b01010100;
  /* 6805.vhd:581:39  */
  assign n823_o = regx[7:1];
  /* 6805.vhd:581:33  */
  assign n824_o = {flagc, n823_o};
  /* 6805.vhd:582:39  */
  assign n825_o = regx[7:1];
  /* 6805.vhd:582:33  */
  assign n826_o = {flagc, n825_o};
  /* 6805.vhd:584:34  */
  assign n827_o = regx[0];
  /* 6805.vhd:585:27  */
  assign n829_o = n826_o == 8'b00000000;
  /* 6805.vhd:585:19  */
  assign n832_o = n829_o ? 1'b1 : 1'b0;
  /* 6805.vhd:590:34  */
  assign n834_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:580:17  */
  assign n836_o = datain == 8'b01010110;
  /* 6805.vhd:593:31  */
  assign n837_o = regx[7];
  /* 6805.vhd:593:41  */
  assign n838_o = regx[7:1];
  /* 6805.vhd:593:35  */
  assign n839_o = {n837_o, n838_o};
  /* 6805.vhd:594:31  */
  assign n840_o = regx[7];
  /* 6805.vhd:594:41  */
  assign n841_o = regx[7:1];
  /* 6805.vhd:594:35  */
  assign n842_o = {n840_o, n841_o};
  /* 6805.vhd:595:34  */
  assign n843_o = regx[7];
  /* 6805.vhd:596:34  */
  assign n844_o = regx[0];
  /* 6805.vhd:597:27  */
  assign n846_o = n842_o == 8'b00000000;
  /* 6805.vhd:597:19  */
  assign n849_o = n846_o ? 1'b1 : 1'b0;
  /* 6805.vhd:602:34  */
  assign n851_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:592:17  */
  assign n853_o = datain == 8'b01010111;
  /* 6805.vhd:605:31  */
  assign n854_o = regx[6:0];
  /* 6805.vhd:605:44  */
  assign n856_o = {n854_o, 1'b0};
  /* 6805.vhd:606:31  */
  assign n857_o = regx[6:0];
  /* 6805.vhd:606:44  */
  assign n859_o = {n857_o, 1'b0};
  /* 6805.vhd:607:34  */
  assign n860_o = regx[6];
  /* 6805.vhd:608:34  */
  assign n861_o = regx[7];
  /* 6805.vhd:609:27  */
  assign n863_o = n859_o == 8'b00000000;
  /* 6805.vhd:609:19  */
  assign n866_o = n863_o ? 1'b1 : 1'b0;
  /* 6805.vhd:614:34  */
  assign n868_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:604:17  */
  assign n870_o = datain == 8'b01011000;
  /* 6805.vhd:617:31  */
  assign n871_o = regx[6:0];
  /* 6805.vhd:617:44  */
  assign n872_o = {n871_o, flagc};
  /* 6805.vhd:618:31  */
  assign n873_o = regx[6:0];
  /* 6805.vhd:618:44  */
  assign n874_o = {n873_o, flagc};
  /* 6805.vhd:619:34  */
  assign n875_o = regx[6];
  /* 6805.vhd:620:34  */
  assign n876_o = regx[7];
  /* 6805.vhd:621:27  */
  assign n878_o = n874_o == 8'b00000000;
  /* 6805.vhd:621:19  */
  assign n881_o = n878_o ? 1'b1 : 1'b0;
  /* 6805.vhd:626:34  */
  assign n883_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:616:17  */
  assign n885_o = datain == 8'b01011001;
  /* 6805.vhd:629:44  */
  assign n887_o = regx - 8'b00000001;
  /* 6805.vhd:630:44  */
  assign n889_o = regx - 8'b00000001;
  /* 6805.vhd:631:34  */
  assign n890_o = n889_o[7];
  /* 6805.vhd:632:27  */
  assign n892_o = n889_o == 8'b00000000;
  /* 6805.vhd:632:19  */
  assign n895_o = n892_o ? 1'b1 : 1'b0;
  /* 6805.vhd:637:34  */
  assign n897_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:628:17  */
  assign n899_o = datain == 8'b01011010;
  /* 6805.vhd:640:44  */
  assign n901_o = regx + 8'b00000001;
  /* 6805.vhd:641:44  */
  assign n903_o = regx + 8'b00000001;
  /* 6805.vhd:642:34  */
  assign n904_o = n903_o[7];
  /* 6805.vhd:643:27  */
  assign n906_o = n903_o == 8'b00000000;
  /* 6805.vhd:643:19  */
  assign n909_o = n906_o ? 1'b1 : 1'b0;
  /* 6805.vhd:648:34  */
  assign n911_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:639:17  */
  assign n913_o = datain == 8'b01011100;
  /* 6805.vhd:651:34  */
  assign n914_o = regx[7];
  /* 6805.vhd:652:27  */
  assign n916_o = regx == 8'b00000000;
  /* 6805.vhd:652:19  */
  assign n919_o = n916_o ? 1'b1 : 1'b0;
  /* 6805.vhd:657:34  */
  assign n921_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:650:17  */
  assign n923_o = datain == 8'b01011101;
  /* 6805.vhd:663:34  */
  assign n925_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:659:17  */
  assign n927_o = datain == 8'b01011111;
  /* 6805.vhd:668:33  */
  assign n929_o = {8'b00000000, regx};
  /* 6805.vhd:669:36  */
  assign n931_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:665:17  */
  assign n933_o = datain == 8'b01100000;
  /* 6805.vhd:665:28  */
  assign n935_o = datain == 8'b01100011;
  /* 6805.vhd:665:28  */
  assign n936_o = n933_o | n935_o;
  /* 6805.vhd:665:36  */
  assign n938_o = datain == 8'b01100100;
  /* 6805.vhd:665:36  */
  assign n939_o = n936_o | n938_o;
  /* 6805.vhd:665:44  */
  assign n941_o = datain == 8'b01100110;
  /* 6805.vhd:665:44  */
  assign n942_o = n939_o | n941_o;
  /* 6805.vhd:665:52  */
  assign n944_o = datain == 8'b01100111;
  /* 6805.vhd:665:52  */
  assign n945_o = n942_o | n944_o;
  /* 6805.vhd:666:28  */
  assign n947_o = datain == 8'b01101000;
  /* 6805.vhd:666:28  */
  assign n948_o = n945_o | n947_o;
  /* 6805.vhd:666:36  */
  assign n950_o = datain == 8'b01101001;
  /* 6805.vhd:666:36  */
  assign n951_o = n948_o | n950_o;
  /* 6805.vhd:666:44  */
  assign n953_o = datain == 8'b01101010;
  /* 6805.vhd:666:44  */
  assign n954_o = n951_o | n953_o;
  /* 6805.vhd:666:52  */
  assign n956_o = datain == 8'b01101100;
  /* 6805.vhd:666:52  */
  assign n957_o = n954_o | n956_o;
  /* 6805.vhd:667:28  */
  assign n959_o = datain == 8'b01101101;
  /* 6805.vhd:667:28  */
  assign n960_o = n957_o | n959_o;
  /* 6805.vhd:667:36  */
  assign n962_o = datain == 8'b01101111;
  /* 6805.vhd:667:36  */
  assign n963_o = n960_o | n962_o;
  /* 6805.vhd:678:34  */
  assign n965_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:671:17  */
  assign n967_o = datain == 8'b01111111;
  /* 6805.vhd:681:36  */
  assign n969_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:680:17  */
  assign n971_o = datain == 8'b10000000;
  /* 6805.vhd:680:28  */
  assign n973_o = datain == 8'b10000001;
  /* 6805.vhd:680:28  */
  assign n974_o = n971_o | n973_o;
  /* 6805.vhd:685:36  */
  assign n976_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:684:17  */
  assign n978_o = datain == 8'b10000011;
  /* 6805.vhd:689:36  */
  assign n980_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:688:17  */
  assign n982_o = datain == 8'b10001110;
  /* 6805.vhd:692:36  */
  assign n984_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:691:17  */
  assign n986_o = datain == 8'b10001111;
  /* 6805.vhd:696:36  */
  assign n988_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:694:17  */
  assign n990_o = datain == 8'b10010111;
  /* 6805.vhd:699:34  */
  assign n991_o = datain[0];
  /* 6805.vhd:700:36  */
  assign n993_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:698:17  */
  assign n995_o = datain == 8'b10011000;
  /* 6805.vhd:698:28  */
  assign n997_o = datain == 8'b10011001;
  /* 6805.vhd:698:28  */
  assign n998_o = n995_o | n997_o;
  /* 6805.vhd:703:34  */
  assign n999_o = datain[0];
  /* 6805.vhd:704:36  */
  assign n1001_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:702:17  */
  assign n1003_o = datain == 8'b10011010;
  /* 6805.vhd:702:28  */
  assign n1005_o = datain == 8'b10011011;
  /* 6805.vhd:702:28  */
  assign n1006_o = n1003_o | n1005_o;
  /* 6805.vhd:708:36  */
  assign n1008_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:706:17  */
  assign n1010_o = datain == 8'b10011100;
  /* 6805.vhd:718:36  */
  assign n1012_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:710:17  */
  assign n1014_o = datain == 8'b00110001;
  /* 6805.vhd:710:28  */
  assign n1016_o = datain == 8'b01000001;
  /* 6805.vhd:710:28  */
  assign n1017_o = n1014_o | n1016_o;
  /* 6805.vhd:710:36  */
  assign n1019_o = datain == 8'b00110101;
  /* 6805.vhd:710:36  */
  assign n1020_o = n1017_o | n1019_o;
  /* 6805.vhd:710:44  */
  assign n1022_o = datain == 8'b00111011;
  /* 6805.vhd:710:44  */
  assign n1023_o = n1020_o | n1022_o;
  /* 6805.vhd:710:52  */
  assign n1025_o = datain == 8'b01000101;
  /* 6805.vhd:710:52  */
  assign n1026_o = n1023_o | n1025_o;
  /* 6805.vhd:710:60  */
  assign n1028_o = datain == 8'b01001011;
  /* 6805.vhd:710:60  */
  assign n1029_o = n1026_o | n1028_o;
  /* 6805.vhd:711:28  */
  assign n1031_o = datain == 8'b01001110;
  /* 6805.vhd:711:28  */
  assign n1032_o = n1029_o | n1031_o;
  /* 6805.vhd:711:36  */
  assign n1034_o = datain == 8'b01010001;
  /* 6805.vhd:711:36  */
  assign n1035_o = n1032_o | n1034_o;
  /* 6805.vhd:711:44  */
  assign n1037_o = datain == 8'b01010010;
  /* 6805.vhd:711:44  */
  assign n1038_o = n1035_o | n1037_o;
  /* 6805.vhd:711:52  */
  assign n1040_o = datain == 8'b01010101;
  /* 6805.vhd:711:52  */
  assign n1041_o = n1038_o | n1040_o;
  /* 6805.vhd:711:60  */
  assign n1043_o = datain == 8'b01011011;
  /* 6805.vhd:711:60  */
  assign n1044_o = n1041_o | n1043_o;
  /* 6805.vhd:712:28  */
  assign n1046_o = datain == 8'b01011110;
  /* 6805.vhd:712:28  */
  assign n1047_o = n1044_o | n1046_o;
  /* 6805.vhd:712:36  */
  assign n1049_o = datain == 8'b01100001;
  /* 6805.vhd:712:36  */
  assign n1050_o = n1047_o | n1049_o;
  /* 6805.vhd:712:44  */
  assign n1052_o = datain == 8'b01100010;
  /* 6805.vhd:712:44  */
  assign n1053_o = n1050_o | n1052_o;
  /* 6805.vhd:712:52  */
  assign n1055_o = datain == 8'b01100101;
  /* 6805.vhd:712:52  */
  assign n1056_o = n1053_o | n1055_o;
  /* 6805.vhd:712:60  */
  assign n1058_o = datain == 8'b01101011;
  /* 6805.vhd:712:60  */
  assign n1059_o = n1056_o | n1058_o;
  /* 6805.vhd:713:28  */
  assign n1061_o = datain == 8'b01101110;
  /* 6805.vhd:713:28  */
  assign n1062_o = n1059_o | n1061_o;
  /* 6805.vhd:713:36  */
  assign n1064_o = datain == 8'b01110001;
  /* 6805.vhd:713:36  */
  assign n1065_o = n1062_o | n1064_o;
  /* 6805.vhd:713:44  */
  assign n1067_o = datain == 8'b01110010;
  /* 6805.vhd:713:44  */
  assign n1068_o = n1065_o | n1067_o;
  /* 6805.vhd:713:52  */
  assign n1070_o = datain == 8'b01110101;
  /* 6805.vhd:713:52  */
  assign n1071_o = n1068_o | n1070_o;
  /* 6805.vhd:713:60  */
  assign n1073_o = datain == 8'b01111011;
  /* 6805.vhd:713:60  */
  assign n1074_o = n1071_o | n1073_o;
  /* 6805.vhd:713:68  */
  assign n1076_o = datain == 8'b01111110;
  /* 6805.vhd:713:68  */
  assign n1077_o = n1074_o | n1076_o;
  /* 6805.vhd:713:76  */
  assign n1079_o = datain == 8'b10000100;
  /* 6805.vhd:713:76  */
  assign n1080_o = n1077_o | n1079_o;
  /* 6805.vhd:714:28  */
  assign n1082_o = datain == 8'b10000101;
  /* 6805.vhd:714:28  */
  assign n1083_o = n1080_o | n1082_o;
  /* 6805.vhd:714:36  */
  assign n1085_o = datain == 8'b10000110;
  /* 6805.vhd:714:36  */
  assign n1086_o = n1083_o | n1085_o;
  /* 6805.vhd:714:44  */
  assign n1088_o = datain == 8'b10000111;
  /* 6805.vhd:714:44  */
  assign n1089_o = n1086_o | n1088_o;
  /* 6805.vhd:714:52  */
  assign n1091_o = datain == 8'b10001000;
  /* 6805.vhd:714:52  */
  assign n1092_o = n1089_o | n1091_o;
  /* 6805.vhd:714:60  */
  assign n1094_o = datain == 8'b10001001;
  /* 6805.vhd:714:60  */
  assign n1095_o = n1092_o | n1094_o;
  /* 6805.vhd:715:28  */
  assign n1097_o = datain == 8'b10001010;
  /* 6805.vhd:715:28  */
  assign n1098_o = n1095_o | n1097_o;
  /* 6805.vhd:715:36  */
  assign n1100_o = datain == 8'b10001011;
  /* 6805.vhd:715:36  */
  assign n1101_o = n1098_o | n1100_o;
  /* 6805.vhd:715:44  */
  assign n1103_o = datain == 8'b10001100;
  /* 6805.vhd:715:44  */
  assign n1104_o = n1101_o | n1103_o;
  /* 6805.vhd:715:52  */
  assign n1106_o = datain == 8'b10001101;
  /* 6805.vhd:715:52  */
  assign n1107_o = n1104_o | n1106_o;
  /* 6805.vhd:715:60  */
  assign n1109_o = datain == 8'b10010000;
  /* 6805.vhd:715:60  */
  assign n1110_o = n1107_o | n1109_o;
  /* 6805.vhd:716:28  */
  assign n1112_o = datain == 8'b10010001;
  /* 6805.vhd:716:28  */
  assign n1113_o = n1110_o | n1112_o;
  /* 6805.vhd:716:36  */
  assign n1115_o = datain == 8'b10010010;
  /* 6805.vhd:716:36  */
  assign n1116_o = n1113_o | n1115_o;
  /* 6805.vhd:716:44  */
  assign n1118_o = datain == 8'b10010011;
  /* 6805.vhd:716:44  */
  assign n1119_o = n1116_o | n1118_o;
  /* 6805.vhd:716:52  */
  assign n1121_o = datain == 8'b10010100;
  /* 6805.vhd:716:52  */
  assign n1122_o = n1119_o | n1121_o;
  /* 6805.vhd:716:60  */
  assign n1124_o = datain == 8'b10010101;
  /* 6805.vhd:716:60  */
  assign n1125_o = n1122_o | n1124_o;
  /* 6805.vhd:716:68  */
  assign n1127_o = datain == 8'b10011101;
  /* 6805.vhd:716:68  */
  assign n1128_o = n1125_o | n1127_o;
  /* 6805.vhd:716:76  */
  assign n1130_o = datain == 8'b10011110;
  /* 6805.vhd:716:76  */
  assign n1131_o = n1128_o | n1130_o;
  /* 6805.vhd:716:84  */
  assign n1133_o = datain == 8'b10100111;
  /* 6805.vhd:716:84  */
  assign n1134_o = n1131_o | n1133_o;
  /* 6805.vhd:717:28  */
  assign n1136_o = datain == 8'b10101100;
  /* 6805.vhd:717:28  */
  assign n1137_o = n1134_o | n1136_o;
  /* 6805.vhd:717:36  */
  assign n1139_o = datain == 8'b10101111;
  /* 6805.vhd:717:36  */
  assign n1140_o = n1137_o | n1139_o;
  /* 6805.vhd:722:36  */
  assign n1142_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:720:17  */
  assign n1144_o = datain == 8'b10011111;
  /* 6805.vhd:725:36  */
  assign n1146_o = regpc + 16'b0000000000000010;
  /* 6805.vhd:726:36  */
  assign n1148_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:724:17  */
  assign n1150_o = datain == 8'b10101101;
  /* 6805.vhd:724:28  */
  assign n1152_o = datain == 8'b10111101;
  /* 6805.vhd:724:28  */
  assign n1153_o = n1150_o | n1152_o;
  /* 6805.vhd:724:36  */
  assign n1155_o = datain == 8'b11101101;
  /* 6805.vhd:724:36  */
  assign n1156_o = n1153_o | n1155_o;
  /* 6805.vhd:729:36  */
  assign n1158_o = regpc + 16'b0000000000000011;
  /* 6805.vhd:730:36  */
  assign n1160_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:728:17  */
  assign n1162_o = datain == 8'b11001101;
  /* 6805.vhd:728:28  */
  assign n1164_o = datain == 8'b11011101;
  /* 6805.vhd:728:28  */
  assign n1165_o = n1162_o | n1164_o;
  /* 6805.vhd:733:36  */
  assign n1167_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:737:36  */
  assign n1169_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:732:17  */
  assign n1171_o = datain == 8'b11111101;
  assign n1172_o = {n1171_o, n1165_o, n1156_o, n1144_o, n1140_o, n1010_o, n1006_o, n998_o, n990_o, n986_o, n982_o, n978_o, n974_o, n967_o, n963_o, n927_o, n923_o, n913_o, n899_o, n885_o, n870_o, n853_o, n836_o, n822_o, n806_o, n792_o, n775_o, n771_o, n761_o, n747_o, n733_o, n718_o, n701_o, n684_o, n670_o, n654_o, n640_o, n634_o, n617_o, n607_o, n597_o, n593_o, n556_o, n510_o, n473_o, n442_o, n303_o, n128_o};
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1177_o = 1'b0;
      48'b010000000000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b001000000000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000100000000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000010000000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000001000000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000100000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000010000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000001000000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000100000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000010000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000001000000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000100000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000010000000000000000000000000000000000: n1177_o = 1'b0;
      48'b000000000000001000000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000100000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000010000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000001000000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000100000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000010000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000001000000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000100000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000010000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000001000000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000100000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000010000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000001000000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000100000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000010000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000001000000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000100000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000010000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000001000000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000100000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000010000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000001000000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000100000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000010000000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000001000000000: n1177_o = 1'b0;
      48'b000000000000000000000000000000000000000100000000: n1177_o = 1'b0;
      48'b000000000000000000000000000000000000000010000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000001000000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000100000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000010000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000001000: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000000100: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000000010: n1177_o = n3853_q;
      48'b000000000000000000000000000000000000000000000001: n1177_o = n3853_q;
      default: n1177_o = n3853_q;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1179_o = rega;
      48'b010000000000000000000000000000000000000000000000: n1179_o = rega;
      48'b001000000000000000000000000000000000000000000000: n1179_o = rega;
      48'b000100000000000000000000000000000000000000000000: n1179_o = regx;
      48'b000010000000000000000000000000000000000000000000: n1179_o = rega;
      48'b000001000000000000000000000000000000000000000000: n1179_o = rega;
      48'b000000100000000000000000000000000000000000000000: n1179_o = rega;
      48'b000000010000000000000000000000000000000000000000: n1179_o = rega;
      48'b000000001000000000000000000000000000000000000000: n1179_o = rega;
      48'b000000000100000000000000000000000000000000000000: n1179_o = rega;
      48'b000000000010000000000000000000000000000000000000: n1179_o = rega;
      48'b000000000001000000000000000000000000000000000000: n1179_o = rega;
      48'b000000000000100000000000000000000000000000000000: n1179_o = rega;
      48'b000000000000010000000000000000000000000000000000: n1179_o = rega;
      48'b000000000000001000000000000000000000000000000000: n1179_o = rega;
      48'b000000000000000100000000000000000000000000000000: n1179_o = rega;
      48'b000000000000000010000000000000000000000000000000: n1179_o = rega;
      48'b000000000000000001000000000000000000000000000000: n1179_o = rega;
      48'b000000000000000000100000000000000000000000000000: n1179_o = rega;
      48'b000000000000000000010000000000000000000000000000: n1179_o = rega;
      48'b000000000000000000001000000000000000000000000000: n1179_o = rega;
      48'b000000000000000000000100000000000000000000000000: n1179_o = rega;
      48'b000000000000000000000010000000000000000000000000: n1179_o = rega;
      48'b000000000000000000000001000000000000000000000000: n1179_o = rega;
      48'b000000000000000000000000100000000000000000000000: n1179_o = rega;
      48'b000000000000000000000000010000000000000000000000: n1179_o = rega;
      48'b000000000000000000000000001000000000000000000000: n1179_o = 8'b00000000;
      48'b000000000000000000000000000100000000000000000000: n1179_o = rega;
      48'b000000000000000000000000000010000000000000000000: n1179_o = n749_o;
      48'b000000000000000000000000000001000000000000000000: n1179_o = n735_o;
      48'b000000000000000000000000000000100000000000000000: n1179_o = n720_o;
      48'b000000000000000000000000000000010000000000000000: n1179_o = n704_o;
      48'b000000000000000000000000000000001000000000000000: n1179_o = n687_o;
      48'b000000000000000000000000000000000100000000000000: n1179_o = n672_o;
      48'b000000000000000000000000000000000010000000000000: n1179_o = n657_o;
      48'b000000000000000000000000000000000001000000000000: n1179_o = n642_o;
      48'b000000000000000000000000000000000000100000000000: n1179_o = n635_o;
      48'b000000000000000000000000000000000000010000000000: n1179_o = n619_o;
      48'b000000000000000000000000000000000000001000000000: n1179_o = rega;
      48'b000000000000000000000000000000000000000100000000: n1179_o = rega;
      48'b000000000000000000000000000000000000000010000000: n1179_o = rega;
      48'b000000000000000000000000000000000000000001000000: n1179_o = rega;
      48'b000000000000000000000000000000000000000000100000: n1179_o = rega;
      48'b000000000000000000000000000000000000000000010000: n1179_o = rega;
      48'b000000000000000000000000000000000000000000001000: n1179_o = rega;
      48'b000000000000000000000000000000000000000000000100: n1179_o = rega;
      48'b000000000000000000000000000000000000000000000010: n1179_o = rega;
      48'b000000000000000000000000000000000000000000000001: n1179_o = rega;
      default: n1179_o = rega;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1181_o = regx;
      48'b010000000000000000000000000000000000000000000000: n1181_o = regx;
      48'b001000000000000000000000000000000000000000000000: n1181_o = regx;
      48'b000100000000000000000000000000000000000000000000: n1181_o = regx;
      48'b000010000000000000000000000000000000000000000000: n1181_o = regx;
      48'b000001000000000000000000000000000000000000000000: n1181_o = regx;
      48'b000000100000000000000000000000000000000000000000: n1181_o = regx;
      48'b000000010000000000000000000000000000000000000000: n1181_o = regx;
      48'b000000001000000000000000000000000000000000000000: n1181_o = rega;
      48'b000000000100000000000000000000000000000000000000: n1181_o = regx;
      48'b000000000010000000000000000000000000000000000000: n1181_o = regx;
      48'b000000000001000000000000000000000000000000000000: n1181_o = regx;
      48'b000000000000100000000000000000000000000000000000: n1181_o = regx;
      48'b000000000000010000000000000000000000000000000000: n1181_o = regx;
      48'b000000000000001000000000000000000000000000000000: n1181_o = regx;
      48'b000000000000000100000000000000000000000000000000: n1181_o = 8'b00000000;
      48'b000000000000000010000000000000000000000000000000: n1181_o = regx;
      48'b000000000000000001000000000000000000000000000000: n1181_o = n901_o;
      48'b000000000000000000100000000000000000000000000000: n1181_o = n887_o;
      48'b000000000000000000010000000000000000000000000000: n1181_o = n872_o;
      48'b000000000000000000001000000000000000000000000000: n1181_o = n856_o;
      48'b000000000000000000000100000000000000000000000000: n1181_o = n839_o;
      48'b000000000000000000000010000000000000000000000000: n1181_o = n824_o;
      48'b000000000000000000000001000000000000000000000000: n1181_o = n809_o;
      48'b000000000000000000000000100000000000000000000000: n1181_o = n794_o;
      48'b000000000000000000000000010000000000000000000000: n1181_o = n777_o;
      48'b000000000000000000000000001000000000000000000000: n1181_o = regx;
      48'b000000000000000000000000000100000000000000000000: n1181_o = regx;
      48'b000000000000000000000000000010000000000000000000: n1181_o = regx;
      48'b000000000000000000000000000001000000000000000000: n1181_o = regx;
      48'b000000000000000000000000000000100000000000000000: n1181_o = regx;
      48'b000000000000000000000000000000010000000000000000: n1181_o = regx;
      48'b000000000000000000000000000000001000000000000000: n1181_o = regx;
      48'b000000000000000000000000000000000100000000000000: n1181_o = regx;
      48'b000000000000000000000000000000000010000000000000: n1181_o = regx;
      48'b000000000000000000000000000000000001000000000000: n1181_o = regx;
      48'b000000000000000000000000000000000000100000000000: n1181_o = n636_o;
      48'b000000000000000000000000000000000000010000000000: n1181_o = regx;
      48'b000000000000000000000000000000000000001000000000: n1181_o = regx;
      48'b000000000000000000000000000000000000000100000000: n1181_o = regx;
      48'b000000000000000000000000000000000000000010000000: n1181_o = regx;
      48'b000000000000000000000000000000000000000001000000: n1181_o = regx;
      48'b000000000000000000000000000000000000000000100000: n1181_o = regx;
      48'b000000000000000000000000000000000000000000010000: n1181_o = regx;
      48'b000000000000000000000000000000000000000000001000: n1181_o = regx;
      48'b000000000000000000000000000000000000000000000100: n1181_o = regx;
      48'b000000000000000000000000000000000000000000000010: n1181_o = regx;
      48'b000000000000000000000000000000000000000000000001: n1181_o = regx;
      default: n1181_o = regx;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1183_o = regsp;
      48'b010000000000000000000000000000000000000000000000: n1183_o = regsp;
      48'b001000000000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000100000000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000010000000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000001000000000000000000000000000000000000000000: n1183_o = 16'b0000000011111111;
      48'b000000100000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000010000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000001000000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000100000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000010000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000001000000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000100000000000000000000000000000000000: n1183_o = n969_o;
      48'b000000000000010000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000001000000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000100000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000010000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000001000000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000100000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000010000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000001000000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000100000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000010000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000001000000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000100000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000010000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000001000000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000100000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000010000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000001000000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000100000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000010000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000001000000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000100000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000010000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000001000000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000100000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000010000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000001000000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000100000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000010000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000001000000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000100000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000010000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000001000: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000000100: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000000010: n1183_o = regsp;
      48'b000000000000000000000000000000000000000000000001: n1183_o = n126_o;
      default: n1183_o = regsp;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1184_o = n1169_o;
      48'b010000000000000000000000000000000000000000000000: n1184_o = n1160_o;
      48'b001000000000000000000000000000000000000000000000: n1184_o = n1148_o;
      48'b000100000000000000000000000000000000000000000000: n1184_o = n1142_o;
      48'b000010000000000000000000000000000000000000000000: n1184_o = n1012_o;
      48'b000001000000000000000000000000000000000000000000: n1184_o = n1008_o;
      48'b000000100000000000000000000000000000000000000000: n1184_o = n1001_o;
      48'b000000010000000000000000000000000000000000000000: n1184_o = n993_o;
      48'b000000001000000000000000000000000000000000000000: n1184_o = n988_o;
      48'b000000000100000000000000000000000000000000000000: n1184_o = n984_o;
      48'b000000000010000000000000000000000000000000000000: n1184_o = n980_o;
      48'b000000000001000000000000000000000000000000000000: n1184_o = n976_o;
      48'b000000000000100000000000000000000000000000000000: n1184_o = regpc;
      48'b000000000000010000000000000000000000000000000000: n1184_o = n965_o;
      48'b000000000000001000000000000000000000000000000000: n1184_o = n931_o;
      48'b000000000000000100000000000000000000000000000000: n1184_o = n925_o;
      48'b000000000000000010000000000000000000000000000000: n1184_o = n921_o;
      48'b000000000000000001000000000000000000000000000000: n1184_o = n911_o;
      48'b000000000000000000100000000000000000000000000000: n1184_o = n897_o;
      48'b000000000000000000010000000000000000000000000000: n1184_o = n883_o;
      48'b000000000000000000001000000000000000000000000000: n1184_o = n868_o;
      48'b000000000000000000000100000000000000000000000000: n1184_o = n851_o;
      48'b000000000000000000000010000000000000000000000000: n1184_o = n834_o;
      48'b000000000000000000000001000000000000000000000000: n1184_o = n820_o;
      48'b000000000000000000000000100000000000000000000000: n1184_o = n804_o;
      48'b000000000000000000000000010000000000000000000000: n1184_o = n790_o;
      48'b000000000000000000000000001000000000000000000000: n1184_o = n773_o;
      48'b000000000000000000000000000100000000000000000000: n1184_o = n769_o;
      48'b000000000000000000000000000010000000000000000000: n1184_o = n759_o;
      48'b000000000000000000000000000001000000000000000000: n1184_o = n745_o;
      48'b000000000000000000000000000000100000000000000000: n1184_o = n731_o;
      48'b000000000000000000000000000000010000000000000000: n1184_o = n716_o;
      48'b000000000000000000000000000000001000000000000000: n1184_o = n699_o;
      48'b000000000000000000000000000000000100000000000000: n1184_o = n682_o;
      48'b000000000000000000000000000000000010000000000000: n1184_o = n668_o;
      48'b000000000000000000000000000000000001000000000000: n1184_o = n652_o;
      48'b000000000000000000000000000000000000100000000000: n1184_o = n638_o;
      48'b000000000000000000000000000000000000010000000000: n1184_o = n632_o;
      48'b000000000000000000000000000000000000001000000000: n1184_o = n615_o;
      48'b000000000000000000000000000000000000000100000000: n1184_o = n605_o;
      48'b000000000000000000000000000000000000000010000000: n1184_o = n595_o;
      48'b000000000000000000000000000000000000000001000000: n1184_o = n558_o;
      48'b000000000000000000000000000000000000000000100000: n1184_o = n512_o;
      48'b000000000000000000000000000000000000000000010000: n1184_o = n475_o;
      48'b000000000000000000000000000000000000000000001000: n1184_o = n444_o;
      48'b000000000000000000000000000000000000000000000100: n1184_o = n305_o;
      48'b000000000000000000000000000000000000000000000010: n1184_o = n130_o;
      48'b000000000000000000000000000000000000000000000001: n1184_o = regpc;
      default: n1184_o = regpc;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b010000000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b001000000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000100000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000010000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000001000000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000100000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000010000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000001000000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000100000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000010000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000001000000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000100000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000010000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000001000000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000100000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000010000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000001000000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000100000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000010000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000001000000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000100000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000010000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000001000000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000100000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000010000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000001000000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000100000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000010000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000001000000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000100000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000010000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000001000000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000100000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000010000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000001000000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000100000000000: n1186_o = 1'b0;
      48'b000000000000000000000000000000000000010000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000001000000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000100000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000010000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000001000000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000100000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000010000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000001000: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000000100: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000000010: n1186_o = flagh;
      48'b000000000000000000000000000000000000000000000001: n1186_o = flagh;
      default: n1186_o = flagh;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b010000000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b001000000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000100000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000010000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000001000000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000100000000000000000000000000000000000000000: n1187_o = n999_o;
      48'b000000010000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000001000000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000100000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000010000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000001000000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000100000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000010000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000001000000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000100000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000010000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000001000000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000100000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000010000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000001000000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000100000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000010000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000001000000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000100000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000010000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000001000000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000100000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000010000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000001000000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000100000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000010000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000001000000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000100000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000010000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000001000000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000100000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000010000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000001000000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000100000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000010000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000001000000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000100000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000010000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000001000: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000000100: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000000010: n1187_o = flagi;
      48'b000000000000000000000000000000000000000000000001: n1187_o = flagi;
      default: n1187_o = flagi;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b010000000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b001000000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000100000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000010000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000001000000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000100000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000010000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000001000000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000100000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000010000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000001000000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000000100000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000000010000000000000000000000000000000000: n1193_o = 1'b0;
      48'b000000000000001000000000000000000000000000000000: n1193_o = flagn;
      48'b000000000000000100000000000000000000000000000000: n1193_o = 1'b0;
      48'b000000000000000010000000000000000000000000000000: n1193_o = n914_o;
      48'b000000000000000001000000000000000000000000000000: n1193_o = n904_o;
      48'b000000000000000000100000000000000000000000000000: n1193_o = n890_o;
      48'b000000000000000000010000000000000000000000000000: n1193_o = n875_o;
      48'b000000000000000000001000000000000000000000000000: n1193_o = n860_o;
      48'b000000000000000000000100000000000000000000000000: n1193_o = n843_o;
      48'b000000000000000000000010000000000000000000000000: n1193_o = flagc;
      48'b000000000000000000000001000000000000000000000000: n1193_o = 1'b0;
      48'b000000000000000000000000100000000000000000000000: n1193_o = n797_o;
      48'b000000000000000000000000010000000000000000000000: n1193_o = n780_o;
      48'b000000000000000000000000001000000000000000000000: n1193_o = 1'b0;
      48'b000000000000000000000000000100000000000000000000: n1193_o = n762_o;
      48'b000000000000000000000000000010000000000000000000: n1193_o = n752_o;
      48'b000000000000000000000000000001000000000000000000: n1193_o = n738_o;
      48'b000000000000000000000000000000100000000000000000: n1193_o = n723_o;
      48'b000000000000000000000000000000010000000000000000: n1193_o = n708_o;
      48'b000000000000000000000000000000001000000000000000: n1193_o = n691_o;
      48'b000000000000000000000000000000000100000000000000: n1193_o = flagc;
      48'b000000000000000000000000000000000010000000000000: n1193_o = 1'b0;
      48'b000000000000000000000000000000000001000000000000: n1193_o = n645_o;
      48'b000000000000000000000000000000000000100000000000: n1193_o = flagn;
      48'b000000000000000000000000000000000000010000000000: n1193_o = n622_o;
      48'b000000000000000000000000000000000000001000000000: n1193_o = n608_o;
      48'b000000000000000000000000000000000000000100000000: n1193_o = n598_o;
      48'b000000000000000000000000000000000000000010000000: n1193_o = flagn;
      48'b000000000000000000000000000000000000000001000000: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000100000: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000010000: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000001000: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000000100: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000000010: n1193_o = flagn;
      48'b000000000000000000000000000000000000000000000001: n1193_o = flagn;
      default: n1193_o = flagn;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b010000000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b001000000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000100000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000010000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000001000000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000100000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000010000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000001000000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000100000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000010000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000001000000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000000100000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000000010000000000000000000000000000000000: n1197_o = 1'b1;
      48'b000000000000001000000000000000000000000000000000: n1197_o = flagz;
      48'b000000000000000100000000000000000000000000000000: n1197_o = 1'b1;
      48'b000000000000000010000000000000000000000000000000: n1197_o = n919_o;
      48'b000000000000000001000000000000000000000000000000: n1197_o = n909_o;
      48'b000000000000000000100000000000000000000000000000: n1197_o = n895_o;
      48'b000000000000000000010000000000000000000000000000: n1197_o = n881_o;
      48'b000000000000000000001000000000000000000000000000: n1197_o = n866_o;
      48'b000000000000000000000100000000000000000000000000: n1197_o = n849_o;
      48'b000000000000000000000010000000000000000000000000: n1197_o = n832_o;
      48'b000000000000000000000001000000000000000000000000: n1197_o = n818_o;
      48'b000000000000000000000000100000000000000000000000: n1197_o = n802_o;
      48'b000000000000000000000000010000000000000000000000: n1197_o = n785_o;
      48'b000000000000000000000000001000000000000000000000: n1197_o = 1'b1;
      48'b000000000000000000000000000100000000000000000000: n1197_o = n767_o;
      48'b000000000000000000000000000010000000000000000000: n1197_o = n757_o;
      48'b000000000000000000000000000001000000000000000000: n1197_o = n743_o;
      48'b000000000000000000000000000000100000000000000000: n1197_o = n729_o;
      48'b000000000000000000000000000000010000000000000000: n1197_o = n714_o;
      48'b000000000000000000000000000000001000000000000000: n1197_o = n697_o;
      48'b000000000000000000000000000000000100000000000000: n1197_o = n680_o;
      48'b000000000000000000000000000000000010000000000000: n1197_o = n666_o;
      48'b000000000000000000000000000000000001000000000000: n1197_o = n650_o;
      48'b000000000000000000000000000000000000100000000000: n1197_o = flagz;
      48'b000000000000000000000000000000000000010000000000: n1197_o = n627_o;
      48'b000000000000000000000000000000000000001000000000: n1197_o = n613_o;
      48'b000000000000000000000000000000000000000100000000: n1197_o = n603_o;
      48'b000000000000000000000000000000000000000010000000: n1197_o = flagz;
      48'b000000000000000000000000000000000000000001000000: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000100000: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000010000: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000001000: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000000100: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000000010: n1197_o = flagz;
      48'b000000000000000000000000000000000000000000000001: n1197_o = flagz;
      default: n1197_o = flagz;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b010000000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b001000000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000100000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000010000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000001000000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000100000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000010000000000000000000000000000000000000000: n1201_o = n991_o;
      48'b000000001000000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000100000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000010000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000001000000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000100000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000010000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000001000000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000000100000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000000010000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000000001000000000000000000000000000000: n1201_o = flagc;
      48'b000000000000000000100000000000000000000000000000: n1201_o = flagc;
      48'b000000000000000000010000000000000000000000000000: n1201_o = n876_o;
      48'b000000000000000000001000000000000000000000000000: n1201_o = n861_o;
      48'b000000000000000000000100000000000000000000000000: n1201_o = n844_o;
      48'b000000000000000000000010000000000000000000000000: n1201_o = n827_o;
      48'b000000000000000000000001000000000000000000000000: n1201_o = n813_o;
      48'b000000000000000000000000100000000000000000000000: n1201_o = 1'b1;
      48'b000000000000000000000000010000000000000000000000: n1201_o = n788_o;
      48'b000000000000000000000000001000000000000000000000: n1201_o = flagc;
      48'b000000000000000000000000000100000000000000000000: n1201_o = flagc;
      48'b000000000000000000000000000010000000000000000000: n1201_o = flagc;
      48'b000000000000000000000000000001000000000000000000: n1201_o = flagc;
      48'b000000000000000000000000000000100000000000000000: n1201_o = n724_o;
      48'b000000000000000000000000000000010000000000000000: n1201_o = n709_o;
      48'b000000000000000000000000000000001000000000000000: n1201_o = n692_o;
      48'b000000000000000000000000000000000100000000000000: n1201_o = n675_o;
      48'b000000000000000000000000000000000010000000000000: n1201_o = n661_o;
      48'b000000000000000000000000000000000001000000000000: n1201_o = 1'b1;
      48'b000000000000000000000000000000000000100000000000: n1201_o = 1'b0;
      48'b000000000000000000000000000000000000010000000000: n1201_o = n630_o;
      48'b000000000000000000000000000000000000001000000000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000100000000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000010000000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000001000000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000100000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000010000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000001000: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000000100: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000000010: n1201_o = flagc;
      48'b000000000000000000000000000000000000000000000001: n1201_o = flagc;
      default: n1201_o = flagc;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1203_o = help;
      48'b010000000000000000000000000000000000000000000000: n1203_o = help;
      48'b001000000000000000000000000000000000000000000000: n1203_o = help;
      48'b000100000000000000000000000000000000000000000000: n1203_o = help;
      48'b000010000000000000000000000000000000000000000000: n1203_o = help;
      48'b000001000000000000000000000000000000000000000000: n1203_o = help;
      48'b000000100000000000000000000000000000000000000000: n1203_o = help;
      48'b000000010000000000000000000000000000000000000000: n1203_o = help;
      48'b000000001000000000000000000000000000000000000000: n1203_o = help;
      48'b000000000100000000000000000000000000000000000000: n1203_o = help;
      48'b000000000010000000000000000000000000000000000000: n1203_o = help;
      48'b000000000001000000000000000000000000000000000000: n1203_o = help;
      48'b000000000000100000000000000000000000000000000000: n1203_o = help;
      48'b000000000000010000000000000000000000000000000000: n1203_o = 8'b00000000;
      48'b000000000000001000000000000000000000000000000000: n1203_o = help;
      48'b000000000000000100000000000000000000000000000000: n1203_o = help;
      48'b000000000000000010000000000000000000000000000000: n1203_o = help;
      48'b000000000000000001000000000000000000000000000000: n1203_o = help;
      48'b000000000000000000100000000000000000000000000000: n1203_o = help;
      48'b000000000000000000010000000000000000000000000000: n1203_o = help;
      48'b000000000000000000001000000000000000000000000000: n1203_o = help;
      48'b000000000000000000000100000000000000000000000000: n1203_o = help;
      48'b000000000000000000000010000000000000000000000000: n1203_o = help;
      48'b000000000000000000000001000000000000000000000000: n1203_o = help;
      48'b000000000000000000000000100000000000000000000000: n1203_o = help;
      48'b000000000000000000000000010000000000000000000000: n1203_o = help;
      48'b000000000000000000000000001000000000000000000000: n1203_o = help;
      48'b000000000000000000000000000100000000000000000000: n1203_o = help;
      48'b000000000000000000000000000010000000000000000000: n1203_o = help;
      48'b000000000000000000000000000001000000000000000000: n1203_o = help;
      48'b000000000000000000000000000000100000000000000000: n1203_o = help;
      48'b000000000000000000000000000000010000000000000000: n1203_o = help;
      48'b000000000000000000000000000000001000000000000000: n1203_o = help;
      48'b000000000000000000000000000000000100000000000000: n1203_o = help;
      48'b000000000000000000000000000000000010000000000000: n1203_o = help;
      48'b000000000000000000000000000000000001000000000000: n1203_o = help;
      48'b000000000000000000000000000000000000100000000000: n1203_o = help;
      48'b000000000000000000000000000000000000010000000000: n1203_o = help;
      48'b000000000000000000000000000000000000001000000000: n1203_o = help;
      48'b000000000000000000000000000000000000000100000000: n1203_o = help;
      48'b000000000000000000000000000000000000000010000000: n1203_o = help;
      48'b000000000000000000000000000000000000000001000000: n1203_o = help;
      48'b000000000000000000000000000000000000000000100000: n1203_o = help;
      48'b000000000000000000000000000000000000000000010000: n1203_o = help;
      48'b000000000000000000000000000000000000000000001000: n1203_o = help;
      48'b000000000000000000000000000000000000000000000100: n1203_o = help;
      48'b000000000000000000000000000000000000000000000010: n1203_o = help;
      48'b000000000000000000000000000000000000000000000001: n1203_o = help;
      default: n1203_o = help;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1205_o = n1167_o;
      48'b010000000000000000000000000000000000000000000000: n1205_o = n1158_o;
      48'b001000000000000000000000000000000000000000000000: n1205_o = n1146_o;
      48'b000100000000000000000000000000000000000000000000: n1205_o = temp;
      48'b000010000000000000000000000000000000000000000000: n1205_o = temp;
      48'b000001000000000000000000000000000000000000000000: n1205_o = temp;
      48'b000000100000000000000000000000000000000000000000: n1205_o = temp;
      48'b000000010000000000000000000000000000000000000000: n1205_o = temp;
      48'b000000001000000000000000000000000000000000000000: n1205_o = temp;
      48'b000000000100000000000000000000000000000000000000: n1205_o = temp;
      48'b000000000010000000000000000000000000000000000000: n1205_o = temp;
      48'b000000000001000000000000000000000000000000000000: n1205_o = temp;
      48'b000000000000100000000000000000000000000000000000: n1205_o = temp;
      48'b000000000000010000000000000000000000000000000000: n1205_o = temp;
      48'b000000000000001000000000000000000000000000000000: n1205_o = n929_o;
      48'b000000000000000100000000000000000000000000000000: n1205_o = temp;
      48'b000000000000000010000000000000000000000000000000: n1205_o = temp;
      48'b000000000000000001000000000000000000000000000000: n1205_o = temp;
      48'b000000000000000000100000000000000000000000000000: n1205_o = temp;
      48'b000000000000000000010000000000000000000000000000: n1205_o = temp;
      48'b000000000000000000001000000000000000000000000000: n1205_o = temp;
      48'b000000000000000000000100000000000000000000000000: n1205_o = temp;
      48'b000000000000000000000010000000000000000000000000: n1205_o = temp;
      48'b000000000000000000000001000000000000000000000000: n1205_o = temp;
      48'b000000000000000000000000100000000000000000000000: n1205_o = temp;
      48'b000000000000000000000000010000000000000000000000: n1205_o = temp;
      48'b000000000000000000000000001000000000000000000000: n1205_o = temp;
      48'b000000000000000000000000000100000000000000000000: n1205_o = temp;
      48'b000000000000000000000000000010000000000000000000: n1205_o = temp;
      48'b000000000000000000000000000001000000000000000000: n1205_o = temp;
      48'b000000000000000000000000000000100000000000000000: n1205_o = temp;
      48'b000000000000000000000000000000010000000000000000: n1205_o = temp;
      48'b000000000000000000000000000000001000000000000000: n1205_o = temp;
      48'b000000000000000000000000000000000100000000000000: n1205_o = temp;
      48'b000000000000000000000000000000000010000000000000: n1205_o = temp;
      48'b000000000000000000000000000000000001000000000000: n1205_o = temp;
      48'b000000000000000000000000000000000000100000000000: n1205_o = temp;
      48'b000000000000000000000000000000000000010000000000: n1205_o = temp;
      48'b000000000000000000000000000000000000001000000000: n1205_o = temp;
      48'b000000000000000000000000000000000000000100000000: n1205_o = temp;
      48'b000000000000000000000000000000000000000010000000: n1205_o = temp;
      48'b000000000000000000000000000000000000000001000000: n1205_o = temp;
      48'b000000000000000000000000000000000000000000100000: n1205_o = temp;
      48'b000000000000000000000000000000000000000000010000: n1205_o = temp;
      48'b000000000000000000000000000000000000000000001000: n1205_o = temp;
      48'b000000000000000000000000000000000000000000000100: n1205_o = temp;
      48'b000000000000000000000000000000000000000000000010: n1205_o = 16'b0000000000000000;
      48'b000000000000000000000000000000000000000000000001: n1205_o = temp;
      default: n1205_o = temp;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1255_o = 4'b0100;
      48'b010000000000000000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b001000000000000000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b000100000000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000010000000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000001000000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000100000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000010000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000001000000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000100000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000010000000000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000001000000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b000000000000100000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b000000000000010000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b000000000000001000000000000000000000000000000000: n1255_o = 4'b0011;
      48'b000000000000000100000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000010000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000001000000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000100000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000010000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000001000000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000100000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000010000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000001000000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000100000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000010000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000001000000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000100000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000010000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000001000000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000100000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000010000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000001000000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000100000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000010000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000001000000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000000100000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000000010000000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000000001000000000: n1255_o = 4'b0101;
      48'b000000000000000000000000000000000000000100000000: n1255_o = 4'b0101;
      48'b000000000000000000000000000000000000000010000000: n1255_o = 4'b0010;
      48'b000000000000000000000000000000000000000001000000: n1255_o = 4'b0101;
      48'b000000000000000000000000000000000000000000100000: n1255_o = 4'b0100;
      48'b000000000000000000000000000000000000000000010000: n1255_o = 4'b0101;
      48'b000000000000000000000000000000000000000000001000: n1255_o = 4'b0100;
      48'b000000000000000000000000000000000000000000000100: n1255_o = 4'b0011;
      48'b000000000000000000000000000000000000000000000010: n1255_o = 4'b0011;
      48'b000000000000000000000000000000000000000000000001: n1255_o = 4'b0011;
      default: n1255_o = 4'b0000;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1265_o = 3'b001;
      48'b010000000000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b001000000000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000100000000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000010000000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000001000000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000100000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000010000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000001000000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000100000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000010000000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000001000000000000000000000000000000000000: n1265_o = 3'b001;
      48'b000000000000100000000000000000000000000000000000: n1265_o = 3'b001;
      48'b000000000000010000000000000000000000000000000000: n1265_o = 3'b010;
      48'b000000000000001000000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000100000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000010000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000001000000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000100000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000010000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000001000000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000100000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000010000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000001000000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000100000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000010000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000001000000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000100000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000010000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000001000000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000100000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000010000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000001000000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000100000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000010000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000001000000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000100000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000010000000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000001000000000: n1265_o = 3'b010;
      48'b000000000000000000000000000000000000000100000000: n1265_o = 3'b010;
      48'b000000000000000000000000000000000000000010000000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000000001000000: n1265_o = 3'b010;
      48'b000000000000000000000000000000000000000000100000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000000000010000: n1265_o = addrmux;
      48'b000000000000000000000000000000000000000000001000: n1265_o = 3'b010;
      48'b000000000000000000000000000000000000000000000100: n1265_o = addrmux;
      48'b000000000000000000000000000000000000000000000010: n1265_o = addrmux;
      48'b000000000000000000000000000000000000000000000001: n1265_o = 3'b001;
      default: n1265_o = addrmux;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1270_o = 4'b0111;
      48'b010000000000000000000000000000000000000000000000: n1270_o = datamux;
      48'b001000000000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000100000000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000010000000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000001000000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000100000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000010000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000001000000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000100000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000010000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000001000000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000100000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000010000000000000000000000000000000000: n1270_o = 4'b1001;
      48'b000000000000001000000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000100000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000010000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000001000000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000100000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000010000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000001000000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000100000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000010000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000001000000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000100000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000010000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000001000000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000100000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000010000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000001000000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000100000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000010000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000001000000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000100000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000010000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000001000000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000000100000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000000010000000000: n1270_o = datamux;
      48'b000000000000000000000000000000000000001000000000: n1270_o = 4'b0010;
      48'b000000000000000000000000000000000000000100000000: n1270_o = 4'b0000;
      48'b000000000000000000000000000000000000000010000000: n1270_o = datamux;
      48'b000000000000000000000000000000000000000001000000: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000100000: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000010000: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000001000: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000000100: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000000010: n1270_o = datamux;
      48'b000000000000000000000000000000000000000000000001: n1270_o = datamux;
      default: n1270_o = datamux;
    endcase
  /* 6805.vhd:330:15  */
  always @*
    case (n1172_o)
      48'b100000000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b010000000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b001000000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000100000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000010000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000001000000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000100000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000010000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000001000000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000100000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000010000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000001000000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000100000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000010000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000001000000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000100000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000010000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000001000000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000100000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000010000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000001000000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000100000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000010000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000001000000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000100000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000010000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000001000000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000100000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000010000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000001000000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000100000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000010000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000001000000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000100000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000010000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000001000000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000100000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000010000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000001000000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000100000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000010000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000001000000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000100000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000010000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000001000: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000000100: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000000010: n1272_o = trace_i;
      48'b000000000000000000000000000000000000000000000001: n1272_o = 1'b1;
      default: n1272_o = trace_i;
    endcase
  /* 6805.vhd:324:13  */
  assign n1274_o = n124_o ? n3853_q : n1177_o;
  /* 6805.vhd:324:13  */
  assign n1275_o = n124_o ? rega : n1179_o;
  /* 6805.vhd:324:13  */
  assign n1276_o = n124_o ? regx : n1181_o;
  /* 6805.vhd:324:13  */
  assign n1277_o = n124_o ? regsp : n1183_o;
  /* 6805.vhd:324:13  */
  assign n1278_o = n124_o ? regpc : n1184_o;
  /* 6805.vhd:324:13  */
  assign n1279_o = n124_o ? flagh : n1186_o;
  /* 6805.vhd:324:13  */
  assign n1280_o = n124_o ? flagi : n1187_o;
  /* 6805.vhd:324:13  */
  assign n1281_o = n124_o ? flagn : n1193_o;
  /* 6805.vhd:324:13  */
  assign n1282_o = n124_o ? flagz : n1197_o;
  /* 6805.vhd:324:13  */
  assign n1283_o = n124_o ? flagc : n1201_o;
  /* 6805.vhd:324:13  */
  assign n1284_o = n124_o ? help : n1203_o;
  /* 6805.vhd:324:13  */
  assign n1285_o = n124_o ? temp : n1205_o;
  /* 6805.vhd:324:13  */
  assign n1287_o = n124_o ? 4'b0011 : n1255_o;
  /* 6805.vhd:324:13  */
  assign n1289_o = n124_o ? 3'b001 : n1265_o;
  /* 6805.vhd:324:13  */
  assign n1290_o = n124_o ? datamux : n1270_o;
  /* 6805.vhd:324:13  */
  assign n1292_o = n124_o ? 8'b10000011 : datain;
  /* 6805.vhd:324:13  */
  assign n1293_o = n124_o ? trace_i : n1272_o;
  /* 6805.vhd:319:13  */
  assign n1295_o = trace ? n3853_q : n1274_o;
  /* 6805.vhd:319:13  */
  assign n1296_o = trace ? rega : n1275_o;
  /* 6805.vhd:319:13  */
  assign n1297_o = trace ? regx : n1276_o;
  /* 6805.vhd:319:13  */
  assign n1298_o = trace ? regsp : n1277_o;
  /* 6805.vhd:319:13  */
  assign n1299_o = trace ? regpc : n1278_o;
  /* 6805.vhd:319:13  */
  assign n1300_o = trace ? flagh : n1279_o;
  /* 6805.vhd:319:13  */
  assign n1301_o = trace ? flagi : n1280_o;
  /* 6805.vhd:319:13  */
  assign n1302_o = trace ? flagn : n1281_o;
  /* 6805.vhd:319:13  */
  assign n1303_o = trace ? flagz : n1282_o;
  /* 6805.vhd:319:13  */
  assign n1304_o = trace ? flagc : n1283_o;
  /* 6805.vhd:319:13  */
  assign n1305_o = trace ? help : n1284_o;
  /* 6805.vhd:319:13  */
  assign n1306_o = trace ? temp : n1285_o;
  /* 6805.vhd:319:13  */
  assign n1308_o = trace ? 4'b0011 : n1287_o;
  /* 6805.vhd:319:13  */
  assign n1310_o = trace ? 3'b001 : n1289_o;
  /* 6805.vhd:319:13  */
  assign n1311_o = trace ? datamux : n1290_o;
  /* 6805.vhd:319:13  */
  assign n1313_o = trace ? 8'b10000011 : n1292_o;
  /* 6805.vhd:319:13  */
  assign n1314_o = trace ? trace_i : n1293_o;
  /* 6805.vhd:319:13  */
  assign n1315_o = trace ? datain : traceopcode;
  /* 6805.vhd:317:11  */
  assign n1318_o = mainfsm == 4'b0010;
  /* 6805.vhd:757:32  */
  assign n1320_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:748:15  */
  assign n1322_o = opcode == 8'b00000000;
  /* 6805.vhd:748:26  */
  assign n1324_o = opcode == 8'b00000010;
  /* 6805.vhd:748:26  */
  assign n1325_o = n1322_o | n1324_o;
  /* 6805.vhd:748:34  */
  assign n1327_o = opcode == 8'b00000100;
  /* 6805.vhd:748:34  */
  assign n1328_o = n1325_o | n1327_o;
  /* 6805.vhd:748:42  */
  assign n1330_o = opcode == 8'b00000110;
  /* 6805.vhd:748:42  */
  assign n1331_o = n1328_o | n1330_o;
  /* 6805.vhd:748:50  */
  assign n1333_o = opcode == 8'b00001000;
  /* 6805.vhd:748:50  */
  assign n1334_o = n1331_o | n1333_o;
  /* 6805.vhd:748:58  */
  assign n1336_o = opcode == 8'b00001010;
  /* 6805.vhd:748:58  */
  assign n1337_o = n1334_o | n1336_o;
  /* 6805.vhd:748:66  */
  assign n1339_o = opcode == 8'b00001100;
  /* 6805.vhd:748:66  */
  assign n1340_o = n1337_o | n1339_o;
  /* 6805.vhd:748:74  */
  assign n1342_o = opcode == 8'b00001110;
  /* 6805.vhd:748:74  */
  assign n1343_o = n1340_o | n1342_o;
  /* 6805.vhd:748:82  */
  assign n1345_o = opcode == 8'b00000001;
  /* 6805.vhd:748:82  */
  assign n1346_o = n1343_o | n1345_o;
  /* 6805.vhd:749:26  */
  assign n1348_o = opcode == 8'b00000011;
  /* 6805.vhd:749:26  */
  assign n1349_o = n1346_o | n1348_o;
  /* 6805.vhd:749:34  */
  assign n1351_o = opcode == 8'b00000101;
  /* 6805.vhd:749:34  */
  assign n1352_o = n1349_o | n1351_o;
  /* 6805.vhd:749:42  */
  assign n1354_o = opcode == 8'b00000111;
  /* 6805.vhd:749:42  */
  assign n1355_o = n1352_o | n1354_o;
  /* 6805.vhd:749:50  */
  assign n1357_o = opcode == 8'b00001001;
  /* 6805.vhd:749:50  */
  assign n1358_o = n1355_o | n1357_o;
  /* 6805.vhd:749:58  */
  assign n1360_o = opcode == 8'b00001011;
  /* 6805.vhd:749:58  */
  assign n1361_o = n1358_o | n1360_o;
  /* 6805.vhd:749:66  */
  assign n1363_o = opcode == 8'b00001101;
  /* 6805.vhd:749:66  */
  assign n1364_o = n1361_o | n1363_o;
  /* 6805.vhd:749:74  */
  assign n1366_o = opcode == 8'b00001111;
  /* 6805.vhd:749:74  */
  assign n1367_o = n1364_o | n1366_o;
  /* 6805.vhd:749:82  */
  assign n1369_o = opcode == 8'b00010000;
  /* 6805.vhd:749:82  */
  assign n1370_o = n1367_o | n1369_o;
  /* 6805.vhd:750:26  */
  assign n1372_o = opcode == 8'b00010010;
  /* 6805.vhd:750:26  */
  assign n1373_o = n1370_o | n1372_o;
  /* 6805.vhd:750:34  */
  assign n1375_o = opcode == 8'b00010100;
  /* 6805.vhd:750:34  */
  assign n1376_o = n1373_o | n1375_o;
  /* 6805.vhd:750:42  */
  assign n1378_o = opcode == 8'b00010110;
  /* 6805.vhd:750:42  */
  assign n1379_o = n1376_o | n1378_o;
  /* 6805.vhd:750:50  */
  assign n1381_o = opcode == 8'b00011000;
  /* 6805.vhd:750:50  */
  assign n1382_o = n1379_o | n1381_o;
  /* 6805.vhd:750:58  */
  assign n1384_o = opcode == 8'b00011010;
  /* 6805.vhd:750:58  */
  assign n1385_o = n1382_o | n1384_o;
  /* 6805.vhd:750:66  */
  assign n1387_o = opcode == 8'b00011100;
  /* 6805.vhd:750:66  */
  assign n1388_o = n1385_o | n1387_o;
  /* 6805.vhd:750:74  */
  assign n1390_o = opcode == 8'b00011110;
  /* 6805.vhd:750:74  */
  assign n1391_o = n1388_o | n1390_o;
  /* 6805.vhd:750:82  */
  assign n1393_o = opcode == 8'b00010001;
  /* 6805.vhd:750:82  */
  assign n1394_o = n1391_o | n1393_o;
  /* 6805.vhd:751:26  */
  assign n1396_o = opcode == 8'b00010011;
  /* 6805.vhd:751:26  */
  assign n1397_o = n1394_o | n1396_o;
  /* 6805.vhd:751:34  */
  assign n1399_o = opcode == 8'b00010101;
  /* 6805.vhd:751:34  */
  assign n1400_o = n1397_o | n1399_o;
  /* 6805.vhd:751:42  */
  assign n1402_o = opcode == 8'b00010111;
  /* 6805.vhd:751:42  */
  assign n1403_o = n1400_o | n1402_o;
  /* 6805.vhd:751:50  */
  assign n1405_o = opcode == 8'b00011001;
  /* 6805.vhd:751:50  */
  assign n1406_o = n1403_o | n1405_o;
  /* 6805.vhd:751:58  */
  assign n1408_o = opcode == 8'b00011011;
  /* 6805.vhd:751:58  */
  assign n1409_o = n1406_o | n1408_o;
  /* 6805.vhd:751:66  */
  assign n1411_o = opcode == 8'b00011101;
  /* 6805.vhd:751:66  */
  assign n1412_o = n1409_o | n1411_o;
  /* 6805.vhd:751:74  */
  assign n1414_o = opcode == 8'b00011111;
  /* 6805.vhd:751:74  */
  assign n1415_o = n1412_o | n1414_o;
  /* 6805.vhd:751:82  */
  assign n1417_o = opcode == 8'b00110000;
  /* 6805.vhd:751:82  */
  assign n1418_o = n1415_o | n1417_o;
  /* 6805.vhd:752:26  */
  assign n1420_o = opcode == 8'b00110011;
  /* 6805.vhd:752:26  */
  assign n1421_o = n1418_o | n1420_o;
  /* 6805.vhd:752:34  */
  assign n1423_o = opcode == 8'b00110100;
  /* 6805.vhd:752:34  */
  assign n1424_o = n1421_o | n1423_o;
  /* 6805.vhd:752:42  */
  assign n1426_o = opcode == 8'b00110110;
  /* 6805.vhd:752:42  */
  assign n1427_o = n1424_o | n1426_o;
  /* 6805.vhd:752:50  */
  assign n1429_o = opcode == 8'b00110111;
  /* 6805.vhd:752:50  */
  assign n1430_o = n1427_o | n1429_o;
  /* 6805.vhd:753:26  */
  assign n1432_o = opcode == 8'b00111000;
  /* 6805.vhd:753:26  */
  assign n1433_o = n1430_o | n1432_o;
  /* 6805.vhd:753:34  */
  assign n1435_o = opcode == 8'b00111001;
  /* 6805.vhd:753:34  */
  assign n1436_o = n1433_o | n1435_o;
  /* 6805.vhd:753:42  */
  assign n1438_o = opcode == 8'b00111010;
  /* 6805.vhd:753:42  */
  assign n1439_o = n1436_o | n1438_o;
  /* 6805.vhd:753:50  */
  assign n1441_o = opcode == 8'b00111100;
  /* 6805.vhd:753:50  */
  assign n1442_o = n1439_o | n1441_o;
  /* 6805.vhd:753:58  */
  assign n1444_o = opcode == 8'b00111101;
  /* 6805.vhd:753:58  */
  assign n1445_o = n1442_o | n1444_o;
  /* 6805.vhd:768:32  */
  assign n1447_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:759:15  */
  assign n1449_o = opcode == 8'b11000000;
  /* 6805.vhd:759:26  */
  assign n1451_o = opcode == 8'b11000001;
  /* 6805.vhd:759:26  */
  assign n1452_o = n1449_o | n1451_o;
  /* 6805.vhd:759:34  */
  assign n1454_o = opcode == 8'b11000010;
  /* 6805.vhd:759:34  */
  assign n1455_o = n1452_o | n1454_o;
  /* 6805.vhd:759:42  */
  assign n1457_o = opcode == 8'b11000011;
  /* 6805.vhd:759:42  */
  assign n1458_o = n1455_o | n1457_o;
  /* 6805.vhd:759:50  */
  assign n1460_o = opcode == 8'b11000100;
  /* 6805.vhd:759:50  */
  assign n1461_o = n1458_o | n1460_o;
  /* 6805.vhd:760:26  */
  assign n1463_o = opcode == 8'b11000101;
  /* 6805.vhd:760:26  */
  assign n1464_o = n1461_o | n1463_o;
  /* 6805.vhd:760:34  */
  assign n1466_o = opcode == 8'b11000110;
  /* 6805.vhd:760:34  */
  assign n1467_o = n1464_o | n1466_o;
  /* 6805.vhd:760:42  */
  assign n1469_o = opcode == 8'b11000111;
  /* 6805.vhd:760:42  */
  assign n1470_o = n1467_o | n1469_o;
  /* 6805.vhd:760:50  */
  assign n1472_o = opcode == 8'b11001000;
  /* 6805.vhd:760:50  */
  assign n1473_o = n1470_o | n1472_o;
  /* 6805.vhd:761:26  */
  assign n1475_o = opcode == 8'b11001001;
  /* 6805.vhd:761:26  */
  assign n1476_o = n1473_o | n1475_o;
  /* 6805.vhd:761:34  */
  assign n1478_o = opcode == 8'b11001010;
  /* 6805.vhd:761:34  */
  assign n1479_o = n1476_o | n1478_o;
  /* 6805.vhd:761:42  */
  assign n1481_o = opcode == 8'b11001011;
  /* 6805.vhd:761:42  */
  assign n1482_o = n1479_o | n1481_o;
  /* 6805.vhd:761:50  */
  assign n1484_o = opcode == 8'b11001100;
  /* 6805.vhd:761:50  */
  assign n1485_o = n1482_o | n1484_o;
  /* 6805.vhd:762:26  */
  assign n1487_o = opcode == 8'b11001110;
  /* 6805.vhd:762:26  */
  assign n1488_o = n1485_o | n1487_o;
  /* 6805.vhd:762:34  */
  assign n1490_o = opcode == 8'b11001111;
  /* 6805.vhd:762:34  */
  assign n1491_o = n1488_o | n1490_o;
  /* 6805.vhd:762:42  */
  assign n1493_o = opcode == 8'b11010000;
  /* 6805.vhd:762:42  */
  assign n1494_o = n1491_o | n1493_o;
  /* 6805.vhd:763:26  */
  assign n1496_o = opcode == 8'b11010001;
  /* 6805.vhd:763:26  */
  assign n1497_o = n1494_o | n1496_o;
  /* 6805.vhd:763:34  */
  assign n1499_o = opcode == 8'b11010010;
  /* 6805.vhd:763:34  */
  assign n1500_o = n1497_o | n1499_o;
  /* 6805.vhd:763:42  */
  assign n1502_o = opcode == 8'b11010011;
  /* 6805.vhd:763:42  */
  assign n1503_o = n1500_o | n1502_o;
  /* 6805.vhd:763:50  */
  assign n1505_o = opcode == 8'b11010100;
  /* 6805.vhd:763:50  */
  assign n1506_o = n1503_o | n1505_o;
  /* 6805.vhd:764:26  */
  assign n1508_o = opcode == 8'b11010101;
  /* 6805.vhd:764:26  */
  assign n1509_o = n1506_o | n1508_o;
  /* 6805.vhd:764:34  */
  assign n1511_o = opcode == 8'b11010110;
  /* 6805.vhd:764:34  */
  assign n1512_o = n1509_o | n1511_o;
  /* 6805.vhd:764:42  */
  assign n1514_o = opcode == 8'b11010111;
  /* 6805.vhd:764:42  */
  assign n1515_o = n1512_o | n1514_o;
  /* 6805.vhd:764:50  */
  assign n1517_o = opcode == 8'b11011000;
  /* 6805.vhd:764:50  */
  assign n1518_o = n1515_o | n1517_o;
  /* 6805.vhd:765:26  */
  assign n1520_o = opcode == 8'b11011001;
  /* 6805.vhd:765:26  */
  assign n1521_o = n1518_o | n1520_o;
  /* 6805.vhd:765:34  */
  assign n1523_o = opcode == 8'b11011010;
  /* 6805.vhd:765:34  */
  assign n1524_o = n1521_o | n1523_o;
  /* 6805.vhd:765:42  */
  assign n1526_o = opcode == 8'b11011011;
  /* 6805.vhd:765:42  */
  assign n1527_o = n1524_o | n1526_o;
  /* 6805.vhd:765:50  */
  assign n1529_o = opcode == 8'b11011100;
  /* 6805.vhd:765:50  */
  assign n1530_o = n1527_o | n1529_o;
  /* 6805.vhd:766:26  */
  assign n1532_o = opcode == 8'b11011110;
  /* 6805.vhd:766:26  */
  assign n1533_o = n1530_o | n1532_o;
  /* 6805.vhd:766:34  */
  assign n1535_o = opcode == 8'b11011111;
  /* 6805.vhd:766:34  */
  assign n1536_o = n1533_o | n1535_o;
  /* 6805.vhd:775:32  */
  assign n1538_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:770:15  */
  assign n1540_o = opcode == 8'b10110111;
  /* 6805.vhd:782:32  */
  assign n1542_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:777:15  */
  assign n1544_o = opcode == 8'b10111111;
  /* 6805.vhd:790:32  */
  assign n1546_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:784:15  */
  assign n1548_o = opcode == 8'b10110000;
  /* 6805.vhd:784:26  */
  assign n1550_o = opcode == 8'b10110001;
  /* 6805.vhd:784:26  */
  assign n1551_o = n1548_o | n1550_o;
  /* 6805.vhd:784:34  */
  assign n1553_o = opcode == 8'b10110010;
  /* 6805.vhd:784:34  */
  assign n1554_o = n1551_o | n1553_o;
  /* 6805.vhd:784:42  */
  assign n1556_o = opcode == 8'b10110011;
  /* 6805.vhd:784:42  */
  assign n1557_o = n1554_o | n1556_o;
  /* 6805.vhd:784:50  */
  assign n1559_o = opcode == 8'b10110100;
  /* 6805.vhd:784:50  */
  assign n1560_o = n1557_o | n1559_o;
  /* 6805.vhd:785:26  */
  assign n1562_o = opcode == 8'b10110101;
  /* 6805.vhd:785:26  */
  assign n1563_o = n1560_o | n1562_o;
  /* 6805.vhd:785:34  */
  assign n1565_o = opcode == 8'b10110110;
  /* 6805.vhd:785:34  */
  assign n1566_o = n1563_o | n1565_o;
  /* 6805.vhd:785:42  */
  assign n1568_o = opcode == 8'b10111000;
  /* 6805.vhd:785:42  */
  assign n1569_o = n1566_o | n1568_o;
  /* 6805.vhd:786:26  */
  assign n1571_o = opcode == 8'b10111001;
  /* 6805.vhd:786:26  */
  assign n1572_o = n1569_o | n1571_o;
  /* 6805.vhd:786:34  */
  assign n1574_o = opcode == 8'b10111010;
  /* 6805.vhd:786:34  */
  assign n1575_o = n1572_o | n1574_o;
  /* 6805.vhd:786:42  */
  assign n1577_o = opcode == 8'b10111011;
  /* 6805.vhd:786:42  */
  assign n1578_o = n1575_o | n1577_o;
  /* 6805.vhd:786:50  */
  assign n1580_o = opcode == 8'b10111110;
  /* 6805.vhd:786:50  */
  assign n1581_o = n1578_o | n1580_o;
  /* 6805.vhd:794:26  */
  assign n1582_o = datain[7];
  /* 6805.vhd:794:30  */
  assign n1583_o = ~n1582_o;
  /* 6805.vhd:795:43  */
  assign n1585_o = {8'b00000000, datain};
  /* 6805.vhd:795:34  */
  assign n1586_o = regpc + n1585_o;
  /* 6805.vhd:795:53  */
  assign n1588_o = n1586_o + 16'b0000000000000001;
  /* 6805.vhd:797:43  */
  assign n1590_o = {8'b11111111, datain};
  /* 6805.vhd:797:34  */
  assign n1591_o = regpc + n1590_o;
  /* 6805.vhd:797:53  */
  assign n1593_o = n1591_o + 16'b0000000000000001;
  /* 6805.vhd:794:17  */
  assign n1594_o = n1583_o ? n1588_o : n1593_o;
  /* 6805.vhd:793:15  */
  assign n1596_o = opcode == 8'b00100000;
  /* 6805.vhd:801:32  */
  assign n1598_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:800:15  */
  assign n1600_o = opcode == 8'b00100001;
  /* 6805.vhd:804:27  */
  assign n1601_o = flagc | flagz;
  /* 6805.vhd:804:45  */
  assign n1602_o = opcode[0];
  /* 6805.vhd:804:37  */
  assign n1603_o = n1601_o == n1602_o;
  /* 6805.vhd:805:28  */
  assign n1604_o = datain[7];
  /* 6805.vhd:805:32  */
  assign n1605_o = ~n1604_o;
  /* 6805.vhd:806:45  */
  assign n1607_o = {8'b00000000, datain};
  /* 6805.vhd:806:36  */
  assign n1608_o = regpc + n1607_o;
  /* 6805.vhd:806:55  */
  assign n1610_o = n1608_o + 16'b0000000000000001;
  /* 6805.vhd:808:45  */
  assign n1612_o = {8'b11111111, datain};
  /* 6805.vhd:808:36  */
  assign n1613_o = regpc + n1612_o;
  /* 6805.vhd:808:55  */
  assign n1615_o = n1613_o + 16'b0000000000000001;
  /* 6805.vhd:805:19  */
  assign n1616_o = n1605_o ? n1610_o : n1615_o;
  /* 6805.vhd:811:34  */
  assign n1618_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:804:17  */
  assign n1619_o = n1603_o ? n1616_o : n1618_o;
  /* 6805.vhd:803:15  */
  assign n1621_o = opcode == 8'b00100010;
  /* 6805.vhd:803:26  */
  assign n1623_o = opcode == 8'b00100011;
  /* 6805.vhd:803:26  */
  assign n1624_o = n1621_o | n1623_o;
  /* 6805.vhd:815:35  */
  assign n1625_o = opcode[0];
  /* 6805.vhd:815:27  */
  assign n1626_o = flagc == n1625_o;
  /* 6805.vhd:816:28  */
  assign n1627_o = datain[7];
  /* 6805.vhd:816:32  */
  assign n1628_o = ~n1627_o;
  /* 6805.vhd:817:45  */
  assign n1630_o = {8'b00000000, datain};
  /* 6805.vhd:817:36  */
  assign n1631_o = regpc + n1630_o;
  /* 6805.vhd:817:55  */
  assign n1633_o = n1631_o + 16'b0000000000000001;
  /* 6805.vhd:819:45  */
  assign n1635_o = {8'b11111111, datain};
  /* 6805.vhd:819:36  */
  assign n1636_o = regpc + n1635_o;
  /* 6805.vhd:819:55  */
  assign n1638_o = n1636_o + 16'b0000000000000001;
  /* 6805.vhd:816:19  */
  assign n1639_o = n1628_o ? n1633_o : n1638_o;
  /* 6805.vhd:822:34  */
  assign n1641_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:815:17  */
  assign n1642_o = n1626_o ? n1639_o : n1641_o;
  /* 6805.vhd:814:15  */
  assign n1644_o = opcode == 8'b00100100;
  /* 6805.vhd:814:26  */
  assign n1646_o = opcode == 8'b00100101;
  /* 6805.vhd:814:26  */
  assign n1647_o = n1644_o | n1646_o;
  /* 6805.vhd:826:35  */
  assign n1648_o = opcode[0];
  /* 6805.vhd:826:27  */
  assign n1649_o = flagz == n1648_o;
  /* 6805.vhd:827:28  */
  assign n1650_o = datain[7];
  /* 6805.vhd:827:32  */
  assign n1651_o = ~n1650_o;
  /* 6805.vhd:828:45  */
  assign n1653_o = {8'b00000000, datain};
  /* 6805.vhd:828:36  */
  assign n1654_o = regpc + n1653_o;
  /* 6805.vhd:828:55  */
  assign n1656_o = n1654_o + 16'b0000000000000001;
  /* 6805.vhd:830:45  */
  assign n1658_o = {8'b11111111, datain};
  /* 6805.vhd:830:36  */
  assign n1659_o = regpc + n1658_o;
  /* 6805.vhd:830:55  */
  assign n1661_o = n1659_o + 16'b0000000000000001;
  /* 6805.vhd:827:19  */
  assign n1662_o = n1651_o ? n1656_o : n1661_o;
  /* 6805.vhd:833:34  */
  assign n1664_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:826:17  */
  assign n1665_o = n1649_o ? n1662_o : n1664_o;
  /* 6805.vhd:825:15  */
  assign n1667_o = opcode == 8'b00100110;
  /* 6805.vhd:825:26  */
  assign n1669_o = opcode == 8'b00100111;
  /* 6805.vhd:825:26  */
  assign n1670_o = n1667_o | n1669_o;
  /* 6805.vhd:837:35  */
  assign n1671_o = opcode[0];
  /* 6805.vhd:837:27  */
  assign n1672_o = flagh == n1671_o;
  /* 6805.vhd:838:28  */
  assign n1673_o = datain[7];
  /* 6805.vhd:838:32  */
  assign n1674_o = ~n1673_o;
  /* 6805.vhd:839:45  */
  assign n1676_o = {8'b00000000, datain};
  /* 6805.vhd:839:36  */
  assign n1677_o = regpc + n1676_o;
  /* 6805.vhd:839:55  */
  assign n1679_o = n1677_o + 16'b0000000000000001;
  /* 6805.vhd:841:45  */
  assign n1681_o = {8'b11111111, datain};
  /* 6805.vhd:841:36  */
  assign n1682_o = regpc + n1681_o;
  /* 6805.vhd:841:55  */
  assign n1684_o = n1682_o + 16'b0000000000000001;
  /* 6805.vhd:838:19  */
  assign n1685_o = n1674_o ? n1679_o : n1684_o;
  /* 6805.vhd:844:34  */
  assign n1687_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:837:17  */
  assign n1688_o = n1672_o ? n1685_o : n1687_o;
  /* 6805.vhd:836:15  */
  assign n1690_o = opcode == 8'b00101000;
  /* 6805.vhd:836:26  */
  assign n1692_o = opcode == 8'b00101001;
  /* 6805.vhd:836:26  */
  assign n1693_o = n1690_o | n1692_o;
  /* 6805.vhd:848:35  */
  assign n1694_o = opcode[0];
  /* 6805.vhd:848:27  */
  assign n1695_o = flagn == n1694_o;
  /* 6805.vhd:849:28  */
  assign n1696_o = datain[7];
  /* 6805.vhd:849:32  */
  assign n1697_o = ~n1696_o;
  /* 6805.vhd:850:45  */
  assign n1699_o = {8'b00000000, datain};
  /* 6805.vhd:850:36  */
  assign n1700_o = regpc + n1699_o;
  /* 6805.vhd:850:55  */
  assign n1702_o = n1700_o + 16'b0000000000000001;
  /* 6805.vhd:852:45  */
  assign n1704_o = {8'b11111111, datain};
  /* 6805.vhd:852:36  */
  assign n1705_o = regpc + n1704_o;
  /* 6805.vhd:852:55  */
  assign n1707_o = n1705_o + 16'b0000000000000001;
  /* 6805.vhd:849:19  */
  assign n1708_o = n1697_o ? n1702_o : n1707_o;
  /* 6805.vhd:855:34  */
  assign n1710_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:848:17  */
  assign n1711_o = n1695_o ? n1708_o : n1710_o;
  /* 6805.vhd:847:15  */
  assign n1713_o = opcode == 8'b00101010;
  /* 6805.vhd:847:26  */
  assign n1715_o = opcode == 8'b00101011;
  /* 6805.vhd:847:26  */
  assign n1716_o = n1713_o | n1715_o;
  /* 6805.vhd:859:35  */
  assign n1717_o = opcode[0];
  /* 6805.vhd:859:27  */
  assign n1718_o = flagi == n1717_o;
  /* 6805.vhd:860:28  */
  assign n1719_o = datain[7];
  /* 6805.vhd:860:32  */
  assign n1720_o = ~n1719_o;
  /* 6805.vhd:861:45  */
  assign n1722_o = {8'b00000000, datain};
  /* 6805.vhd:861:36  */
  assign n1723_o = regpc + n1722_o;
  /* 6805.vhd:861:55  */
  assign n1725_o = n1723_o + 16'b0000000000000001;
  /* 6805.vhd:863:45  */
  assign n1727_o = {8'b11111111, datain};
  /* 6805.vhd:863:36  */
  assign n1728_o = regpc + n1727_o;
  /* 6805.vhd:863:55  */
  assign n1730_o = n1728_o + 16'b0000000000000001;
  /* 6805.vhd:860:19  */
  assign n1731_o = n1720_o ? n1725_o : n1730_o;
  /* 6805.vhd:866:34  */
  assign n1733_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:859:17  */
  assign n1734_o = n1718_o ? n1731_o : n1733_o;
  /* 6805.vhd:858:15  */
  assign n1736_o = opcode == 8'b00101100;
  /* 6805.vhd:858:26  */
  assign n1738_o = opcode == 8'b00101101;
  /* 6805.vhd:858:26  */
  assign n1739_o = n1736_o | n1738_o;
  /* 6805.vhd:870:36  */
  assign n1740_o = opcode[0];
  /* 6805.vhd:870:28  */
  assign n1741_o = extirq == n1740_o;
  /* 6805.vhd:871:28  */
  assign n1742_o = datain[7];
  /* 6805.vhd:871:32  */
  assign n1743_o = ~n1742_o;
  /* 6805.vhd:872:45  */
  assign n1745_o = {8'b00000000, datain};
  /* 6805.vhd:872:36  */
  assign n1746_o = regpc + n1745_o;
  /* 6805.vhd:872:55  */
  assign n1748_o = n1746_o + 16'b0000000000000001;
  /* 6805.vhd:874:45  */
  assign n1750_o = {8'b11111111, datain};
  /* 6805.vhd:874:36  */
  assign n1751_o = regpc + n1750_o;
  /* 6805.vhd:874:55  */
  assign n1753_o = n1751_o + 16'b0000000000000001;
  /* 6805.vhd:871:19  */
  assign n1754_o = n1743_o ? n1748_o : n1753_o;
  /* 6805.vhd:877:34  */
  assign n1756_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:870:17  */
  assign n1757_o = n1741_o ? n1754_o : n1756_o;
  /* 6805.vhd:869:15  */
  assign n1759_o = opcode == 8'b00101110;
  /* 6805.vhd:869:26  */
  assign n1761_o = opcode == 8'b00101111;
  /* 6805.vhd:869:26  */
  assign n1762_o = n1759_o | n1761_o;
  /* 6805.vhd:883:19  */
  assign n1764_o = opcode == 8'b00111111;
  /* 6805.vhd:886:46  */
  assign n1766_o = {8'b00000000, datain};
  /* 6805.vhd:886:37  */
  assign n1767_o = temp + n1766_o;
  /* 6805.vhd:885:19  */
  assign n1769_o = opcode == 8'b01101111;
  assign n1770_o = {n1769_o, n1764_o};
  assign n1771_o = n1767_o[7:0];
  /* 6805.vhd:882:17  */
  always @*
    case (n1770_o)
      2'b10: n1773_o = n1771_o;
      2'b01: n1773_o = datain;
      default: n1773_o = 8'b00000000;
    endcase
  assign n1774_o = n1767_o[15:8];
  assign n1776_o = temp[15:8];
  /* 6805.vhd:882:17  */
  always @*
    case (n1770_o)
      2'b10: n1777_o = n1774_o;
      2'b01: n1777_o = n1776_o;
      default: n1777_o = 8'b00000000;
    endcase
  /* 6805.vhd:895:34  */
  assign n1779_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:880:15  */
  assign n1781_o = opcode == 8'b00111111;
  /* 6805.vhd:880:26  */
  assign n1783_o = opcode == 8'b01101111;
  /* 6805.vhd:880:26  */
  assign n1784_o = n1781_o | n1783_o;
  /* 6805.vhd:900:42  */
  assign n1786_o = {8'b00000000, datain};
  /* 6805.vhd:900:33  */
  assign n1787_o = temp + n1786_o;
  /* 6805.vhd:901:34  */
  assign n1789_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:897:15  */
  assign n1791_o = opcode == 8'b01100000;
  /* 6805.vhd:897:26  */
  assign n1793_o = opcode == 8'b01100011;
  /* 6805.vhd:897:26  */
  assign n1794_o = n1791_o | n1793_o;
  /* 6805.vhd:897:34  */
  assign n1796_o = opcode == 8'b01100100;
  /* 6805.vhd:897:34  */
  assign n1797_o = n1794_o | n1796_o;
  /* 6805.vhd:897:42  */
  assign n1799_o = opcode == 8'b01100110;
  /* 6805.vhd:897:42  */
  assign n1800_o = n1797_o | n1799_o;
  /* 6805.vhd:897:50  */
  assign n1802_o = opcode == 8'b01100111;
  /* 6805.vhd:897:50  */
  assign n1803_o = n1800_o | n1802_o;
  /* 6805.vhd:898:26  */
  assign n1805_o = opcode == 8'b01101000;
  /* 6805.vhd:898:26  */
  assign n1806_o = n1803_o | n1805_o;
  /* 6805.vhd:898:34  */
  assign n1808_o = opcode == 8'b01101001;
  /* 6805.vhd:898:34  */
  assign n1809_o = n1806_o | n1808_o;
  /* 6805.vhd:898:42  */
  assign n1811_o = opcode == 8'b01101010;
  /* 6805.vhd:898:42  */
  assign n1812_o = n1809_o | n1811_o;
  /* 6805.vhd:898:50  */
  assign n1814_o = opcode == 8'b01101100;
  /* 6805.vhd:898:50  */
  assign n1815_o = n1812_o | n1814_o;
  /* 6805.vhd:899:26  */
  assign n1817_o = opcode == 8'b01101101;
  /* 6805.vhd:899:26  */
  assign n1818_o = n1815_o | n1817_o;
  /* 6805.vhd:904:15  */
  assign n1820_o = opcode == 8'b01111111;
  /* 6805.vhd:909:32  */
  assign n1821_o = datain[4];
  /* 6805.vhd:910:32  */
  assign n1822_o = datain[3];
  /* 6805.vhd:911:32  */
  assign n1823_o = datain[2];
  /* 6805.vhd:912:32  */
  assign n1824_o = datain[1];
  /* 6805.vhd:913:32  */
  assign n1825_o = datain[0];
  /* 6805.vhd:914:32  */
  assign n1827_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:908:15  */
  assign n1829_o = opcode == 8'b10000000;
  /* 6805.vhd:908:26  */
  assign n1831_o = opcode == 8'b10000010;
  /* 6805.vhd:908:26  */
  assign n1832_o = n1829_o | n1831_o;
  /* 6805.vhd:918:32  */
  assign n1834_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:916:15  */
  assign n1836_o = opcode == 8'b10000001;
  /* 6805.vhd:920:15  */
  assign n1838_o = opcode == 8'b10000011;
  /* 6805.vhd:925:32  */
  assign n1840_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:924:15  */
  assign n1842_o = opcode == 8'b10101101;
  /* 6805.vhd:924:26  */
  assign n1844_o = opcode == 8'b10111101;
  /* 6805.vhd:924:26  */
  assign n1845_o = n1842_o | n1844_o;
  /* 6805.vhd:924:34  */
  assign n1847_o = opcode == 8'b11101101;
  /* 6805.vhd:924:34  */
  assign n1848_o = n1845_o | n1847_o;
  /* 6805.vhd:932:33  */
  assign n1850_o = {8'b00000000, datain};
  /* 6805.vhd:931:15  */
  assign n1852_o = opcode == 8'b10111100;
  /* 6805.vhd:936:32  */
  assign n1854_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:934:15  */
  assign n1856_o = opcode == 8'b11001101;
  /* 6805.vhd:934:26  */
  assign n1858_o = opcode == 8'b11011101;
  /* 6805.vhd:934:26  */
  assign n1859_o = n1856_o | n1858_o;
  assign n1860_o = {n1859_o, n1852_o, n1848_o, n1838_o, n1836_o, n1832_o, n1820_o, n1818_o, n1784_o, n1762_o, n1739_o, n1716_o, n1693_o, n1670_o, n1647_o, n1624_o, n1600_o, n1596_o, n1581_o, n1544_o, n1540_o, n1536_o, n1445_o};
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1867_o = n3853_q;
      23'b01000000000000000000000: n1867_o = n3853_q;
      23'b00100000000000000000000: n1867_o = 1'b0;
      23'b00010000000000000000000: n1867_o = 1'b0;
      23'b00001000000000000000000: n1867_o = n3853_q;
      23'b00000100000000000000000: n1867_o = n3853_q;
      23'b00000010000000000000000: n1867_o = 1'b1;
      23'b00000001000000000000000: n1867_o = n3853_q;
      23'b00000000100000000000000: n1867_o = 1'b0;
      23'b00000000010000000000000: n1867_o = n3853_q;
      23'b00000000001000000000000: n1867_o = n3853_q;
      23'b00000000000100000000000: n1867_o = n3853_q;
      23'b00000000000010000000000: n1867_o = n3853_q;
      23'b00000000000001000000000: n1867_o = n3853_q;
      23'b00000000000000100000000: n1867_o = n3853_q;
      23'b00000000000000010000000: n1867_o = n3853_q;
      23'b00000000000000001000000: n1867_o = n3853_q;
      23'b00000000000000000100000: n1867_o = n3853_q;
      23'b00000000000000000010000: n1867_o = n3853_q;
      23'b00000000000000000001000: n1867_o = 1'b0;
      23'b00000000000000000000100: n1867_o = 1'b0;
      23'b00000000000000000000010: n1867_o = n3853_q;
      23'b00000000000000000000001: n1867_o = n3853_q;
      default: n1867_o = n3853_q;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1868_o = regsp;
      23'b01000000000000000000000: n1868_o = regsp;
      23'b00100000000000000000000: n1868_o = regsp;
      23'b00010000000000000000000: n1868_o = regsp;
      23'b00001000000000000000000: n1868_o = n1834_o;
      23'b00000100000000000000000: n1868_o = n1827_o;
      23'b00000010000000000000000: n1868_o = regsp;
      23'b00000001000000000000000: n1868_o = regsp;
      23'b00000000100000000000000: n1868_o = regsp;
      23'b00000000010000000000000: n1868_o = regsp;
      23'b00000000001000000000000: n1868_o = regsp;
      23'b00000000000100000000000: n1868_o = regsp;
      23'b00000000000010000000000: n1868_o = regsp;
      23'b00000000000001000000000: n1868_o = regsp;
      23'b00000000000000100000000: n1868_o = regsp;
      23'b00000000000000010000000: n1868_o = regsp;
      23'b00000000000000001000000: n1868_o = regsp;
      23'b00000000000000000100000: n1868_o = regsp;
      23'b00000000000000000010000: n1868_o = regsp;
      23'b00000000000000000001000: n1868_o = regsp;
      23'b00000000000000000000100: n1868_o = regsp;
      23'b00000000000000000000010: n1868_o = regsp;
      23'b00000000000000000000001: n1868_o = regsp;
      default: n1868_o = regsp;
    endcase
  assign n1869_o = n1320_o[7:0];
  assign n1870_o = n1447_o[7:0];
  assign n1871_o = n1538_o[7:0];
  assign n1872_o = n1542_o[7:0];
  assign n1873_o = n1546_o[7:0];
  assign n1874_o = n1594_o[7:0];
  assign n1875_o = n1598_o[7:0];
  assign n1876_o = n1619_o[7:0];
  assign n1877_o = n1642_o[7:0];
  assign n1878_o = n1665_o[7:0];
  assign n1879_o = n1688_o[7:0];
  assign n1880_o = n1711_o[7:0];
  assign n1881_o = n1734_o[7:0];
  assign n1882_o = n1757_o[7:0];
  assign n1883_o = n1779_o[7:0];
  assign n1884_o = n1789_o[7:0];
  assign n1885_o = n1840_o[7:0];
  assign n1886_o = n1850_o[7:0];
  assign n1887_o = n1854_o[7:0];
  assign n1888_o = regpc[7:0];
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1889_o = n1887_o;
      23'b01000000000000000000000: n1889_o = n1886_o;
      23'b00100000000000000000000: n1889_o = n1885_o;
      23'b00010000000000000000000: n1889_o = n1888_o;
      23'b00001000000000000000000: n1889_o = n1888_o;
      23'b00000100000000000000000: n1889_o = n1888_o;
      23'b00000010000000000000000: n1889_o = n1888_o;
      23'b00000001000000000000000: n1889_o = n1884_o;
      23'b00000000100000000000000: n1889_o = n1883_o;
      23'b00000000010000000000000: n1889_o = n1882_o;
      23'b00000000001000000000000: n1889_o = n1881_o;
      23'b00000000000100000000000: n1889_o = n1880_o;
      23'b00000000000010000000000: n1889_o = n1879_o;
      23'b00000000000001000000000: n1889_o = n1878_o;
      23'b00000000000000100000000: n1889_o = n1877_o;
      23'b00000000000000010000000: n1889_o = n1876_o;
      23'b00000000000000001000000: n1889_o = n1875_o;
      23'b00000000000000000100000: n1889_o = n1874_o;
      23'b00000000000000000010000: n1889_o = n1873_o;
      23'b00000000000000000001000: n1889_o = n1872_o;
      23'b00000000000000000000100: n1889_o = n1871_o;
      23'b00000000000000000000010: n1889_o = n1870_o;
      23'b00000000000000000000001: n1889_o = n1869_o;
      default: n1889_o = n1888_o;
    endcase
  assign n1890_o = n1320_o[15:8];
  assign n1891_o = n1447_o[15:8];
  assign n1892_o = n1538_o[15:8];
  assign n1893_o = n1542_o[15:8];
  assign n1894_o = n1546_o[15:8];
  assign n1895_o = n1594_o[15:8];
  assign n1896_o = n1598_o[15:8];
  assign n1897_o = n1619_o[15:8];
  assign n1898_o = n1642_o[15:8];
  assign n1899_o = n1665_o[15:8];
  assign n1900_o = n1688_o[15:8];
  assign n1901_o = n1711_o[15:8];
  assign n1902_o = n1734_o[15:8];
  assign n1903_o = n1757_o[15:8];
  assign n1904_o = n1779_o[15:8];
  assign n1905_o = n1789_o[15:8];
  assign n1906_o = n1840_o[15:8];
  assign n1907_o = n1850_o[15:8];
  assign n1908_o = n1854_o[15:8];
  assign n1909_o = regpc[15:8];
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1910_o = n1908_o;
      23'b01000000000000000000000: n1910_o = n1907_o;
      23'b00100000000000000000000: n1910_o = n1906_o;
      23'b00010000000000000000000: n1910_o = n1909_o;
      23'b00001000000000000000000: n1910_o = datain;
      23'b00000100000000000000000: n1910_o = n1909_o;
      23'b00000010000000000000000: n1910_o = n1909_o;
      23'b00000001000000000000000: n1910_o = n1905_o;
      23'b00000000100000000000000: n1910_o = n1904_o;
      23'b00000000010000000000000: n1910_o = n1903_o;
      23'b00000000001000000000000: n1910_o = n1902_o;
      23'b00000000000100000000000: n1910_o = n1901_o;
      23'b00000000000010000000000: n1910_o = n1900_o;
      23'b00000000000001000000000: n1910_o = n1899_o;
      23'b00000000000000100000000: n1910_o = n1898_o;
      23'b00000000000000010000000: n1910_o = n1897_o;
      23'b00000000000000001000000: n1910_o = n1896_o;
      23'b00000000000000000100000: n1910_o = n1895_o;
      23'b00000000000000000010000: n1910_o = n1894_o;
      23'b00000000000000000001000: n1910_o = n1893_o;
      23'b00000000000000000000100: n1910_o = n1892_o;
      23'b00000000000000000000010: n1910_o = n1891_o;
      23'b00000000000000000000001: n1910_o = n1890_o;
      default: n1910_o = n1909_o;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1911_o = flagh;
      23'b01000000000000000000000: n1911_o = flagh;
      23'b00100000000000000000000: n1911_o = flagh;
      23'b00010000000000000000000: n1911_o = flagh;
      23'b00001000000000000000000: n1911_o = flagh;
      23'b00000100000000000000000: n1911_o = n1821_o;
      23'b00000010000000000000000: n1911_o = flagh;
      23'b00000001000000000000000: n1911_o = flagh;
      23'b00000000100000000000000: n1911_o = flagh;
      23'b00000000010000000000000: n1911_o = flagh;
      23'b00000000001000000000000: n1911_o = flagh;
      23'b00000000000100000000000: n1911_o = flagh;
      23'b00000000000010000000000: n1911_o = flagh;
      23'b00000000000001000000000: n1911_o = flagh;
      23'b00000000000000100000000: n1911_o = flagh;
      23'b00000000000000010000000: n1911_o = flagh;
      23'b00000000000000001000000: n1911_o = flagh;
      23'b00000000000000000100000: n1911_o = flagh;
      23'b00000000000000000010000: n1911_o = flagh;
      23'b00000000000000000001000: n1911_o = flagh;
      23'b00000000000000000000100: n1911_o = flagh;
      23'b00000000000000000000010: n1911_o = flagh;
      23'b00000000000000000000001: n1911_o = flagh;
      default: n1911_o = flagh;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1912_o = flagi;
      23'b01000000000000000000000: n1912_o = flagi;
      23'b00100000000000000000000: n1912_o = flagi;
      23'b00010000000000000000000: n1912_o = flagi;
      23'b00001000000000000000000: n1912_o = flagi;
      23'b00000100000000000000000: n1912_o = n1822_o;
      23'b00000010000000000000000: n1912_o = flagi;
      23'b00000001000000000000000: n1912_o = flagi;
      23'b00000000100000000000000: n1912_o = flagi;
      23'b00000000010000000000000: n1912_o = flagi;
      23'b00000000001000000000000: n1912_o = flagi;
      23'b00000000000100000000000: n1912_o = flagi;
      23'b00000000000010000000000: n1912_o = flagi;
      23'b00000000000001000000000: n1912_o = flagi;
      23'b00000000000000100000000: n1912_o = flagi;
      23'b00000000000000010000000: n1912_o = flagi;
      23'b00000000000000001000000: n1912_o = flagi;
      23'b00000000000000000100000: n1912_o = flagi;
      23'b00000000000000000010000: n1912_o = flagi;
      23'b00000000000000000001000: n1912_o = flagi;
      23'b00000000000000000000100: n1912_o = flagi;
      23'b00000000000000000000010: n1912_o = flagi;
      23'b00000000000000000000001: n1912_o = flagi;
      default: n1912_o = flagi;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1914_o = flagn;
      23'b01000000000000000000000: n1914_o = flagn;
      23'b00100000000000000000000: n1914_o = flagn;
      23'b00010000000000000000000: n1914_o = flagn;
      23'b00001000000000000000000: n1914_o = flagn;
      23'b00000100000000000000000: n1914_o = n1823_o;
      23'b00000010000000000000000: n1914_o = flagn;
      23'b00000001000000000000000: n1914_o = flagn;
      23'b00000000100000000000000: n1914_o = 1'b0;
      23'b00000000010000000000000: n1914_o = flagn;
      23'b00000000001000000000000: n1914_o = flagn;
      23'b00000000000100000000000: n1914_o = flagn;
      23'b00000000000010000000000: n1914_o = flagn;
      23'b00000000000001000000000: n1914_o = flagn;
      23'b00000000000000100000000: n1914_o = flagn;
      23'b00000000000000010000000: n1914_o = flagn;
      23'b00000000000000001000000: n1914_o = flagn;
      23'b00000000000000000100000: n1914_o = flagn;
      23'b00000000000000000010000: n1914_o = flagn;
      23'b00000000000000000001000: n1914_o = flagn;
      23'b00000000000000000000100: n1914_o = flagn;
      23'b00000000000000000000010: n1914_o = flagn;
      23'b00000000000000000000001: n1914_o = flagn;
      default: n1914_o = flagn;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1916_o = flagz;
      23'b01000000000000000000000: n1916_o = flagz;
      23'b00100000000000000000000: n1916_o = flagz;
      23'b00010000000000000000000: n1916_o = flagz;
      23'b00001000000000000000000: n1916_o = flagz;
      23'b00000100000000000000000: n1916_o = n1824_o;
      23'b00000010000000000000000: n1916_o = flagz;
      23'b00000001000000000000000: n1916_o = flagz;
      23'b00000000100000000000000: n1916_o = 1'b1;
      23'b00000000010000000000000: n1916_o = flagz;
      23'b00000000001000000000000: n1916_o = flagz;
      23'b00000000000100000000000: n1916_o = flagz;
      23'b00000000000010000000000: n1916_o = flagz;
      23'b00000000000001000000000: n1916_o = flagz;
      23'b00000000000000100000000: n1916_o = flagz;
      23'b00000000000000010000000: n1916_o = flagz;
      23'b00000000000000001000000: n1916_o = flagz;
      23'b00000000000000000100000: n1916_o = flagz;
      23'b00000000000000000010000: n1916_o = flagz;
      23'b00000000000000000001000: n1916_o = flagz;
      23'b00000000000000000000100: n1916_o = flagz;
      23'b00000000000000000000010: n1916_o = flagz;
      23'b00000000000000000000001: n1916_o = flagz;
      default: n1916_o = flagz;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1917_o = flagc;
      23'b01000000000000000000000: n1917_o = flagc;
      23'b00100000000000000000000: n1917_o = flagc;
      23'b00010000000000000000000: n1917_o = flagc;
      23'b00001000000000000000000: n1917_o = flagc;
      23'b00000100000000000000000: n1917_o = n1825_o;
      23'b00000010000000000000000: n1917_o = flagc;
      23'b00000001000000000000000: n1917_o = flagc;
      23'b00000000100000000000000: n1917_o = flagc;
      23'b00000000010000000000000: n1917_o = flagc;
      23'b00000000001000000000000: n1917_o = flagc;
      23'b00000000000100000000000: n1917_o = flagc;
      23'b00000000000010000000000: n1917_o = flagc;
      23'b00000000000001000000000: n1917_o = flagc;
      23'b00000000000000100000000: n1917_o = flagc;
      23'b00000000000000010000000: n1917_o = flagc;
      23'b00000000000000001000000: n1917_o = flagc;
      23'b00000000000000000100000: n1917_o = flagc;
      23'b00000000000000000010000: n1917_o = flagc;
      23'b00000000000000000001000: n1917_o = flagc;
      23'b00000000000000000000100: n1917_o = flagc;
      23'b00000000000000000000010: n1917_o = flagc;
      23'b00000000000000000000001: n1917_o = flagc;
      default: n1917_o = flagc;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1919_o = help;
      23'b01000000000000000000000: n1919_o = help;
      23'b00100000000000000000000: n1919_o = datain;
      23'b00010000000000000000000: n1919_o = help;
      23'b00001000000000000000000: n1919_o = help;
      23'b00000100000000000000000: n1919_o = help;
      23'b00000010000000000000000: n1919_o = help;
      23'b00000001000000000000000: n1919_o = help;
      23'b00000000100000000000000: n1919_o = 8'b00000000;
      23'b00000000010000000000000: n1919_o = help;
      23'b00000000001000000000000: n1919_o = help;
      23'b00000000000100000000000: n1919_o = help;
      23'b00000000000010000000000: n1919_o = help;
      23'b00000000000001000000000: n1919_o = help;
      23'b00000000000000100000000: n1919_o = help;
      23'b00000000000000010000000: n1919_o = help;
      23'b00000000000000001000000: n1919_o = help;
      23'b00000000000000000100000: n1919_o = help;
      23'b00000000000000000010000: n1919_o = help;
      23'b00000000000000000001000: n1919_o = help;
      23'b00000000000000000000100: n1919_o = help;
      23'b00000000000000000000010: n1919_o = help;
      23'b00000000000000000000001: n1919_o = help;
      default: n1919_o = help;
    endcase
  assign n1920_o = n1787_o[7:0];
  assign n1921_o = temp[7:0];
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1922_o = n1921_o;
      23'b01000000000000000000000: n1922_o = n1921_o;
      23'b00100000000000000000000: n1922_o = n1921_o;
      23'b00010000000000000000000: n1922_o = n1921_o;
      23'b00001000000000000000000: n1922_o = n1921_o;
      23'b00000100000000000000000: n1922_o = n1921_o;
      23'b00000010000000000000000: n1922_o = n1921_o;
      23'b00000001000000000000000: n1922_o = n1920_o;
      23'b00000000100000000000000: n1922_o = n1773_o;
      23'b00000000010000000000000: n1922_o = n1921_o;
      23'b00000000001000000000000: n1922_o = n1921_o;
      23'b00000000000100000000000: n1922_o = n1921_o;
      23'b00000000000010000000000: n1922_o = n1921_o;
      23'b00000000000001000000000: n1922_o = n1921_o;
      23'b00000000000000100000000: n1922_o = n1921_o;
      23'b00000000000000010000000: n1922_o = n1921_o;
      23'b00000000000000001000000: n1922_o = n1921_o;
      23'b00000000000000000100000: n1922_o = n1921_o;
      23'b00000000000000000010000: n1922_o = datain;
      23'b00000000000000000001000: n1922_o = datain;
      23'b00000000000000000000100: n1922_o = datain;
      23'b00000000000000000000010: n1922_o = n1921_o;
      23'b00000000000000000000001: n1922_o = datain;
      default: n1922_o = n1921_o;
    endcase
  assign n1923_o = n1787_o[15:8];
  assign n1924_o = temp[15:8];
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1925_o = datain;
      23'b01000000000000000000000: n1925_o = n1924_o;
      23'b00100000000000000000000: n1925_o = n1924_o;
      23'b00010000000000000000000: n1925_o = n1924_o;
      23'b00001000000000000000000: n1925_o = n1924_o;
      23'b00000100000000000000000: n1925_o = n1924_o;
      23'b00000010000000000000000: n1925_o = n1924_o;
      23'b00000001000000000000000: n1925_o = n1923_o;
      23'b00000000100000000000000: n1925_o = n1777_o;
      23'b00000000010000000000000: n1925_o = n1924_o;
      23'b00000000001000000000000: n1925_o = n1924_o;
      23'b00000000000100000000000: n1925_o = n1924_o;
      23'b00000000000010000000000: n1925_o = n1924_o;
      23'b00000000000001000000000: n1925_o = n1924_o;
      23'b00000000000000100000000: n1925_o = n1924_o;
      23'b00000000000000010000000: n1925_o = n1924_o;
      23'b00000000000000001000000: n1925_o = n1924_o;
      23'b00000000000000000100000: n1925_o = n1924_o;
      23'b00000000000000000010000: n1925_o = n1924_o;
      23'b00000000000000000001000: n1925_o = n1924_o;
      23'b00000000000000000000100: n1925_o = n1924_o;
      23'b00000000000000000000010: n1925_o = datain;
      23'b00000000000000000000001: n1925_o = n1924_o;
      default: n1925_o = n1924_o;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1950_o = 4'b0100;
      23'b01000000000000000000000: n1950_o = 4'b0010;
      23'b00100000000000000000000: n1950_o = 4'b0100;
      23'b00010000000000000000000: n1950_o = 4'b0100;
      23'b00001000000000000000000: n1950_o = 4'b0100;
      23'b00000100000000000000000: n1950_o = 4'b0100;
      23'b00000010000000000000000: n1950_o = 4'b0010;
      23'b00000001000000000000000: n1950_o = 4'b0100;
      23'b00000000100000000000000: n1950_o = 4'b0100;
      23'b00000000010000000000000: n1950_o = 4'b0010;
      23'b00000000001000000000000: n1950_o = 4'b0010;
      23'b00000000000100000000000: n1950_o = 4'b0010;
      23'b00000000000010000000000: n1950_o = 4'b0010;
      23'b00000000000001000000000: n1950_o = 4'b0010;
      23'b00000000000000100000000: n1950_o = 4'b0010;
      23'b00000000000000010000000: n1950_o = 4'b0010;
      23'b00000000000000001000000: n1950_o = 4'b0010;
      23'b00000000000000000100000: n1950_o = 4'b0010;
      23'b00000000000000000010000: n1950_o = 4'b0101;
      23'b00000000000000000001000: n1950_o = 4'b0101;
      23'b00000000000000000000100: n1950_o = 4'b0101;
      23'b00000000000000000000010: n1950_o = 4'b0100;
      23'b00000000000000000000001: n1950_o = 4'b0100;
      default: n1950_o = 4'b0000;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1959_o = addrmux;
      23'b01000000000000000000000: n1959_o = addrmux;
      23'b00100000000000000000000: n1959_o = 3'b001;
      23'b00010000000000000000000: n1959_o = addrmux;
      23'b00001000000000000000000: n1959_o = addrmux;
      23'b00000100000000000000000: n1959_o = addrmux;
      23'b00000010000000000000000: n1959_o = 3'b000;
      23'b00000001000000000000000: n1959_o = 3'b011;
      23'b00000000100000000000000: n1959_o = 3'b011;
      23'b00000000010000000000000: n1959_o = addrmux;
      23'b00000000001000000000000: n1959_o = addrmux;
      23'b00000000000100000000000: n1959_o = addrmux;
      23'b00000000000010000000000: n1959_o = addrmux;
      23'b00000000000001000000000: n1959_o = addrmux;
      23'b00000000000000100000000: n1959_o = addrmux;
      23'b00000000000000010000000: n1959_o = addrmux;
      23'b00000000000000001000000: n1959_o = addrmux;
      23'b00000000000000000100000: n1959_o = addrmux;
      23'b00000000000000000010000: n1959_o = 3'b011;
      23'b00000000000000000001000: n1959_o = 3'b011;
      23'b00000000000000000000100: n1959_o = 3'b011;
      23'b00000000000000000000010: n1959_o = addrmux;
      23'b00000000000000000000001: n1959_o = 3'b011;
      default: n1959_o = addrmux;
    endcase
  /* 6805.vhd:747:13  */
  always @*
    case (n1860_o)
      23'b10000000000000000000000: n1965_o = datamux;
      23'b01000000000000000000000: n1965_o = datamux;
      23'b00100000000000000000000: n1965_o = 4'b0101;
      23'b00010000000000000000000: n1965_o = 4'b0101;
      23'b00001000000000000000000: n1965_o = datamux;
      23'b00000100000000000000000: n1965_o = datamux;
      23'b00000010000000000000000: n1965_o = datamux;
      23'b00000001000000000000000: n1965_o = datamux;
      23'b00000000100000000000000: n1965_o = 4'b1001;
      23'b00000000010000000000000: n1965_o = datamux;
      23'b00000000001000000000000: n1965_o = datamux;
      23'b00000000000100000000000: n1965_o = datamux;
      23'b00000000000010000000000: n1965_o = datamux;
      23'b00000000000001000000000: n1965_o = datamux;
      23'b00000000000000100000000: n1965_o = datamux;
      23'b00000000000000010000000: n1965_o = datamux;
      23'b00000000000000001000000: n1965_o = datamux;
      23'b00000000000000000100000: n1965_o = datamux;
      23'b00000000000000000010000: n1965_o = datamux;
      23'b00000000000000000001000: n1965_o = 4'b0010;
      23'b00000000000000000000100: n1965_o = 4'b0000;
      23'b00000000000000000000010: n1965_o = datamux;
      23'b00000000000000000000001: n1965_o = datamux;
      default: n1965_o = datamux;
    endcase
  /* 6805.vhd:746:11  */
  assign n1967_o = mainfsm == 4'b0011;
  /* 6805.vhd:947:57  */
  assign n1968_o = opcode[3:1];
  /* 6805.vhd:947:38  */
  assign n1971_o = 3'b111 - n1968_o;
  /* 6805.vhd:947:28  */
  assign n1974_o = datain & n3867_o;
  /* 6805.vhd:947:73  */
  assign n1976_o = n1974_o != 8'b00000000;
  /* 6805.vhd:947:17  */
  assign n1979_o = n1976_o ? 1'b1 : 1'b0;
  /* 6805.vhd:945:15  */
  assign n1981_o = opcode == 8'b00000000;
  /* 6805.vhd:945:26  */
  assign n1983_o = opcode == 8'b00000010;
  /* 6805.vhd:945:26  */
  assign n1984_o = n1981_o | n1983_o;
  /* 6805.vhd:945:34  */
  assign n1986_o = opcode == 8'b00000100;
  /* 6805.vhd:945:34  */
  assign n1987_o = n1984_o | n1986_o;
  /* 6805.vhd:945:42  */
  assign n1989_o = opcode == 8'b00000110;
  /* 6805.vhd:945:42  */
  assign n1990_o = n1987_o | n1989_o;
  /* 6805.vhd:945:50  */
  assign n1992_o = opcode == 8'b00001000;
  /* 6805.vhd:945:50  */
  assign n1993_o = n1990_o | n1992_o;
  /* 6805.vhd:945:58  */
  assign n1995_o = opcode == 8'b00001010;
  /* 6805.vhd:945:58  */
  assign n1996_o = n1993_o | n1995_o;
  /* 6805.vhd:945:66  */
  assign n1998_o = opcode == 8'b00001100;
  /* 6805.vhd:945:66  */
  assign n1999_o = n1996_o | n1998_o;
  /* 6805.vhd:945:74  */
  assign n2001_o = opcode == 8'b00001110;
  /* 6805.vhd:945:74  */
  assign n2002_o = n1999_o | n2001_o;
  /* 6805.vhd:945:82  */
  assign n2004_o = opcode == 8'b00000001;
  /* 6805.vhd:945:82  */
  assign n2005_o = n2002_o | n2004_o;
  /* 6805.vhd:946:26  */
  assign n2007_o = opcode == 8'b00000011;
  /* 6805.vhd:946:26  */
  assign n2008_o = n2005_o | n2007_o;
  /* 6805.vhd:946:34  */
  assign n2010_o = opcode == 8'b00000101;
  /* 6805.vhd:946:34  */
  assign n2011_o = n2008_o | n2010_o;
  /* 6805.vhd:946:42  */
  assign n2013_o = opcode == 8'b00000111;
  /* 6805.vhd:946:42  */
  assign n2014_o = n2011_o | n2013_o;
  /* 6805.vhd:946:50  */
  assign n2016_o = opcode == 8'b00001001;
  /* 6805.vhd:946:50  */
  assign n2017_o = n2014_o | n2016_o;
  /* 6805.vhd:946:58  */
  assign n2019_o = opcode == 8'b00001011;
  /* 6805.vhd:946:58  */
  assign n2020_o = n2017_o | n2019_o;
  /* 6805.vhd:946:66  */
  assign n2022_o = opcode == 8'b00001101;
  /* 6805.vhd:946:66  */
  assign n2023_o = n2020_o | n2022_o;
  /* 6805.vhd:946:74  */
  assign n2025_o = opcode == 8'b00001111;
  /* 6805.vhd:946:74  */
  assign n2026_o = n2023_o | n2025_o;
  /* 6805.vhd:958:26  */
  assign n2027_o = opcode[0];
  /* 6805.vhd:958:30  */
  assign n2028_o = ~n2027_o;
  /* 6805.vhd:959:63  */
  assign n2029_o = opcode[3:1];
  /* 6805.vhd:959:44  */
  assign n2032_o = 3'b111 - n2029_o;
  /* 6805.vhd:959:34  */
  assign n2035_o = datain | n3881_o;
  /* 6805.vhd:961:63  */
  assign n2036_o = opcode[3:1];
  /* 6805.vhd:961:44  */
  assign n2039_o = 3'b111 - n2036_o;
  /* 6805.vhd:961:34  */
  assign n2042_o = datain & n3895_o;
  /* 6805.vhd:958:17  */
  assign n2043_o = n2028_o ? n2035_o : n2042_o;
  /* 6805.vhd:954:15  */
  assign n2045_o = opcode == 8'b00010000;
  /* 6805.vhd:954:26  */
  assign n2047_o = opcode == 8'b00010010;
  /* 6805.vhd:954:26  */
  assign n2048_o = n2045_o | n2047_o;
  /* 6805.vhd:954:34  */
  assign n2050_o = opcode == 8'b00010100;
  /* 6805.vhd:954:34  */
  assign n2051_o = n2048_o | n2050_o;
  /* 6805.vhd:954:42  */
  assign n2053_o = opcode == 8'b00010110;
  /* 6805.vhd:954:42  */
  assign n2054_o = n2051_o | n2053_o;
  /* 6805.vhd:954:50  */
  assign n2056_o = opcode == 8'b00011000;
  /* 6805.vhd:954:50  */
  assign n2057_o = n2054_o | n2056_o;
  /* 6805.vhd:954:58  */
  assign n2059_o = opcode == 8'b00011010;
  /* 6805.vhd:954:58  */
  assign n2060_o = n2057_o | n2059_o;
  /* 6805.vhd:954:66  */
  assign n2062_o = opcode == 8'b00011100;
  /* 6805.vhd:954:66  */
  assign n2063_o = n2060_o | n2062_o;
  /* 6805.vhd:954:74  */
  assign n2065_o = opcode == 8'b00011110;
  /* 6805.vhd:954:74  */
  assign n2066_o = n2063_o | n2065_o;
  /* 6805.vhd:954:82  */
  assign n2068_o = opcode == 8'b00010001;
  /* 6805.vhd:954:82  */
  assign n2069_o = n2066_o | n2068_o;
  /* 6805.vhd:955:26  */
  assign n2071_o = opcode == 8'b00010011;
  /* 6805.vhd:955:26  */
  assign n2072_o = n2069_o | n2071_o;
  /* 6805.vhd:955:34  */
  assign n2074_o = opcode == 8'b00010101;
  /* 6805.vhd:955:34  */
  assign n2075_o = n2072_o | n2074_o;
  /* 6805.vhd:955:42  */
  assign n2077_o = opcode == 8'b00010111;
  /* 6805.vhd:955:42  */
  assign n2078_o = n2075_o | n2077_o;
  /* 6805.vhd:955:50  */
  assign n2080_o = opcode == 8'b00011001;
  /* 6805.vhd:955:50  */
  assign n2081_o = n2078_o | n2080_o;
  /* 6805.vhd:955:58  */
  assign n2083_o = opcode == 8'b00011011;
  /* 6805.vhd:955:58  */
  assign n2084_o = n2081_o | n2083_o;
  /* 6805.vhd:955:66  */
  assign n2086_o = opcode == 8'b00011101;
  /* 6805.vhd:955:66  */
  assign n2087_o = n2084_o | n2086_o;
  /* 6805.vhd:955:74  */
  assign n2089_o = opcode == 8'b00011111;
  /* 6805.vhd:955:74  */
  assign n2090_o = n2087_o | n2089_o;
  /* 6805.vhd:977:28  */
  assign n2091_o = opcode[7:4];
  /* 6805.vhd:978:19  */
  assign n2093_o = n2091_o == 4'b1100;
  /* 6805.vhd:980:19  */
  assign n2095_o = n2091_o == 4'b1101;
  /* 6805.vhd:982:19  */
  assign n2097_o = n2091_o == 4'b1110;
  assign n2098_o = {n2097_o, n2095_o, n2093_o};
  /* 6805.vhd:977:17  */
  always @*
    case (n2098_o)
      3'b100: n2102_o = 3'b110;
      3'b010: n2102_o = 3'b100;
      3'b001: n2102_o = 3'b011;
      default: n2102_o = addrmux;
    endcase
  /* 6805.vhd:987:32  */
  assign n2104_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:964:15  */
  assign n2106_o = opcode == 8'b11000000;
  /* 6805.vhd:964:26  */
  assign n2108_o = opcode == 8'b11000001;
  /* 6805.vhd:964:26  */
  assign n2109_o = n2106_o | n2108_o;
  /* 6805.vhd:964:34  */
  assign n2111_o = opcode == 8'b11000010;
  /* 6805.vhd:964:34  */
  assign n2112_o = n2109_o | n2111_o;
  /* 6805.vhd:964:42  */
  assign n2114_o = opcode == 8'b11000011;
  /* 6805.vhd:964:42  */
  assign n2115_o = n2112_o | n2114_o;
  /* 6805.vhd:964:50  */
  assign n2117_o = opcode == 8'b11000100;
  /* 6805.vhd:964:50  */
  assign n2118_o = n2115_o | n2117_o;
  /* 6805.vhd:965:26  */
  assign n2120_o = opcode == 8'b11000101;
  /* 6805.vhd:965:26  */
  assign n2121_o = n2118_o | n2120_o;
  /* 6805.vhd:965:34  */
  assign n2123_o = opcode == 8'b11000110;
  /* 6805.vhd:965:34  */
  assign n2124_o = n2121_o | n2123_o;
  /* 6805.vhd:965:42  */
  assign n2126_o = opcode == 8'b11001000;
  /* 6805.vhd:965:42  */
  assign n2127_o = n2124_o | n2126_o;
  /* 6805.vhd:966:26  */
  assign n2129_o = opcode == 8'b11001001;
  /* 6805.vhd:966:26  */
  assign n2130_o = n2127_o | n2129_o;
  /* 6805.vhd:966:34  */
  assign n2132_o = opcode == 8'b11001010;
  /* 6805.vhd:966:34  */
  assign n2133_o = n2130_o | n2132_o;
  /* 6805.vhd:966:42  */
  assign n2135_o = opcode == 8'b11001011;
  /* 6805.vhd:966:42  */
  assign n2136_o = n2133_o | n2135_o;
  /* 6805.vhd:966:50  */
  assign n2138_o = opcode == 8'b11001110;
  /* 6805.vhd:966:50  */
  assign n2139_o = n2136_o | n2138_o;
  /* 6805.vhd:967:26  */
  assign n2141_o = opcode == 8'b11010000;
  /* 6805.vhd:967:26  */
  assign n2142_o = n2139_o | n2141_o;
  /* 6805.vhd:968:26  */
  assign n2144_o = opcode == 8'b11010001;
  /* 6805.vhd:968:26  */
  assign n2145_o = n2142_o | n2144_o;
  /* 6805.vhd:968:34  */
  assign n2147_o = opcode == 8'b11010010;
  /* 6805.vhd:968:34  */
  assign n2148_o = n2145_o | n2147_o;
  /* 6805.vhd:968:42  */
  assign n2150_o = opcode == 8'b11010011;
  /* 6805.vhd:968:42  */
  assign n2151_o = n2148_o | n2150_o;
  /* 6805.vhd:968:50  */
  assign n2153_o = opcode == 8'b11010100;
  /* 6805.vhd:968:50  */
  assign n2154_o = n2151_o | n2153_o;
  /* 6805.vhd:969:26  */
  assign n2156_o = opcode == 8'b11010101;
  /* 6805.vhd:969:26  */
  assign n2157_o = n2154_o | n2156_o;
  /* 6805.vhd:969:34  */
  assign n2159_o = opcode == 8'b11010110;
  /* 6805.vhd:969:34  */
  assign n2160_o = n2157_o | n2159_o;
  /* 6805.vhd:969:42  */
  assign n2162_o = opcode == 8'b11011000;
  /* 6805.vhd:969:42  */
  assign n2163_o = n2160_o | n2162_o;
  /* 6805.vhd:970:26  */
  assign n2165_o = opcode == 8'b11011001;
  /* 6805.vhd:970:26  */
  assign n2166_o = n2163_o | n2165_o;
  /* 6805.vhd:970:34  */
  assign n2168_o = opcode == 8'b11011010;
  /* 6805.vhd:970:34  */
  assign n2169_o = n2166_o | n2168_o;
  /* 6805.vhd:970:42  */
  assign n2171_o = opcode == 8'b11011011;
  /* 6805.vhd:970:42  */
  assign n2172_o = n2169_o | n2171_o;
  /* 6805.vhd:970:50  */
  assign n2174_o = opcode == 8'b11011110;
  /* 6805.vhd:970:50  */
  assign n2175_o = n2172_o | n2174_o;
  /* 6805.vhd:971:26  */
  assign n2177_o = opcode == 8'b11100000;
  /* 6805.vhd:971:26  */
  assign n2178_o = n2175_o | n2177_o;
  /* 6805.vhd:972:26  */
  assign n2180_o = opcode == 8'b11100001;
  /* 6805.vhd:972:26  */
  assign n2181_o = n2178_o | n2180_o;
  /* 6805.vhd:972:34  */
  assign n2183_o = opcode == 8'b11100010;
  /* 6805.vhd:972:34  */
  assign n2184_o = n2181_o | n2183_o;
  /* 6805.vhd:972:42  */
  assign n2186_o = opcode == 8'b11100011;
  /* 6805.vhd:972:42  */
  assign n2187_o = n2184_o | n2186_o;
  /* 6805.vhd:972:50  */
  assign n2189_o = opcode == 8'b11100100;
  /* 6805.vhd:972:50  */
  assign n2190_o = n2187_o | n2189_o;
  /* 6805.vhd:973:26  */
  assign n2192_o = opcode == 8'b11100101;
  /* 6805.vhd:973:26  */
  assign n2193_o = n2190_o | n2192_o;
  /* 6805.vhd:973:34  */
  assign n2195_o = opcode == 8'b11100110;
  /* 6805.vhd:973:34  */
  assign n2196_o = n2193_o | n2195_o;
  /* 6805.vhd:973:42  */
  assign n2198_o = opcode == 8'b11101000;
  /* 6805.vhd:973:42  */
  assign n2199_o = n2196_o | n2198_o;
  /* 6805.vhd:974:26  */
  assign n2201_o = opcode == 8'b11101001;
  /* 6805.vhd:974:26  */
  assign n2202_o = n2199_o | n2201_o;
  /* 6805.vhd:974:34  */
  assign n2204_o = opcode == 8'b11101010;
  /* 6805.vhd:974:34  */
  assign n2205_o = n2202_o | n2204_o;
  /* 6805.vhd:974:42  */
  assign n2207_o = opcode == 8'b11101011;
  /* 6805.vhd:974:42  */
  assign n2208_o = n2205_o | n2207_o;
  /* 6805.vhd:974:50  */
  assign n2210_o = opcode == 8'b11101110;
  /* 6805.vhd:974:50  */
  assign n2211_o = n2208_o | n2210_o;
  /* 6805.vhd:990:30  */
  assign n2212_o = temp[15:8];
  /* 6805.vhd:990:44  */
  assign n2213_o = {n2212_o, datain};
  /* 6805.vhd:989:15  */
  assign n2215_o = opcode == 8'b11001100;
  /* 6805.vhd:993:31  */
  assign n2216_o = temp[15:8];
  /* 6805.vhd:993:45  */
  assign n2217_o = {n2216_o, datain};
  /* 6805.vhd:993:64  */
  assign n2219_o = {8'b00000000, regx};
  /* 6805.vhd:993:55  */
  assign n2220_o = n2217_o + n2219_o;
  /* 6805.vhd:992:15  */
  assign n2222_o = opcode == 8'b11011100;
  /* 6805.vhd:996:33  */
  assign n2224_o = {8'b00000000, datain};
  /* 6805.vhd:996:52  */
  assign n2226_o = {8'b00000000, regx};
  /* 6805.vhd:996:43  */
  assign n2227_o = n2224_o + n2226_o;
  /* 6805.vhd:995:15  */
  assign n2229_o = opcode == 8'b11101100;
  /* 6805.vhd:1000:30  */
  assign n2230_o = rega[7];
  /* 6805.vhd:1001:25  */
  assign n2232_o = rega == 8'b00000000;
  /* 6805.vhd:1001:17  */
  assign n2235_o = n2232_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1009:32  */
  assign n2237_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:998:15  */
  assign n2239_o = opcode == 8'b11000111;
  /* 6805.vhd:1013:30  */
  assign n2240_o = rega[7];
  /* 6805.vhd:1014:25  */
  assign n2242_o = rega == 8'b00000000;
  /* 6805.vhd:1014:17  */
  assign n2245_o = n2242_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1022:32  */
  assign n2247_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1011:15  */
  assign n2249_o = opcode == 8'b11010111;
  /* 6805.vhd:1026:30  */
  assign n2250_o = rega[7];
  /* 6805.vhd:1027:25  */
  assign n2252_o = rega == 8'b00000000;
  /* 6805.vhd:1027:17  */
  assign n2255_o = n2252_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1035:32  */
  assign n2257_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1024:15  */
  assign n2259_o = opcode == 8'b11100111;
  /* 6805.vhd:1039:30  */
  assign n2260_o = regx[7];
  /* 6805.vhd:1040:25  */
  assign n2262_o = regx == 8'b00000000;
  /* 6805.vhd:1040:17  */
  assign n2265_o = n2262_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1048:32  */
  assign n2267_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1037:15  */
  assign n2269_o = opcode == 8'b11001111;
  /* 6805.vhd:1052:30  */
  assign n2270_o = regx[7];
  /* 6805.vhd:1053:25  */
  assign n2272_o = regx == 8'b00000000;
  /* 6805.vhd:1053:17  */
  assign n2275_o = n2272_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1061:32  */
  assign n2277_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1050:15  */
  assign n2279_o = opcode == 8'b11011111;
  /* 6805.vhd:1065:30  */
  assign n2280_o = regx[7];
  /* 6805.vhd:1066:25  */
  assign n2282_o = regx == 8'b00000000;
  /* 6805.vhd:1066:17  */
  assign n2285_o = n2282_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1074:32  */
  assign n2287_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1063:15  */
  assign n2289_o = opcode == 8'b11101111;
  /* 6805.vhd:1079:34  */
  assign n2291_o = 8'b00000000 - datain;
  /* 6805.vhd:1080:34  */
  assign n2293_o = 8'b00000000 - datain;
  /* 6805.vhd:1081:32  */
  assign n2294_o = n2293_o[7];
  /* 6805.vhd:1082:25  */
  assign n2296_o = n2293_o == 8'b00000000;
  /* 6805.vhd:1082:17  */
  assign n2299_o = n2296_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1082:17  */
  assign n2302_o = n2296_o ? 1'b0 : 1'b1;
  /* 6805.vhd:1076:15  */
  assign n2304_o = opcode == 8'b00110000;
  /* 6805.vhd:1076:26  */
  assign n2306_o = opcode == 8'b01100000;
  /* 6805.vhd:1076:26  */
  assign n2307_o = n2304_o | n2306_o;
  /* 6805.vhd:1076:34  */
  assign n2309_o = opcode == 8'b01110000;
  /* 6805.vhd:1076:34  */
  assign n2310_o = n2307_o | n2309_o;
  /* 6805.vhd:1093:35  */
  assign n2312_o = datain ^ 8'b11111111;
  /* 6805.vhd:1094:35  */
  assign n2314_o = datain ^ 8'b11111111;
  /* 6805.vhd:1096:32  */
  assign n2315_o = n2314_o[7];
  /* 6805.vhd:1097:25  */
  assign n2317_o = n2314_o == 8'b00000000;
  /* 6805.vhd:1097:17  */
  assign n2320_o = n2317_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1090:15  */
  assign n2322_o = opcode == 8'b00110011;
  /* 6805.vhd:1090:26  */
  assign n2324_o = opcode == 8'b01100011;
  /* 6805.vhd:1090:26  */
  assign n2325_o = n2322_o | n2324_o;
  /* 6805.vhd:1090:34  */
  assign n2327_o = opcode == 8'b01110011;
  /* 6805.vhd:1090:34  */
  assign n2328_o = n2325_o | n2327_o;
  /* 6805.vhd:1106:40  */
  assign n2329_o = datain[7:1];
  /* 6805.vhd:1106:32  */
  assign n2331_o = {1'b0, n2329_o};
  /* 6805.vhd:1107:40  */
  assign n2332_o = datain[7:1];
  /* 6805.vhd:1107:32  */
  assign n2334_o = {1'b0, n2332_o};
  /* 6805.vhd:1109:34  */
  assign n2335_o = datain[0];
  /* 6805.vhd:1110:25  */
  assign n2337_o = n2334_o == 8'b00000000;
  /* 6805.vhd:1110:17  */
  assign n2340_o = n2337_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1103:15  */
  assign n2342_o = opcode == 8'b00110100;
  /* 6805.vhd:1103:26  */
  assign n2344_o = opcode == 8'b01100100;
  /* 6805.vhd:1103:26  */
  assign n2345_o = n2342_o | n2344_o;
  /* 6805.vhd:1103:34  */
  assign n2347_o = opcode == 8'b01110100;
  /* 6805.vhd:1103:34  */
  assign n2348_o = n2345_o | n2347_o;
  /* 6805.vhd:1119:42  */
  assign n2349_o = datain[7:1];
  /* 6805.vhd:1119:34  */
  assign n2350_o = {flagc, n2349_o};
  /* 6805.vhd:1120:42  */
  assign n2351_o = datain[7:1];
  /* 6805.vhd:1120:34  */
  assign n2352_o = {flagc, n2351_o};
  /* 6805.vhd:1122:34  */
  assign n2353_o = datain[0];
  /* 6805.vhd:1123:25  */
  assign n2355_o = n2352_o == 8'b00000000;
  /* 6805.vhd:1123:17  */
  assign n2358_o = n2355_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1116:15  */
  assign n2360_o = opcode == 8'b00110110;
  /* 6805.vhd:1116:26  */
  assign n2362_o = opcode == 8'b01100110;
  /* 6805.vhd:1116:26  */
  assign n2363_o = n2360_o | n2362_o;
  /* 6805.vhd:1116:34  */
  assign n2365_o = opcode == 8'b01110110;
  /* 6805.vhd:1116:34  */
  assign n2366_o = n2363_o | n2365_o;
  /* 6805.vhd:1132:34  */
  assign n2367_o = datain[7];
  /* 6805.vhd:1132:46  */
  assign n2368_o = datain[7:1];
  /* 6805.vhd:1132:38  */
  assign n2369_o = {n2367_o, n2368_o};
  /* 6805.vhd:1133:34  */
  assign n2370_o = datain[7];
  /* 6805.vhd:1133:46  */
  assign n2371_o = datain[7:1];
  /* 6805.vhd:1133:38  */
  assign n2372_o = {n2370_o, n2371_o};
  /* 6805.vhd:1134:34  */
  assign n2373_o = datain[7];
  /* 6805.vhd:1135:34  */
  assign n2374_o = datain[0];
  /* 6805.vhd:1136:25  */
  assign n2376_o = n2372_o == 8'b00000000;
  /* 6805.vhd:1136:17  */
  assign n2379_o = n2376_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1129:15  */
  assign n2381_o = opcode == 8'b00110111;
  /* 6805.vhd:1129:26  */
  assign n2383_o = opcode == 8'b01100111;
  /* 6805.vhd:1129:26  */
  assign n2384_o = n2381_o | n2383_o;
  /* 6805.vhd:1129:34  */
  assign n2386_o = opcode == 8'b01110111;
  /* 6805.vhd:1129:34  */
  assign n2387_o = n2384_o | n2386_o;
  /* 6805.vhd:1145:34  */
  assign n2388_o = datain[6:0];
  /* 6805.vhd:1145:47  */
  assign n2390_o = {n2388_o, 1'b0};
  /* 6805.vhd:1146:34  */
  assign n2391_o = datain[6:0];
  /* 6805.vhd:1146:47  */
  assign n2393_o = {n2391_o, 1'b0};
  /* 6805.vhd:1147:34  */
  assign n2394_o = datain[6];
  /* 6805.vhd:1148:34  */
  assign n2395_o = datain[7];
  /* 6805.vhd:1149:25  */
  assign n2397_o = n2393_o == 8'b00000000;
  /* 6805.vhd:1149:17  */
  assign n2400_o = n2397_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1142:15  */
  assign n2402_o = opcode == 8'b00111000;
  /* 6805.vhd:1142:26  */
  assign n2404_o = opcode == 8'b01101000;
  /* 6805.vhd:1142:26  */
  assign n2405_o = n2402_o | n2404_o;
  /* 6805.vhd:1142:34  */
  assign n2407_o = opcode == 8'b01111000;
  /* 6805.vhd:1142:34  */
  assign n2408_o = n2405_o | n2407_o;
  /* 6805.vhd:1158:34  */
  assign n2409_o = datain[6:0];
  /* 6805.vhd:1158:47  */
  assign n2410_o = {n2409_o, flagc};
  /* 6805.vhd:1159:34  */
  assign n2411_o = datain[6:0];
  /* 6805.vhd:1159:47  */
  assign n2412_o = {n2411_o, flagc};
  /* 6805.vhd:1160:34  */
  assign n2413_o = datain[6];
  /* 6805.vhd:1161:34  */
  assign n2414_o = datain[7];
  /* 6805.vhd:1162:25  */
  assign n2416_o = n2412_o == 8'b00000000;
  /* 6805.vhd:1162:17  */
  assign n2419_o = n2416_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1155:15  */
  assign n2421_o = opcode == 8'b00111001;
  /* 6805.vhd:1155:26  */
  assign n2423_o = opcode == 8'b01101001;
  /* 6805.vhd:1155:26  */
  assign n2424_o = n2421_o | n2423_o;
  /* 6805.vhd:1155:34  */
  assign n2426_o = opcode == 8'b01111001;
  /* 6805.vhd:1155:34  */
  assign n2427_o = n2424_o | n2426_o;
  /* 6805.vhd:1171:35  */
  assign n2429_o = datain - 8'b00000001;
  /* 6805.vhd:1172:35  */
  assign n2431_o = datain - 8'b00000001;
  /* 6805.vhd:1173:32  */
  assign n2432_o = n2431_o[7];
  /* 6805.vhd:1174:25  */
  assign n2434_o = n2431_o == 8'b00000000;
  /* 6805.vhd:1174:17  */
  assign n2437_o = n2434_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1168:15  */
  assign n2439_o = opcode == 8'b00111010;
  /* 6805.vhd:1168:26  */
  assign n2441_o = opcode == 8'b01101010;
  /* 6805.vhd:1168:26  */
  assign n2442_o = n2439_o | n2441_o;
  /* 6805.vhd:1168:34  */
  assign n2444_o = opcode == 8'b01111010;
  /* 6805.vhd:1168:34  */
  assign n2445_o = n2442_o | n2444_o;
  /* 6805.vhd:1183:35  */
  assign n2447_o = datain + 8'b00000001;
  /* 6805.vhd:1184:35  */
  assign n2449_o = datain + 8'b00000001;
  /* 6805.vhd:1185:32  */
  assign n2450_o = n2449_o[7];
  /* 6805.vhd:1186:25  */
  assign n2452_o = n2449_o == 8'b00000000;
  /* 6805.vhd:1186:17  */
  assign n2455_o = n2452_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1180:15  */
  assign n2457_o = opcode == 8'b00111100;
  /* 6805.vhd:1180:26  */
  assign n2459_o = opcode == 8'b01101100;
  /* 6805.vhd:1180:26  */
  assign n2460_o = n2457_o | n2459_o;
  /* 6805.vhd:1180:34  */
  assign n2462_o = opcode == 8'b01111100;
  /* 6805.vhd:1180:34  */
  assign n2463_o = n2460_o | n2462_o;
  /* 6805.vhd:1193:34  */
  assign n2464_o = datain[7];
  /* 6805.vhd:1194:27  */
  assign n2466_o = datain == 8'b00000000;
  /* 6805.vhd:1194:17  */
  assign n2469_o = n2466_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1192:15  */
  assign n2471_o = opcode == 8'b00111101;
  /* 6805.vhd:1192:26  */
  assign n2473_o = opcode == 8'b01101101;
  /* 6805.vhd:1192:26  */
  assign n2474_o = n2471_o | n2473_o;
  /* 6805.vhd:1192:34  */
  assign n2476_o = opcode == 8'b01111101;
  /* 6805.vhd:1192:34  */
  assign n2477_o = n2474_o | n2476_o;
  /* 6805.vhd:1201:15  */
  assign n2479_o = opcode == 8'b00111111;
  /* 6805.vhd:1201:26  */
  assign n2481_o = opcode == 8'b01101111;
  /* 6805.vhd:1201:26  */
  assign n2482_o = n2479_o | n2481_o;
  /* 6805.vhd:1207:32  */
  assign n2484_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1205:15  */
  assign n2486_o = opcode == 8'b10000000;
  /* 6805.vhd:1205:26  */
  assign n2488_o = opcode == 8'b10000010;
  /* 6805.vhd:1205:26  */
  assign n2489_o = n2486_o | n2488_o;
  /* 6805.vhd:1209:15  */
  assign n2491_o = opcode == 8'b10000001;
  /* 6805.vhd:1214:32  */
  assign n2493_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1213:15  */
  assign n2495_o = opcode == 8'b10000011;
  /* 6805.vhd:1218:32  */
  assign n2497_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1217:15  */
  assign n2499_o = opcode == 8'b10101101;
  /* 6805.vhd:1217:26  */
  assign n2501_o = opcode == 8'b10111101;
  /* 6805.vhd:1217:26  */
  assign n2502_o = n2499_o | n2501_o;
  /* 6805.vhd:1217:34  */
  assign n2504_o = opcode == 8'b11101101;
  /* 6805.vhd:1217:34  */
  assign n2505_o = n2502_o | n2504_o;
  /* 6805.vhd:1222:32  */
  assign n2507_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1221:15  */
  assign n2509_o = opcode == 8'b11111101;
  /* 6805.vhd:1228:34  */
  assign n2511_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1225:15  */
  assign n2513_o = opcode == 8'b11001101;
  /* 6805.vhd:1225:26  */
  assign n2515_o = opcode == 8'b11011101;
  /* 6805.vhd:1225:26  */
  assign n2516_o = n2513_o | n2515_o;
  assign n2517_o = {n2516_o, n2509_o, n2505_o, n2495_o, n2491_o, n2489_o, n2482_o, n2477_o, n2463_o, n2445_o, n2427_o, n2408_o, n2387_o, n2366_o, n2348_o, n2328_o, n2310_o, n2289_o, n2279_o, n2269_o, n2259_o, n2249_o, n2239_o, n2229_o, n2222_o, n2215_o, n2211_o, n2090_o, n2026_o};
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2536_o = 1'b0;
      29'b01000000000000000000000000000: n2536_o = n3853_q;
      29'b00100000000000000000000000000: n2536_o = n3853_q;
      29'b00010000000000000000000000000: n2536_o = n3853_q;
      29'b00001000000000000000000000000: n2536_o = n3853_q;
      29'b00000100000000000000000000000: n2536_o = n3853_q;
      29'b00000010000000000000000000000: n2536_o = 1'b1;
      29'b00000001000000000000000000000: n2536_o = n3853_q;
      29'b00000000100000000000000000000: n2536_o = 1'b0;
      29'b00000000010000000000000000000: n2536_o = 1'b0;
      29'b00000000001000000000000000000: n2536_o = 1'b0;
      29'b00000000000100000000000000000: n2536_o = 1'b0;
      29'b00000000000010000000000000000: n2536_o = 1'b0;
      29'b00000000000001000000000000000: n2536_o = 1'b0;
      29'b00000000000000100000000000000: n2536_o = 1'b0;
      29'b00000000000000010000000000000: n2536_o = 1'b0;
      29'b00000000000000001000000000000: n2536_o = 1'b0;
      29'b00000000000000000100000000000: n2536_o = 1'b0;
      29'b00000000000000000010000000000: n2536_o = 1'b0;
      29'b00000000000000000001000000000: n2536_o = 1'b0;
      29'b00000000000000000000100000000: n2536_o = 1'b0;
      29'b00000000000000000000010000000: n2536_o = 1'b0;
      29'b00000000000000000000001000000: n2536_o = 1'b0;
      29'b00000000000000000000000100000: n2536_o = n3853_q;
      29'b00000000000000000000000010000: n2536_o = n3853_q;
      29'b00000000000000000000000001000: n2536_o = n3853_q;
      29'b00000000000000000000000000100: n2536_o = n3853_q;
      29'b00000000000000000000000000010: n2536_o = 1'b0;
      29'b00000000000000000000000000001: n2536_o = n3853_q;
      default: n2536_o = n3853_q;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2537_o = rega;
      29'b01000000000000000000000000000: n2537_o = rega;
      29'b00100000000000000000000000000: n2537_o = rega;
      29'b00010000000000000000000000000: n2537_o = rega;
      29'b00001000000000000000000000000: n2537_o = rega;
      29'b00000100000000000000000000000: n2537_o = datain;
      29'b00000010000000000000000000000: n2537_o = rega;
      29'b00000001000000000000000000000: n2537_o = rega;
      29'b00000000100000000000000000000: n2537_o = rega;
      29'b00000000010000000000000000000: n2537_o = rega;
      29'b00000000001000000000000000000: n2537_o = rega;
      29'b00000000000100000000000000000: n2537_o = rega;
      29'b00000000000010000000000000000: n2537_o = rega;
      29'b00000000000001000000000000000: n2537_o = rega;
      29'b00000000000000100000000000000: n2537_o = rega;
      29'b00000000000000010000000000000: n2537_o = rega;
      29'b00000000000000001000000000000: n2537_o = rega;
      29'b00000000000000000100000000000: n2537_o = rega;
      29'b00000000000000000010000000000: n2537_o = rega;
      29'b00000000000000000001000000000: n2537_o = rega;
      29'b00000000000000000000100000000: n2537_o = rega;
      29'b00000000000000000000010000000: n2537_o = rega;
      29'b00000000000000000000001000000: n2537_o = rega;
      29'b00000000000000000000000100000: n2537_o = rega;
      29'b00000000000000000000000010000: n2537_o = rega;
      29'b00000000000000000000000001000: n2537_o = rega;
      29'b00000000000000000000000000100: n2537_o = rega;
      29'b00000000000000000000000000010: n2537_o = rega;
      29'b00000000000000000000000000001: n2537_o = rega;
      default: n2537_o = rega;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2538_o = regsp;
      29'b01000000000000000000000000000: n2538_o = n2507_o;
      29'b00100000000000000000000000000: n2538_o = n2497_o;
      29'b00010000000000000000000000000: n2538_o = n2493_o;
      29'b00001000000000000000000000000: n2538_o = regsp;
      29'b00000100000000000000000000000: n2538_o = n2484_o;
      29'b00000010000000000000000000000: n2538_o = regsp;
      29'b00000001000000000000000000000: n2538_o = regsp;
      29'b00000000100000000000000000000: n2538_o = regsp;
      29'b00000000010000000000000000000: n2538_o = regsp;
      29'b00000000001000000000000000000: n2538_o = regsp;
      29'b00000000000100000000000000000: n2538_o = regsp;
      29'b00000000000010000000000000000: n2538_o = regsp;
      29'b00000000000001000000000000000: n2538_o = regsp;
      29'b00000000000000100000000000000: n2538_o = regsp;
      29'b00000000000000010000000000000: n2538_o = regsp;
      29'b00000000000000001000000000000: n2538_o = regsp;
      29'b00000000000000000100000000000: n2538_o = regsp;
      29'b00000000000000000010000000000: n2538_o = regsp;
      29'b00000000000000000001000000000: n2538_o = regsp;
      29'b00000000000000000000100000000: n2538_o = regsp;
      29'b00000000000000000000010000000: n2538_o = regsp;
      29'b00000000000000000000001000000: n2538_o = regsp;
      29'b00000000000000000000000100000: n2538_o = regsp;
      29'b00000000000000000000000010000: n2538_o = regsp;
      29'b00000000000000000000000001000: n2538_o = regsp;
      29'b00000000000000000000000000100: n2538_o = regsp;
      29'b00000000000000000000000000010: n2538_o = regsp;
      29'b00000000000000000000000000001: n2538_o = regsp;
      default: n2538_o = regsp;
    endcase
  assign n2539_o = n2104_o[7:0];
  assign n2540_o = n2213_o[7:0];
  assign n2541_o = n2220_o[7:0];
  assign n2542_o = n2227_o[7:0];
  assign n2543_o = n2237_o[7:0];
  assign n2544_o = n2247_o[7:0];
  assign n2545_o = n2257_o[7:0];
  assign n2546_o = n2267_o[7:0];
  assign n2547_o = n2277_o[7:0];
  assign n2548_o = n2287_o[7:0];
  assign n2549_o = n2511_o[7:0];
  assign n2550_o = regpc[7:0];
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2551_o = n2549_o;
      29'b01000000000000000000000000000: n2551_o = n2550_o;
      29'b00100000000000000000000000000: n2551_o = n2550_o;
      29'b00010000000000000000000000000: n2551_o = n2550_o;
      29'b00001000000000000000000000000: n2551_o = datain;
      29'b00000100000000000000000000000: n2551_o = n2550_o;
      29'b00000010000000000000000000000: n2551_o = n2550_o;
      29'b00000001000000000000000000000: n2551_o = n2550_o;
      29'b00000000100000000000000000000: n2551_o = n2550_o;
      29'b00000000010000000000000000000: n2551_o = n2550_o;
      29'b00000000001000000000000000000: n2551_o = n2550_o;
      29'b00000000000100000000000000000: n2551_o = n2550_o;
      29'b00000000000010000000000000000: n2551_o = n2550_o;
      29'b00000000000001000000000000000: n2551_o = n2550_o;
      29'b00000000000000100000000000000: n2551_o = n2550_o;
      29'b00000000000000010000000000000: n2551_o = n2550_o;
      29'b00000000000000001000000000000: n2551_o = n2550_o;
      29'b00000000000000000100000000000: n2551_o = n2548_o;
      29'b00000000000000000010000000000: n2551_o = n2547_o;
      29'b00000000000000000001000000000: n2551_o = n2546_o;
      29'b00000000000000000000100000000: n2551_o = n2545_o;
      29'b00000000000000000000010000000: n2551_o = n2544_o;
      29'b00000000000000000000001000000: n2551_o = n2543_o;
      29'b00000000000000000000000100000: n2551_o = n2542_o;
      29'b00000000000000000000000010000: n2551_o = n2541_o;
      29'b00000000000000000000000001000: n2551_o = n2540_o;
      29'b00000000000000000000000000100: n2551_o = n2539_o;
      29'b00000000000000000000000000010: n2551_o = n2550_o;
      29'b00000000000000000000000000001: n2551_o = n2550_o;
      default: n2551_o = n2550_o;
    endcase
  assign n2552_o = n2104_o[15:8];
  assign n2553_o = n2213_o[15:8];
  assign n2554_o = n2220_o[15:8];
  assign n2555_o = n2227_o[15:8];
  assign n2556_o = n2237_o[15:8];
  assign n2557_o = n2247_o[15:8];
  assign n2558_o = n2257_o[15:8];
  assign n2559_o = n2267_o[15:8];
  assign n2560_o = n2277_o[15:8];
  assign n2561_o = n2287_o[15:8];
  assign n2562_o = n2511_o[15:8];
  assign n2563_o = regpc[15:8];
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2564_o = n2562_o;
      29'b01000000000000000000000000000: n2564_o = n2563_o;
      29'b00100000000000000000000000000: n2564_o = n2563_o;
      29'b00010000000000000000000000000: n2564_o = n2563_o;
      29'b00001000000000000000000000000: n2564_o = n2563_o;
      29'b00000100000000000000000000000: n2564_o = n2563_o;
      29'b00000010000000000000000000000: n2564_o = n2563_o;
      29'b00000001000000000000000000000: n2564_o = n2563_o;
      29'b00000000100000000000000000000: n2564_o = n2563_o;
      29'b00000000010000000000000000000: n2564_o = n2563_o;
      29'b00000000001000000000000000000: n2564_o = n2563_o;
      29'b00000000000100000000000000000: n2564_o = n2563_o;
      29'b00000000000010000000000000000: n2564_o = n2563_o;
      29'b00000000000001000000000000000: n2564_o = n2563_o;
      29'b00000000000000100000000000000: n2564_o = n2563_o;
      29'b00000000000000010000000000000: n2564_o = n2563_o;
      29'b00000000000000001000000000000: n2564_o = n2563_o;
      29'b00000000000000000100000000000: n2564_o = n2561_o;
      29'b00000000000000000010000000000: n2564_o = n2560_o;
      29'b00000000000000000001000000000: n2564_o = n2559_o;
      29'b00000000000000000000100000000: n2564_o = n2558_o;
      29'b00000000000000000000010000000: n2564_o = n2557_o;
      29'b00000000000000000000001000000: n2564_o = n2556_o;
      29'b00000000000000000000000100000: n2564_o = n2555_o;
      29'b00000000000000000000000010000: n2564_o = n2554_o;
      29'b00000000000000000000000001000: n2564_o = n2553_o;
      29'b00000000000000000000000000100: n2564_o = n2552_o;
      29'b00000000000000000000000000010: n2564_o = n2563_o;
      29'b00000000000000000000000000001: n2564_o = n2563_o;
      default: n2564_o = n2563_o;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2566_o = flagn;
      29'b01000000000000000000000000000: n2566_o = flagn;
      29'b00100000000000000000000000000: n2566_o = flagn;
      29'b00010000000000000000000000000: n2566_o = flagn;
      29'b00001000000000000000000000000: n2566_o = flagn;
      29'b00000100000000000000000000000: n2566_o = flagn;
      29'b00000010000000000000000000000: n2566_o = flagn;
      29'b00000001000000000000000000000: n2566_o = n2464_o;
      29'b00000000100000000000000000000: n2566_o = n2450_o;
      29'b00000000010000000000000000000: n2566_o = n2432_o;
      29'b00000000001000000000000000000: n2566_o = n2413_o;
      29'b00000000000100000000000000000: n2566_o = n2394_o;
      29'b00000000000010000000000000000: n2566_o = n2373_o;
      29'b00000000000001000000000000000: n2566_o = flagc;
      29'b00000000000000100000000000000: n2566_o = 1'b0;
      29'b00000000000000010000000000000: n2566_o = n2315_o;
      29'b00000000000000001000000000000: n2566_o = n2294_o;
      29'b00000000000000000100000000000: n2566_o = n2280_o;
      29'b00000000000000000010000000000: n2566_o = n2270_o;
      29'b00000000000000000001000000000: n2566_o = n2260_o;
      29'b00000000000000000000100000000: n2566_o = n2250_o;
      29'b00000000000000000000010000000: n2566_o = n2240_o;
      29'b00000000000000000000001000000: n2566_o = n2230_o;
      29'b00000000000000000000000100000: n2566_o = flagn;
      29'b00000000000000000000000010000: n2566_o = flagn;
      29'b00000000000000000000000001000: n2566_o = flagn;
      29'b00000000000000000000000000100: n2566_o = flagn;
      29'b00000000000000000000000000010: n2566_o = flagn;
      29'b00000000000000000000000000001: n2566_o = flagn;
      default: n2566_o = flagn;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2567_o = flagz;
      29'b01000000000000000000000000000: n2567_o = flagz;
      29'b00100000000000000000000000000: n2567_o = flagz;
      29'b00010000000000000000000000000: n2567_o = flagz;
      29'b00001000000000000000000000000: n2567_o = flagz;
      29'b00000100000000000000000000000: n2567_o = flagz;
      29'b00000010000000000000000000000: n2567_o = flagz;
      29'b00000001000000000000000000000: n2567_o = n2469_o;
      29'b00000000100000000000000000000: n2567_o = n2455_o;
      29'b00000000010000000000000000000: n2567_o = n2437_o;
      29'b00000000001000000000000000000: n2567_o = n2419_o;
      29'b00000000000100000000000000000: n2567_o = n2400_o;
      29'b00000000000010000000000000000: n2567_o = n2379_o;
      29'b00000000000001000000000000000: n2567_o = n2358_o;
      29'b00000000000000100000000000000: n2567_o = n2340_o;
      29'b00000000000000010000000000000: n2567_o = n2320_o;
      29'b00000000000000001000000000000: n2567_o = n2299_o;
      29'b00000000000000000100000000000: n2567_o = n2285_o;
      29'b00000000000000000010000000000: n2567_o = n2275_o;
      29'b00000000000000000001000000000: n2567_o = n2265_o;
      29'b00000000000000000000100000000: n2567_o = n2255_o;
      29'b00000000000000000000010000000: n2567_o = n2245_o;
      29'b00000000000000000000001000000: n2567_o = n2235_o;
      29'b00000000000000000000000100000: n2567_o = flagz;
      29'b00000000000000000000000010000: n2567_o = flagz;
      29'b00000000000000000000000001000: n2567_o = flagz;
      29'b00000000000000000000000000100: n2567_o = flagz;
      29'b00000000000000000000000000010: n2567_o = flagz;
      29'b00000000000000000000000000001: n2567_o = flagz;
      default: n2567_o = flagz;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2569_o = flagc;
      29'b01000000000000000000000000000: n2569_o = flagc;
      29'b00100000000000000000000000000: n2569_o = flagc;
      29'b00010000000000000000000000000: n2569_o = flagc;
      29'b00001000000000000000000000000: n2569_o = flagc;
      29'b00000100000000000000000000000: n2569_o = flagc;
      29'b00000010000000000000000000000: n2569_o = flagc;
      29'b00000001000000000000000000000: n2569_o = flagc;
      29'b00000000100000000000000000000: n2569_o = flagc;
      29'b00000000010000000000000000000: n2569_o = flagc;
      29'b00000000001000000000000000000: n2569_o = n2414_o;
      29'b00000000000100000000000000000: n2569_o = n2395_o;
      29'b00000000000010000000000000000: n2569_o = n2374_o;
      29'b00000000000001000000000000000: n2569_o = n2353_o;
      29'b00000000000000100000000000000: n2569_o = n2335_o;
      29'b00000000000000010000000000000: n2569_o = 1'b1;
      29'b00000000000000001000000000000: n2569_o = n2302_o;
      29'b00000000000000000100000000000: n2569_o = flagc;
      29'b00000000000000000010000000000: n2569_o = flagc;
      29'b00000000000000000001000000000: n2569_o = flagc;
      29'b00000000000000000000100000000: n2569_o = flagc;
      29'b00000000000000000000010000000: n2569_o = flagc;
      29'b00000000000000000000001000000: n2569_o = flagc;
      29'b00000000000000000000000100000: n2569_o = flagc;
      29'b00000000000000000000000010000: n2569_o = flagc;
      29'b00000000000000000000000001000: n2569_o = flagc;
      29'b00000000000000000000000000100: n2569_o = flagc;
      29'b00000000000000000000000000010: n2569_o = flagc;
      29'b00000000000000000000000000001: n2569_o = n1979_o;
      default: n2569_o = flagc;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2570_o = help;
      29'b01000000000000000000000000000: n2570_o = help;
      29'b00100000000000000000000000000: n2570_o = help;
      29'b00010000000000000000000000000: n2570_o = help;
      29'b00001000000000000000000000000: n2570_o = help;
      29'b00000100000000000000000000000: n2570_o = help;
      29'b00000010000000000000000000000: n2570_o = help;
      29'b00000001000000000000000000000: n2570_o = help;
      29'b00000000100000000000000000000: n2570_o = n2447_o;
      29'b00000000010000000000000000000: n2570_o = n2429_o;
      29'b00000000001000000000000000000: n2570_o = n2410_o;
      29'b00000000000100000000000000000: n2570_o = n2390_o;
      29'b00000000000010000000000000000: n2570_o = n2369_o;
      29'b00000000000001000000000000000: n2570_o = n2350_o;
      29'b00000000000000100000000000000: n2570_o = n2331_o;
      29'b00000000000000010000000000000: n2570_o = n2312_o;
      29'b00000000000000001000000000000: n2570_o = n2291_o;
      29'b00000000000000000100000000000: n2570_o = help;
      29'b00000000000000000010000000000: n2570_o = help;
      29'b00000000000000000001000000000: n2570_o = help;
      29'b00000000000000000000100000000: n2570_o = help;
      29'b00000000000000000000010000000: n2570_o = help;
      29'b00000000000000000000001000000: n2570_o = help;
      29'b00000000000000000000000100000: n2570_o = help;
      29'b00000000000000000000000010000: n2570_o = help;
      29'b00000000000000000000000001000: n2570_o = help;
      29'b00000000000000000000000000100: n2570_o = help;
      29'b00000000000000000000000000010: n2570_o = n2043_o;
      29'b00000000000000000000000000001: n2570_o = help;
      default: n2570_o = help;
    endcase
  assign n2571_o = temp[7:0];
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2572_o = datain;
      29'b01000000000000000000000000000: n2572_o = n2571_o;
      29'b00100000000000000000000000000: n2572_o = n2571_o;
      29'b00010000000000000000000000000: n2572_o = n2571_o;
      29'b00001000000000000000000000000: n2572_o = n2571_o;
      29'b00000100000000000000000000000: n2572_o = n2571_o;
      29'b00000010000000000000000000000: n2572_o = n2571_o;
      29'b00000001000000000000000000000: n2572_o = n2571_o;
      29'b00000000100000000000000000000: n2572_o = n2571_o;
      29'b00000000010000000000000000000: n2572_o = n2571_o;
      29'b00000000001000000000000000000: n2572_o = n2571_o;
      29'b00000000000100000000000000000: n2572_o = n2571_o;
      29'b00000000000010000000000000000: n2572_o = n2571_o;
      29'b00000000000001000000000000000: n2572_o = n2571_o;
      29'b00000000000000100000000000000: n2572_o = n2571_o;
      29'b00000000000000010000000000000: n2572_o = n2571_o;
      29'b00000000000000001000000000000: n2572_o = n2571_o;
      29'b00000000000000000100000000000: n2572_o = datain;
      29'b00000000000000000010000000000: n2572_o = datain;
      29'b00000000000000000001000000000: n2572_o = datain;
      29'b00000000000000000000100000000: n2572_o = datain;
      29'b00000000000000000000010000000: n2572_o = datain;
      29'b00000000000000000000001000000: n2572_o = datain;
      29'b00000000000000000000000100000: n2572_o = n2571_o;
      29'b00000000000000000000000010000: n2572_o = n2571_o;
      29'b00000000000000000000000001000: n2572_o = n2571_o;
      29'b00000000000000000000000000100: n2572_o = datain;
      29'b00000000000000000000000000010: n2572_o = n2571_o;
      29'b00000000000000000000000000001: n2572_o = n2571_o;
      default: n2572_o = n2571_o;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2603_o = 4'b0101;
      29'b01000000000000000000000000000: n2603_o = 4'b0101;
      29'b00100000000000000000000000000: n2603_o = 4'b0101;
      29'b00010000000000000000000000000: n2603_o = 4'b0101;
      29'b00001000000000000000000000000: n2603_o = 4'b0010;
      29'b00000100000000000000000000000: n2603_o = 4'b0101;
      29'b00000010000000000000000000000: n2603_o = 4'b0010;
      29'b00000001000000000000000000000: n2603_o = 4'b0010;
      29'b00000000100000000000000000000: n2603_o = 4'b0101;
      29'b00000000010000000000000000000: n2603_o = 4'b0101;
      29'b00000000001000000000000000000: n2603_o = 4'b0101;
      29'b00000000000100000000000000000: n2603_o = 4'b0101;
      29'b00000000000010000000000000000: n2603_o = 4'b0101;
      29'b00000000000001000000000000000: n2603_o = 4'b0101;
      29'b00000000000000100000000000000: n2603_o = 4'b0101;
      29'b00000000000000010000000000000: n2603_o = 4'b0101;
      29'b00000000000000001000000000000: n2603_o = 4'b0101;
      29'b00000000000000000100000000000: n2603_o = 4'b0101;
      29'b00000000000000000010000000000: n2603_o = 4'b0101;
      29'b00000000000000000001000000000: n2603_o = 4'b0101;
      29'b00000000000000000000100000000: n2603_o = 4'b0101;
      29'b00000000000000000000010000000: n2603_o = 4'b0101;
      29'b00000000000000000000001000000: n2603_o = 4'b0101;
      29'b00000000000000000000000100000: n2603_o = 4'b0010;
      29'b00000000000000000000000010000: n2603_o = 4'b0010;
      29'b00000000000000000000000001000: n2603_o = 4'b0010;
      29'b00000000000000000000000000100: n2603_o = 4'b0101;
      29'b00000000000000000000000000010: n2603_o = 4'b0101;
      29'b00000000000000000000000000001: n2603_o = 4'b0101;
      default: n2603_o = 4'b0000;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2615_o = 3'b001;
      29'b01000000000000000000000000000: n2615_o = addrmux;
      29'b00100000000000000000000000000: n2615_o = addrmux;
      29'b00010000000000000000000000000: n2615_o = addrmux;
      29'b00001000000000000000000000000: n2615_o = 3'b000;
      29'b00000100000000000000000000000: n2615_o = addrmux;
      29'b00000010000000000000000000000: n2615_o = 3'b000;
      29'b00000001000000000000000000000: n2615_o = 3'b000;
      29'b00000000100000000000000000000: n2615_o = addrmux;
      29'b00000000010000000000000000000: n2615_o = addrmux;
      29'b00000000001000000000000000000: n2615_o = addrmux;
      29'b00000000000100000000000000000: n2615_o = addrmux;
      29'b00000000000010000000000000000: n2615_o = addrmux;
      29'b00000000000001000000000000000: n2615_o = addrmux;
      29'b00000000000000100000000000000: n2615_o = addrmux;
      29'b00000000000000010000000000000: n2615_o = addrmux;
      29'b00000000000000001000000000000: n2615_o = addrmux;
      29'b00000000000000000100000000000: n2615_o = 3'b110;
      29'b00000000000000000010000000000: n2615_o = 3'b100;
      29'b00000000000000000001000000000: n2615_o = 3'b011;
      29'b00000000000000000000100000000: n2615_o = 3'b110;
      29'b00000000000000000000010000000: n2615_o = 3'b100;
      29'b00000000000000000000001000000: n2615_o = 3'b011;
      29'b00000000000000000000000100000: n2615_o = addrmux;
      29'b00000000000000000000000010000: n2615_o = addrmux;
      29'b00000000000000000000000001000: n2615_o = addrmux;
      29'b00000000000000000000000000100: n2615_o = n2102_o;
      29'b00000000000000000000000000010: n2615_o = addrmux;
      29'b00000000000000000000000000001: n2615_o = 3'b000;
      default: n2615_o = addrmux;
    endcase
  /* 6805.vhd:944:13  */
  always @*
    case (n2517_o)
      29'b10000000000000000000000000000: n2636_o = 4'b0101;
      29'b01000000000000000000000000000: n2636_o = 4'b1000;
      29'b00100000000000000000000000000: n2636_o = 4'b0110;
      29'b00010000000000000000000000000: n2636_o = 4'b0110;
      29'b00001000000000000000000000000: n2636_o = datamux;
      29'b00000100000000000000000000000: n2636_o = datamux;
      29'b00000010000000000000000000000: n2636_o = datamux;
      29'b00000001000000000000000000000: n2636_o = datamux;
      29'b00000000100000000000000000000: n2636_o = 4'b1001;
      29'b00000000010000000000000000000: n2636_o = 4'b1001;
      29'b00000000001000000000000000000: n2636_o = 4'b1001;
      29'b00000000000100000000000000000: n2636_o = 4'b1001;
      29'b00000000000010000000000000000: n2636_o = 4'b1001;
      29'b00000000000001000000000000000: n2636_o = 4'b1001;
      29'b00000000000000100000000000000: n2636_o = 4'b1001;
      29'b00000000000000010000000000000: n2636_o = 4'b1001;
      29'b00000000000000001000000000000: n2636_o = 4'b1001;
      29'b00000000000000000100000000000: n2636_o = 4'b0010;
      29'b00000000000000000010000000000: n2636_o = 4'b0010;
      29'b00000000000000000001000000000: n2636_o = 4'b0010;
      29'b00000000000000000000100000000: n2636_o = 4'b0000;
      29'b00000000000000000000010000000: n2636_o = 4'b0000;
      29'b00000000000000000000001000000: n2636_o = 4'b0000;
      29'b00000000000000000000000100000: n2636_o = datamux;
      29'b00000000000000000000000010000: n2636_o = datamux;
      29'b00000000000000000000000001000: n2636_o = datamux;
      29'b00000000000000000000000000100: n2636_o = datamux;
      29'b00000000000000000000000000010: n2636_o = 4'b1001;
      29'b00000000000000000000000000001: n2636_o = datamux;
      default: n2636_o = datamux;
    endcase
  /* 6805.vhd:943:11  */
  assign n2639_o = mainfsm == 4'b0100;
  /* 6805.vhd:1241:27  */
  assign n2640_o = opcode[0];
  /* 6805.vhd:1241:31  */
  assign n2641_o = n2640_o ^ flagc;
  /* 6805.vhd:1242:28  */
  assign n2642_o = datain[7];
  /* 6805.vhd:1242:32  */
  assign n2643_o = ~n2642_o;
  /* 6805.vhd:1243:45  */
  assign n2645_o = {8'b00000000, datain};
  /* 6805.vhd:1243:36  */
  assign n2646_o = regpc + n2645_o;
  /* 6805.vhd:1243:55  */
  assign n2648_o = n2646_o + 16'b0000000000000001;
  /* 6805.vhd:1245:45  */
  assign n2650_o = {8'b11111111, datain};
  /* 6805.vhd:1245:36  */
  assign n2651_o = regpc + n2650_o;
  /* 6805.vhd:1245:55  */
  assign n2653_o = n2651_o + 16'b0000000000000001;
  /* 6805.vhd:1242:19  */
  assign n2654_o = n2643_o ? n2648_o : n2653_o;
  /* 6805.vhd:1248:34  */
  assign n2656_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1241:17  */
  assign n2657_o = n2641_o ? n2654_o : n2656_o;
  /* 6805.vhd:1239:15  */
  assign n2659_o = opcode == 8'b00000000;
  /* 6805.vhd:1239:26  */
  assign n2661_o = opcode == 8'b00000010;
  /* 6805.vhd:1239:26  */
  assign n2662_o = n2659_o | n2661_o;
  /* 6805.vhd:1239:34  */
  assign n2664_o = opcode == 8'b00000100;
  /* 6805.vhd:1239:34  */
  assign n2665_o = n2662_o | n2664_o;
  /* 6805.vhd:1239:42  */
  assign n2667_o = opcode == 8'b00000110;
  /* 6805.vhd:1239:42  */
  assign n2668_o = n2665_o | n2667_o;
  /* 6805.vhd:1239:50  */
  assign n2670_o = opcode == 8'b00001000;
  /* 6805.vhd:1239:50  */
  assign n2671_o = n2668_o | n2670_o;
  /* 6805.vhd:1239:58  */
  assign n2673_o = opcode == 8'b00001010;
  /* 6805.vhd:1239:58  */
  assign n2674_o = n2671_o | n2673_o;
  /* 6805.vhd:1239:66  */
  assign n2676_o = opcode == 8'b00001100;
  /* 6805.vhd:1239:66  */
  assign n2677_o = n2674_o | n2676_o;
  /* 6805.vhd:1239:74  */
  assign n2679_o = opcode == 8'b00001110;
  /* 6805.vhd:1239:74  */
  assign n2680_o = n2677_o | n2679_o;
  /* 6805.vhd:1239:82  */
  assign n2682_o = opcode == 8'b00000001;
  /* 6805.vhd:1239:82  */
  assign n2683_o = n2680_o | n2682_o;
  /* 6805.vhd:1240:26  */
  assign n2685_o = opcode == 8'b00000011;
  /* 6805.vhd:1240:26  */
  assign n2686_o = n2683_o | n2685_o;
  /* 6805.vhd:1240:34  */
  assign n2688_o = opcode == 8'b00000101;
  /* 6805.vhd:1240:34  */
  assign n2689_o = n2686_o | n2688_o;
  /* 6805.vhd:1240:42  */
  assign n2691_o = opcode == 8'b00000111;
  /* 6805.vhd:1240:42  */
  assign n2692_o = n2689_o | n2691_o;
  /* 6805.vhd:1240:50  */
  assign n2694_o = opcode == 8'b00001001;
  /* 6805.vhd:1240:50  */
  assign n2695_o = n2692_o | n2694_o;
  /* 6805.vhd:1240:58  */
  assign n2697_o = opcode == 8'b00001011;
  /* 6805.vhd:1240:58  */
  assign n2698_o = n2695_o | n2697_o;
  /* 6805.vhd:1240:66  */
  assign n2700_o = opcode == 8'b00001101;
  /* 6805.vhd:1240:66  */
  assign n2701_o = n2698_o | n2700_o;
  /* 6805.vhd:1240:74  */
  assign n2703_o = opcode == 8'b00001111;
  /* 6805.vhd:1240:74  */
  assign n2704_o = n2701_o | n2703_o;
  /* 6805.vhd:1252:15  */
  assign n2706_o = opcode == 8'b00010000;
  /* 6805.vhd:1252:26  */
  assign n2708_o = opcode == 8'b00010010;
  /* 6805.vhd:1252:26  */
  assign n2709_o = n2706_o | n2708_o;
  /* 6805.vhd:1252:34  */
  assign n2711_o = opcode == 8'b00010100;
  /* 6805.vhd:1252:34  */
  assign n2712_o = n2709_o | n2711_o;
  /* 6805.vhd:1252:42  */
  assign n2714_o = opcode == 8'b00010110;
  /* 6805.vhd:1252:42  */
  assign n2715_o = n2712_o | n2714_o;
  /* 6805.vhd:1252:50  */
  assign n2717_o = opcode == 8'b00011000;
  /* 6805.vhd:1252:50  */
  assign n2718_o = n2715_o | n2717_o;
  /* 6805.vhd:1252:58  */
  assign n2720_o = opcode == 8'b00011010;
  /* 6805.vhd:1252:58  */
  assign n2721_o = n2718_o | n2720_o;
  /* 6805.vhd:1252:66  */
  assign n2723_o = opcode == 8'b00011100;
  /* 6805.vhd:1252:66  */
  assign n2724_o = n2721_o | n2723_o;
  /* 6805.vhd:1252:74  */
  assign n2726_o = opcode == 8'b00011110;
  /* 6805.vhd:1252:74  */
  assign n2727_o = n2724_o | n2726_o;
  /* 6805.vhd:1252:82  */
  assign n2729_o = opcode == 8'b00010001;
  /* 6805.vhd:1252:82  */
  assign n2730_o = n2727_o | n2729_o;
  /* 6805.vhd:1253:26  */
  assign n2732_o = opcode == 8'b00010011;
  /* 6805.vhd:1253:26  */
  assign n2733_o = n2730_o | n2732_o;
  /* 6805.vhd:1253:34  */
  assign n2735_o = opcode == 8'b00010101;
  /* 6805.vhd:1253:34  */
  assign n2736_o = n2733_o | n2735_o;
  /* 6805.vhd:1253:42  */
  assign n2738_o = opcode == 8'b00010111;
  /* 6805.vhd:1253:42  */
  assign n2739_o = n2736_o | n2738_o;
  /* 6805.vhd:1253:50  */
  assign n2741_o = opcode == 8'b00011001;
  /* 6805.vhd:1253:50  */
  assign n2742_o = n2739_o | n2741_o;
  /* 6805.vhd:1253:58  */
  assign n2744_o = opcode == 8'b00011011;
  /* 6805.vhd:1253:58  */
  assign n2745_o = n2742_o | n2744_o;
  /* 6805.vhd:1253:66  */
  assign n2747_o = opcode == 8'b00011101;
  /* 6805.vhd:1253:66  */
  assign n2748_o = n2745_o | n2747_o;
  /* 6805.vhd:1253:74  */
  assign n2750_o = opcode == 8'b00011111;
  /* 6805.vhd:1253:74  */
  assign n2751_o = n2748_o | n2750_o;
  /* 6805.vhd:1253:82  */
  assign n2753_o = opcode == 8'b00110000;
  /* 6805.vhd:1253:82  */
  assign n2754_o = n2751_o | n2753_o;
  /* 6805.vhd:1254:26  */
  assign n2756_o = opcode == 8'b00110011;
  /* 6805.vhd:1254:26  */
  assign n2757_o = n2754_o | n2756_o;
  /* 6805.vhd:1254:34  */
  assign n2759_o = opcode == 8'b00110100;
  /* 6805.vhd:1254:34  */
  assign n2760_o = n2757_o | n2759_o;
  /* 6805.vhd:1254:42  */
  assign n2762_o = opcode == 8'b00110110;
  /* 6805.vhd:1254:42  */
  assign n2763_o = n2760_o | n2762_o;
  /* 6805.vhd:1254:50  */
  assign n2765_o = opcode == 8'b00110111;
  /* 6805.vhd:1254:50  */
  assign n2766_o = n2763_o | n2765_o;
  /* 6805.vhd:1255:26  */
  assign n2768_o = opcode == 8'b00111000;
  /* 6805.vhd:1255:26  */
  assign n2769_o = n2766_o | n2768_o;
  /* 6805.vhd:1255:34  */
  assign n2771_o = opcode == 8'b00111001;
  /* 6805.vhd:1255:34  */
  assign n2772_o = n2769_o | n2771_o;
  /* 6805.vhd:1255:42  */
  assign n2774_o = opcode == 8'b00111010;
  /* 6805.vhd:1255:42  */
  assign n2775_o = n2772_o | n2774_o;
  /* 6805.vhd:1255:50  */
  assign n2777_o = opcode == 8'b00111100;
  /* 6805.vhd:1255:50  */
  assign n2778_o = n2775_o | n2777_o;
  /* 6805.vhd:1255:58  */
  assign n2780_o = opcode == 8'b01100000;
  /* 6805.vhd:1255:58  */
  assign n2781_o = n2778_o | n2780_o;
  /* 6805.vhd:1256:26  */
  assign n2783_o = opcode == 8'b01100011;
  /* 6805.vhd:1256:26  */
  assign n2784_o = n2781_o | n2783_o;
  /* 6805.vhd:1256:34  */
  assign n2786_o = opcode == 8'b01100100;
  /* 6805.vhd:1256:34  */
  assign n2787_o = n2784_o | n2786_o;
  /* 6805.vhd:1256:42  */
  assign n2789_o = opcode == 8'b01100110;
  /* 6805.vhd:1256:42  */
  assign n2790_o = n2787_o | n2789_o;
  /* 6805.vhd:1256:50  */
  assign n2792_o = opcode == 8'b01100111;
  /* 6805.vhd:1256:50  */
  assign n2793_o = n2790_o | n2792_o;
  /* 6805.vhd:1256:58  */
  assign n2795_o = opcode == 8'b01101000;
  /* 6805.vhd:1256:58  */
  assign n2796_o = n2793_o | n2795_o;
  /* 6805.vhd:1257:26  */
  assign n2798_o = opcode == 8'b01101001;
  /* 6805.vhd:1257:26  */
  assign n2799_o = n2796_o | n2798_o;
  /* 6805.vhd:1257:34  */
  assign n2801_o = opcode == 8'b01101010;
  /* 6805.vhd:1257:34  */
  assign n2802_o = n2799_o | n2801_o;
  /* 6805.vhd:1257:42  */
  assign n2804_o = opcode == 8'b01101100;
  /* 6805.vhd:1257:42  */
  assign n2805_o = n2802_o | n2804_o;
  /* 6805.vhd:1257:50  */
  assign n2807_o = opcode == 8'b01110000;
  /* 6805.vhd:1257:50  */
  assign n2808_o = n2805_o | n2807_o;
  /* 6805.vhd:1258:26  */
  assign n2810_o = opcode == 8'b01110011;
  /* 6805.vhd:1258:26  */
  assign n2811_o = n2808_o | n2810_o;
  /* 6805.vhd:1258:34  */
  assign n2813_o = opcode == 8'b01110100;
  /* 6805.vhd:1258:34  */
  assign n2814_o = n2811_o | n2813_o;
  /* 6805.vhd:1258:42  */
  assign n2816_o = opcode == 8'b01110110;
  /* 6805.vhd:1258:42  */
  assign n2817_o = n2814_o | n2816_o;
  /* 6805.vhd:1258:50  */
  assign n2819_o = opcode == 8'b01110111;
  /* 6805.vhd:1258:50  */
  assign n2820_o = n2817_o | n2819_o;
  /* 6805.vhd:1258:58  */
  assign n2822_o = opcode == 8'b01111000;
  /* 6805.vhd:1258:58  */
  assign n2823_o = n2820_o | n2822_o;
  /* 6805.vhd:1258:66  */
  assign n2825_o = opcode == 8'b01111001;
  /* 6805.vhd:1258:66  */
  assign n2826_o = n2823_o | n2825_o;
  /* 6805.vhd:1258:74  */
  assign n2828_o = opcode == 8'b01111010;
  /* 6805.vhd:1258:74  */
  assign n2829_o = n2826_o | n2828_o;
  /* 6805.vhd:1259:26  */
  assign n2831_o = opcode == 8'b01111100;
  /* 6805.vhd:1259:26  */
  assign n2832_o = n2829_o | n2831_o;
  /* 6805.vhd:1259:34  */
  assign n2834_o = opcode == 8'b10110111;
  /* 6805.vhd:1259:34  */
  assign n2835_o = n2832_o | n2834_o;
  /* 6805.vhd:1260:26  */
  assign n2837_o = opcode == 8'b10111111;
  /* 6805.vhd:1260:26  */
  assign n2838_o = n2835_o | n2837_o;
  /* 6805.vhd:1260:34  */
  assign n2840_o = opcode == 8'b11000111;
  /* 6805.vhd:1260:34  */
  assign n2841_o = n2838_o | n2840_o;
  /* 6805.vhd:1260:42  */
  assign n2843_o = opcode == 8'b11001111;
  /* 6805.vhd:1260:42  */
  assign n2844_o = n2841_o | n2843_o;
  /* 6805.vhd:1260:50  */
  assign n2846_o = opcode == 8'b11010111;
  /* 6805.vhd:1260:50  */
  assign n2847_o = n2844_o | n2846_o;
  /* 6805.vhd:1261:26  */
  assign n2849_o = opcode == 8'b11011111;
  /* 6805.vhd:1261:26  */
  assign n2850_o = n2847_o | n2849_o;
  /* 6805.vhd:1261:34  */
  assign n2852_o = opcode == 8'b11100111;
  /* 6805.vhd:1261:34  */
  assign n2853_o = n2850_o | n2852_o;
  /* 6805.vhd:1261:42  */
  assign n2855_o = opcode == 8'b11101111;
  /* 6805.vhd:1261:42  */
  assign n2856_o = n2853_o | n2855_o;
  /* 6805.vhd:1261:50  */
  assign n2858_o = opcode == 8'b11110111;
  /* 6805.vhd:1261:50  */
  assign n2859_o = n2856_o | n2858_o;
  /* 6805.vhd:1262:26  */
  assign n2861_o = opcode == 8'b11111111;
  /* 6805.vhd:1262:26  */
  assign n2862_o = n2859_o | n2861_o;
  /* 6805.vhd:1268:32  */
  assign n2864_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1266:15  */
  assign n2866_o = opcode == 8'b10000000;
  /* 6805.vhd:1266:26  */
  assign n2868_o = opcode == 8'b10000010;
  /* 6805.vhd:1266:26  */
  assign n2869_o = n2866_o | n2868_o;
  /* 6805.vhd:1271:32  */
  assign n2871_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1270:15  */
  assign n2876_o = opcode == 8'b10000011;
  /* 6805.vhd:1284:30  */
  assign n2877_o = rega - datain;
  /* 6805.vhd:1285:30  */
  assign n2878_o = rega - datain;
  /* 6805.vhd:1286:30  */
  assign n2879_o = n2878_o[7];
  /* 6805.vhd:1287:25  */
  assign n2881_o = n2878_o == 8'b00000000;
  /* 6805.vhd:1287:17  */
  assign n2884_o = n2881_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1292:36  */
  assign n2885_o = rega[7];
  /* 6805.vhd:1292:28  */
  assign n2886_o = ~n2885_o;
  /* 6805.vhd:1292:51  */
  assign n2887_o = datain[7];
  /* 6805.vhd:1292:41  */
  assign n2888_o = n2886_o & n2887_o;
  /* 6805.vhd:1293:33  */
  assign n2889_o = datain[7];
  /* 6805.vhd:1293:45  */
  assign n2890_o = n2878_o[7];
  /* 6805.vhd:1293:37  */
  assign n2891_o = n2889_o & n2890_o;
  /* 6805.vhd:1292:56  */
  assign n2892_o = n2888_o | n2891_o;
  /* 6805.vhd:1294:31  */
  assign n2893_o = n2878_o[7];
  /* 6805.vhd:1294:48  */
  assign n2894_o = rega[7];
  /* 6805.vhd:1294:40  */
  assign n2895_o = ~n2894_o;
  /* 6805.vhd:1294:35  */
  assign n2896_o = n2893_o & n2895_o;
  /* 6805.vhd:1293:50  */
  assign n2897_o = n2892_o | n2896_o;
  /* 6805.vhd:1295:27  */
  assign n2899_o = opcode == 8'b10100000;
  /* 6805.vhd:1296:34  */
  assign n2901_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1295:17  */
  assign n2902_o = n2899_o ? n2901_o : regpc;
  /* 6805.vhd:1282:15  */
  assign n2904_o = opcode == 8'b10100000;
  /* 6805.vhd:1282:26  */
  assign n2906_o = opcode == 8'b10110000;
  /* 6805.vhd:1282:26  */
  assign n2907_o = n2904_o | n2906_o;
  /* 6805.vhd:1282:34  */
  assign n2909_o = opcode == 8'b11000000;
  /* 6805.vhd:1282:34  */
  assign n2910_o = n2907_o | n2909_o;
  /* 6805.vhd:1282:42  */
  assign n2912_o = opcode == 8'b11010000;
  /* 6805.vhd:1282:42  */
  assign n2913_o = n2910_o | n2912_o;
  /* 6805.vhd:1282:50  */
  assign n2915_o = opcode == 8'b11100000;
  /* 6805.vhd:1282:50  */
  assign n2916_o = n2913_o | n2915_o;
  /* 6805.vhd:1282:58  */
  assign n2918_o = opcode == 8'b11110000;
  /* 6805.vhd:1282:58  */
  assign n2919_o = n2916_o | n2918_o;
  /* 6805.vhd:1301:30  */
  assign n2920_o = rega - datain;
  /* 6805.vhd:1302:30  */
  assign n2921_o = n2920_o[7];
  /* 6805.vhd:1303:25  */
  assign n2923_o = n2920_o == 8'b00000000;
  /* 6805.vhd:1303:17  */
  assign n2926_o = n2923_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1308:36  */
  assign n2927_o = rega[7];
  /* 6805.vhd:1308:28  */
  assign n2928_o = ~n2927_o;
  /* 6805.vhd:1308:51  */
  assign n2929_o = datain[7];
  /* 6805.vhd:1308:41  */
  assign n2930_o = n2928_o & n2929_o;
  /* 6805.vhd:1309:33  */
  assign n2931_o = datain[7];
  /* 6805.vhd:1309:45  */
  assign n2932_o = n2920_o[7];
  /* 6805.vhd:1309:37  */
  assign n2933_o = n2931_o & n2932_o;
  /* 6805.vhd:1308:56  */
  assign n2934_o = n2930_o | n2933_o;
  /* 6805.vhd:1310:31  */
  assign n2935_o = n2920_o[7];
  /* 6805.vhd:1310:48  */
  assign n2936_o = rega[7];
  /* 6805.vhd:1310:40  */
  assign n2937_o = ~n2936_o;
  /* 6805.vhd:1310:35  */
  assign n2938_o = n2935_o & n2937_o;
  /* 6805.vhd:1309:50  */
  assign n2939_o = n2934_o | n2938_o;
  /* 6805.vhd:1311:27  */
  assign n2941_o = opcode == 8'b10100001;
  /* 6805.vhd:1312:34  */
  assign n2943_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1311:17  */
  assign n2944_o = n2941_o ? n2943_o : regpc;
  /* 6805.vhd:1299:15  */
  assign n2946_o = opcode == 8'b10100001;
  /* 6805.vhd:1299:26  */
  assign n2948_o = opcode == 8'b10110001;
  /* 6805.vhd:1299:26  */
  assign n2949_o = n2946_o | n2948_o;
  /* 6805.vhd:1299:34  */
  assign n2951_o = opcode == 8'b11000001;
  /* 6805.vhd:1299:34  */
  assign n2952_o = n2949_o | n2951_o;
  /* 6805.vhd:1299:42  */
  assign n2954_o = opcode == 8'b11010001;
  /* 6805.vhd:1299:42  */
  assign n2955_o = n2952_o | n2954_o;
  /* 6805.vhd:1299:50  */
  assign n2957_o = opcode == 8'b11100001;
  /* 6805.vhd:1299:50  */
  assign n2958_o = n2955_o | n2957_o;
  /* 6805.vhd:1299:58  */
  assign n2960_o = opcode == 8'b11110001;
  /* 6805.vhd:1299:58  */
  assign n2961_o = n2958_o | n2960_o;
  /* 6805.vhd:1317:30  */
  assign n2962_o = rega - datain;
  /* 6805.vhd:1317:52  */
  assign n2964_o = {7'b0000000, flagc};
  /* 6805.vhd:1317:39  */
  assign n2965_o = n2962_o - n2964_o;
  /* 6805.vhd:1318:30  */
  assign n2966_o = rega - datain;
  /* 6805.vhd:1318:52  */
  assign n2968_o = {7'b0000000, flagc};
  /* 6805.vhd:1318:39  */
  assign n2969_o = n2966_o - n2968_o;
  /* 6805.vhd:1319:30  */
  assign n2970_o = n2969_o[7];
  /* 6805.vhd:1320:25  */
  assign n2972_o = n2969_o == 8'b00000000;
  /* 6805.vhd:1320:17  */
  assign n2975_o = n2972_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1325:36  */
  assign n2976_o = rega[7];
  /* 6805.vhd:1325:28  */
  assign n2977_o = ~n2976_o;
  /* 6805.vhd:1325:51  */
  assign n2978_o = datain[7];
  /* 6805.vhd:1325:41  */
  assign n2979_o = n2977_o & n2978_o;
  /* 6805.vhd:1326:33  */
  assign n2980_o = datain[7];
  /* 6805.vhd:1326:45  */
  assign n2981_o = n2969_o[7];
  /* 6805.vhd:1326:37  */
  assign n2982_o = n2980_o & n2981_o;
  /* 6805.vhd:1325:56  */
  assign n2983_o = n2979_o | n2982_o;
  /* 6805.vhd:1327:31  */
  assign n2984_o = n2969_o[7];
  /* 6805.vhd:1327:48  */
  assign n2985_o = rega[7];
  /* 6805.vhd:1327:40  */
  assign n2986_o = ~n2985_o;
  /* 6805.vhd:1327:35  */
  assign n2987_o = n2984_o & n2986_o;
  /* 6805.vhd:1326:50  */
  assign n2988_o = n2983_o | n2987_o;
  /* 6805.vhd:1328:27  */
  assign n2990_o = opcode == 8'b10100010;
  /* 6805.vhd:1329:34  */
  assign n2992_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1328:17  */
  assign n2993_o = n2990_o ? n2992_o : regpc;
  /* 6805.vhd:1315:15  */
  assign n2995_o = opcode == 8'b10100010;
  /* 6805.vhd:1315:26  */
  assign n2997_o = opcode == 8'b10110010;
  /* 6805.vhd:1315:26  */
  assign n2998_o = n2995_o | n2997_o;
  /* 6805.vhd:1315:34  */
  assign n3000_o = opcode == 8'b11000010;
  /* 6805.vhd:1315:34  */
  assign n3001_o = n2998_o | n3000_o;
  /* 6805.vhd:1315:42  */
  assign n3003_o = opcode == 8'b11010010;
  /* 6805.vhd:1315:42  */
  assign n3004_o = n3001_o | n3003_o;
  /* 6805.vhd:1315:50  */
  assign n3006_o = opcode == 8'b11100010;
  /* 6805.vhd:1315:50  */
  assign n3007_o = n3004_o | n3006_o;
  /* 6805.vhd:1315:58  */
  assign n3009_o = opcode == 8'b11110010;
  /* 6805.vhd:1315:58  */
  assign n3010_o = n3007_o | n3009_o;
  /* 6805.vhd:1334:30  */
  assign n3011_o = regx - datain;
  /* 6805.vhd:1335:30  */
  assign n3012_o = n3011_o[7];
  /* 6805.vhd:1336:25  */
  assign n3014_o = n3011_o == 8'b00000000;
  /* 6805.vhd:1336:17  */
  assign n3017_o = n3014_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1341:36  */
  assign n3018_o = regx[7];
  /* 6805.vhd:1341:28  */
  assign n3019_o = ~n3018_o;
  /* 6805.vhd:1341:51  */
  assign n3020_o = datain[7];
  /* 6805.vhd:1341:41  */
  assign n3021_o = n3019_o & n3020_o;
  /* 6805.vhd:1342:33  */
  assign n3022_o = datain[7];
  /* 6805.vhd:1342:45  */
  assign n3023_o = n3011_o[7];
  /* 6805.vhd:1342:37  */
  assign n3024_o = n3022_o & n3023_o;
  /* 6805.vhd:1341:56  */
  assign n3025_o = n3021_o | n3024_o;
  /* 6805.vhd:1343:31  */
  assign n3026_o = n3011_o[7];
  /* 6805.vhd:1343:48  */
  assign n3027_o = regx[7];
  /* 6805.vhd:1343:40  */
  assign n3028_o = ~n3027_o;
  /* 6805.vhd:1343:35  */
  assign n3029_o = n3026_o & n3028_o;
  /* 6805.vhd:1342:50  */
  assign n3030_o = n3025_o | n3029_o;
  /* 6805.vhd:1344:27  */
  assign n3032_o = opcode == 8'b10100011;
  /* 6805.vhd:1345:34  */
  assign n3034_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1344:17  */
  assign n3035_o = n3032_o ? n3034_o : regpc;
  /* 6805.vhd:1332:15  */
  assign n3037_o = opcode == 8'b10100011;
  /* 6805.vhd:1332:26  */
  assign n3039_o = opcode == 8'b10110011;
  /* 6805.vhd:1332:26  */
  assign n3040_o = n3037_o | n3039_o;
  /* 6805.vhd:1332:34  */
  assign n3042_o = opcode == 8'b11000011;
  /* 6805.vhd:1332:34  */
  assign n3043_o = n3040_o | n3042_o;
  /* 6805.vhd:1332:42  */
  assign n3045_o = opcode == 8'b11010011;
  /* 6805.vhd:1332:42  */
  assign n3046_o = n3043_o | n3045_o;
  /* 6805.vhd:1332:50  */
  assign n3048_o = opcode == 8'b11100011;
  /* 6805.vhd:1332:50  */
  assign n3049_o = n3046_o | n3048_o;
  /* 6805.vhd:1332:58  */
  assign n3051_o = opcode == 8'b11110011;
  /* 6805.vhd:1332:58  */
  assign n3052_o = n3049_o | n3051_o;
  /* 6805.vhd:1350:30  */
  assign n3053_o = rega & datain;
  /* 6805.vhd:1351:30  */
  assign n3054_o = rega & datain;
  /* 6805.vhd:1352:30  */
  assign n3055_o = n3054_o[7];
  /* 6805.vhd:1353:25  */
  assign n3057_o = n3054_o == 8'b00000000;
  /* 6805.vhd:1353:17  */
  assign n3060_o = n3057_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1358:27  */
  assign n3062_o = opcode == 8'b10100100;
  /* 6805.vhd:1359:34  */
  assign n3064_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1358:17  */
  assign n3065_o = n3062_o ? n3064_o : regpc;
  /* 6805.vhd:1348:15  */
  assign n3067_o = opcode == 8'b10100100;
  /* 6805.vhd:1348:26  */
  assign n3069_o = opcode == 8'b10110100;
  /* 6805.vhd:1348:26  */
  assign n3070_o = n3067_o | n3069_o;
  /* 6805.vhd:1348:34  */
  assign n3072_o = opcode == 8'b11000100;
  /* 6805.vhd:1348:34  */
  assign n3073_o = n3070_o | n3072_o;
  /* 6805.vhd:1348:42  */
  assign n3075_o = opcode == 8'b11010100;
  /* 6805.vhd:1348:42  */
  assign n3076_o = n3073_o | n3075_o;
  /* 6805.vhd:1348:50  */
  assign n3078_o = opcode == 8'b11100100;
  /* 6805.vhd:1348:50  */
  assign n3079_o = n3076_o | n3078_o;
  /* 6805.vhd:1348:58  */
  assign n3081_o = opcode == 8'b11110100;
  /* 6805.vhd:1348:58  */
  assign n3082_o = n3079_o | n3081_o;
  /* 6805.vhd:1364:30  */
  assign n3083_o = rega & datain;
  /* 6805.vhd:1365:30  */
  assign n3084_o = n3083_o[7];
  /* 6805.vhd:1366:25  */
  assign n3086_o = n3083_o == 8'b00000000;
  /* 6805.vhd:1366:17  */
  assign n3089_o = n3086_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1371:27  */
  assign n3091_o = opcode == 8'b10100101;
  /* 6805.vhd:1372:34  */
  assign n3093_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1371:17  */
  assign n3094_o = n3091_o ? n3093_o : regpc;
  /* 6805.vhd:1362:15  */
  assign n3096_o = opcode == 8'b10100101;
  /* 6805.vhd:1362:26  */
  assign n3098_o = opcode == 8'b10110101;
  /* 6805.vhd:1362:26  */
  assign n3099_o = n3096_o | n3098_o;
  /* 6805.vhd:1362:34  */
  assign n3101_o = opcode == 8'b11000101;
  /* 6805.vhd:1362:34  */
  assign n3102_o = n3099_o | n3101_o;
  /* 6805.vhd:1362:42  */
  assign n3104_o = opcode == 8'b11010101;
  /* 6805.vhd:1362:42  */
  assign n3105_o = n3102_o | n3104_o;
  /* 6805.vhd:1362:50  */
  assign n3107_o = opcode == 8'b11100101;
  /* 6805.vhd:1362:50  */
  assign n3108_o = n3105_o | n3107_o;
  /* 6805.vhd:1362:58  */
  assign n3110_o = opcode == 8'b11110101;
  /* 6805.vhd:1362:58  */
  assign n3111_o = n3108_o | n3110_o;
  /* 6805.vhd:1378:32  */
  assign n3112_o = datain[7];
  /* 6805.vhd:1379:27  */
  assign n3114_o = datain == 8'b00000000;
  /* 6805.vhd:1379:17  */
  assign n3117_o = n3114_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1384:27  */
  assign n3119_o = opcode == 8'b10100110;
  /* 6805.vhd:1385:34  */
  assign n3121_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1384:17  */
  assign n3122_o = n3119_o ? n3121_o : regpc;
  /* 6805.vhd:1375:15  */
  assign n3124_o = opcode == 8'b10100110;
  /* 6805.vhd:1375:26  */
  assign n3126_o = opcode == 8'b10110110;
  /* 6805.vhd:1375:26  */
  assign n3127_o = n3124_o | n3126_o;
  /* 6805.vhd:1375:34  */
  assign n3129_o = opcode == 8'b11000110;
  /* 6805.vhd:1375:34  */
  assign n3130_o = n3127_o | n3129_o;
  /* 6805.vhd:1375:42  */
  assign n3132_o = opcode == 8'b11010110;
  /* 6805.vhd:1375:42  */
  assign n3133_o = n3130_o | n3132_o;
  /* 6805.vhd:1375:50  */
  assign n3135_o = opcode == 8'b11100110;
  /* 6805.vhd:1375:50  */
  assign n3136_o = n3133_o | n3135_o;
  /* 6805.vhd:1375:58  */
  assign n3138_o = opcode == 8'b11110110;
  /* 6805.vhd:1375:58  */
  assign n3139_o = n3136_o | n3138_o;
  /* 6805.vhd:1390:30  */
  assign n3140_o = rega ^ datain;
  /* 6805.vhd:1391:30  */
  assign n3141_o = rega ^ datain;
  /* 6805.vhd:1392:30  */
  assign n3142_o = n3141_o[7];
  /* 6805.vhd:1393:25  */
  assign n3144_o = n3141_o == 8'b00000000;
  /* 6805.vhd:1393:17  */
  assign n3147_o = n3144_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1398:27  */
  assign n3149_o = opcode == 8'b10101000;
  /* 6805.vhd:1399:34  */
  assign n3151_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1398:17  */
  assign n3152_o = n3149_o ? n3151_o : regpc;
  /* 6805.vhd:1388:15  */
  assign n3154_o = opcode == 8'b10101000;
  /* 6805.vhd:1388:26  */
  assign n3156_o = opcode == 8'b10111000;
  /* 6805.vhd:1388:26  */
  assign n3157_o = n3154_o | n3156_o;
  /* 6805.vhd:1388:34  */
  assign n3159_o = opcode == 8'b11001000;
  /* 6805.vhd:1388:34  */
  assign n3160_o = n3157_o | n3159_o;
  /* 6805.vhd:1388:42  */
  assign n3162_o = opcode == 8'b11011000;
  /* 6805.vhd:1388:42  */
  assign n3163_o = n3160_o | n3162_o;
  /* 6805.vhd:1388:50  */
  assign n3165_o = opcode == 8'b11101000;
  /* 6805.vhd:1388:50  */
  assign n3166_o = n3163_o | n3165_o;
  /* 6805.vhd:1388:58  */
  assign n3168_o = opcode == 8'b11111000;
  /* 6805.vhd:1388:58  */
  assign n3169_o = n3166_o | n3168_o;
  /* 6805.vhd:1404:30  */
  assign n3170_o = rega + datain;
  /* 6805.vhd:1404:52  */
  assign n3172_o = {7'b0000000, flagc};
  /* 6805.vhd:1404:39  */
  assign n3173_o = n3170_o + n3172_o;
  /* 6805.vhd:1405:30  */
  assign n3174_o = rega + datain;
  /* 6805.vhd:1405:52  */
  assign n3176_o = {7'b0000000, flagc};
  /* 6805.vhd:1405:39  */
  assign n3177_o = n3174_o + n3176_o;
  /* 6805.vhd:1406:30  */
  assign n3178_o = n3177_o[7];
  /* 6805.vhd:1407:25  */
  assign n3180_o = n3177_o == 8'b00000000;
  /* 6805.vhd:1407:17  */
  assign n3183_o = n3180_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1412:31  */
  assign n3184_o = rega[3];
  /* 6805.vhd:1412:45  */
  assign n3185_o = datain[3];
  /* 6805.vhd:1412:35  */
  assign n3186_o = n3184_o & n3185_o;
  /* 6805.vhd:1413:33  */
  assign n3187_o = datain[3];
  /* 6805.vhd:1413:50  */
  assign n3188_o = n3177_o[3];
  /* 6805.vhd:1413:42  */
  assign n3189_o = ~n3188_o;
  /* 6805.vhd:1413:37  */
  assign n3190_o = n3187_o & n3189_o;
  /* 6805.vhd:1412:50  */
  assign n3191_o = n3186_o | n3190_o;
  /* 6805.vhd:1414:36  */
  assign n3192_o = n3177_o[3];
  /* 6805.vhd:1414:28  */
  assign n3193_o = ~n3192_o;
  /* 6805.vhd:1414:49  */
  assign n3194_o = rega[3];
  /* 6805.vhd:1414:41  */
  assign n3195_o = n3193_o & n3194_o;
  /* 6805.vhd:1413:56  */
  assign n3196_o = n3191_o | n3195_o;
  /* 6805.vhd:1415:31  */
  assign n3197_o = rega[7];
  /* 6805.vhd:1415:45  */
  assign n3198_o = datain[7];
  /* 6805.vhd:1415:35  */
  assign n3199_o = n3197_o & n3198_o;
  /* 6805.vhd:1416:33  */
  assign n3200_o = datain[7];
  /* 6805.vhd:1416:50  */
  assign n3201_o = n3177_o[7];
  /* 6805.vhd:1416:42  */
  assign n3202_o = ~n3201_o;
  /* 6805.vhd:1416:37  */
  assign n3203_o = n3200_o & n3202_o;
  /* 6805.vhd:1415:50  */
  assign n3204_o = n3199_o | n3203_o;
  /* 6805.vhd:1417:36  */
  assign n3205_o = n3177_o[7];
  /* 6805.vhd:1417:28  */
  assign n3206_o = ~n3205_o;
  /* 6805.vhd:1417:49  */
  assign n3207_o = rega[7];
  /* 6805.vhd:1417:41  */
  assign n3208_o = n3206_o & n3207_o;
  /* 6805.vhd:1416:56  */
  assign n3209_o = n3204_o | n3208_o;
  /* 6805.vhd:1418:27  */
  assign n3211_o = opcode == 8'b10101001;
  /* 6805.vhd:1419:34  */
  assign n3213_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1418:17  */
  assign n3214_o = n3211_o ? n3213_o : regpc;
  /* 6805.vhd:1402:15  */
  assign n3216_o = opcode == 8'b10101001;
  /* 6805.vhd:1402:26  */
  assign n3218_o = opcode == 8'b10111001;
  /* 6805.vhd:1402:26  */
  assign n3219_o = n3216_o | n3218_o;
  /* 6805.vhd:1402:34  */
  assign n3221_o = opcode == 8'b11001001;
  /* 6805.vhd:1402:34  */
  assign n3222_o = n3219_o | n3221_o;
  /* 6805.vhd:1402:42  */
  assign n3224_o = opcode == 8'b11011001;
  /* 6805.vhd:1402:42  */
  assign n3225_o = n3222_o | n3224_o;
  /* 6805.vhd:1402:50  */
  assign n3227_o = opcode == 8'b11101001;
  /* 6805.vhd:1402:50  */
  assign n3228_o = n3225_o | n3227_o;
  /* 6805.vhd:1402:58  */
  assign n3230_o = opcode == 8'b11111001;
  /* 6805.vhd:1402:58  */
  assign n3231_o = n3228_o | n3230_o;
  /* 6805.vhd:1424:30  */
  assign n3232_o = rega | datain;
  /* 6805.vhd:1425:30  */
  assign n3233_o = rega | datain;
  /* 6805.vhd:1426:30  */
  assign n3234_o = n3233_o[7];
  /* 6805.vhd:1427:25  */
  assign n3236_o = n3233_o == 8'b00000000;
  /* 6805.vhd:1427:17  */
  assign n3239_o = n3236_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1432:27  */
  assign n3241_o = opcode == 8'b10101010;
  /* 6805.vhd:1433:34  */
  assign n3243_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1432:17  */
  assign n3244_o = n3241_o ? n3243_o : regpc;
  /* 6805.vhd:1422:15  */
  assign n3246_o = opcode == 8'b10101010;
  /* 6805.vhd:1422:26  */
  assign n3248_o = opcode == 8'b10111010;
  /* 6805.vhd:1422:26  */
  assign n3249_o = n3246_o | n3248_o;
  /* 6805.vhd:1422:34  */
  assign n3251_o = opcode == 8'b11001010;
  /* 6805.vhd:1422:34  */
  assign n3252_o = n3249_o | n3251_o;
  /* 6805.vhd:1422:42  */
  assign n3254_o = opcode == 8'b11011010;
  /* 6805.vhd:1422:42  */
  assign n3255_o = n3252_o | n3254_o;
  /* 6805.vhd:1422:50  */
  assign n3257_o = opcode == 8'b11101010;
  /* 6805.vhd:1422:50  */
  assign n3258_o = n3255_o | n3257_o;
  /* 6805.vhd:1422:58  */
  assign n3260_o = opcode == 8'b11111010;
  /* 6805.vhd:1422:58  */
  assign n3261_o = n3258_o | n3260_o;
  /* 6805.vhd:1438:30  */
  assign n3262_o = rega + datain;
  /* 6805.vhd:1439:30  */
  assign n3263_o = rega + datain;
  /* 6805.vhd:1440:30  */
  assign n3264_o = n3263_o[7];
  /* 6805.vhd:1441:25  */
  assign n3266_o = n3263_o == 8'b00000000;
  /* 6805.vhd:1441:17  */
  assign n3269_o = n3266_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1446:31  */
  assign n3270_o = rega[3];
  /* 6805.vhd:1446:45  */
  assign n3271_o = datain[3];
  /* 6805.vhd:1446:35  */
  assign n3272_o = n3270_o & n3271_o;
  /* 6805.vhd:1447:33  */
  assign n3273_o = datain[3];
  /* 6805.vhd:1447:50  */
  assign n3274_o = n3263_o[3];
  /* 6805.vhd:1447:42  */
  assign n3275_o = ~n3274_o;
  /* 6805.vhd:1447:37  */
  assign n3276_o = n3273_o & n3275_o;
  /* 6805.vhd:1446:50  */
  assign n3277_o = n3272_o | n3276_o;
  /* 6805.vhd:1448:36  */
  assign n3278_o = n3263_o[3];
  /* 6805.vhd:1448:28  */
  assign n3279_o = ~n3278_o;
  /* 6805.vhd:1448:49  */
  assign n3280_o = rega[3];
  /* 6805.vhd:1448:41  */
  assign n3281_o = n3279_o & n3280_o;
  /* 6805.vhd:1447:56  */
  assign n3282_o = n3277_o | n3281_o;
  /* 6805.vhd:1449:31  */
  assign n3283_o = rega[7];
  /* 6805.vhd:1449:45  */
  assign n3284_o = datain[7];
  /* 6805.vhd:1449:35  */
  assign n3285_o = n3283_o & n3284_o;
  /* 6805.vhd:1450:33  */
  assign n3286_o = datain[7];
  /* 6805.vhd:1450:50  */
  assign n3287_o = n3263_o[7];
  /* 6805.vhd:1450:42  */
  assign n3288_o = ~n3287_o;
  /* 6805.vhd:1450:37  */
  assign n3289_o = n3286_o & n3288_o;
  /* 6805.vhd:1449:50  */
  assign n3290_o = n3285_o | n3289_o;
  /* 6805.vhd:1451:36  */
  assign n3291_o = n3263_o[7];
  /* 6805.vhd:1451:28  */
  assign n3292_o = ~n3291_o;
  /* 6805.vhd:1451:49  */
  assign n3293_o = rega[7];
  /* 6805.vhd:1451:41  */
  assign n3294_o = n3292_o & n3293_o;
  /* 6805.vhd:1450:56  */
  assign n3295_o = n3290_o | n3294_o;
  /* 6805.vhd:1452:27  */
  assign n3297_o = opcode == 8'b10101011;
  /* 6805.vhd:1453:34  */
  assign n3299_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1452:17  */
  assign n3300_o = n3297_o ? n3299_o : regpc;
  /* 6805.vhd:1436:15  */
  assign n3302_o = opcode == 8'b10101011;
  /* 6805.vhd:1436:26  */
  assign n3304_o = opcode == 8'b10111011;
  /* 6805.vhd:1436:26  */
  assign n3305_o = n3302_o | n3304_o;
  /* 6805.vhd:1436:34  */
  assign n3307_o = opcode == 8'b11001011;
  /* 6805.vhd:1436:34  */
  assign n3308_o = n3305_o | n3307_o;
  /* 6805.vhd:1436:42  */
  assign n3310_o = opcode == 8'b11011011;
  /* 6805.vhd:1436:42  */
  assign n3311_o = n3308_o | n3310_o;
  /* 6805.vhd:1436:50  */
  assign n3313_o = opcode == 8'b11101011;
  /* 6805.vhd:1436:50  */
  assign n3314_o = n3311_o | n3313_o;
  /* 6805.vhd:1436:58  */
  assign n3316_o = opcode == 8'b11111011;
  /* 6805.vhd:1436:58  */
  assign n3317_o = n3314_o | n3316_o;
  /* 6805.vhd:1459:32  */
  assign n3318_o = datain[7];
  /* 6805.vhd:1460:27  */
  assign n3320_o = datain == 8'b00000000;
  /* 6805.vhd:1460:17  */
  assign n3323_o = n3320_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1465:27  */
  assign n3325_o = opcode == 8'b10101110;
  /* 6805.vhd:1466:34  */
  assign n3327_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1465:17  */
  assign n3328_o = n3325_o ? n3327_o : regpc;
  /* 6805.vhd:1456:15  */
  assign n3330_o = opcode == 8'b10101110;
  /* 6805.vhd:1456:26  */
  assign n3332_o = opcode == 8'b10111110;
  /* 6805.vhd:1456:26  */
  assign n3333_o = n3330_o | n3332_o;
  /* 6805.vhd:1456:34  */
  assign n3335_o = opcode == 8'b11001110;
  /* 6805.vhd:1456:34  */
  assign n3336_o = n3333_o | n3335_o;
  /* 6805.vhd:1456:42  */
  assign n3338_o = opcode == 8'b11011110;
  /* 6805.vhd:1456:42  */
  assign n3339_o = n3336_o | n3338_o;
  /* 6805.vhd:1456:50  */
  assign n3341_o = opcode == 8'b11101110;
  /* 6805.vhd:1456:50  */
  assign n3342_o = n3339_o | n3341_o;
  /* 6805.vhd:1456:58  */
  assign n3344_o = opcode == 8'b11111110;
  /* 6805.vhd:1456:58  */
  assign n3345_o = n3342_o | n3344_o;
  /* 6805.vhd:1472:24  */
  assign n3346_o = help[7];
  /* 6805.vhd:1472:28  */
  assign n3347_o = ~n3346_o;
  /* 6805.vhd:1473:43  */
  assign n3349_o = {8'b00000000, help};
  /* 6805.vhd:1473:34  */
  assign n3350_o = regpc + n3349_o;
  /* 6805.vhd:1475:43  */
  assign n3352_o = {8'b11111111, help};
  /* 6805.vhd:1475:34  */
  assign n3353_o = regpc + n3352_o;
  /* 6805.vhd:1472:17  */
  assign n3354_o = n3347_o ? n3350_o : n3353_o;
  /* 6805.vhd:1477:32  */
  assign n3356_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1469:15  */
  assign n3358_o = opcode == 8'b10101101;
  /* 6805.vhd:1482:32  */
  assign n3360_o = {8'b00000000, help};
  /* 6805.vhd:1483:32  */
  assign n3362_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1479:15  */
  assign n3364_o = opcode == 8'b10111101;
  /* 6805.vhd:1486:32  */
  assign n3366_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1485:15  */
  assign n3368_o = opcode == 8'b11001101;
  /* 6805.vhd:1485:26  */
  assign n3370_o = opcode == 8'b11011101;
  /* 6805.vhd:1485:26  */
  assign n3371_o = n3368_o | n3370_o;
  /* 6805.vhd:1492:33  */
  assign n3373_o = {8'b00000000, help};
  /* 6805.vhd:1492:50  */
  assign n3375_o = {8'b00000000, regx};
  /* 6805.vhd:1492:41  */
  assign n3376_o = n3373_o + n3375_o;
  /* 6805.vhd:1493:32  */
  assign n3378_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1489:15  */
  assign n3380_o = opcode == 8'b11101101;
  /* 6805.vhd:1498:33  */
  assign n3382_o = {8'b00000000, regx};
  /* 6805.vhd:1499:32  */
  assign n3384_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1495:15  */
  assign n3386_o = opcode == 8'b11111101;
  assign n3387_o = {n3386_o, n3380_o, n3371_o, n3364_o, n3358_o, n3345_o, n3317_o, n3261_o, n3231_o, n3169_o, n3139_o, n3111_o, n3082_o, n3052_o, n3010_o, n2961_o, n2919_o, n2876_o, n2869_o, n2862_o, n2704_o};
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3393_o = 1'b1;
      21'b010000000000000000000: n3393_o = 1'b1;
      21'b001000000000000000000: n3393_o = n3853_q;
      21'b000100000000000000000: n3393_o = 1'b1;
      21'b000010000000000000000: n3393_o = 1'b1;
      21'b000001000000000000000: n3393_o = n3853_q;
      21'b000000100000000000000: n3393_o = n3853_q;
      21'b000000010000000000000: n3393_o = n3853_q;
      21'b000000001000000000000: n3393_o = n3853_q;
      21'b000000000100000000000: n3393_o = n3853_q;
      21'b000000000010000000000: n3393_o = n3853_q;
      21'b000000000001000000000: n3393_o = n3853_q;
      21'b000000000000100000000: n3393_o = n3853_q;
      21'b000000000000010000000: n3393_o = n3853_q;
      21'b000000000000001000000: n3393_o = n3853_q;
      21'b000000000000000100000: n3393_o = n3853_q;
      21'b000000000000000010000: n3393_o = n3853_q;
      21'b000000000000000001000: n3393_o = n3853_q;
      21'b000000000000000000100: n3393_o = n3853_q;
      21'b000000000000000000010: n3393_o = 1'b1;
      21'b000000000000000000001: n3393_o = n3853_q;
      default: n3393_o = n3853_q;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3394_o = rega;
      21'b010000000000000000000: n3394_o = rega;
      21'b001000000000000000000: n3394_o = rega;
      21'b000100000000000000000: n3394_o = rega;
      21'b000010000000000000000: n3394_o = rega;
      21'b000001000000000000000: n3394_o = rega;
      21'b000000100000000000000: n3394_o = n3262_o;
      21'b000000010000000000000: n3394_o = n3232_o;
      21'b000000001000000000000: n3394_o = n3173_o;
      21'b000000000100000000000: n3394_o = n3140_o;
      21'b000000000010000000000: n3394_o = datain;
      21'b000000000001000000000: n3394_o = rega;
      21'b000000000000100000000: n3394_o = n3053_o;
      21'b000000000000010000000: n3394_o = rega;
      21'b000000000000001000000: n3394_o = n2965_o;
      21'b000000000000000100000: n3394_o = rega;
      21'b000000000000000010000: n3394_o = n2877_o;
      21'b000000000000000001000: n3394_o = rega;
      21'b000000000000000000100: n3394_o = rega;
      21'b000000000000000000010: n3394_o = rega;
      21'b000000000000000000001: n3394_o = rega;
      default: n3394_o = rega;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3395_o = regx;
      21'b010000000000000000000: n3395_o = regx;
      21'b001000000000000000000: n3395_o = regx;
      21'b000100000000000000000: n3395_o = regx;
      21'b000010000000000000000: n3395_o = regx;
      21'b000001000000000000000: n3395_o = datain;
      21'b000000100000000000000: n3395_o = regx;
      21'b000000010000000000000: n3395_o = regx;
      21'b000000001000000000000: n3395_o = regx;
      21'b000000000100000000000: n3395_o = regx;
      21'b000000000010000000000: n3395_o = regx;
      21'b000000000001000000000: n3395_o = regx;
      21'b000000000000100000000: n3395_o = regx;
      21'b000000000000010000000: n3395_o = regx;
      21'b000000000000001000000: n3395_o = regx;
      21'b000000000000000100000: n3395_o = regx;
      21'b000000000000000010000: n3395_o = regx;
      21'b000000000000000001000: n3395_o = regx;
      21'b000000000000000000100: n3395_o = datain;
      21'b000000000000000000010: n3395_o = regx;
      21'b000000000000000000001: n3395_o = regx;
      default: n3395_o = regx;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3396_o = n3384_o;
      21'b010000000000000000000: n3396_o = n3378_o;
      21'b001000000000000000000: n3396_o = n3366_o;
      21'b000100000000000000000: n3396_o = n3362_o;
      21'b000010000000000000000: n3396_o = n3356_o;
      21'b000001000000000000000: n3396_o = regsp;
      21'b000000100000000000000: n3396_o = regsp;
      21'b000000010000000000000: n3396_o = regsp;
      21'b000000001000000000000: n3396_o = regsp;
      21'b000000000100000000000: n3396_o = regsp;
      21'b000000000010000000000: n3396_o = regsp;
      21'b000000000001000000000: n3396_o = regsp;
      21'b000000000000100000000: n3396_o = regsp;
      21'b000000000000010000000: n3396_o = regsp;
      21'b000000000000001000000: n3396_o = regsp;
      21'b000000000000000100000: n3396_o = regsp;
      21'b000000000000000010000: n3396_o = regsp;
      21'b000000000000000001000: n3396_o = n2871_o;
      21'b000000000000000000100: n3396_o = n2864_o;
      21'b000000000000000000010: n3396_o = regsp;
      21'b000000000000000000001: n3396_o = regsp;
      default: n3396_o = regsp;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3397_o = n3382_o;
      21'b010000000000000000000: n3397_o = n3376_o;
      21'b001000000000000000000: n3397_o = regpc;
      21'b000100000000000000000: n3397_o = n3360_o;
      21'b000010000000000000000: n3397_o = n3354_o;
      21'b000001000000000000000: n3397_o = n3328_o;
      21'b000000100000000000000: n3397_o = n3300_o;
      21'b000000010000000000000: n3397_o = n3244_o;
      21'b000000001000000000000: n3397_o = n3214_o;
      21'b000000000100000000000: n3397_o = n3152_o;
      21'b000000000010000000000: n3397_o = n3122_o;
      21'b000000000001000000000: n3397_o = n3094_o;
      21'b000000000000100000000: n3397_o = n3065_o;
      21'b000000000000010000000: n3397_o = n3035_o;
      21'b000000000000001000000: n3397_o = n2993_o;
      21'b000000000000000100000: n3397_o = n2944_o;
      21'b000000000000000010000: n3397_o = n2902_o;
      21'b000000000000000001000: n3397_o = regpc;
      21'b000000000000000000100: n3397_o = regpc;
      21'b000000000000000000010: n3397_o = regpc;
      21'b000000000000000000001: n3397_o = n2657_o;
      default: n3397_o = regpc;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3398_o = flagh;
      21'b010000000000000000000: n3398_o = flagh;
      21'b001000000000000000000: n3398_o = flagh;
      21'b000100000000000000000: n3398_o = flagh;
      21'b000010000000000000000: n3398_o = flagh;
      21'b000001000000000000000: n3398_o = flagh;
      21'b000000100000000000000: n3398_o = n3282_o;
      21'b000000010000000000000: n3398_o = flagh;
      21'b000000001000000000000: n3398_o = n3196_o;
      21'b000000000100000000000: n3398_o = flagh;
      21'b000000000010000000000: n3398_o = flagh;
      21'b000000000001000000000: n3398_o = flagh;
      21'b000000000000100000000: n3398_o = flagh;
      21'b000000000000010000000: n3398_o = flagh;
      21'b000000000000001000000: n3398_o = flagh;
      21'b000000000000000100000: n3398_o = flagh;
      21'b000000000000000010000: n3398_o = flagh;
      21'b000000000000000001000: n3398_o = flagh;
      21'b000000000000000000100: n3398_o = flagh;
      21'b000000000000000000010: n3398_o = flagh;
      21'b000000000000000000001: n3398_o = flagh;
      default: n3398_o = flagh;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3399_o = flagn;
      21'b010000000000000000000: n3399_o = flagn;
      21'b001000000000000000000: n3399_o = flagn;
      21'b000100000000000000000: n3399_o = flagn;
      21'b000010000000000000000: n3399_o = flagn;
      21'b000001000000000000000: n3399_o = n3318_o;
      21'b000000100000000000000: n3399_o = n3264_o;
      21'b000000010000000000000: n3399_o = n3234_o;
      21'b000000001000000000000: n3399_o = n3178_o;
      21'b000000000100000000000: n3399_o = n3142_o;
      21'b000000000010000000000: n3399_o = n3112_o;
      21'b000000000001000000000: n3399_o = n3084_o;
      21'b000000000000100000000: n3399_o = n3055_o;
      21'b000000000000010000000: n3399_o = n3012_o;
      21'b000000000000001000000: n3399_o = n2970_o;
      21'b000000000000000100000: n3399_o = n2921_o;
      21'b000000000000000010000: n3399_o = n2879_o;
      21'b000000000000000001000: n3399_o = flagn;
      21'b000000000000000000100: n3399_o = flagn;
      21'b000000000000000000010: n3399_o = flagn;
      21'b000000000000000000001: n3399_o = flagn;
      default: n3399_o = flagn;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3400_o = flagz;
      21'b010000000000000000000: n3400_o = flagz;
      21'b001000000000000000000: n3400_o = flagz;
      21'b000100000000000000000: n3400_o = flagz;
      21'b000010000000000000000: n3400_o = flagz;
      21'b000001000000000000000: n3400_o = n3323_o;
      21'b000000100000000000000: n3400_o = n3269_o;
      21'b000000010000000000000: n3400_o = n3239_o;
      21'b000000001000000000000: n3400_o = n3183_o;
      21'b000000000100000000000: n3400_o = n3147_o;
      21'b000000000010000000000: n3400_o = n3117_o;
      21'b000000000001000000000: n3400_o = n3089_o;
      21'b000000000000100000000: n3400_o = n3060_o;
      21'b000000000000010000000: n3400_o = n3017_o;
      21'b000000000000001000000: n3400_o = n2975_o;
      21'b000000000000000100000: n3400_o = n2926_o;
      21'b000000000000000010000: n3400_o = n2884_o;
      21'b000000000000000001000: n3400_o = flagz;
      21'b000000000000000000100: n3400_o = flagz;
      21'b000000000000000000010: n3400_o = flagz;
      21'b000000000000000000001: n3400_o = flagz;
      default: n3400_o = flagz;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3401_o = flagc;
      21'b010000000000000000000: n3401_o = flagc;
      21'b001000000000000000000: n3401_o = flagc;
      21'b000100000000000000000: n3401_o = flagc;
      21'b000010000000000000000: n3401_o = flagc;
      21'b000001000000000000000: n3401_o = flagc;
      21'b000000100000000000000: n3401_o = n3295_o;
      21'b000000010000000000000: n3401_o = flagc;
      21'b000000001000000000000: n3401_o = n3209_o;
      21'b000000000100000000000: n3401_o = flagc;
      21'b000000000010000000000: n3401_o = flagc;
      21'b000000000001000000000: n3401_o = flagc;
      21'b000000000000100000000: n3401_o = flagc;
      21'b000000000000010000000: n3401_o = n3030_o;
      21'b000000000000001000000: n3401_o = n2988_o;
      21'b000000000000000100000: n3401_o = n2939_o;
      21'b000000000000000010000: n3401_o = n2897_o;
      21'b000000000000000001000: n3401_o = flagc;
      21'b000000000000000000100: n3401_o = flagc;
      21'b000000000000000000010: n3401_o = flagc;
      21'b000000000000000000001: n3401_o = flagc;
      default: n3401_o = flagc;
    endcase
  assign n3402_o = help[0];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3403_o = n3402_o;
      21'b010000000000000000000: n3403_o = n3402_o;
      21'b001000000000000000000: n3403_o = n3402_o;
      21'b000100000000000000000: n3403_o = n3402_o;
      21'b000010000000000000000: n3403_o = n3402_o;
      21'b000001000000000000000: n3403_o = n3402_o;
      21'b000000100000000000000: n3403_o = n3402_o;
      21'b000000010000000000000: n3403_o = n3402_o;
      21'b000000001000000000000: n3403_o = n3402_o;
      21'b000000000100000000000: n3403_o = n3402_o;
      21'b000000000010000000000: n3403_o = n3402_o;
      21'b000000000001000000000: n3403_o = n3402_o;
      21'b000000000000100000000: n3403_o = n3402_o;
      21'b000000000000010000000: n3403_o = n3402_o;
      21'b000000000000001000000: n3403_o = n3402_o;
      21'b000000000000000100000: n3403_o = n3402_o;
      21'b000000000000000010000: n3403_o = n3402_o;
      21'b000000000000000001000: n3403_o = flagc;
      21'b000000000000000000100: n3403_o = n3402_o;
      21'b000000000000000000010: n3403_o = n3402_o;
      21'b000000000000000000001: n3403_o = n3402_o;
      default: n3403_o = n3402_o;
    endcase
  assign n3404_o = help[1];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3405_o = n3404_o;
      21'b010000000000000000000: n3405_o = n3404_o;
      21'b001000000000000000000: n3405_o = n3404_o;
      21'b000100000000000000000: n3405_o = n3404_o;
      21'b000010000000000000000: n3405_o = n3404_o;
      21'b000001000000000000000: n3405_o = n3404_o;
      21'b000000100000000000000: n3405_o = n3404_o;
      21'b000000010000000000000: n3405_o = n3404_o;
      21'b000000001000000000000: n3405_o = n3404_o;
      21'b000000000100000000000: n3405_o = n3404_o;
      21'b000000000010000000000: n3405_o = n3404_o;
      21'b000000000001000000000: n3405_o = n3404_o;
      21'b000000000000100000000: n3405_o = n3404_o;
      21'b000000000000010000000: n3405_o = n3404_o;
      21'b000000000000001000000: n3405_o = n3404_o;
      21'b000000000000000100000: n3405_o = n3404_o;
      21'b000000000000000010000: n3405_o = n3404_o;
      21'b000000000000000001000: n3405_o = flagz;
      21'b000000000000000000100: n3405_o = n3404_o;
      21'b000000000000000000010: n3405_o = n3404_o;
      21'b000000000000000000001: n3405_o = n3404_o;
      default: n3405_o = n3404_o;
    endcase
  assign n3406_o = help[2];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3407_o = n3406_o;
      21'b010000000000000000000: n3407_o = n3406_o;
      21'b001000000000000000000: n3407_o = n3406_o;
      21'b000100000000000000000: n3407_o = n3406_o;
      21'b000010000000000000000: n3407_o = n3406_o;
      21'b000001000000000000000: n3407_o = n3406_o;
      21'b000000100000000000000: n3407_o = n3406_o;
      21'b000000010000000000000: n3407_o = n3406_o;
      21'b000000001000000000000: n3407_o = n3406_o;
      21'b000000000100000000000: n3407_o = n3406_o;
      21'b000000000010000000000: n3407_o = n3406_o;
      21'b000000000001000000000: n3407_o = n3406_o;
      21'b000000000000100000000: n3407_o = n3406_o;
      21'b000000000000010000000: n3407_o = n3406_o;
      21'b000000000000001000000: n3407_o = n3406_o;
      21'b000000000000000100000: n3407_o = n3406_o;
      21'b000000000000000010000: n3407_o = n3406_o;
      21'b000000000000000001000: n3407_o = flagn;
      21'b000000000000000000100: n3407_o = n3406_o;
      21'b000000000000000000010: n3407_o = n3406_o;
      21'b000000000000000000001: n3407_o = n3406_o;
      default: n3407_o = n3406_o;
    endcase
  assign n3408_o = help[3];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3409_o = n3408_o;
      21'b010000000000000000000: n3409_o = n3408_o;
      21'b001000000000000000000: n3409_o = n3408_o;
      21'b000100000000000000000: n3409_o = n3408_o;
      21'b000010000000000000000: n3409_o = n3408_o;
      21'b000001000000000000000: n3409_o = n3408_o;
      21'b000000100000000000000: n3409_o = n3408_o;
      21'b000000010000000000000: n3409_o = n3408_o;
      21'b000000001000000000000: n3409_o = n3408_o;
      21'b000000000100000000000: n3409_o = n3408_o;
      21'b000000000010000000000: n3409_o = n3408_o;
      21'b000000000001000000000: n3409_o = n3408_o;
      21'b000000000000100000000: n3409_o = n3408_o;
      21'b000000000000010000000: n3409_o = n3408_o;
      21'b000000000000001000000: n3409_o = n3408_o;
      21'b000000000000000100000: n3409_o = n3408_o;
      21'b000000000000000010000: n3409_o = n3408_o;
      21'b000000000000000001000: n3409_o = flagi;
      21'b000000000000000000100: n3409_o = n3408_o;
      21'b000000000000000000010: n3409_o = n3408_o;
      21'b000000000000000000001: n3409_o = n3408_o;
      default: n3409_o = n3408_o;
    endcase
  assign n3410_o = help[4];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3411_o = n3410_o;
      21'b010000000000000000000: n3411_o = n3410_o;
      21'b001000000000000000000: n3411_o = n3410_o;
      21'b000100000000000000000: n3411_o = n3410_o;
      21'b000010000000000000000: n3411_o = n3410_o;
      21'b000001000000000000000: n3411_o = n3410_o;
      21'b000000100000000000000: n3411_o = n3410_o;
      21'b000000010000000000000: n3411_o = n3410_o;
      21'b000000001000000000000: n3411_o = n3410_o;
      21'b000000000100000000000: n3411_o = n3410_o;
      21'b000000000010000000000: n3411_o = n3410_o;
      21'b000000000001000000000: n3411_o = n3410_o;
      21'b000000000000100000000: n3411_o = n3410_o;
      21'b000000000000010000000: n3411_o = n3410_o;
      21'b000000000000001000000: n3411_o = n3410_o;
      21'b000000000000000100000: n3411_o = n3410_o;
      21'b000000000000000010000: n3411_o = n3410_o;
      21'b000000000000000001000: n3411_o = flagh;
      21'b000000000000000000100: n3411_o = n3410_o;
      21'b000000000000000000010: n3411_o = n3410_o;
      21'b000000000000000000001: n3411_o = n3410_o;
      default: n3411_o = n3410_o;
    endcase
  assign n3412_o = help[5];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3413_o = n3412_o;
      21'b010000000000000000000: n3413_o = n3412_o;
      21'b001000000000000000000: n3413_o = n3412_o;
      21'b000100000000000000000: n3413_o = n3412_o;
      21'b000010000000000000000: n3413_o = n3412_o;
      21'b000001000000000000000: n3413_o = n3412_o;
      21'b000000100000000000000: n3413_o = n3412_o;
      21'b000000010000000000000: n3413_o = n3412_o;
      21'b000000001000000000000: n3413_o = n3412_o;
      21'b000000000100000000000: n3413_o = n3412_o;
      21'b000000000010000000000: n3413_o = n3412_o;
      21'b000000000001000000000: n3413_o = n3412_o;
      21'b000000000000100000000: n3413_o = n3412_o;
      21'b000000000000010000000: n3413_o = n3412_o;
      21'b000000000000001000000: n3413_o = n3412_o;
      21'b000000000000000100000: n3413_o = n3412_o;
      21'b000000000000000010000: n3413_o = n3412_o;
      21'b000000000000000001000: n3413_o = 1'b1;
      21'b000000000000000000100: n3413_o = n3412_o;
      21'b000000000000000000010: n3413_o = n3412_o;
      21'b000000000000000000001: n3413_o = n3412_o;
      default: n3413_o = n3412_o;
    endcase
  assign n3414_o = help[6];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3415_o = n3414_o;
      21'b010000000000000000000: n3415_o = n3414_o;
      21'b001000000000000000000: n3415_o = n3414_o;
      21'b000100000000000000000: n3415_o = n3414_o;
      21'b000010000000000000000: n3415_o = n3414_o;
      21'b000001000000000000000: n3415_o = n3414_o;
      21'b000000100000000000000: n3415_o = n3414_o;
      21'b000000010000000000000: n3415_o = n3414_o;
      21'b000000001000000000000: n3415_o = n3414_o;
      21'b000000000100000000000: n3415_o = n3414_o;
      21'b000000000010000000000: n3415_o = n3414_o;
      21'b000000000001000000000: n3415_o = n3414_o;
      21'b000000000000100000000: n3415_o = n3414_o;
      21'b000000000000010000000: n3415_o = n3414_o;
      21'b000000000000001000000: n3415_o = n3414_o;
      21'b000000000000000100000: n3415_o = n3414_o;
      21'b000000000000000010000: n3415_o = n3414_o;
      21'b000000000000000001000: n3415_o = 1'b1;
      21'b000000000000000000100: n3415_o = n3414_o;
      21'b000000000000000000010: n3415_o = n3414_o;
      21'b000000000000000000001: n3415_o = n3414_o;
      default: n3415_o = n3414_o;
    endcase
  assign n3416_o = help[7];
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3417_o = n3416_o;
      21'b010000000000000000000: n3417_o = n3416_o;
      21'b001000000000000000000: n3417_o = n3416_o;
      21'b000100000000000000000: n3417_o = n3416_o;
      21'b000010000000000000000: n3417_o = n3416_o;
      21'b000001000000000000000: n3417_o = n3416_o;
      21'b000000100000000000000: n3417_o = n3416_o;
      21'b000000010000000000000: n3417_o = n3416_o;
      21'b000000001000000000000: n3417_o = n3416_o;
      21'b000000000100000000000: n3417_o = n3416_o;
      21'b000000000010000000000: n3417_o = n3416_o;
      21'b000000000001000000000: n3417_o = n3416_o;
      21'b000000000000100000000: n3417_o = n3416_o;
      21'b000000000000010000000: n3417_o = n3416_o;
      21'b000000000000001000000: n3417_o = n3416_o;
      21'b000000000000000100000: n3417_o = n3416_o;
      21'b000000000000000010000: n3417_o = n3416_o;
      21'b000000000000000001000: n3417_o = 1'b1;
      21'b000000000000000000100: n3417_o = n3416_o;
      21'b000000000000000000010: n3417_o = n3416_o;
      21'b000000000000000000001: n3417_o = n3416_o;
      default: n3417_o = n3416_o;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3440_o = 4'b0010;
      21'b010000000000000000000: n3440_o = 4'b0010;
      21'b001000000000000000000: n3440_o = 4'b0110;
      21'b000100000000000000000: n3440_o = 4'b0010;
      21'b000010000000000000000: n3440_o = 4'b0010;
      21'b000001000000000000000: n3440_o = 4'b0010;
      21'b000000100000000000000: n3440_o = 4'b0010;
      21'b000000010000000000000: n3440_o = 4'b0010;
      21'b000000001000000000000: n3440_o = 4'b0010;
      21'b000000000100000000000: n3440_o = 4'b0010;
      21'b000000000010000000000: n3440_o = 4'b0010;
      21'b000000000001000000000: n3440_o = 4'b0010;
      21'b000000000000100000000: n3440_o = 4'b0010;
      21'b000000000000010000000: n3440_o = 4'b0010;
      21'b000000000000001000000: n3440_o = 4'b0010;
      21'b000000000000000100000: n3440_o = 4'b0010;
      21'b000000000000000010000: n3440_o = 4'b0010;
      21'b000000000000000001000: n3440_o = 4'b0110;
      21'b000000000000000000100: n3440_o = 4'b0110;
      21'b000000000000000000010: n3440_o = 4'b0010;
      21'b000000000000000000001: n3440_o = 4'b0010;
      default: n3440_o = 4'b0000;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3459_o = 3'b000;
      21'b010000000000000000000: n3459_o = 3'b000;
      21'b001000000000000000000: n3459_o = addrmux;
      21'b000100000000000000000: n3459_o = 3'b000;
      21'b000010000000000000000: n3459_o = 3'b000;
      21'b000001000000000000000: n3459_o = 3'b000;
      21'b000000100000000000000: n3459_o = 3'b000;
      21'b000000010000000000000: n3459_o = 3'b000;
      21'b000000001000000000000: n3459_o = 3'b000;
      21'b000000000100000000000: n3459_o = 3'b000;
      21'b000000000010000000000: n3459_o = 3'b000;
      21'b000000000001000000000: n3459_o = 3'b000;
      21'b000000000000100000000: n3459_o = 3'b000;
      21'b000000000000010000000: n3459_o = 3'b000;
      21'b000000000000001000000: n3459_o = 3'b000;
      21'b000000000000000100000: n3459_o = 3'b000;
      21'b000000000000000010000: n3459_o = 3'b000;
      21'b000000000000000001000: n3459_o = addrmux;
      21'b000000000000000000100: n3459_o = addrmux;
      21'b000000000000000000010: n3459_o = 3'b000;
      21'b000000000000000000001: n3459_o = 3'b000;
      default: n3459_o = addrmux;
    endcase
  /* 6805.vhd:1238:13  */
  always @*
    case (n3387_o)
      21'b100000000000000000000: n3462_o = datamux;
      21'b010000000000000000000: n3462_o = datamux;
      21'b001000000000000000000: n3462_o = 4'b0110;
      21'b000100000000000000000: n3462_o = datamux;
      21'b000010000000000000000: n3462_o = datamux;
      21'b000001000000000000000: n3462_o = datamux;
      21'b000000100000000000000: n3462_o = datamux;
      21'b000000010000000000000: n3462_o = datamux;
      21'b000000001000000000000: n3462_o = datamux;
      21'b000000000100000000000: n3462_o = datamux;
      21'b000000000010000000000: n3462_o = datamux;
      21'b000000000001000000000: n3462_o = datamux;
      21'b000000000000100000000: n3462_o = datamux;
      21'b000000000000010000000: n3462_o = datamux;
      21'b000000000000001000000: n3462_o = datamux;
      21'b000000000000000100000: n3462_o = datamux;
      21'b000000000000000010000: n3462_o = datamux;
      21'b000000000000000001000: n3462_o = 4'b0010;
      21'b000000000000000000100: n3462_o = datamux;
      21'b000000000000000000010: n3462_o = datamux;
      21'b000000000000000000001: n3462_o = datamux;
      default: n3462_o = datamux;
    endcase
  /* 6805.vhd:1237:11  */
  assign n3465_o = mainfsm == 4'b0101;
  /* 6805.vhd:1510:32  */
  assign n3467_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1508:15  */
  assign n3469_o = opcode == 8'b10000000;
  /* 6805.vhd:1508:26  */
  assign n3471_o = opcode == 8'b10000010;
  /* 6805.vhd:1508:26  */
  assign n3472_o = n3469_o | n3471_o;
  /* 6805.vhd:1513:32  */
  assign n3474_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1512:15  */
  assign n3476_o = opcode == 8'b10000011;
  /* 6805.vhd:1519:32  */
  assign n3478_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1516:15  */
  assign n3480_o = opcode == 8'b11001101;
  /* 6805.vhd:1525:32  */
  assign n3482_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1526:40  */
  assign n3484_o = {8'b00000000, regx};
  /* 6805.vhd:1526:31  */
  assign n3485_o = temp + n3484_o;
  /* 6805.vhd:1522:15  */
  assign n3487_o = opcode == 8'b11011101;
  assign n3488_o = {n3487_o, n3480_o, n3476_o, n3472_o};
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3491_o = 1'b1;
      4'b0100: n3491_o = 1'b1;
      4'b0010: n3491_o = n3853_q;
      4'b0001: n3491_o = n3853_q;
      default: n3491_o = n3853_q;
    endcase
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3492_o = n3482_o;
      4'b0100: n3492_o = n3478_o;
      4'b0010: n3492_o = n3474_o;
      4'b0001: n3492_o = n3467_o;
      default: n3492_o = regsp;
    endcase
  assign n3493_o = temp[7:0];
  assign n3494_o = n3485_o[7:0];
  assign n3495_o = regpc[7:0];
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3496_o = n3494_o;
      4'b0100: n3496_o = n3493_o;
      4'b0010: n3496_o = n3495_o;
      4'b0001: n3496_o = n3495_o;
      default: n3496_o = n3495_o;
    endcase
  assign n3497_o = temp[15:8];
  assign n3498_o = n3485_o[15:8];
  assign n3499_o = regpc[15:8];
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3500_o = n3498_o;
      4'b0100: n3500_o = n3497_o;
      4'b0010: n3500_o = n3499_o;
      4'b0001: n3500_o = datain;
      default: n3500_o = n3499_o;
    endcase
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3506_o = 4'b0010;
      4'b0100: n3506_o = 4'b0010;
      4'b0010: n3506_o = 4'b0111;
      4'b0001: n3506_o = 4'b0111;
      default: n3506_o = 4'b0000;
    endcase
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3509_o = 3'b000;
      4'b0100: n3509_o = 3'b000;
      4'b0010: n3509_o = addrmux;
      4'b0001: n3509_o = addrmux;
      default: n3509_o = addrmux;
    endcase
  /* 6805.vhd:1507:13  */
  always @*
    case (n3488_o)
      4'b1000: n3511_o = datamux;
      4'b0100: n3511_o = datamux;
      4'b0010: n3511_o = 4'b0000;
      4'b0001: n3511_o = datamux;
      default: n3511_o = datamux;
    endcase
  /* 6805.vhd:1506:11  */
  assign n3513_o = mainfsm == 4'b0110;
  /* 6805.vhd:1535:15  */
  assign n3515_o = opcode == 8'b10000000;
  /* 6805.vhd:1535:26  */
  assign n3517_o = opcode == 8'b10000010;
  /* 6805.vhd:1535:26  */
  assign n3518_o = n3515_o | n3517_o;
  /* 6805.vhd:1540:34  */
  assign n3520_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1543:26  */
  assign n3521_o = ~trace;
  /* 6805.vhd:1550:19  */
  assign n3524_o = sciirqrequest ? 16'b0001111111110110 : 16'b0001111111111100;
  /* 6805.vhd:1550:19  */
  assign n3526_o = sciirqrequest ? 1'b0 : n116_o;
  /* 6805.vhd:1547:19  */
  assign n3528_o = timerirqrequest ? 16'b0001111111111000 : n3524_o;
  /* 6805.vhd:1547:19  */
  assign n3530_o = timerirqrequest ? 1'b0 : n111_o;
  /* 6805.vhd:1547:19  */
  assign n3531_o = timerirqrequest ? n116_o : n3526_o;
  /* 6805.vhd:1544:19  */
  assign n3533_o = extirqrequest ? 16'b0001111111111010 : n3528_o;
  /* 6805.vhd:1543:17  */
  assign n3535_o = n3543_o ? 1'b0 : n106_o;
  /* 6805.vhd:1544:19  */
  assign n3536_o = extirqrequest ? n111_o : n3530_o;
  /* 6805.vhd:1544:19  */
  assign n3537_o = extirqrequest ? n116_o : n3531_o;
  /* 6805.vhd:1543:17  */
  assign n3539_o = n3521_o ? n3533_o : 16'b0001111111111000;
  /* 6805.vhd:1543:17  */
  assign n3542_o = n3521_o ? 4'b1000 : 4'b1011;
  /* 6805.vhd:1543:17  */
  assign n3543_o = extirqrequest & n3521_o;
  /* 6805.vhd:1543:17  */
  assign n3544_o = n3521_o ? n3536_o : n111_o;
  /* 6805.vhd:1543:17  */
  assign n3545_o = n3521_o ? n3537_o : n116_o;
  /* 6805.vhd:1539:15  */
  assign n3547_o = opcode == 8'b10000011;
  assign n3548_o = {n3547_o, n3518_o};
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3549_o = n3520_o;
      2'b01: n3549_o = regsp;
      default: n3549_o = regsp;
    endcase
  assign n3550_o = regpc[7:0];
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3551_o = n3550_o;
      2'b01: n3551_o = datain;
      default: n3551_o = n3550_o;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3553_o = 1'b1;
      2'b01: n3553_o = flagi;
      default: n3553_o = flagi;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3554_o = n3539_o;
      2'b01: n3554_o = temp;
      default: n3554_o = temp;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3557_o = n3542_o;
      2'b01: n3557_o = 4'b0010;
      default: n3557_o = 4'b0000;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3559_o = addrmux;
      2'b01: n3559_o = 3'b000;
      default: n3559_o = addrmux;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3561_o = 4'b1001;
      2'b01: n3561_o = datamux;
      default: n3561_o = datamux;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3562_o = n3535_o;
      2'b01: n3562_o = n106_o;
      default: n3562_o = n106_o;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3563_o = n3544_o;
      2'b01: n3563_o = n111_o;
      default: n3563_o = n111_o;
    endcase
  /* 6805.vhd:1534:13  */
  always @*
    case (n3548_o)
      2'b10: n3564_o = n3545_o;
      2'b01: n3564_o = n116_o;
      default: n3564_o = n116_o;
    endcase
  /* 6805.vhd:1533:11  */
  assign n3566_o = mainfsm == 4'b0111;
  /* 6805.vhd:1571:34  */
  assign n3568_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1568:15  */
  assign n3570_o = opcode == 8'b10000011;
  /* 6805.vhd:1567:13  */
  always @*
    case (n3570_o)
      1'b1: n3572_o = 1'b1;
      default: n3572_o = n3853_q;
    endcase
  /* 6805.vhd:1567:13  */
  always @*
    case (n3570_o)
      1'b1: n3573_o = n3568_o;
      default: n3573_o = regsp;
    endcase
  /* 6805.vhd:1567:13  */
  always @*
    case (n3570_o)
      1'b1: n3576_o = 4'b1001;
      default: n3576_o = 4'b0000;
    endcase
  /* 6805.vhd:1567:13  */
  always @*
    case (n3570_o)
      1'b1: n3578_o = 3'b011;
      default: n3578_o = addrmux;
    endcase
  /* 6805.vhd:1566:11  */
  assign n3580_o = mainfsm == 4'b1000;
  /* 6805.vhd:1581:30  */
  assign n3582_o = temp + 16'b0000000000000001;
  /* 6805.vhd:1579:15  */
  assign n3584_o = opcode == 8'b10000011;
  assign n3585_o = regpc[15:8];
  /* 6805.vhd:1578:13  */
  always @*
    case (n3584_o)
      1'b1: n3586_o = datain;
      default: n3586_o = n3585_o;
    endcase
  /* 6805.vhd:1578:13  */
  always @*
    case (n3584_o)
      1'b1: n3587_o = n3582_o;
      default: n3587_o = temp;
    endcase
  /* 6805.vhd:1578:13  */
  always @*
    case (n3584_o)
      1'b1: n3590_o = 4'b1010;
      default: n3590_o = 4'b0000;
    endcase
  /* 6805.vhd:1577:11  */
  assign n3592_o = mainfsm == 4'b1001;
  /* 6805.vhd:1589:15  */
  assign n3594_o = opcode == 8'b10000011;
  assign n3595_o = regpc[7:0];
  /* 6805.vhd:1588:13  */
  always @*
    case (n3594_o)
      1'b1: n3596_o = datain;
      default: n3596_o = n3595_o;
    endcase
  /* 6805.vhd:1588:13  */
  always @*
    case (n3594_o)
      1'b1: n3599_o = 4'b0010;
      default: n3599_o = 4'b0000;
    endcase
  /* 6805.vhd:1588:13  */
  always @*
    case (n3594_o)
      1'b1: n3601_o = 3'b000;
      default: n3601_o = addrmux;
    endcase
  /* 6805.vhd:1587:11  */
  assign n3603_o = mainfsm == 4'b1010;
  /* 6805.vhd:1598:30  */
  assign n3605_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1597:11  */
  assign n3607_o = mainfsm == 4'b1011;
  assign n3608_o = {n3607_o, n3603_o, n3592_o, n3580_o, n3566_o, n3513_o, n3465_o, n2639_o, n1967_o, n1318_o, n122_o, n120_o};
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3609_o = n3853_q;
      12'b010000000000: n3609_o = n3853_q;
      12'b001000000000: n3609_o = n3853_q;
      12'b000100000000: n3609_o = n3572_o;
      12'b000010000000: n3609_o = n3853_q;
      12'b000001000000: n3609_o = n3491_o;
      12'b000000100000: n3609_o = n3393_o;
      12'b000000010000: n3609_o = n2536_o;
      12'b000000001000: n3609_o = n1867_o;
      12'b000000000100: n3609_o = n1295_o;
      12'b000000000010: n3609_o = n3853_q;
      12'b000000000001: n3609_o = n3853_q;
      default: n3609_o = n3853_q;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3610_o = rega;
      12'b010000000000: n3610_o = rega;
      12'b001000000000: n3610_o = rega;
      12'b000100000000: n3610_o = rega;
      12'b000010000000: n3610_o = rega;
      12'b000001000000: n3610_o = rega;
      12'b000000100000: n3610_o = n3394_o;
      12'b000000010000: n3610_o = n2537_o;
      12'b000000001000: n3610_o = rega;
      12'b000000000100: n3610_o = n1296_o;
      12'b000000000010: n3610_o = rega;
      12'b000000000001: n3610_o = rega;
      default: n3610_o = rega;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3611_o = regx;
      12'b010000000000: n3611_o = regx;
      12'b001000000000: n3611_o = regx;
      12'b000100000000: n3611_o = regx;
      12'b000010000000: n3611_o = regx;
      12'b000001000000: n3611_o = regx;
      12'b000000100000: n3611_o = n3395_o;
      12'b000000010000: n3611_o = regx;
      12'b000000001000: n3611_o = regx;
      12'b000000000100: n3611_o = n1297_o;
      12'b000000000010: n3611_o = regx;
      12'b000000000001: n3611_o = regx;
      default: n3611_o = regx;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3612_o = n3605_o;
      12'b010000000000: n3612_o = regsp;
      12'b001000000000: n3612_o = regsp;
      12'b000100000000: n3612_o = n3573_o;
      12'b000010000000: n3612_o = n3549_o;
      12'b000001000000: n3612_o = n3492_o;
      12'b000000100000: n3612_o = n3396_o;
      12'b000000010000: n3612_o = n2538_o;
      12'b000000001000: n3612_o = n1868_o;
      12'b000000000100: n3612_o = n1298_o;
      12'b000000000010: n3612_o = regsp;
      12'b000000000001: n3612_o = regsp;
      default: n3612_o = regsp;
    endcase
  assign n3613_o = n1299_o[7:0];
  assign n3614_o = n3397_o[7:0];
  assign n3615_o = regpc[7:0];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3616_o = n3615_o;
      12'b010000000000: n3616_o = n3596_o;
      12'b001000000000: n3616_o = n3615_o;
      12'b000100000000: n3616_o = n3615_o;
      12'b000010000000: n3616_o = n3551_o;
      12'b000001000000: n3616_o = n3496_o;
      12'b000000100000: n3616_o = n3614_o;
      12'b000000010000: n3616_o = n2551_o;
      12'b000000001000: n3616_o = n1889_o;
      12'b000000000100: n3616_o = n3613_o;
      12'b000000000010: n3616_o = datain;
      12'b000000000001: n3616_o = n3615_o;
      default: n3616_o = n3615_o;
    endcase
  assign n3617_o = n1299_o[15:8];
  assign n3618_o = n3397_o[15:8];
  assign n3619_o = regpc[15:8];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3620_o = n3619_o;
      12'b010000000000: n3620_o = n3619_o;
      12'b001000000000: n3620_o = n3586_o;
      12'b000100000000: n3620_o = n3619_o;
      12'b000010000000: n3620_o = n3619_o;
      12'b000001000000: n3620_o = n3500_o;
      12'b000000100000: n3620_o = n3618_o;
      12'b000000010000: n3620_o = n2564_o;
      12'b000000001000: n3620_o = n1910_o;
      12'b000000000100: n3620_o = n3617_o;
      12'b000000000010: n3620_o = n3619_o;
      12'b000000000001: n3620_o = datain;
      default: n3620_o = n3619_o;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3621_o = flagh;
      12'b010000000000: n3621_o = flagh;
      12'b001000000000: n3621_o = flagh;
      12'b000100000000: n3621_o = flagh;
      12'b000010000000: n3621_o = flagh;
      12'b000001000000: n3621_o = flagh;
      12'b000000100000: n3621_o = n3398_o;
      12'b000000010000: n3621_o = flagh;
      12'b000000001000: n3621_o = n1911_o;
      12'b000000000100: n3621_o = n1300_o;
      12'b000000000010: n3621_o = flagh;
      12'b000000000001: n3621_o = flagh;
      default: n3621_o = flagh;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3622_o = flagi;
      12'b010000000000: n3622_o = flagi;
      12'b001000000000: n3622_o = flagi;
      12'b000100000000: n3622_o = flagi;
      12'b000010000000: n3622_o = n3553_o;
      12'b000001000000: n3622_o = flagi;
      12'b000000100000: n3622_o = flagi;
      12'b000000010000: n3622_o = flagi;
      12'b000000001000: n3622_o = n1912_o;
      12'b000000000100: n3622_o = n1301_o;
      12'b000000000010: n3622_o = flagi;
      12'b000000000001: n3622_o = flagi;
      default: n3622_o = flagi;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3623_o = flagn;
      12'b010000000000: n3623_o = flagn;
      12'b001000000000: n3623_o = flagn;
      12'b000100000000: n3623_o = flagn;
      12'b000010000000: n3623_o = flagn;
      12'b000001000000: n3623_o = flagn;
      12'b000000100000: n3623_o = n3399_o;
      12'b000000010000: n3623_o = n2566_o;
      12'b000000001000: n3623_o = n1914_o;
      12'b000000000100: n3623_o = n1302_o;
      12'b000000000010: n3623_o = flagn;
      12'b000000000001: n3623_o = flagn;
      default: n3623_o = flagn;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3624_o = flagz;
      12'b010000000000: n3624_o = flagz;
      12'b001000000000: n3624_o = flagz;
      12'b000100000000: n3624_o = flagz;
      12'b000010000000: n3624_o = flagz;
      12'b000001000000: n3624_o = flagz;
      12'b000000100000: n3624_o = n3400_o;
      12'b000000010000: n3624_o = n2567_o;
      12'b000000001000: n3624_o = n1916_o;
      12'b000000000100: n3624_o = n1303_o;
      12'b000000000010: n3624_o = flagz;
      12'b000000000001: n3624_o = flagz;
      default: n3624_o = flagz;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3625_o = flagc;
      12'b010000000000: n3625_o = flagc;
      12'b001000000000: n3625_o = flagc;
      12'b000100000000: n3625_o = flagc;
      12'b000010000000: n3625_o = flagc;
      12'b000001000000: n3625_o = flagc;
      12'b000000100000: n3625_o = n3401_o;
      12'b000000010000: n3625_o = n2569_o;
      12'b000000001000: n3625_o = n1917_o;
      12'b000000000100: n3625_o = n1304_o;
      12'b000000000010: n3625_o = flagc;
      12'b000000000001: n3625_o = flagc;
      default: n3625_o = flagc;
    endcase
  assign n3626_o = n1305_o[0];
  assign n3627_o = n1919_o[0];
  assign n3628_o = n2570_o[0];
  assign n3629_o = help[0];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3630_o = n3629_o;
      12'b010000000000: n3630_o = n3629_o;
      12'b001000000000: n3630_o = n3629_o;
      12'b000100000000: n3630_o = n3629_o;
      12'b000010000000: n3630_o = n3629_o;
      12'b000001000000: n3630_o = n3629_o;
      12'b000000100000: n3630_o = n3403_o;
      12'b000000010000: n3630_o = n3628_o;
      12'b000000001000: n3630_o = n3627_o;
      12'b000000000100: n3630_o = n3626_o;
      12'b000000000010: n3630_o = n3629_o;
      12'b000000000001: n3630_o = n3629_o;
      default: n3630_o = n3629_o;
    endcase
  assign n3631_o = n1305_o[1];
  assign n3632_o = n1919_o[1];
  assign n3633_o = n2570_o[1];
  assign n3634_o = help[1];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3635_o = n3634_o;
      12'b010000000000: n3635_o = n3634_o;
      12'b001000000000: n3635_o = n3634_o;
      12'b000100000000: n3635_o = n3634_o;
      12'b000010000000: n3635_o = n3634_o;
      12'b000001000000: n3635_o = n3634_o;
      12'b000000100000: n3635_o = n3405_o;
      12'b000000010000: n3635_o = n3633_o;
      12'b000000001000: n3635_o = n3632_o;
      12'b000000000100: n3635_o = n3631_o;
      12'b000000000010: n3635_o = n3634_o;
      12'b000000000001: n3635_o = n3634_o;
      default: n3635_o = n3634_o;
    endcase
  assign n3636_o = n1305_o[2];
  assign n3637_o = n1919_o[2];
  assign n3638_o = n2570_o[2];
  assign n3639_o = help[2];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3640_o = n3639_o;
      12'b010000000000: n3640_o = n3639_o;
      12'b001000000000: n3640_o = n3639_o;
      12'b000100000000: n3640_o = n3639_o;
      12'b000010000000: n3640_o = n3639_o;
      12'b000001000000: n3640_o = n3639_o;
      12'b000000100000: n3640_o = n3407_o;
      12'b000000010000: n3640_o = n3638_o;
      12'b000000001000: n3640_o = n3637_o;
      12'b000000000100: n3640_o = n3636_o;
      12'b000000000010: n3640_o = n3639_o;
      12'b000000000001: n3640_o = n3639_o;
      default: n3640_o = n3639_o;
    endcase
  assign n3641_o = n1305_o[3];
  assign n3642_o = n1919_o[3];
  assign n3643_o = n2570_o[3];
  assign n3644_o = help[3];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3645_o = n3644_o;
      12'b010000000000: n3645_o = n3644_o;
      12'b001000000000: n3645_o = n3644_o;
      12'b000100000000: n3645_o = n3644_o;
      12'b000010000000: n3645_o = n3644_o;
      12'b000001000000: n3645_o = n3644_o;
      12'b000000100000: n3645_o = n3409_o;
      12'b000000010000: n3645_o = n3643_o;
      12'b000000001000: n3645_o = n3642_o;
      12'b000000000100: n3645_o = n3641_o;
      12'b000000000010: n3645_o = n3644_o;
      12'b000000000001: n3645_o = n3644_o;
      default: n3645_o = n3644_o;
    endcase
  assign n3646_o = n1305_o[4];
  assign n3647_o = n1919_o[4];
  assign n3648_o = n2570_o[4];
  assign n3649_o = help[4];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3650_o = n3649_o;
      12'b010000000000: n3650_o = n3649_o;
      12'b001000000000: n3650_o = n3649_o;
      12'b000100000000: n3650_o = n3649_o;
      12'b000010000000: n3650_o = n3649_o;
      12'b000001000000: n3650_o = n3649_o;
      12'b000000100000: n3650_o = n3411_o;
      12'b000000010000: n3650_o = n3648_o;
      12'b000000001000: n3650_o = n3647_o;
      12'b000000000100: n3650_o = n3646_o;
      12'b000000000010: n3650_o = n3649_o;
      12'b000000000001: n3650_o = n3649_o;
      default: n3650_o = n3649_o;
    endcase
  assign n3651_o = n1305_o[5];
  assign n3652_o = n1919_o[5];
  assign n3653_o = n2570_o[5];
  assign n3654_o = help[5];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3655_o = n3654_o;
      12'b010000000000: n3655_o = n3654_o;
      12'b001000000000: n3655_o = n3654_o;
      12'b000100000000: n3655_o = n3654_o;
      12'b000010000000: n3655_o = n3654_o;
      12'b000001000000: n3655_o = n3654_o;
      12'b000000100000: n3655_o = n3413_o;
      12'b000000010000: n3655_o = n3653_o;
      12'b000000001000: n3655_o = n3652_o;
      12'b000000000100: n3655_o = n3651_o;
      12'b000000000010: n3655_o = n3654_o;
      12'b000000000001: n3655_o = n3654_o;
      default: n3655_o = n3654_o;
    endcase
  assign n3656_o = n1305_o[6];
  assign n3657_o = n1919_o[6];
  assign n3658_o = n2570_o[6];
  assign n3659_o = help[6];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3660_o = n3659_o;
      12'b010000000000: n3660_o = n3659_o;
      12'b001000000000: n3660_o = n3659_o;
      12'b000100000000: n3660_o = n3659_o;
      12'b000010000000: n3660_o = n3659_o;
      12'b000001000000: n3660_o = n3659_o;
      12'b000000100000: n3660_o = n3415_o;
      12'b000000010000: n3660_o = n3658_o;
      12'b000000001000: n3660_o = n3657_o;
      12'b000000000100: n3660_o = n3656_o;
      12'b000000000010: n3660_o = n3659_o;
      12'b000000000001: n3660_o = n3659_o;
      default: n3660_o = n3659_o;
    endcase
  assign n3661_o = n1305_o[7];
  assign n3662_o = n1919_o[7];
  assign n3663_o = n2570_o[7];
  assign n3664_o = help[7];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3665_o = n3664_o;
      12'b010000000000: n3665_o = n3664_o;
      12'b001000000000: n3665_o = n3664_o;
      12'b000100000000: n3665_o = n3664_o;
      12'b000010000000: n3665_o = n3664_o;
      12'b000001000000: n3665_o = n3664_o;
      12'b000000100000: n3665_o = n3417_o;
      12'b000000010000: n3665_o = n3663_o;
      12'b000000001000: n3665_o = n3662_o;
      12'b000000000100: n3665_o = n3661_o;
      12'b000000000010: n3665_o = n3664_o;
      12'b000000000001: n3665_o = n3664_o;
      default: n3665_o = n3664_o;
    endcase
  assign n3666_o = n118_o[7:0];
  assign n3667_o = n1306_o[7:0];
  assign n3668_o = n3554_o[7:0];
  assign n3669_o = n3587_o[7:0];
  assign n3670_o = temp[7:0];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3671_o = n3670_o;
      12'b010000000000: n3671_o = n3670_o;
      12'b001000000000: n3671_o = n3669_o;
      12'b000100000000: n3671_o = n3670_o;
      12'b000010000000: n3671_o = n3668_o;
      12'b000001000000: n3671_o = n3670_o;
      12'b000000100000: n3671_o = n3670_o;
      12'b000000010000: n3671_o = n2572_o;
      12'b000000001000: n3671_o = n1922_o;
      12'b000000000100: n3671_o = n3667_o;
      12'b000000000010: n3671_o = n3670_o;
      12'b000000000001: n3671_o = n3666_o;
      default: n3671_o = n3670_o;
    endcase
  assign n3672_o = n118_o[15:8];
  assign n3673_o = n1306_o[15:8];
  assign n3674_o = n3554_o[15:8];
  assign n3675_o = n3587_o[15:8];
  assign n3676_o = temp[15:8];
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3677_o = n3676_o;
      12'b010000000000: n3677_o = n3676_o;
      12'b001000000000: n3677_o = n3675_o;
      12'b000100000000: n3677_o = n3676_o;
      12'b000010000000: n3677_o = n3674_o;
      12'b000001000000: n3677_o = n3676_o;
      12'b000000100000: n3677_o = n3676_o;
      12'b000000010000: n3677_o = n3676_o;
      12'b000000001000: n3677_o = n1925_o;
      12'b000000000100: n3677_o = n3673_o;
      12'b000000000010: n3677_o = n3676_o;
      12'b000000000001: n3677_o = n3672_o;
      default: n3677_o = n3676_o;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3682_o = 4'b1000;
      12'b010000000000: n3682_o = n3599_o;
      12'b001000000000: n3682_o = n3590_o;
      12'b000100000000: n3682_o = n3576_o;
      12'b000010000000: n3682_o = n3557_o;
      12'b000001000000: n3682_o = n3506_o;
      12'b000000100000: n3682_o = n3440_o;
      12'b000000010000: n3682_o = n2603_o;
      12'b000000001000: n3682_o = n1950_o;
      12'b000000000100: n3682_o = n1308_o;
      12'b000000000010: n3682_o = 4'b0010;
      12'b000000000001: n3682_o = 4'b0001;
      default: n3682_o = 4'b0000;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3684_o = addrmux;
      12'b010000000000: n3684_o = n3601_o;
      12'b001000000000: n3684_o = addrmux;
      12'b000100000000: n3684_o = n3578_o;
      12'b000010000000: n3684_o = n3559_o;
      12'b000001000000: n3684_o = n3509_o;
      12'b000000100000: n3684_o = n3459_o;
      12'b000000010000: n3684_o = n2615_o;
      12'b000000001000: n3684_o = n1959_o;
      12'b000000000100: n3684_o = n1310_o;
      12'b000000000010: n3684_o = 3'b000;
      12'b000000000001: n3684_o = addrmux;
      default: n3684_o = addrmux;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3686_o = 4'b1010;
      12'b010000000000: n3686_o = datamux;
      12'b001000000000: n3686_o = datamux;
      12'b000100000000: n3686_o = datamux;
      12'b000010000000: n3686_o = n3561_o;
      12'b000001000000: n3686_o = n3511_o;
      12'b000000100000: n3686_o = n3462_o;
      12'b000000010000: n3686_o = n2636_o;
      12'b000000001000: n3686_o = n1965_o;
      12'b000000000100: n3686_o = n1311_o;
      12'b000000000010: n3686_o = datamux;
      12'b000000000001: n3686_o = datamux;
      default: n3686_o = datamux;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3687_o = opcode;
      12'b010000000000: n3687_o = opcode;
      12'b001000000000: n3687_o = opcode;
      12'b000100000000: n3687_o = opcode;
      12'b000010000000: n3687_o = opcode;
      12'b000001000000: n3687_o = opcode;
      12'b000000100000: n3687_o = opcode;
      12'b000000010000: n3687_o = opcode;
      12'b000000001000: n3687_o = opcode;
      12'b000000000100: n3687_o = n1313_o;
      12'b000000000010: n3687_o = opcode;
      12'b000000000001: n3687_o = opcode;
      default: n3687_o = opcode;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3688_o = n106_o;
      12'b010000000000: n3688_o = n106_o;
      12'b001000000000: n3688_o = n106_o;
      12'b000100000000: n3688_o = n106_o;
      12'b000010000000: n3688_o = n3562_o;
      12'b000001000000: n3688_o = n106_o;
      12'b000000100000: n3688_o = n106_o;
      12'b000000010000: n3688_o = n106_o;
      12'b000000001000: n3688_o = n106_o;
      12'b000000000100: n3688_o = n106_o;
      12'b000000000010: n3688_o = n106_o;
      12'b000000000001: n3688_o = n106_o;
      default: n3688_o = n106_o;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3689_o = n111_o;
      12'b010000000000: n3689_o = n111_o;
      12'b001000000000: n3689_o = n111_o;
      12'b000100000000: n3689_o = n111_o;
      12'b000010000000: n3689_o = n3563_o;
      12'b000001000000: n3689_o = n111_o;
      12'b000000100000: n3689_o = n111_o;
      12'b000000010000: n3689_o = n111_o;
      12'b000000001000: n3689_o = n111_o;
      12'b000000000100: n3689_o = n111_o;
      12'b000000000010: n3689_o = n111_o;
      12'b000000000001: n3689_o = n111_o;
      default: n3689_o = n111_o;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3690_o = n116_o;
      12'b010000000000: n3690_o = n116_o;
      12'b001000000000: n3690_o = n116_o;
      12'b000100000000: n3690_o = n116_o;
      12'b000010000000: n3690_o = n3564_o;
      12'b000001000000: n3690_o = n116_o;
      12'b000000100000: n3690_o = n116_o;
      12'b000000010000: n3690_o = n116_o;
      12'b000000001000: n3690_o = n116_o;
      12'b000000000100: n3690_o = n116_o;
      12'b000000000010: n3690_o = n116_o;
      12'b000000000001: n3690_o = n116_o;
      default: n3690_o = n116_o;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3692_o = 1'b0;
      12'b010000000000: n3692_o = trace;
      12'b001000000000: n3692_o = trace;
      12'b000100000000: n3692_o = trace;
      12'b000010000000: n3692_o = trace;
      12'b000001000000: n3692_o = trace;
      12'b000000100000: n3692_o = trace;
      12'b000000010000: n3692_o = trace;
      12'b000000001000: n3692_o = trace;
      12'b000000000100: n3692_o = trace_i;
      12'b000000000010: n3692_o = trace;
      12'b000000000001: n3692_o = trace;
      default: n3692_o = trace;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3694_o = 1'b0;
      12'b010000000000: n3694_o = trace_i;
      12'b001000000000: n3694_o = trace_i;
      12'b000100000000: n3694_o = trace_i;
      12'b000010000000: n3694_o = trace_i;
      12'b000001000000: n3694_o = trace_i;
      12'b000000100000: n3694_o = trace_i;
      12'b000000010000: n3694_o = trace_i;
      12'b000000001000: n3694_o = trace_i;
      12'b000000000100: n3694_o = n1314_o;
      12'b000000000010: n3694_o = trace_i;
      12'b000000000001: n3694_o = trace_i;
      default: n3694_o = trace_i;
    endcase
  /* 6805.vhd:307:9  */
  always @*
    case (n3608_o)
      12'b100000000000: n3695_o = traceopcode;
      12'b010000000000: n3695_o = traceopcode;
      12'b001000000000: n3695_o = traceopcode;
      12'b000100000000: n3695_o = traceopcode;
      12'b000010000000: n3695_o = traceopcode;
      12'b000001000000: n3695_o = traceopcode;
      12'b000000100000: n3695_o = traceopcode;
      12'b000000010000: n3695_o = traceopcode;
      12'b000000001000: n3695_o = traceopcode;
      12'b000000000100: n3695_o = n1315_o;
      12'b000000000010: n3695_o = traceopcode;
      12'b000000000001: n3695_o = traceopcode;
      default: n3695_o = traceopcode;
    endcase
  assign n3701_o = {n3620_o, n3616_o};
  assign n3708_o = {n3665_o, n3660_o, n3655_o, n3650_o, n3645_o, n3640_o, n3635_o, n3630_o};
  assign n3710_o = {n3677_o, n3671_o};
  /* 6805.vhd:306:7  */
  assign n3716_o = clken ? n3688_o : n106_o;
  /* 6805.vhd:306:7  */
  assign n3717_o = clken ? n3689_o : n111_o;
  /* 6805.vhd:306:7  */
  assign n3718_o = clken ? n3690_o : n116_o;
  /* 6805.vhd:264:5  */
  assign n3802_o = {8'b11111110, 8'b11111101, 8'b11111011, 8'b11110111, 8'b11101111, 8'b11011111, 8'b10111111, 8'b01111111};
  assign n3803_o = {8'b00000001, 8'b00000010, 8'b00000100, 8'b00001000, 8'b00010000, 8'b00100000, 8'b01000000, 8'b10000000};
  /* 6805.vhd:289:7  */
  assign n3804_o = clken ? n3610_o : rega;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3805_q <= 8'b00000000;
    else
      n3805_q <= n3804_o;
  /* 6805.vhd:289:7  */
  assign n3806_o = clken ? n3611_o : regx;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3807_q <= 8'b00000000;
    else
      n3807_q <= n3806_o;
  /* 6805.vhd:289:7  */
  assign n3808_o = clken ? n3612_o : regsp;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3809_q <= 16'b0000000011111111;
    else
      n3809_q <= n3808_o;
  /* 6805.vhd:289:7  */
  assign n3810_o = clken ? n3701_o : regpc;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3811_q <= 16'b0001111111111110;
    else
      n3811_q <= n3810_o;
  /* 6805.vhd:289:7  */
  assign n3812_o = clken ? n3621_o : flagh;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3813_q <= 1'b0;
    else
      n3813_q <= n3812_o;
  /* 6805.vhd:289:7  */
  assign n3814_o = clken ? n3622_o : flagi;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3815_q <= 1'b1;
    else
      n3815_q <= n3814_o;
  /* 6805.vhd:289:7  */
  assign n3816_o = clken ? n3623_o : flagn;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3817_q <= 1'b0;
    else
      n3817_q <= n3816_o;
  /* 6805.vhd:289:7  */
  assign n3818_o = clken ? n3624_o : flagz;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3819_q <= 1'b0;
    else
      n3819_q <= n3818_o;
  /* 6805.vhd:289:7  */
  assign n3820_o = clken ? n3625_o : flagc;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3821_q <= 1'b0;
    else
      n3821_q <= n3820_o;
  /* 6805.vhd:289:7  */
  assign n3822_o = clken ? n3708_o : help;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3823_q <= 8'b00000000;
    else
      n3823_q <= n3822_o;
  /* 6805.vhd:289:7  */
  assign n3824_o = clken ? n3710_o : temp;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3825_q <= 16'b0001111111111110;
    else
      n3825_q <= n3824_o;
  /* 6805.vhd:289:7  */
  assign n3826_o = clken ? n3682_o : mainfsm;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3827_q <= 4'b0000;
    else
      n3827_q <= n3826_o;
  /* 6805.vhd:289:7  */
  assign n3828_o = clken ? n3684_o : addrmux;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3829_q <= 3'b011;
    else
      n3829_q <= n3828_o;
  /* 6805.vhd:289:7  */
  assign n3830_o = clken ? n3686_o : datamux;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3831_q <= 4'b0000;
    else
      n3831_q <= n3830_o;
  /* 6805.vhd:260:3  */
  assign n3832_o = ~n100_o;
  /* 6805.vhd:260:3  */
  assign n3833_o = clken & n3832_o;
  /* 6805.vhd:289:7  */
  assign n3834_o = n3833_o ? n3687_o : opcode;
  /* 6805.vhd:289:7  */
  always @(posedge clk)
    n3835_q <= n3834_o;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3836_q <= 1'b1;
    else
      n3836_q <= extirq;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3837_q <= 1'b1;
    else
      n3837_q <= timerirq;
  /* 6805.vhd:260:3  */
  assign n3838_o = ~n100_o;
  /* 6805.vhd:289:7  */
  assign n3839_o = n3838_o ? sciirq : sciirq_d;
  /* 6805.vhd:289:7  */
  always @(posedge clk)
    n3840_q <= n3839_o;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3841_q <= 1'b0;
    else
      n3841_q <= n3716_o;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3842_q <= 1'b0;
    else
      n3842_q <= n3717_o;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3843_q <= 1'b0;
    else
      n3843_q <= n3718_o;
  /* 6805.vhd:289:7  */
  assign n3844_o = clken ? n3692_o : trace;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3845_q <= 1'b0;
    else
      n3845_q <= n3844_o;
  /* 6805.vhd:289:7  */
  assign n3846_o = clken ? n3694_o : trace_i;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3847_q <= 1'b0;
    else
      n3847_q <= n3846_o;
  /* 6805.vhd:260:3  */
  assign n3848_o = ~n100_o;
  /* 6805.vhd:260:3  */
  assign n3849_o = clken & n3848_o;
  /* 6805.vhd:289:7  */
  assign n3850_o = n3849_o ? n3695_o : traceopcode;
  /* 6805.vhd:289:7  */
  always @(posedge clk)
    n3851_q <= n3850_o;
  /* 6805.vhd:289:7  */
  assign n3852_o = clken ? n3609_o : n3853_q;
  /* 6805.vhd:289:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3853_q <= 1'b1;
    else
      n3853_q <= n3852_o;
  /* 6805.vhd:217:13  */
  assign n3854_o = mask1[7:0];
  /* 6805.vhd:214:3  */
  assign n3855_o = mask1[15:8];
  /* 6805.vhd:146:6  */
  assign n3856_o = mask1[23:16];
  /* 6805.vhd:145:6  */
  assign n3857_o = mask1[31:24];
  /* 6805.vhd:143:6  */
  assign n3858_o = mask1[39:32];
  /* 6805.vhd:142:6  */
  assign n3859_o = mask1[47:40];
  /* 6805.vhd:289:7  */
  assign n3860_o = mask1[55:48];
  /* 6805.vhd:289:7  */
  assign n3861_o = mask1[63:56];
  /* 6805.vhd:947:37  */
  assign n3862_o = n1971_o[1:0];
  /* 6805.vhd:947:37  */
  always @*
    case (n3862_o)
      2'b00: n3863_o = n3854_o;
      2'b01: n3863_o = n3855_o;
      2'b10: n3863_o = n3856_o;
      2'b11: n3863_o = n3857_o;
    endcase
  /* 6805.vhd:947:37  */
  assign n3864_o = n1971_o[1:0];
  /* 6805.vhd:947:37  */
  always @*
    case (n3864_o)
      2'b00: n3865_o = n3858_o;
      2'b01: n3865_o = n3859_o;
      2'b10: n3865_o = n3860_o;
      2'b11: n3865_o = n3861_o;
    endcase
  /* 6805.vhd:947:37  */
  assign n3866_o = n1971_o[2];
  /* 6805.vhd:947:37  */
  assign n3867_o = n3866_o ? n3865_o : n3863_o;
  /* 6805.vhd:947:37  */
  assign n3868_o = mask1[7:0];
  /* 6805.vhd:947:38  */
  assign n3869_o = mask1[15:8];
  /* 6805.vhd:289:7  */
  assign n3870_o = mask1[23:16];
  /* 6805.vhd:289:7  */
  assign n3871_o = mask1[31:24];
  /* 6805.vhd:289:7  */
  assign n3872_o = mask1[39:32];
  /* 6805.vhd:289:7  */
  assign n3873_o = mask1[47:40];
  /* 6805.vhd:289:7  */
  assign n3874_o = mask1[55:48];
  /* 6805.vhd:289:7  */
  assign n3875_o = mask1[63:56];
  /* 6805.vhd:959:43  */
  assign n3876_o = n2032_o[1:0];
  /* 6805.vhd:959:43  */
  always @*
    case (n3876_o)
      2'b00: n3877_o = n3868_o;
      2'b01: n3877_o = n3869_o;
      2'b10: n3877_o = n3870_o;
      2'b11: n3877_o = n3871_o;
    endcase
  /* 6805.vhd:959:43  */
  assign n3878_o = n2032_o[1:0];
  /* 6805.vhd:959:43  */
  always @*
    case (n3878_o)
      2'b00: n3879_o = n3872_o;
      2'b01: n3879_o = n3873_o;
      2'b10: n3879_o = n3874_o;
      2'b11: n3879_o = n3875_o;
    endcase
  /* 6805.vhd:959:43  */
  assign n3880_o = n2032_o[2];
  /* 6805.vhd:959:43  */
  assign n3881_o = n3880_o ? n3879_o : n3877_o;
  /* 6805.vhd:959:43  */
  assign n3882_o = mask0[7:0];
  /* 6805.vhd:959:44  */
  assign n3883_o = mask0[15:8];
  /* 6805.vhd:289:7  */
  assign n3884_o = mask0[23:16];
  /* 6805.vhd:289:7  */
  assign n3885_o = mask0[31:24];
  /* 6805.vhd:289:7  */
  assign n3886_o = mask0[39:32];
  /* 6805.vhd:289:7  */
  assign n3887_o = mask0[47:40];
  /* 6805.vhd:289:7  */
  assign n3888_o = mask0[55:48];
  /* 6805.vhd:307:9  */
  assign n3889_o = mask0[63:56];
  /* 6805.vhd:961:43  */
  assign n3890_o = n2039_o[1:0];
  /* 6805.vhd:961:43  */
  always @*
    case (n3890_o)
      2'b00: n3891_o = n3882_o;
      2'b01: n3891_o = n3883_o;
      2'b10: n3891_o = n3884_o;
      2'b11: n3891_o = n3885_o;
    endcase
  /* 6805.vhd:961:43  */
  assign n3892_o = n2039_o[1:0];
  /* 6805.vhd:961:43  */
  always @*
    case (n3892_o)
      2'b00: n3893_o = n3886_o;
      2'b01: n3893_o = n3887_o;
      2'b10: n3893_o = n3888_o;
      2'b11: n3893_o = n3889_o;
    endcase
  /* 6805.vhd:961:43  */
  assign n3894_o = n2039_o[2];
  /* 6805.vhd:961:43  */
  assign n3895_o = n3894_o ? n3893_o : n3891_o;
endmodule

