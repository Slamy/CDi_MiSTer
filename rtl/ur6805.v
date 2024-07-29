module fadd
  (input  a,
   input  b,
   input  cin,
   output s,
   output cout);
  wire n4144_o;
  wire n4145_o;
  wire n4146_o;
  wire n4147_o;
  wire n4148_o;
  wire n4149_o;
  wire n4150_o;
  assign s = n4145_o;
  assign cout = n4150_o;
  /* 6805.vhd:19:10  */
  assign n4144_o = a ^ b;
  /* 6805.vhd:19:16  */
  assign n4145_o = n4144_o ^ cin;
  /* 6805.vhd:20:14  */
  assign n4146_o = a & b;
  /* 6805.vhd:20:27  */
  assign n4147_o = a & cin;
  /* 6805.vhd:20:21  */
  assign n4148_o = n4146_o | n4147_o;
  /* 6805.vhd:20:42  */
  assign n4149_o = b & cin;
  /* 6805.vhd:20:36  */
  assign n4150_o = n4148_o | n4149_o;
endmodule

module add8
  (input  [7:0] a,
   input  [7:0] b,
   input  cin,
   output [7:0] sum,
   output cout);
  wire [6:0] c;
  wire n4069_o;
  wire n4070_o;
  wire a0_n4071;
  wire a0_n4072;
  wire a0_s;
  wire a0_cout;
  wire n4077_o;
  wire n4078_o;
  wire n4079_o;
  wire stage_n1_as_n4080;
  wire stage_n1_as_n4081;
  wire stage_n1_as_s;
  wire stage_n1_as_cout;
  wire n4086_o;
  wire n4087_o;
  wire n4088_o;
  wire stage_n2_as_n4089;
  wire stage_n2_as_n4090;
  wire stage_n2_as_s;
  wire stage_n2_as_cout;
  wire n4095_o;
  wire n4096_o;
  wire n4097_o;
  wire stage_n3_as_n4098;
  wire stage_n3_as_n4099;
  wire stage_n3_as_s;
  wire stage_n3_as_cout;
  wire n4104_o;
  wire n4105_o;
  wire n4106_o;
  wire stage_n4_as_n4107;
  wire stage_n4_as_n4108;
  wire stage_n4_as_s;
  wire stage_n4_as_cout;
  wire n4113_o;
  wire n4114_o;
  wire n4115_o;
  wire stage_n5_as_n4116;
  wire stage_n5_as_n4117;
  wire stage_n5_as_s;
  wire stage_n5_as_cout;
  wire n4122_o;
  wire n4123_o;
  wire n4124_o;
  wire stage_n6_as_n4125;
  wire stage_n6_as_n4126;
  wire stage_n6_as_s;
  wire stage_n6_as_cout;
  wire n4131_o;
  wire n4132_o;
  wire n4133_o;
  wire a31_n4134;
  wire a31_n4135;
  wire a31_s;
  wire a31_cout;
  wire [6:0] n4140_o;
  wire [7:0] n4141_o;
  assign sum = n4141_o;
  assign cout = a31_n4135;
  /* 6805.vhd:34:10  */
  assign c = n4140_o; // (signal)
  /* 6805.vhd:43:33  */
  assign n4069_o = a[0];
  /* 6805.vhd:43:39  */
  assign n4070_o = b[0];
  /* 6805.vhd:43:49  */
  assign a0_n4071 = a0_s; // (signal)
  /* 6805.vhd:43:57  */
  assign a0_n4072 = a0_cout; // (signal)
  /* 6805.vhd:43:3  */
  fadd a0 (
    .a(n4069_o),
    .b(n4070_o),
    .cin(cin),
    .s(a0_s),
    .cout(a0_cout));
  /* 6805.vhd:45:33  */
  assign n4077_o = a[1];
  /* 6805.vhd:45:39  */
  assign n4078_o = b[1];
  /* 6805.vhd:45:45  */
  assign n4079_o = c[6];
  /* 6805.vhd:45:53  */
  assign stage_n1_as_n4080 = stage_n1_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n1_as_n4081 = stage_n1_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n1_as (
    .a(n4077_o),
    .b(n4078_o),
    .cin(n4079_o),
    .s(stage_n1_as_s),
    .cout(stage_n1_as_cout));
  /* 6805.vhd:45:33  */
  assign n4086_o = a[2];
  /* 6805.vhd:45:39  */
  assign n4087_o = b[2];
  /* 6805.vhd:45:45  */
  assign n4088_o = c[5];
  /* 6805.vhd:45:53  */
  assign stage_n2_as_n4089 = stage_n2_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n2_as_n4090 = stage_n2_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n2_as (
    .a(n4086_o),
    .b(n4087_o),
    .cin(n4088_o),
    .s(stage_n2_as_s),
    .cout(stage_n2_as_cout));
  /* 6805.vhd:45:33  */
  assign n4095_o = a[3];
  /* 6805.vhd:45:39  */
  assign n4096_o = b[3];
  /* 6805.vhd:45:45  */
  assign n4097_o = c[4];
  /* 6805.vhd:45:53  */
  assign stage_n3_as_n4098 = stage_n3_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n3_as_n4099 = stage_n3_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n3_as (
    .a(n4095_o),
    .b(n4096_o),
    .cin(n4097_o),
    .s(stage_n3_as_s),
    .cout(stage_n3_as_cout));
  /* 6805.vhd:45:33  */
  assign n4104_o = a[4];
  /* 6805.vhd:45:39  */
  assign n4105_o = b[4];
  /* 6805.vhd:45:45  */
  assign n4106_o = c[3];
  /* 6805.vhd:45:53  */
  assign stage_n4_as_n4107 = stage_n4_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n4_as_n4108 = stage_n4_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n4_as (
    .a(n4104_o),
    .b(n4105_o),
    .cin(n4106_o),
    .s(stage_n4_as_s),
    .cout(stage_n4_as_cout));
  /* 6805.vhd:45:33  */
  assign n4113_o = a[5];
  /* 6805.vhd:45:39  */
  assign n4114_o = b[5];
  /* 6805.vhd:45:45  */
  assign n4115_o = c[2];
  /* 6805.vhd:45:53  */
  assign stage_n5_as_n4116 = stage_n5_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n5_as_n4117 = stage_n5_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n5_as (
    .a(n4113_o),
    .b(n4114_o),
    .cin(n4115_o),
    .s(stage_n5_as_s),
    .cout(stage_n5_as_cout));
  /* 6805.vhd:45:33  */
  assign n4122_o = a[6];
  /* 6805.vhd:45:39  */
  assign n4123_o = b[6];
  /* 6805.vhd:45:45  */
  assign n4124_o = c[1];
  /* 6805.vhd:45:53  */
  assign stage_n6_as_n4125 = stage_n6_as_s; // (signal)
  /* 6805.vhd:45:61  */
  assign stage_n6_as_n4126 = stage_n6_as_cout; // (signal)
  /* 6805.vhd:45:14  */
  fadd stage_n6_as (
    .a(n4122_o),
    .b(n4123_o),
    .cin(n4124_o),
    .s(stage_n6_as_s),
    .cout(stage_n6_as_cout));
  /* 6805.vhd:47:33  */
  assign n4131_o = a[7];
  /* 6805.vhd:47:39  */
  assign n4132_o = b[7];
  /* 6805.vhd:47:45  */
  assign n4133_o = c[0];
  /* 6805.vhd:47:51  */
  assign a31_n4134 = a31_s; // (signal)
  /* 6805.vhd:47:59  */
  assign a31_n4135 = a31_cout; // (signal)
  /* 6805.vhd:47:3  */
  fadd a31 (
    .a(n4131_o),
    .b(n4132_o),
    .cin(n4133_o),
    .s(a31_s),
    .cout(a31_cout));
  assign n4140_o = {a0_n4072, stage_n1_as_n4081, stage_n2_as_n4090, stage_n3_as_n4099, stage_n4_as_n4108, stage_n5_as_n4117, stage_n6_as_n4126};
  assign n4141_o = {a31_n4134, stage_n6_as_n4125, stage_n5_as_n4116, stage_n4_as_n4107, stage_n3_as_n4098, stage_n2_as_n4089, stage_n1_as_n4080, a0_n4071};
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
  wire [7:0] n3992_o;
  wire n3993_o;
  wire n3994_o;
  wire n3995_o;
  wire stage_n1_sta_n3996;
  wire stage_n1_sta_n3997;
  wire stage_n1_sta_s;
  wire stage_n1_sta_cout;
  wire n4002_o;
  wire n4003_o;
  wire n4004_o;
  wire stage_n2_sta_n4005;
  wire stage_n2_sta_n4006;
  wire stage_n2_sta_s;
  wire stage_n2_sta_cout;
  wire n4011_o;
  wire n4012_o;
  wire n4013_o;
  wire stage_n3_sta_n4014;
  wire stage_n3_sta_n4015;
  wire stage_n3_sta_s;
  wire stage_n3_sta_cout;
  wire n4020_o;
  wire n4021_o;
  wire n4022_o;
  wire stage_n4_sta_n4023;
  wire stage_n4_sta_n4024;
  wire stage_n4_sta_s;
  wire stage_n4_sta_cout;
  wire n4029_o;
  wire n4030_o;
  wire n4031_o;
  wire stage_n5_sta_n4032;
  wire stage_n5_sta_n4033;
  wire stage_n5_sta_s;
  wire stage_n5_sta_cout;
  wire n4038_o;
  wire n4039_o;
  wire n4040_o;
  wire stage_n6_sta_n4041;
  wire stage_n6_sta_n4042;
  wire stage_n6_sta_s;
  wire stage_n6_sta_cout;
  wire n4047_o;
  wire n4048_o;
  wire n4049_o;
  wire stage_n7_sta_n4050;
  wire stage_n7_sta_n4051;
  wire stage_n7_sta_s;
  wire stage_n7_sta_cout;
  wire n4056_o;
  wire n4057_o;
  wire n4058_o;
  wire stage_n8_sta_n4059;
  wire stage_n8_sta_n4060;
  wire stage_n8_sta_s;
  wire stage_n8_sta_cout;
  wire [7:0] n4065_o;
  wire [7:0] n4066_o;
  assign sum_out = n4065_o;
  assign cout = n4066_o;
  /* 6805.vhd:65:10  */
  always @*
    zero = 8'b00000000; // (isignal)
  initial
    zero = 8'b00000000;
  /* 6805.vhd:66:10  */
  always @*
    aa = n3992_o; // (isignal)
  initial
    aa = 8'b00000000;
  /* 6805.vhd:75:11  */
  assign n3992_o = b ? a : zero;
  /* 6805.vhd:77:26  */
  assign n3993_o = aa[0];
  /* 6805.vhd:77:37  */
  assign n3994_o = sum_in[0];
  /* 6805.vhd:77:45  */
  assign n3995_o = cin[0];
  /* 6805.vhd:77:51  */
  assign stage_n1_sta_n3996 = stage_n1_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n1_sta_n3997 = stage_n1_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n1_sta (
    .a(n3993_o),
    .b(n3994_o),
    .cin(n3995_o),
    .s(stage_n1_sta_s),
    .cout(stage_n1_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4002_o = aa[1];
  /* 6805.vhd:77:37  */
  assign n4003_o = sum_in[1];
  /* 6805.vhd:77:45  */
  assign n4004_o = cin[1];
  /* 6805.vhd:77:51  */
  assign stage_n2_sta_n4005 = stage_n2_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n2_sta_n4006 = stage_n2_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n2_sta (
    .a(n4002_o),
    .b(n4003_o),
    .cin(n4004_o),
    .s(stage_n2_sta_s),
    .cout(stage_n2_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4011_o = aa[2];
  /* 6805.vhd:77:37  */
  assign n4012_o = sum_in[2];
  /* 6805.vhd:77:45  */
  assign n4013_o = cin[2];
  /* 6805.vhd:77:51  */
  assign stage_n3_sta_n4014 = stage_n3_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n3_sta_n4015 = stage_n3_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n3_sta (
    .a(n4011_o),
    .b(n4012_o),
    .cin(n4013_o),
    .s(stage_n3_sta_s),
    .cout(stage_n3_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4020_o = aa[3];
  /* 6805.vhd:77:37  */
  assign n4021_o = sum_in[3];
  /* 6805.vhd:77:45  */
  assign n4022_o = cin[3];
  /* 6805.vhd:77:51  */
  assign stage_n4_sta_n4023 = stage_n4_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n4_sta_n4024 = stage_n4_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n4_sta (
    .a(n4020_o),
    .b(n4021_o),
    .cin(n4022_o),
    .s(stage_n4_sta_s),
    .cout(stage_n4_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4029_o = aa[4];
  /* 6805.vhd:77:37  */
  assign n4030_o = sum_in[4];
  /* 6805.vhd:77:45  */
  assign n4031_o = cin[4];
  /* 6805.vhd:77:51  */
  assign stage_n5_sta_n4032 = stage_n5_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n5_sta_n4033 = stage_n5_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n5_sta (
    .a(n4029_o),
    .b(n4030_o),
    .cin(n4031_o),
    .s(stage_n5_sta_s),
    .cout(stage_n5_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4038_o = aa[5];
  /* 6805.vhd:77:37  */
  assign n4039_o = sum_in[5];
  /* 6805.vhd:77:45  */
  assign n4040_o = cin[5];
  /* 6805.vhd:77:51  */
  assign stage_n6_sta_n4041 = stage_n6_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n6_sta_n4042 = stage_n6_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n6_sta (
    .a(n4038_o),
    .b(n4039_o),
    .cin(n4040_o),
    .s(stage_n6_sta_s),
    .cout(stage_n6_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4047_o = aa[6];
  /* 6805.vhd:77:37  */
  assign n4048_o = sum_in[6];
  /* 6805.vhd:77:45  */
  assign n4049_o = cin[6];
  /* 6805.vhd:77:51  */
  assign stage_n7_sta_n4050 = stage_n7_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n7_sta_n4051 = stage_n7_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n7_sta (
    .a(n4047_o),
    .b(n4048_o),
    .cin(n4049_o),
    .s(stage_n7_sta_s),
    .cout(stage_n7_sta_cout));
  /* 6805.vhd:77:26  */
  assign n4056_o = aa[7];
  /* 6805.vhd:77:37  */
  assign n4057_o = sum_in[7];
  /* 6805.vhd:77:45  */
  assign n4058_o = cin[7];
  /* 6805.vhd:77:51  */
  assign stage_n8_sta_n4059 = stage_n8_sta_s; // (signal)
  /* 6805.vhd:77:63  */
  assign stage_n8_sta_n4060 = stage_n8_sta_cout; // (signal)
  /* 6805.vhd:77:5  */
  fadd stage_n8_sta (
    .a(n4056_o),
    .b(n4057_o),
    .cin(n4058_o),
    .s(stage_n8_sta_s),
    .cout(stage_n8_sta_cout));
  assign n4065_o = {stage_n8_sta_n4059, stage_n7_sta_n4050, stage_n6_sta_n4041, stage_n5_sta_n4032, stage_n4_sta_n4023, stage_n3_sta_n4014, stage_n2_sta_n4005, stage_n1_sta_n3996};
  assign n4066_o = {stage_n8_sta_n4060, stage_n7_sta_n4051, stage_n6_sta_n4042, stage_n5_sta_n4033, stage_n4_sta_n4024, stage_n3_sta_n4015, stage_n2_sta_n4006, stage_n1_sta_n3997};
endmodule

module mul8
  (input  [7:0] a,
   input  [7:0] b,
   output [15:0] prod);
  reg [7:0] zero;
  wire [63:0] s;
  wire [63:0] c;
  wire [63:0] ss;
  wire n3873_o;
  wire [7:0] st0_n3874;
  wire [7:0] st0_n3875;
  wire [7:0] st0_sum_out;
  wire [7:0] st0_cout;
  wire [6:0] n3880_o;
  wire [7:0] n3882_o;
  wire n3883_o;
  wire n3884_o;
  wire [7:0] n3885_o;
  wire [7:0] n3886_o;
  wire [7:0] stage_n1_st_n3887;
  wire [7:0] stage_n1_st_n3888;
  wire [7:0] stage_n1_st_sum_out;
  wire [7:0] stage_n1_st_cout;
  wire [6:0] n3893_o;
  wire [7:0] n3895_o;
  wire n3896_o;
  wire n3897_o;
  wire [7:0] n3898_o;
  wire [7:0] n3899_o;
  wire [7:0] stage_n2_st_n3900;
  wire [7:0] stage_n2_st_n3901;
  wire [7:0] stage_n2_st_sum_out;
  wire [7:0] stage_n2_st_cout;
  wire [6:0] n3906_o;
  wire [7:0] n3908_o;
  wire n3909_o;
  wire n3910_o;
  wire [7:0] n3911_o;
  wire [7:0] n3912_o;
  wire [7:0] stage_n3_st_n3913;
  wire [7:0] stage_n3_st_n3914;
  wire [7:0] stage_n3_st_sum_out;
  wire [7:0] stage_n3_st_cout;
  wire [6:0] n3919_o;
  wire [7:0] n3921_o;
  wire n3922_o;
  wire n3923_o;
  wire [7:0] n3924_o;
  wire [7:0] n3925_o;
  wire [7:0] stage_n4_st_n3926;
  wire [7:0] stage_n4_st_n3927;
  wire [7:0] stage_n4_st_sum_out;
  wire [7:0] stage_n4_st_cout;
  wire [6:0] n3932_o;
  wire [7:0] n3934_o;
  wire n3935_o;
  wire n3936_o;
  wire [7:0] n3937_o;
  wire [7:0] n3938_o;
  wire [7:0] stage_n5_st_n3939;
  wire [7:0] stage_n5_st_n3940;
  wire [7:0] stage_n5_st_sum_out;
  wire [7:0] stage_n5_st_cout;
  wire [6:0] n3945_o;
  wire [7:0] n3947_o;
  wire n3948_o;
  wire n3949_o;
  wire [7:0] n3950_o;
  wire [7:0] n3951_o;
  wire [7:0] stage_n6_st_n3952;
  wire [7:0] stage_n6_st_n3953;
  wire [7:0] stage_n6_st_sum_out;
  wire [7:0] stage_n6_st_cout;
  wire [6:0] n3958_o;
  wire [7:0] n3960_o;
  wire n3961_o;
  wire n3962_o;
  wire [7:0] n3963_o;
  wire [7:0] n3964_o;
  wire [7:0] stage_n7_st_n3965;
  wire [7:0] stage_n7_st_n3966;
  wire [7:0] stage_n7_st_sum_out;
  wire [7:0] stage_n7_st_cout;
  wire [6:0] n3971_o;
  wire [7:0] n3973_o;
  wire n3974_o;
  wire [7:0] n3975_o;
  wire [7:0] n3976_o;
  localparam n3977_o = 1'b0;
  wire [7:0] add_n3978;
  wire [7:0] add_sum;
  wire add_cout;
  wire [63:0] n3984_o;
  wire [63:0] n3985_o;
  wire [63:0] n3986_o;
  wire [15:0] n3987_o;
  assign prod = n3987_o;
  /* 6805.vhd:92:10  */
  always @*
    zero = 8'b00000000; // (isignal)
  initial
    zero = 8'b00000000;
  /* 6805.vhd:95:10  */
  assign s = n3984_o; // (signal)
  /* 6805.vhd:96:10  */
  assign c = n3985_o; // (signal)
  /* 6805.vhd:97:10  */
  assign ss = n3986_o; // (signal)
  /* 6805.vhd:115:24  */
  assign n3873_o = b[0];
  /* 6805.vhd:115:45  */
  assign st0_n3874 = st0_sum_out; // (signal)
  /* 6805.vhd:115:51  */
  assign st0_n3875 = st0_cout; // (signal)
  /* 6805.vhd:115:3  */
  add8c st0 (
    .b(n3873_o),
    .a(a),
    .sum_in(zero),
    .cin(zero),
    .sum_out(st0_sum_out),
    .cout(st0_cout));
  /* 6805.vhd:116:22  */
  assign n3880_o = s[63:57];
  /* 6805.vhd:116:16  */
  assign n3882_o = {1'b0, n3880_o};
  /* 6805.vhd:117:18  */
  assign n3883_o = s[56];
  /* 6805.vhd:120:25  */
  assign n3884_o = b[1];
  /* 6805.vhd:120:35  */
  assign n3885_o = ss[63:56];
  /* 6805.vhd:120:44  */
  assign n3886_o = c[63:56];
  /* 6805.vhd:120:51  */
  assign stage_n1_st_n3887 = stage_n1_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n1_st_n3888 = stage_n1_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n1_st (
    .b(n3884_o),
    .a(a),
    .sum_in(n3885_o),
    .cin(n3886_o),
    .sum_out(stage_n1_st_sum_out),
    .cout(stage_n1_st_cout));
  /* 6805.vhd:121:24  */
  assign n3893_o = s[55:49];
  /* 6805.vhd:121:18  */
  assign n3895_o = {1'b0, n3893_o};
  /* 6805.vhd:122:20  */
  assign n3896_o = s[48];
  /* 6805.vhd:120:25  */
  assign n3897_o = b[2];
  /* 6805.vhd:120:35  */
  assign n3898_o = ss[55:48];
  /* 6805.vhd:120:44  */
  assign n3899_o = c[55:48];
  /* 6805.vhd:120:51  */
  assign stage_n2_st_n3900 = stage_n2_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n2_st_n3901 = stage_n2_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n2_st (
    .b(n3897_o),
    .a(a),
    .sum_in(n3898_o),
    .cin(n3899_o),
    .sum_out(stage_n2_st_sum_out),
    .cout(stage_n2_st_cout));
  /* 6805.vhd:121:24  */
  assign n3906_o = s[47:41];
  /* 6805.vhd:121:18  */
  assign n3908_o = {1'b0, n3906_o};
  /* 6805.vhd:122:20  */
  assign n3909_o = s[40];
  /* 6805.vhd:120:25  */
  assign n3910_o = b[3];
  /* 6805.vhd:120:35  */
  assign n3911_o = ss[47:40];
  /* 6805.vhd:120:44  */
  assign n3912_o = c[47:40];
  /* 6805.vhd:120:51  */
  assign stage_n3_st_n3913 = stage_n3_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n3_st_n3914 = stage_n3_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n3_st (
    .b(n3910_o),
    .a(a),
    .sum_in(n3911_o),
    .cin(n3912_o),
    .sum_out(stage_n3_st_sum_out),
    .cout(stage_n3_st_cout));
  /* 6805.vhd:121:24  */
  assign n3919_o = s[39:33];
  /* 6805.vhd:121:18  */
  assign n3921_o = {1'b0, n3919_o};
  /* 6805.vhd:122:20  */
  assign n3922_o = s[32];
  /* 6805.vhd:120:25  */
  assign n3923_o = b[4];
  /* 6805.vhd:120:35  */
  assign n3924_o = ss[39:32];
  /* 6805.vhd:120:44  */
  assign n3925_o = c[39:32];
  /* 6805.vhd:120:51  */
  assign stage_n4_st_n3926 = stage_n4_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n4_st_n3927 = stage_n4_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n4_st (
    .b(n3923_o),
    .a(a),
    .sum_in(n3924_o),
    .cin(n3925_o),
    .sum_out(stage_n4_st_sum_out),
    .cout(stage_n4_st_cout));
  /* 6805.vhd:121:24  */
  assign n3932_o = s[31:25];
  /* 6805.vhd:121:18  */
  assign n3934_o = {1'b0, n3932_o};
  /* 6805.vhd:122:20  */
  assign n3935_o = s[24];
  /* 6805.vhd:120:25  */
  assign n3936_o = b[5];
  /* 6805.vhd:120:35  */
  assign n3937_o = ss[31:24];
  /* 6805.vhd:120:44  */
  assign n3938_o = c[31:24];
  /* 6805.vhd:120:51  */
  assign stage_n5_st_n3939 = stage_n5_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n5_st_n3940 = stage_n5_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n5_st (
    .b(n3936_o),
    .a(a),
    .sum_in(n3937_o),
    .cin(n3938_o),
    .sum_out(stage_n5_st_sum_out),
    .cout(stage_n5_st_cout));
  /* 6805.vhd:121:24  */
  assign n3945_o = s[23:17];
  /* 6805.vhd:121:18  */
  assign n3947_o = {1'b0, n3945_o};
  /* 6805.vhd:122:20  */
  assign n3948_o = s[16];
  /* 6805.vhd:120:25  */
  assign n3949_o = b[6];
  /* 6805.vhd:120:35  */
  assign n3950_o = ss[23:16];
  /* 6805.vhd:120:44  */
  assign n3951_o = c[23:16];
  /* 6805.vhd:120:51  */
  assign stage_n6_st_n3952 = stage_n6_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n6_st_n3953 = stage_n6_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n6_st (
    .b(n3949_o),
    .a(a),
    .sum_in(n3950_o),
    .cin(n3951_o),
    .sum_out(stage_n6_st_sum_out),
    .cout(stage_n6_st_cout));
  /* 6805.vhd:121:24  */
  assign n3958_o = s[15:9];
  /* 6805.vhd:121:18  */
  assign n3960_o = {1'b0, n3958_o};
  /* 6805.vhd:122:20  */
  assign n3961_o = s[8];
  /* 6805.vhd:120:25  */
  assign n3962_o = b[7];
  /* 6805.vhd:120:35  */
  assign n3963_o = ss[15:8];
  /* 6805.vhd:120:44  */
  assign n3964_o = c[15:8];
  /* 6805.vhd:120:51  */
  assign stage_n7_st_n3965 = stage_n7_st_sum_out; // (signal)
  /* 6805.vhd:120:57  */
  assign stage_n7_st_n3966 = stage_n7_st_cout; // (signal)
  /* 6805.vhd:120:5  */
  add8c stage_n7_st (
    .b(n3962_o),
    .a(a),
    .sum_in(n3963_o),
    .cin(n3964_o),
    .sum_out(stage_n7_st_sum_out),
    .cout(stage_n7_st_cout));
  /* 6805.vhd:121:24  */
  assign n3971_o = s[7:1];
  /* 6805.vhd:121:18  */
  assign n3973_o = {1'b0, n3971_o};
  /* 6805.vhd:122:20  */
  assign n3974_o = s[0];
  /* 6805.vhd:125:24  */
  assign n3975_o = ss[7:0];
  /* 6805.vhd:125:30  */
  assign n3976_o = c[7:0];
  /* 6805.vhd:125:41  */
  assign add_n3978 = add_sum; // (signal)
  /* 6805.vhd:125:3  */
  add8 add (
    .a(n3975_o),
    .b(n3976_o),
    .cin(n3977_o),
    .sum(add_sum),
    .cout());
  assign n3984_o = {st0_n3874, stage_n1_st_n3887, stage_n2_st_n3900, stage_n3_st_n3913, stage_n4_st_n3926, stage_n5_st_n3939, stage_n6_st_n3952, stage_n7_st_n3965};
  assign n3985_o = {st0_n3875, stage_n1_st_n3888, stage_n2_st_n3901, stage_n3_st_n3914, stage_n4_st_n3927, stage_n5_st_n3940, stage_n6_st_n3953, stage_n7_st_n3966};
  assign n3986_o = {n3882_o, n3895_o, n3908_o, n3921_o, n3934_o, n3947_o, n3960_o, n3973_o};
  assign n3987_o = {add_n3978, n3974_o, n3961_o, n3948_o, n3935_o, n3922_o, n3909_o, n3896_o, n3883_o};
endmodule

module UR6805
  (input  clk,
   input  clken,
   input  rst,
   input  extirq,
   input  timerirq,
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
  wire extirqrequest;
  wire timerirqrequest;
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
  wire [15:0] n113_o;
  wire n115_o;
  wire n117_o;
  wire n118_o;
  wire [15:0] n120_o;
  wire n122_o;
  wire [15:0] n124_o;
  wire n126_o;
  wire n128_o;
  wire n129_o;
  wire n131_o;
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
  wire [15:0] n299_o;
  wire n301_o;
  wire n303_o;
  wire n304_o;
  wire n306_o;
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
  wire [15:0] n438_o;
  wire n440_o;
  wire n442_o;
  wire n443_o;
  wire n445_o;
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
  wire [15:0] n469_o;
  wire n471_o;
  wire n473_o;
  wire n474_o;
  wire n476_o;
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
  wire [15:0] n506_o;
  wire n508_o;
  wire n510_o;
  wire n511_o;
  wire n513_o;
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
  wire [15:0] n552_o;
  wire n554_o;
  wire n556_o;
  wire n557_o;
  wire n559_o;
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
  wire [15:0] n589_o;
  wire n591_o;
  wire n592_o;
  wire n594_o;
  wire n597_o;
  wire [15:0] n599_o;
  wire n601_o;
  wire n602_o;
  wire n604_o;
  wire n607_o;
  wire [15:0] n609_o;
  wire n611_o;
  wire [7:0] n613_o;
  wire [7:0] n615_o;
  wire n616_o;
  wire n618_o;
  wire n621_o;
  wire n624_o;
  wire [15:0] n626_o;
  wire n628_o;
  wire [7:0] n629_o;
  wire [7:0] n630_o;
  wire [15:0] n632_o;
  wire n634_o;
  wire [7:0] n636_o;
  wire [7:0] n638_o;
  wire n639_o;
  wire n641_o;
  wire n644_o;
  wire [15:0] n646_o;
  wire n648_o;
  wire [6:0] n649_o;
  wire [7:0] n651_o;
  wire [6:0] n652_o;
  wire [7:0] n654_o;
  wire n655_o;
  wire n657_o;
  wire n660_o;
  wire [15:0] n662_o;
  wire n664_o;
  wire [6:0] n665_o;
  wire [7:0] n666_o;
  wire [6:0] n667_o;
  wire [7:0] n668_o;
  wire n669_o;
  wire n671_o;
  wire n674_o;
  wire [15:0] n676_o;
  wire n678_o;
  wire n679_o;
  wire [6:0] n680_o;
  wire [7:0] n681_o;
  wire n682_o;
  wire [6:0] n683_o;
  wire [7:0] n684_o;
  wire n685_o;
  wire n686_o;
  wire n688_o;
  wire n691_o;
  wire [15:0] n693_o;
  wire n695_o;
  wire [6:0] n696_o;
  wire [7:0] n698_o;
  wire [6:0] n699_o;
  wire [7:0] n701_o;
  wire n702_o;
  wire n703_o;
  wire n705_o;
  wire n708_o;
  wire [15:0] n710_o;
  wire n712_o;
  wire [6:0] n713_o;
  wire [7:0] n714_o;
  wire [6:0] n715_o;
  wire [7:0] n716_o;
  wire n717_o;
  wire n718_o;
  wire n720_o;
  wire n723_o;
  wire [15:0] n725_o;
  wire n727_o;
  wire [7:0] n729_o;
  wire [7:0] n731_o;
  wire n732_o;
  wire n734_o;
  wire n737_o;
  wire [15:0] n739_o;
  wire n741_o;
  wire [7:0] n743_o;
  wire [7:0] n745_o;
  wire n746_o;
  wire n748_o;
  wire n751_o;
  wire [15:0] n753_o;
  wire n755_o;
  wire n756_o;
  wire n758_o;
  wire n761_o;
  wire [15:0] n763_o;
  wire n765_o;
  wire [15:0] n767_o;
  wire n769_o;
  wire [7:0] n771_o;
  wire [7:0] n773_o;
  wire n774_o;
  wire n776_o;
  wire n779_o;
  wire n782_o;
  wire [15:0] n784_o;
  wire n786_o;
  wire [7:0] n788_o;
  wire [7:0] n790_o;
  wire n791_o;
  wire n793_o;
  wire n796_o;
  wire [15:0] n798_o;
  wire n800_o;
  wire [6:0] n801_o;
  wire [7:0] n803_o;
  wire [6:0] n804_o;
  wire [7:0] n806_o;
  wire n807_o;
  wire n809_o;
  wire n812_o;
  wire [15:0] n814_o;
  wire n816_o;
  wire [6:0] n817_o;
  wire [7:0] n818_o;
  wire [6:0] n819_o;
  wire [7:0] n820_o;
  wire n821_o;
  wire n823_o;
  wire n826_o;
  wire [15:0] n828_o;
  wire n830_o;
  wire n831_o;
  wire [6:0] n832_o;
  wire [7:0] n833_o;
  wire n834_o;
  wire [6:0] n835_o;
  wire [7:0] n836_o;
  wire n837_o;
  wire n838_o;
  wire n840_o;
  wire n843_o;
  wire [15:0] n845_o;
  wire n847_o;
  wire [6:0] n848_o;
  wire [7:0] n850_o;
  wire [6:0] n851_o;
  wire [7:0] n853_o;
  wire n854_o;
  wire n855_o;
  wire n857_o;
  wire n860_o;
  wire [15:0] n862_o;
  wire n864_o;
  wire [6:0] n865_o;
  wire [7:0] n866_o;
  wire [6:0] n867_o;
  wire [7:0] n868_o;
  wire n869_o;
  wire n870_o;
  wire n872_o;
  wire n875_o;
  wire [15:0] n877_o;
  wire n879_o;
  wire [7:0] n881_o;
  wire [7:0] n883_o;
  wire n884_o;
  wire n886_o;
  wire n889_o;
  wire [15:0] n891_o;
  wire n893_o;
  wire [7:0] n895_o;
  wire [7:0] n897_o;
  wire n898_o;
  wire n900_o;
  wire n903_o;
  wire [15:0] n905_o;
  wire n907_o;
  wire n908_o;
  wire n910_o;
  wire n913_o;
  wire [15:0] n915_o;
  wire n917_o;
  wire [15:0] n919_o;
  wire n921_o;
  wire [15:0] n923_o;
  wire [15:0] n925_o;
  wire n927_o;
  wire n929_o;
  wire n930_o;
  wire n932_o;
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
  wire [15:0] n959_o;
  wire n961_o;
  wire [15:0] n963_o;
  wire n965_o;
  wire n967_o;
  wire n968_o;
  wire [15:0] n970_o;
  wire n972_o;
  wire [15:0] n974_o;
  wire n976_o;
  wire [15:0] n978_o;
  wire n980_o;
  wire [15:0] n982_o;
  wire n984_o;
  wire n985_o;
  wire [15:0] n987_o;
  wire n989_o;
  wire n991_o;
  wire n992_o;
  wire n993_o;
  wire [15:0] n995_o;
  wire n997_o;
  wire n999_o;
  wire n1000_o;
  wire [15:0] n1002_o;
  wire n1004_o;
  wire [15:0] n1006_o;
  wire n1008_o;
  wire n1010_o;
  wire n1011_o;
  wire n1013_o;
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
  wire [15:0] n1136_o;
  wire n1138_o;
  wire [15:0] n1140_o;
  wire [15:0] n1142_o;
  wire n1144_o;
  wire n1146_o;
  wire n1147_o;
  wire n1149_o;
  wire n1150_o;
  wire [15:0] n1152_o;
  wire [15:0] n1154_o;
  wire n1156_o;
  wire n1158_o;
  wire n1159_o;
  wire [15:0] n1161_o;
  wire [15:0] n1163_o;
  wire n1165_o;
  wire [47:0] n1166_o;
  reg n1171_o;
  reg [7:0] n1173_o;
  reg [7:0] n1175_o;
  reg [15:0] n1177_o;
  reg [15:0] n1178_o;
  reg n1180_o;
  reg n1181_o;
  reg n1187_o;
  reg n1191_o;
  reg n1195_o;
  reg [7:0] n1197_o;
  reg [15:0] n1199_o;
  reg [3:0] n1249_o;
  reg [2:0] n1259_o;
  reg [3:0] n1264_o;
  reg n1266_o;
  wire n1268_o;
  wire [7:0] n1269_o;
  wire [7:0] n1270_o;
  wire [15:0] n1271_o;
  wire [15:0] n1272_o;
  wire n1273_o;
  wire n1274_o;
  wire n1275_o;
  wire n1276_o;
  wire n1277_o;
  wire [7:0] n1278_o;
  wire [15:0] n1279_o;
  wire [3:0] n1281_o;
  wire [2:0] n1283_o;
  wire [3:0] n1284_o;
  wire [7:0] n1286_o;
  wire n1287_o;
  wire n1289_o;
  wire [7:0] n1290_o;
  wire [7:0] n1291_o;
  wire [15:0] n1292_o;
  wire [15:0] n1293_o;
  wire n1294_o;
  wire n1295_o;
  wire n1296_o;
  wire n1297_o;
  wire n1298_o;
  wire [7:0] n1299_o;
  wire [15:0] n1300_o;
  wire [3:0] n1302_o;
  wire [2:0] n1304_o;
  wire [3:0] n1305_o;
  wire [7:0] n1307_o;
  wire n1308_o;
  wire [7:0] n1309_o;
  wire n1312_o;
  wire [15:0] n1314_o;
  wire n1316_o;
  wire n1318_o;
  wire n1319_o;
  wire n1321_o;
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
  wire [15:0] n1441_o;
  wire n1443_o;
  wire n1445_o;
  wire n1446_o;
  wire n1448_o;
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
  wire [15:0] n1532_o;
  wire n1534_o;
  wire [15:0] n1536_o;
  wire n1538_o;
  wire [15:0] n1540_o;
  wire n1542_o;
  wire n1544_o;
  wire n1545_o;
  wire n1547_o;
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
  wire n1576_o;
  wire n1577_o;
  wire [15:0] n1579_o;
  wire [15:0] n1580_o;
  wire [15:0] n1582_o;
  wire [15:0] n1584_o;
  wire [15:0] n1585_o;
  wire [15:0] n1587_o;
  wire [15:0] n1588_o;
  wire n1590_o;
  wire [15:0] n1592_o;
  wire n1594_o;
  wire n1595_o;
  wire n1596_o;
  wire n1597_o;
  wire n1598_o;
  wire n1599_o;
  wire [15:0] n1601_o;
  wire [15:0] n1602_o;
  wire [15:0] n1604_o;
  wire [15:0] n1606_o;
  wire [15:0] n1607_o;
  wire [15:0] n1609_o;
  wire [15:0] n1610_o;
  wire [15:0] n1612_o;
  wire [15:0] n1613_o;
  wire n1615_o;
  wire n1617_o;
  wire n1618_o;
  wire n1619_o;
  wire n1620_o;
  wire n1621_o;
  wire n1622_o;
  wire [15:0] n1624_o;
  wire [15:0] n1625_o;
  wire [15:0] n1627_o;
  wire [15:0] n1629_o;
  wire [15:0] n1630_o;
  wire [15:0] n1632_o;
  wire [15:0] n1633_o;
  wire [15:0] n1635_o;
  wire [15:0] n1636_o;
  wire n1638_o;
  wire n1640_o;
  wire n1641_o;
  wire n1642_o;
  wire n1643_o;
  wire n1644_o;
  wire n1645_o;
  wire [15:0] n1647_o;
  wire [15:0] n1648_o;
  wire [15:0] n1650_o;
  wire [15:0] n1652_o;
  wire [15:0] n1653_o;
  wire [15:0] n1655_o;
  wire [15:0] n1656_o;
  wire [15:0] n1658_o;
  wire [15:0] n1659_o;
  wire n1661_o;
  wire n1663_o;
  wire n1664_o;
  wire n1665_o;
  wire n1666_o;
  wire n1667_o;
  wire n1668_o;
  wire [15:0] n1670_o;
  wire [15:0] n1671_o;
  wire [15:0] n1673_o;
  wire [15:0] n1675_o;
  wire [15:0] n1676_o;
  wire [15:0] n1678_o;
  wire [15:0] n1679_o;
  wire [15:0] n1681_o;
  wire [15:0] n1682_o;
  wire n1684_o;
  wire n1686_o;
  wire n1687_o;
  wire n1688_o;
  wire n1689_o;
  wire n1690_o;
  wire n1691_o;
  wire [15:0] n1693_o;
  wire [15:0] n1694_o;
  wire [15:0] n1696_o;
  wire [15:0] n1698_o;
  wire [15:0] n1699_o;
  wire [15:0] n1701_o;
  wire [15:0] n1702_o;
  wire [15:0] n1704_o;
  wire [15:0] n1705_o;
  wire n1707_o;
  wire n1709_o;
  wire n1710_o;
  wire n1711_o;
  wire n1712_o;
  wire n1713_o;
  wire n1714_o;
  wire [15:0] n1716_o;
  wire [15:0] n1717_o;
  wire [15:0] n1719_o;
  wire [15:0] n1721_o;
  wire [15:0] n1722_o;
  wire [15:0] n1724_o;
  wire [15:0] n1725_o;
  wire [15:0] n1727_o;
  wire [15:0] n1728_o;
  wire n1730_o;
  wire n1732_o;
  wire n1733_o;
  wire n1734_o;
  wire n1735_o;
  wire n1736_o;
  wire n1737_o;
  wire [15:0] n1739_o;
  wire [15:0] n1740_o;
  wire [15:0] n1742_o;
  wire [15:0] n1744_o;
  wire [15:0] n1745_o;
  wire [15:0] n1747_o;
  wire [15:0] n1748_o;
  wire [15:0] n1750_o;
  wire [15:0] n1751_o;
  wire n1753_o;
  wire n1755_o;
  wire n1756_o;
  wire n1758_o;
  wire [15:0] n1760_o;
  wire [15:0] n1761_o;
  wire n1763_o;
  wire [1:0] n1764_o;
  wire [7:0] n1765_o;
  reg [7:0] n1767_o;
  wire [7:0] n1768_o;
  wire [7:0] n1770_o;
  reg [7:0] n1771_o;
  wire [15:0] n1773_o;
  wire n1775_o;
  wire n1777_o;
  wire n1778_o;
  wire [15:0] n1780_o;
  wire [15:0] n1781_o;
  wire [15:0] n1783_o;
  wire n1785_o;
  wire n1787_o;
  wire n1788_o;
  wire n1790_o;
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
  wire n1816_o;
  wire n1817_o;
  wire n1818_o;
  wire n1819_o;
  wire [15:0] n1821_o;
  wire n1823_o;
  wire n1825_o;
  wire n1826_o;
  wire [15:0] n1828_o;
  wire n1830_o;
  wire n1832_o;
  wire [15:0] n1834_o;
  wire n1836_o;
  wire n1838_o;
  wire n1839_o;
  wire n1841_o;
  wire n1842_o;
  wire [15:0] n1844_o;
  wire n1846_o;
  wire [15:0] n1848_o;
  wire n1850_o;
  wire n1852_o;
  wire n1853_o;
  wire [22:0] n1854_o;
  reg n1861_o;
  reg [15:0] n1862_o;
  wire [7:0] n1863_o;
  wire [7:0] n1864_o;
  wire [7:0] n1865_o;
  wire [7:0] n1866_o;
  wire [7:0] n1867_o;
  wire [7:0] n1868_o;
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
  reg [7:0] n1883_o;
  wire [7:0] n1884_o;
  wire [7:0] n1885_o;
  wire [7:0] n1886_o;
  wire [7:0] n1887_o;
  wire [7:0] n1888_o;
  wire [7:0] n1889_o;
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
  reg [7:0] n1904_o;
  reg n1905_o;
  reg n1906_o;
  reg n1908_o;
  reg n1910_o;
  reg n1911_o;
  reg [7:0] n1913_o;
  wire [7:0] n1914_o;
  wire [7:0] n1915_o;
  reg [7:0] n1916_o;
  wire [7:0] n1917_o;
  wire [7:0] n1918_o;
  reg [7:0] n1919_o;
  reg [3:0] n1944_o;
  reg [2:0] n1953_o;
  reg [3:0] n1959_o;
  wire n1961_o;
  wire [2:0] n1962_o;
  wire [2:0] n1965_o;
  wire [7:0] n1968_o;
  wire n1970_o;
  wire n1973_o;
  wire n1975_o;
  wire n1977_o;
  wire n1978_o;
  wire n1980_o;
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
  wire n2021_o;
  wire n2022_o;
  wire [2:0] n2023_o;
  wire [2:0] n2026_o;
  wire [7:0] n2029_o;
  wire [2:0] n2030_o;
  wire [2:0] n2033_o;
  wire [7:0] n2036_o;
  wire [7:0] n2037_o;
  wire n2039_o;
  wire n2041_o;
  wire n2042_o;
  wire n2044_o;
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
  wire [3:0] n2085_o;
  wire n2087_o;
  wire n2089_o;
  wire n2091_o;
  wire [2:0] n2092_o;
  reg [2:0] n2096_o;
  wire [15:0] n2098_o;
  wire n2100_o;
  wire n2102_o;
  wire n2103_o;
  wire n2105_o;
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
  wire [7:0] n2206_o;
  wire [15:0] n2207_o;
  wire n2209_o;
  wire [7:0] n2210_o;
  wire [15:0] n2211_o;
  wire [15:0] n2213_o;
  wire [15:0] n2214_o;
  wire n2216_o;
  wire [15:0] n2218_o;
  wire [15:0] n2220_o;
  wire [15:0] n2221_o;
  wire n2223_o;
  wire n2224_o;
  wire n2226_o;
  wire n2229_o;
  wire [15:0] n2231_o;
  wire n2233_o;
  wire n2234_o;
  wire n2236_o;
  wire n2239_o;
  wire [15:0] n2241_o;
  wire n2243_o;
  wire n2244_o;
  wire n2246_o;
  wire n2249_o;
  wire [15:0] n2251_o;
  wire n2253_o;
  wire n2254_o;
  wire n2256_o;
  wire n2259_o;
  wire [15:0] n2261_o;
  wire n2263_o;
  wire n2264_o;
  wire n2266_o;
  wire n2269_o;
  wire [15:0] n2271_o;
  wire n2273_o;
  wire n2274_o;
  wire n2276_o;
  wire n2279_o;
  wire [15:0] n2281_o;
  wire n2283_o;
  wire [7:0] n2285_o;
  wire [7:0] n2287_o;
  wire n2288_o;
  wire n2290_o;
  wire n2293_o;
  wire n2296_o;
  wire n2298_o;
  wire n2300_o;
  wire n2301_o;
  wire n2303_o;
  wire n2304_o;
  wire [7:0] n2306_o;
  wire [7:0] n2308_o;
  wire n2309_o;
  wire n2311_o;
  wire n2314_o;
  wire n2316_o;
  wire n2318_o;
  wire n2319_o;
  wire n2321_o;
  wire n2322_o;
  wire [6:0] n2323_o;
  wire [7:0] n2325_o;
  wire [6:0] n2326_o;
  wire [7:0] n2328_o;
  wire n2329_o;
  wire n2331_o;
  wire n2334_o;
  wire n2336_o;
  wire n2338_o;
  wire n2339_o;
  wire n2341_o;
  wire n2342_o;
  wire [6:0] n2343_o;
  wire [7:0] n2344_o;
  wire [6:0] n2345_o;
  wire [7:0] n2346_o;
  wire n2347_o;
  wire n2349_o;
  wire n2352_o;
  wire n2354_o;
  wire n2356_o;
  wire n2357_o;
  wire n2359_o;
  wire n2360_o;
  wire n2361_o;
  wire [6:0] n2362_o;
  wire [7:0] n2363_o;
  wire n2364_o;
  wire [6:0] n2365_o;
  wire [7:0] n2366_o;
  wire n2367_o;
  wire n2368_o;
  wire n2370_o;
  wire n2373_o;
  wire n2375_o;
  wire n2377_o;
  wire n2378_o;
  wire n2380_o;
  wire n2381_o;
  wire [6:0] n2382_o;
  wire [7:0] n2384_o;
  wire [6:0] n2385_o;
  wire [7:0] n2387_o;
  wire n2388_o;
  wire n2389_o;
  wire n2391_o;
  wire n2394_o;
  wire n2396_o;
  wire n2398_o;
  wire n2399_o;
  wire n2401_o;
  wire n2402_o;
  wire [6:0] n2403_o;
  wire [7:0] n2404_o;
  wire [6:0] n2405_o;
  wire [7:0] n2406_o;
  wire n2407_o;
  wire n2408_o;
  wire n2410_o;
  wire n2413_o;
  wire n2415_o;
  wire n2417_o;
  wire n2418_o;
  wire n2420_o;
  wire n2421_o;
  wire [7:0] n2423_o;
  wire [7:0] n2425_o;
  wire n2426_o;
  wire n2428_o;
  wire n2431_o;
  wire n2433_o;
  wire n2435_o;
  wire n2436_o;
  wire n2438_o;
  wire n2439_o;
  wire [7:0] n2441_o;
  wire [7:0] n2443_o;
  wire n2444_o;
  wire n2446_o;
  wire n2449_o;
  wire n2451_o;
  wire n2453_o;
  wire n2454_o;
  wire n2456_o;
  wire n2457_o;
  wire n2458_o;
  wire n2460_o;
  wire n2463_o;
  wire n2465_o;
  wire n2467_o;
  wire n2468_o;
  wire n2470_o;
  wire n2471_o;
  wire n2473_o;
  wire n2475_o;
  wire n2476_o;
  wire [15:0] n2478_o;
  wire n2480_o;
  wire n2482_o;
  wire n2483_o;
  wire n2485_o;
  wire [15:0] n2487_o;
  wire n2489_o;
  wire [15:0] n2491_o;
  wire n2493_o;
  wire n2495_o;
  wire n2496_o;
  wire n2498_o;
  wire n2499_o;
  wire [15:0] n2501_o;
  wire n2503_o;
  wire [15:0] n2505_o;
  wire n2507_o;
  wire n2509_o;
  wire n2510_o;
  wire [28:0] n2511_o;
  reg n2530_o;
  reg [7:0] n2531_o;
  reg [15:0] n2532_o;
  wire [7:0] n2533_o;
  wire [7:0] n2534_o;
  wire [7:0] n2535_o;
  wire [7:0] n2536_o;
  wire [7:0] n2537_o;
  wire [7:0] n2538_o;
  wire [7:0] n2539_o;
  wire [7:0] n2540_o;
  wire [7:0] n2541_o;
  wire [7:0] n2542_o;
  wire [7:0] n2543_o;
  wire [7:0] n2544_o;
  reg [7:0] n2545_o;
  wire [7:0] n2546_o;
  wire [7:0] n2547_o;
  wire [7:0] n2548_o;
  wire [7:0] n2549_o;
  wire [7:0] n2550_o;
  wire [7:0] n2551_o;
  wire [7:0] n2552_o;
  wire [7:0] n2553_o;
  wire [7:0] n2554_o;
  wire [7:0] n2555_o;
  wire [7:0] n2556_o;
  wire [7:0] n2557_o;
  reg [7:0] n2558_o;
  reg n2560_o;
  reg n2561_o;
  reg n2563_o;
  reg [7:0] n2564_o;
  wire [7:0] n2565_o;
  reg [7:0] n2566_o;
  reg [3:0] n2597_o;
  reg [2:0] n2609_o;
  reg [3:0] n2630_o;
  wire n2633_o;
  wire n2634_o;
  wire n2635_o;
  wire n2636_o;
  wire n2637_o;
  wire [15:0] n2639_o;
  wire [15:0] n2640_o;
  wire [15:0] n2642_o;
  wire [15:0] n2644_o;
  wire [15:0] n2645_o;
  wire [15:0] n2647_o;
  wire [15:0] n2648_o;
  wire [15:0] n2650_o;
  wire [15:0] n2651_o;
  wire n2653_o;
  wire n2655_o;
  wire n2656_o;
  wire n2658_o;
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
  wire n2702_o;
  wire n2703_o;
  wire n2705_o;
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
  wire [15:0] n2858_o;
  wire n2860_o;
  wire n2862_o;
  wire n2863_o;
  wire [15:0] n2865_o;
  wire n2870_o;
  wire [7:0] n2871_o;
  wire [7:0] n2872_o;
  wire n2873_o;
  wire n2875_o;
  wire n2878_o;
  wire n2879_o;
  wire n2880_o;
  wire n2881_o;
  wire n2882_o;
  wire n2883_o;
  wire n2884_o;
  wire n2885_o;
  wire n2886_o;
  wire n2887_o;
  wire n2888_o;
  wire n2889_o;
  wire n2890_o;
  wire n2891_o;
  wire n2893_o;
  wire [15:0] n2895_o;
  wire [15:0] n2896_o;
  wire n2898_o;
  wire n2900_o;
  wire n2901_o;
  wire n2903_o;
  wire n2904_o;
  wire n2906_o;
  wire n2907_o;
  wire n2909_o;
  wire n2910_o;
  wire n2912_o;
  wire n2913_o;
  wire [7:0] n2914_o;
  wire n2915_o;
  wire n2917_o;
  wire n2920_o;
  wire n2921_o;
  wire n2922_o;
  wire n2923_o;
  wire n2924_o;
  wire n2925_o;
  wire n2926_o;
  wire n2927_o;
  wire n2928_o;
  wire n2929_o;
  wire n2930_o;
  wire n2931_o;
  wire n2932_o;
  wire n2933_o;
  wire n2935_o;
  wire [15:0] n2937_o;
  wire [15:0] n2938_o;
  wire n2940_o;
  wire n2942_o;
  wire n2943_o;
  wire n2945_o;
  wire n2946_o;
  wire n2948_o;
  wire n2949_o;
  wire n2951_o;
  wire n2952_o;
  wire n2954_o;
  wire n2955_o;
  wire [7:0] n2956_o;
  wire [7:0] n2958_o;
  wire [7:0] n2959_o;
  wire [7:0] n2960_o;
  wire [7:0] n2962_o;
  wire [7:0] n2963_o;
  wire n2964_o;
  wire n2966_o;
  wire n2969_o;
  wire n2970_o;
  wire n2971_o;
  wire n2972_o;
  wire n2973_o;
  wire n2974_o;
  wire n2975_o;
  wire n2976_o;
  wire n2977_o;
  wire n2978_o;
  wire n2979_o;
  wire n2980_o;
  wire n2981_o;
  wire n2982_o;
  wire n2984_o;
  wire [15:0] n2986_o;
  wire [15:0] n2987_o;
  wire n2989_o;
  wire n2991_o;
  wire n2992_o;
  wire n2994_o;
  wire n2995_o;
  wire n2997_o;
  wire n2998_o;
  wire n3000_o;
  wire n3001_o;
  wire n3003_o;
  wire n3004_o;
  wire [7:0] n3005_o;
  wire n3006_o;
  wire n3008_o;
  wire n3011_o;
  wire n3012_o;
  wire n3013_o;
  wire n3014_o;
  wire n3015_o;
  wire n3016_o;
  wire n3017_o;
  wire n3018_o;
  wire n3019_o;
  wire n3020_o;
  wire n3021_o;
  wire n3022_o;
  wire n3023_o;
  wire n3024_o;
  wire n3026_o;
  wire [15:0] n3028_o;
  wire [15:0] n3029_o;
  wire n3031_o;
  wire n3033_o;
  wire n3034_o;
  wire n3036_o;
  wire n3037_o;
  wire n3039_o;
  wire n3040_o;
  wire n3042_o;
  wire n3043_o;
  wire n3045_o;
  wire n3046_o;
  wire [7:0] n3047_o;
  wire [7:0] n3048_o;
  wire n3049_o;
  wire n3051_o;
  wire n3054_o;
  wire n3056_o;
  wire [15:0] n3058_o;
  wire [15:0] n3059_o;
  wire n3061_o;
  wire n3063_o;
  wire n3064_o;
  wire n3066_o;
  wire n3067_o;
  wire n3069_o;
  wire n3070_o;
  wire n3072_o;
  wire n3073_o;
  wire n3075_o;
  wire n3076_o;
  wire [7:0] n3077_o;
  wire n3078_o;
  wire n3080_o;
  wire n3083_o;
  wire n3085_o;
  wire [15:0] n3087_o;
  wire [15:0] n3088_o;
  wire n3090_o;
  wire n3092_o;
  wire n3093_o;
  wire n3095_o;
  wire n3096_o;
  wire n3098_o;
  wire n3099_o;
  wire n3101_o;
  wire n3102_o;
  wire n3104_o;
  wire n3105_o;
  wire n3106_o;
  wire n3108_o;
  wire n3111_o;
  wire n3113_o;
  wire [15:0] n3115_o;
  wire [15:0] n3116_o;
  wire n3118_o;
  wire n3120_o;
  wire n3121_o;
  wire n3123_o;
  wire n3124_o;
  wire n3126_o;
  wire n3127_o;
  wire n3129_o;
  wire n3130_o;
  wire n3132_o;
  wire n3133_o;
  wire [7:0] n3134_o;
  wire [7:0] n3135_o;
  wire n3136_o;
  wire n3138_o;
  wire n3141_o;
  wire n3143_o;
  wire [15:0] n3145_o;
  wire [15:0] n3146_o;
  wire n3148_o;
  wire n3150_o;
  wire n3151_o;
  wire n3153_o;
  wire n3154_o;
  wire n3156_o;
  wire n3157_o;
  wire n3159_o;
  wire n3160_o;
  wire n3162_o;
  wire n3163_o;
  wire [7:0] n3164_o;
  wire [7:0] n3166_o;
  wire [7:0] n3167_o;
  wire [7:0] n3168_o;
  wire [7:0] n3170_o;
  wire [7:0] n3171_o;
  wire n3172_o;
  wire n3174_o;
  wire n3177_o;
  wire n3178_o;
  wire n3179_o;
  wire n3180_o;
  wire n3181_o;
  wire n3182_o;
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
  wire n3205_o;
  wire [15:0] n3207_o;
  wire [15:0] n3208_o;
  wire n3210_o;
  wire n3212_o;
  wire n3213_o;
  wire n3215_o;
  wire n3216_o;
  wire n3218_o;
  wire n3219_o;
  wire n3221_o;
  wire n3222_o;
  wire n3224_o;
  wire n3225_o;
  wire [7:0] n3226_o;
  wire [7:0] n3227_o;
  wire n3228_o;
  wire n3230_o;
  wire n3233_o;
  wire n3235_o;
  wire [15:0] n3237_o;
  wire [15:0] n3238_o;
  wire n3240_o;
  wire n3242_o;
  wire n3243_o;
  wire n3245_o;
  wire n3246_o;
  wire n3248_o;
  wire n3249_o;
  wire n3251_o;
  wire n3252_o;
  wire n3254_o;
  wire n3255_o;
  wire [7:0] n3256_o;
  wire [7:0] n3257_o;
  wire n3258_o;
  wire n3260_o;
  wire n3263_o;
  wire n3264_o;
  wire n3265_o;
  wire n3266_o;
  wire n3267_o;
  wire n3268_o;
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
  wire n3291_o;
  wire [15:0] n3293_o;
  wire [15:0] n3294_o;
  wire n3296_o;
  wire n3298_o;
  wire n3299_o;
  wire n3301_o;
  wire n3302_o;
  wire n3304_o;
  wire n3305_o;
  wire n3307_o;
  wire n3308_o;
  wire n3310_o;
  wire n3311_o;
  wire n3312_o;
  wire n3314_o;
  wire n3317_o;
  wire n3319_o;
  wire [15:0] n3321_o;
  wire [15:0] n3322_o;
  wire n3324_o;
  wire n3326_o;
  wire n3327_o;
  wire n3329_o;
  wire n3330_o;
  wire n3332_o;
  wire n3333_o;
  wire n3335_o;
  wire n3336_o;
  wire n3338_o;
  wire n3339_o;
  wire n3340_o;
  wire n3341_o;
  wire [15:0] n3343_o;
  wire [15:0] n3344_o;
  wire [15:0] n3346_o;
  wire [15:0] n3347_o;
  wire [15:0] n3348_o;
  wire [15:0] n3350_o;
  wire n3352_o;
  wire [15:0] n3354_o;
  wire [15:0] n3356_o;
  wire n3358_o;
  wire [15:0] n3360_o;
  wire n3362_o;
  wire n3364_o;
  wire n3365_o;
  wire [15:0] n3367_o;
  wire [15:0] n3369_o;
  wire [15:0] n3370_o;
  wire [15:0] n3372_o;
  wire n3374_o;
  wire [15:0] n3376_o;
  wire [15:0] n3378_o;
  wire n3380_o;
  wire [20:0] n3381_o;
  reg n3387_o;
  reg [7:0] n3388_o;
  reg [7:0] n3389_o;
  reg [15:0] n3390_o;
  reg [15:0] n3391_o;
  reg n3392_o;
  reg n3393_o;
  reg n3394_o;
  reg n3395_o;
  wire n3396_o;
  reg n3397_o;
  wire n3398_o;
  reg n3399_o;
  wire n3400_o;
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
  reg [3:0] n3434_o;
  reg [2:0] n3453_o;
  reg [3:0] n3456_o;
  wire n3459_o;
  wire [15:0] n3461_o;
  wire n3463_o;
  wire n3465_o;
  wire n3466_o;
  wire [15:0] n3468_o;
  wire n3470_o;
  wire [15:0] n3472_o;
  wire n3474_o;
  wire [15:0] n3476_o;
  wire [15:0] n3478_o;
  wire [15:0] n3479_o;
  wire n3481_o;
  wire [3:0] n3482_o;
  reg n3485_o;
  reg [15:0] n3486_o;
  wire [7:0] n3487_o;
  wire [7:0] n3488_o;
  wire [7:0] n3489_o;
  reg [7:0] n3490_o;
  wire [7:0] n3491_o;
  wire [7:0] n3492_o;
  wire [7:0] n3493_o;
  reg [7:0] n3494_o;
  reg [3:0] n3500_o;
  reg [2:0] n3503_o;
  reg [3:0] n3505_o;
  wire n3507_o;
  wire n3509_o;
  wire n3511_o;
  wire n3512_o;
  wire [15:0] n3514_o;
  wire n3515_o;
  wire [15:0] n3518_o;
  wire n3520_o;
  wire [15:0] n3522_o;
  wire n3524_o;
  wire n3525_o;
  wire [15:0] n3527_o;
  wire [3:0] n3530_o;
  wire n3531_o;
  wire n3532_o;
  wire n3534_o;
  wire [1:0] n3535_o;
  reg [15:0] n3536_o;
  wire [7:0] n3537_o;
  reg [7:0] n3538_o;
  reg n3540_o;
  reg [15:0] n3541_o;
  reg [3:0] n3544_o;
  reg [2:0] n3546_o;
  reg [3:0] n3548_o;
  reg n3549_o;
  reg n3550_o;
  wire n3552_o;
  wire [15:0] n3554_o;
  wire n3556_o;
  reg n3558_o;
  reg [15:0] n3559_o;
  reg [3:0] n3562_o;
  reg [2:0] n3564_o;
  wire n3566_o;
  wire [15:0] n3568_o;
  wire n3570_o;
  wire [7:0] n3571_o;
  reg [7:0] n3572_o;
  reg [15:0] n3573_o;
  reg [3:0] n3576_o;
  wire n3578_o;
  wire n3580_o;
  wire [7:0] n3581_o;
  reg [7:0] n3582_o;
  reg [3:0] n3585_o;
  reg [2:0] n3587_o;
  wire n3589_o;
  wire [15:0] n3591_o;
  wire n3593_o;
  wire [11:0] n3594_o;
  reg n3595_o;
  reg [7:0] n3596_o;
  reg [7:0] n3597_o;
  reg [15:0] n3598_o;
  wire [7:0] n3599_o;
  wire [7:0] n3600_o;
  wire [7:0] n3601_o;
  reg [7:0] n3602_o;
  wire [7:0] n3603_o;
  wire [7:0] n3604_o;
  wire [7:0] n3605_o;
  reg [7:0] n3606_o;
  reg n3607_o;
  reg n3608_o;
  reg n3609_o;
  reg n3610_o;
  reg n3611_o;
  wire n3612_o;
  wire n3613_o;
  wire n3614_o;
  wire n3615_o;
  reg n3616_o;
  wire n3617_o;
  wire n3618_o;
  wire n3619_o;
  wire n3620_o;
  reg n3621_o;
  wire n3622_o;
  wire n3623_o;
  wire n3624_o;
  wire n3625_o;
  reg n3626_o;
  wire n3627_o;
  wire n3628_o;
  wire n3629_o;
  wire n3630_o;
  reg n3631_o;
  wire n3632_o;
  wire n3633_o;
  wire n3634_o;
  wire n3635_o;
  reg n3636_o;
  wire n3637_o;
  wire n3638_o;
  wire n3639_o;
  wire n3640_o;
  reg n3641_o;
  wire n3642_o;
  wire n3643_o;
  wire n3644_o;
  wire n3645_o;
  reg n3646_o;
  wire n3647_o;
  wire n3648_o;
  wire n3649_o;
  wire n3650_o;
  reg n3651_o;
  wire [7:0] n3652_o;
  wire [7:0] n3653_o;
  wire [7:0] n3654_o;
  wire [7:0] n3655_o;
  wire [7:0] n3656_o;
  reg [7:0] n3657_o;
  wire [7:0] n3658_o;
  wire [7:0] n3659_o;
  wire [7:0] n3660_o;
  wire [7:0] n3661_o;
  wire [7:0] n3662_o;
  reg [7:0] n3663_o;
  reg [3:0] n3668_o;
  reg [2:0] n3670_o;
  reg [3:0] n3672_o;
  reg [7:0] n3673_o;
  reg n3674_o;
  reg n3675_o;
  reg n3677_o;
  reg n3679_o;
  reg [7:0] n3680_o;
  wire [15:0] n3686_o;
  wire [7:0] n3693_o;
  wire [15:0] n3695_o;
  wire n3701_o;
  wire n3702_o;
  wire [63:0] n3781_o;
  wire [63:0] n3782_o;
  wire [7:0] n3783_o;
  reg [7:0] n3784_q;
  wire [7:0] n3785_o;
  reg [7:0] n3786_q;
  wire [15:0] n3787_o;
  reg [15:0] n3788_q;
  wire [15:0] n3789_o;
  reg [15:0] n3790_q;
  wire n3791_o;
  reg n3792_q;
  wire n3793_o;
  reg n3794_q;
  wire n3795_o;
  reg n3796_q;
  wire n3797_o;
  reg n3798_q;
  wire n3799_o;
  reg n3800_q;
  wire [7:0] n3801_o;
  reg [7:0] n3802_q;
  wire [15:0] n3803_o;
  reg [15:0] n3804_q;
  wire [3:0] n3805_o;
  reg [3:0] n3806_q;
  wire [2:0] n3807_o;
  reg [2:0] n3808_q;
  wire [3:0] n3809_o;
  reg [3:0] n3810_q;
  wire n3811_o;
  wire n3812_o;
  wire [7:0] n3813_o;
  reg [7:0] n3814_q;
  reg n3815_q;
  reg n3816_q;
  reg n3817_q;
  reg n3818_q;
  wire n3819_o;
  reg n3820_q;
  wire n3821_o;
  reg n3822_q;
  wire n3823_o;
  wire n3824_o;
  wire [7:0] n3825_o;
  reg [7:0] n3826_q;
  wire n3827_o;
  reg n3828_q;
  wire [7:0] n3829_o;
  wire [7:0] n3830_o;
  wire [7:0] n3831_o;
  wire [7:0] n3832_o;
  wire [7:0] n3833_o;
  wire [7:0] n3834_o;
  wire [7:0] n3835_o;
  wire [7:0] n3836_o;
  wire [1:0] n3837_o;
  reg [7:0] n3838_o;
  wire [1:0] n3839_o;
  reg [7:0] n3840_o;
  wire n3841_o;
  wire [7:0] n3842_o;
  wire [7:0] n3843_o;
  wire [7:0] n3844_o;
  wire [7:0] n3845_o;
  wire [7:0] n3846_o;
  wire [7:0] n3847_o;
  wire [7:0] n3848_o;
  wire [7:0] n3849_o;
  wire [7:0] n3850_o;
  wire [1:0] n3851_o;
  reg [7:0] n3852_o;
  wire [1:0] n3853_o;
  reg [7:0] n3854_o;
  wire n3855_o;
  wire [7:0] n3856_o;
  wire [7:0] n3857_o;
  wire [7:0] n3858_o;
  wire [7:0] n3859_o;
  wire [7:0] n3860_o;
  wire [7:0] n3861_o;
  wire [7:0] n3862_o;
  wire [7:0] n3863_o;
  wire [7:0] n3864_o;
  wire [1:0] n3865_o;
  reg [7:0] n3866_o;
  wire [1:0] n3867_o;
  reg [7:0] n3868_o;
  wire n3869_o;
  wire [7:0] n3870_o;
  assign addr = n9_o;
  assign wr = n3828_q;
  assign state = mainfsm;
  assign dataout = n46_o;
  /* 6805.vhd:181:10  */
  assign mask0 = n3781_o; // (signal)
  /* 6805.vhd:182:10  */
  assign mask1 = n3782_o; // (signal)
  /* 6805.vhd:183:10  */
  assign rega = n3784_q; // (signal)
  /* 6805.vhd:184:10  */
  assign regx = n3786_q; // (signal)
  /* 6805.vhd:185:10  */
  assign regsp = n3788_q; // (signal)
  /* 6805.vhd:186:10  */
  assign regpc = n3790_q; // (signal)
  /* 6805.vhd:187:10  */
  assign flagh = n3792_q; // (signal)
  /* 6805.vhd:188:10  */
  assign flagi = n3794_q; // (signal)
  /* 6805.vhd:189:10  */
  assign flagn = n3796_q; // (signal)
  /* 6805.vhd:190:10  */
  assign flagz = n3798_q; // (signal)
  /* 6805.vhd:191:10  */
  assign flagc = n3800_q; // (signal)
  /* 6805.vhd:192:10  */
  assign help = n3802_q; // (signal)
  /* 6805.vhd:193:10  */
  assign temp = n3804_q; // (signal)
  /* 6805.vhd:194:10  */
  assign mainfsm = n3806_q; // (signal)
  /* 6805.vhd:195:10  */
  assign addrmux = n3808_q; // (signal)
  /* 6805.vhd:196:10  */
  assign datamux = n3810_q; // (signal)
  /* 6805.vhd:197:10  */
  assign opcode = n3814_q; // (signal)
  /* 6805.vhd:198:10  */
  assign prod = mul_n4; // (signal)
  /* 6805.vhd:199:10  */
  assign extirq_d = n3815_q; // (signal)
  /* 6805.vhd:200:10  */
  assign timerirq_d = n3816_q; // (signal)
  /* 6805.vhd:201:10  */
  assign extirqrequest = n3817_q; // (signal)
  /* 6805.vhd:202:10  */
  assign timerirqrequest = n3818_q; // (signal)
  /* 6805.vhd:204:10  */
  assign trace = n3820_q; // (signal)
  /* 6805.vhd:205:10  */
  assign trace_i = n3822_q; // (signal)
  /* 6805.vhd:206:10  */
  assign traceopcode = n3826_q; // (signal)
  /* 6805.vhd:213:13  */
  assign mul_n4 = mul_prod; // (signal)
  /* 6805.vhd:210:3  */
  mul8 mul (
    .a(rega),
    .b(regx),
    .prod(mul_prod));
  /* 6805.vhd:216:39  */
  assign n8_o = addrmux == 3'b000;
  /* 6805.vhd:216:26  */
  assign n9_o = n8_o ? regpc : n12_o;
  /* 6805.vhd:217:39  */
  assign n11_o = addrmux == 3'b001;
  /* 6805.vhd:216:48  */
  assign n12_o = n11_o ? regsp : n17_o;
  /* 6805.vhd:218:17  */
  assign n14_o = {8'b00000000, regx};
  /* 6805.vhd:218:39  */
  assign n16_o = addrmux == 3'b010;
  /* 6805.vhd:217:48  */
  assign n17_o = n16_o ? n14_o : n20_o;
  /* 6805.vhd:219:39  */
  assign n19_o = addrmux == 3'b011;
  /* 6805.vhd:218:48  */
  assign n20_o = n19_o ? temp : n26_o;
  /* 6805.vhd:220:19  */
  assign n22_o = {8'b00000000, regx};
  /* 6805.vhd:220:27  */
  assign n23_o = n22_o + temp;
  /* 6805.vhd:220:48  */
  assign n25_o = addrmux == 3'b100;
  /* 6805.vhd:219:48  */
  assign n26_o = n25_o ? n23_o : n30_o;
  /* 6805.vhd:221:18  */
  assign n27_o = regsp + temp;
  /* 6805.vhd:221:39  */
  assign n29_o = addrmux == 3'b101;
  /* 6805.vhd:220:57  */
  assign n30_o = n29_o ? n27_o : n39_o;
  /* 6805.vhd:222:19  */
  assign n32_o = {8'b00000000, regx};
  /* 6805.vhd:222:42  */
  assign n33_o = temp[7:0];
  /* 6805.vhd:222:36  */
  assign n35_o = {8'b00000000, n33_o};
  /* 6805.vhd:222:27  */
  assign n36_o = n32_o + n35_o;
  /* 6805.vhd:222:70  */
  assign n38_o = addrmux == 3'b110;
  /* 6805.vhd:221:48  */
  assign n39_o = n38_o ? n36_o : n43_o;
  /* 6805.vhd:223:33  */
  assign n40_o = temp[7:0];
  /* 6805.vhd:223:27  */
  assign n42_o = {8'b00000000, n40_o};
  /* 6805.vhd:223:18  */
  assign n43_o = regsp + n42_o;
  /* 6805.vhd:224:46  */
  assign n45_o = datamux == 4'b0000;
  /* 6805.vhd:224:33  */
  assign n46_o = n45_o ? rega : n49_o;
  /* 6805.vhd:225:46  */
  assign n48_o = datamux == 4'b0001;
  /* 6805.vhd:224:53  */
  assign n49_o = n48_o ? regx : n52_o;
  /* 6805.vhd:226:46  */
  assign n51_o = datamux == 4'b0010;
  /* 6805.vhd:225:53  */
  assign n52_o = n51_o ? regx : n56_o;
  /* 6805.vhd:227:19  */
  assign n53_o = regsp[7:0];
  /* 6805.vhd:227:46  */
  assign n55_o = datamux == 4'b0011;
  /* 6805.vhd:226:53  */
  assign n56_o = n55_o ? n53_o : n60_o;
  /* 6805.vhd:228:19  */
  assign n57_o = regsp[15:8];
  /* 6805.vhd:228:46  */
  assign n59_o = datamux == 4'b0100;
  /* 6805.vhd:227:55  */
  assign n60_o = n59_o ? n57_o : n64_o;
  /* 6805.vhd:229:19  */
  assign n61_o = regpc[7:0];
  /* 6805.vhd:229:46  */
  assign n63_o = datamux == 4'b0101;
  /* 6805.vhd:228:55  */
  assign n64_o = n63_o ? n61_o : n68_o;
  /* 6805.vhd:230:19  */
  assign n65_o = regpc[15:8];
  /* 6805.vhd:230:46  */
  assign n67_o = datamux == 4'b0110;
  /* 6805.vhd:229:55  */
  assign n68_o = n67_o ? n65_o : n72_o;
  /* 6805.vhd:231:19  */
  assign n69_o = temp[7:0];
  /* 6805.vhd:231:46  */
  assign n71_o = datamux == 4'b0111;
  /* 6805.vhd:230:55  */
  assign n72_o = n71_o ? n69_o : n76_o;
  /* 6805.vhd:232:19  */
  assign n73_o = temp[15:8];
  /* 6805.vhd:232:46  */
  assign n75_o = datamux == 4'b1000;
  /* 6805.vhd:231:55  */
  assign n76_o = n75_o ? n73_o : n79_o;
  /* 6805.vhd:233:46  */
  assign n78_o = datamux == 4'b1001;
  /* 6805.vhd:232:55  */
  assign n79_o = n78_o ? help : traceopcode;
  /* 6805.vhd:260:12  */
  assign n100_o = ~rst;
  /* 6805.vhd:288:20  */
  assign n103_o = $unsigned(extirq) <= $unsigned(1'b0);
  /* 6805.vhd:288:28  */
  assign n104_o = extirq_d & n103_o;
  /* 6805.vhd:288:9  */
  assign n106_o = n104_o ? 1'b1 : extirqrequest;
  /* 6805.vhd:292:22  */
  assign n108_o = $unsigned(timerirq) <= $unsigned(1'b0);
  /* 6805.vhd:292:30  */
  assign n109_o = timerirq_d & n108_o;
  /* 6805.vhd:292:9  */
  assign n111_o = n109_o ? 1'b1 : timerirqrequest;
  /* 6805.vhd:300:29  */
  assign n113_o = temp + 16'b0000000000000001;
  /* 6805.vhd:298:11  */
  assign n115_o = mainfsm == 4'b0000;
  /* 6805.vhd:302:11  */
  assign n117_o = mainfsm == 4'b0001;
  /* 6805.vhd:314:39  */
  assign n118_o = extirqrequest | timerirqrequest;
  /* 6805.vhd:323:36  */
  assign n120_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:321:17  */
  assign n122_o = datain == 8'b10000010;
  /* 6805.vhd:339:36  */
  assign n124_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:326:17  */
  assign n126_o = datain == 8'b00000000;
  /* 6805.vhd:326:28  */
  assign n128_o = datain == 8'b00000010;
  /* 6805.vhd:326:28  */
  assign n129_o = n126_o | n128_o;
  /* 6805.vhd:326:36  */
  assign n131_o = datain == 8'b00000100;
  /* 6805.vhd:326:36  */
  assign n132_o = n129_o | n131_o;
  /* 6805.vhd:326:44  */
  assign n134_o = datain == 8'b00000110;
  /* 6805.vhd:326:44  */
  assign n135_o = n132_o | n134_o;
  /* 6805.vhd:326:52  */
  assign n137_o = datain == 8'b00001000;
  /* 6805.vhd:326:52  */
  assign n138_o = n135_o | n137_o;
  /* 6805.vhd:326:60  */
  assign n140_o = datain == 8'b00001010;
  /* 6805.vhd:326:60  */
  assign n141_o = n138_o | n140_o;
  /* 6805.vhd:326:68  */
  assign n143_o = datain == 8'b00001100;
  /* 6805.vhd:326:68  */
  assign n144_o = n141_o | n143_o;
  /* 6805.vhd:326:76  */
  assign n146_o = datain == 8'b00001110;
  /* 6805.vhd:326:76  */
  assign n147_o = n144_o | n146_o;
  /* 6805.vhd:326:84  */
  assign n149_o = datain == 8'b00000001;
  /* 6805.vhd:326:84  */
  assign n150_o = n147_o | n149_o;
  /* 6805.vhd:327:28  */
  assign n152_o = datain == 8'b00000011;
  /* 6805.vhd:327:28  */
  assign n153_o = n150_o | n152_o;
  /* 6805.vhd:327:36  */
  assign n155_o = datain == 8'b00000101;
  /* 6805.vhd:327:36  */
  assign n156_o = n153_o | n155_o;
  /* 6805.vhd:327:44  */
  assign n158_o = datain == 8'b00000111;
  /* 6805.vhd:327:44  */
  assign n159_o = n156_o | n158_o;
  /* 6805.vhd:327:52  */
  assign n161_o = datain == 8'b00001001;
  /* 6805.vhd:327:52  */
  assign n162_o = n159_o | n161_o;
  /* 6805.vhd:327:60  */
  assign n164_o = datain == 8'b00001011;
  /* 6805.vhd:327:60  */
  assign n165_o = n162_o | n164_o;
  /* 6805.vhd:327:68  */
  assign n167_o = datain == 8'b00001101;
  /* 6805.vhd:327:68  */
  assign n168_o = n165_o | n167_o;
  /* 6805.vhd:327:76  */
  assign n170_o = datain == 8'b00001111;
  /* 6805.vhd:327:76  */
  assign n171_o = n168_o | n170_o;
  /* 6805.vhd:327:84  */
  assign n173_o = datain == 8'b00010000;
  /* 6805.vhd:327:84  */
  assign n174_o = n171_o | n173_o;
  /* 6805.vhd:328:28  */
  assign n176_o = datain == 8'b00010010;
  /* 6805.vhd:328:28  */
  assign n177_o = n174_o | n176_o;
  /* 6805.vhd:328:36  */
  assign n179_o = datain == 8'b00010100;
  /* 6805.vhd:328:36  */
  assign n180_o = n177_o | n179_o;
  /* 6805.vhd:328:44  */
  assign n182_o = datain == 8'b00010110;
  /* 6805.vhd:328:44  */
  assign n183_o = n180_o | n182_o;
  /* 6805.vhd:328:52  */
  assign n185_o = datain == 8'b00011000;
  /* 6805.vhd:328:52  */
  assign n186_o = n183_o | n185_o;
  /* 6805.vhd:328:60  */
  assign n188_o = datain == 8'b00011010;
  /* 6805.vhd:328:60  */
  assign n189_o = n186_o | n188_o;
  /* 6805.vhd:328:68  */
  assign n191_o = datain == 8'b00011100;
  /* 6805.vhd:328:68  */
  assign n192_o = n189_o | n191_o;
  /* 6805.vhd:328:76  */
  assign n194_o = datain == 8'b00011110;
  /* 6805.vhd:328:76  */
  assign n195_o = n192_o | n194_o;
  /* 6805.vhd:328:84  */
  assign n197_o = datain == 8'b00010001;
  /* 6805.vhd:328:84  */
  assign n198_o = n195_o | n197_o;
  /* 6805.vhd:329:28  */
  assign n200_o = datain == 8'b00010011;
  /* 6805.vhd:329:28  */
  assign n201_o = n198_o | n200_o;
  /* 6805.vhd:329:36  */
  assign n203_o = datain == 8'b00010101;
  /* 6805.vhd:329:36  */
  assign n204_o = n201_o | n203_o;
  /* 6805.vhd:329:44  */
  assign n206_o = datain == 8'b00010111;
  /* 6805.vhd:329:44  */
  assign n207_o = n204_o | n206_o;
  /* 6805.vhd:329:52  */
  assign n209_o = datain == 8'b00011001;
  /* 6805.vhd:329:52  */
  assign n210_o = n207_o | n209_o;
  /* 6805.vhd:329:60  */
  assign n212_o = datain == 8'b00011011;
  /* 6805.vhd:329:60  */
  assign n213_o = n210_o | n212_o;
  /* 6805.vhd:329:68  */
  assign n215_o = datain == 8'b00011101;
  /* 6805.vhd:329:68  */
  assign n216_o = n213_o | n215_o;
  /* 6805.vhd:329:76  */
  assign n218_o = datain == 8'b00011111;
  /* 6805.vhd:329:76  */
  assign n219_o = n216_o | n218_o;
  /* 6805.vhd:329:84  */
  assign n221_o = datain == 8'b00110000;
  /* 6805.vhd:329:84  */
  assign n222_o = n219_o | n221_o;
  /* 6805.vhd:330:28  */
  assign n224_o = datain == 8'b00110011;
  /* 6805.vhd:330:28  */
  assign n225_o = n222_o | n224_o;
  /* 6805.vhd:330:36  */
  assign n227_o = datain == 8'b00110100;
  /* 6805.vhd:330:36  */
  assign n228_o = n225_o | n227_o;
  /* 6805.vhd:330:44  */
  assign n230_o = datain == 8'b00110110;
  /* 6805.vhd:330:44  */
  assign n231_o = n228_o | n230_o;
  /* 6805.vhd:331:28  */
  assign n233_o = datain == 8'b00110111;
  /* 6805.vhd:331:28  */
  assign n234_o = n231_o | n233_o;
  /* 6805.vhd:331:36  */
  assign n236_o = datain == 8'b00111000;
  /* 6805.vhd:331:36  */
  assign n237_o = n234_o | n236_o;
  /* 6805.vhd:331:44  */
  assign n239_o = datain == 8'b00111001;
  /* 6805.vhd:331:44  */
  assign n240_o = n237_o | n239_o;
  /* 6805.vhd:332:28  */
  assign n242_o = datain == 8'b00111010;
  /* 6805.vhd:332:28  */
  assign n243_o = n240_o | n242_o;
  /* 6805.vhd:332:36  */
  assign n245_o = datain == 8'b00111100;
  /* 6805.vhd:332:36  */
  assign n246_o = n243_o | n245_o;
  /* 6805.vhd:332:44  */
  assign n248_o = datain == 8'b00111101;
  /* 6805.vhd:332:44  */
  assign n249_o = n246_o | n248_o;
  /* 6805.vhd:333:28  */
  assign n251_o = datain == 8'b00111111;
  /* 6805.vhd:333:28  */
  assign n252_o = n249_o | n251_o;
  /* 6805.vhd:333:36  */
  assign n254_o = datain == 8'b10110000;
  /* 6805.vhd:333:36  */
  assign n255_o = n252_o | n254_o;
  /* 6805.vhd:334:28  */
  assign n257_o = datain == 8'b10110001;
  /* 6805.vhd:334:28  */
  assign n258_o = n255_o | n257_o;
  /* 6805.vhd:334:36  */
  assign n260_o = datain == 8'b10110010;
  /* 6805.vhd:334:36  */
  assign n261_o = n258_o | n260_o;
  /* 6805.vhd:334:44  */
  assign n263_o = datain == 8'b10110011;
  /* 6805.vhd:334:44  */
  assign n264_o = n261_o | n263_o;
  /* 6805.vhd:334:52  */
  assign n266_o = datain == 8'b10110100;
  /* 6805.vhd:334:52  */
  assign n267_o = n264_o | n266_o;
  /* 6805.vhd:335:28  */
  assign n269_o = datain == 8'b10110101;
  /* 6805.vhd:335:28  */
  assign n270_o = n267_o | n269_o;
  /* 6805.vhd:335:36  */
  assign n272_o = datain == 8'b10110110;
  /* 6805.vhd:335:36  */
  assign n273_o = n270_o | n272_o;
  /* 6805.vhd:335:44  */
  assign n275_o = datain == 8'b10110111;
  /* 6805.vhd:335:44  */
  assign n276_o = n273_o | n275_o;
  /* 6805.vhd:335:52  */
  assign n278_o = datain == 8'b10111000;
  /* 6805.vhd:335:52  */
  assign n279_o = n276_o | n278_o;
  /* 6805.vhd:336:28  */
  assign n281_o = datain == 8'b10111001;
  /* 6805.vhd:336:28  */
  assign n282_o = n279_o | n281_o;
  /* 6805.vhd:336:36  */
  assign n284_o = datain == 8'b10111010;
  /* 6805.vhd:336:36  */
  assign n285_o = n282_o | n284_o;
  /* 6805.vhd:336:44  */
  assign n287_o = datain == 8'b10111011;
  /* 6805.vhd:336:44  */
  assign n288_o = n285_o | n287_o;
  /* 6805.vhd:336:52  */
  assign n290_o = datain == 8'b10111100;
  /* 6805.vhd:336:52  */
  assign n291_o = n288_o | n290_o;
  /* 6805.vhd:337:28  */
  assign n293_o = datain == 8'b10111110;
  /* 6805.vhd:337:28  */
  assign n294_o = n291_o | n293_o;
  /* 6805.vhd:337:36  */
  assign n296_o = datain == 8'b10111111;
  /* 6805.vhd:337:36  */
  assign n297_o = n294_o | n296_o;
  /* 6805.vhd:351:34  */
  assign n299_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:341:17  */
  assign n301_o = datain == 8'b00100000;
  /* 6805.vhd:341:28  */
  assign n303_o = datain == 8'b00100001;
  /* 6805.vhd:341:28  */
  assign n304_o = n301_o | n303_o;
  /* 6805.vhd:341:36  */
  assign n306_o = datain == 8'b00100010;
  /* 6805.vhd:341:36  */
  assign n307_o = n304_o | n306_o;
  /* 6805.vhd:341:44  */
  assign n309_o = datain == 8'b00100011;
  /* 6805.vhd:341:44  */
  assign n310_o = n307_o | n309_o;
  /* 6805.vhd:341:52  */
  assign n312_o = datain == 8'b00100100;
  /* 6805.vhd:341:52  */
  assign n313_o = n310_o | n312_o;
  /* 6805.vhd:341:60  */
  assign n315_o = datain == 8'b00100101;
  /* 6805.vhd:341:60  */
  assign n316_o = n313_o | n315_o;
  /* 6805.vhd:341:68  */
  assign n318_o = datain == 8'b00100110;
  /* 6805.vhd:341:68  */
  assign n319_o = n316_o | n318_o;
  /* 6805.vhd:341:76  */
  assign n321_o = datain == 8'b00100111;
  /* 6805.vhd:341:76  */
  assign n322_o = n319_o | n321_o;
  /* 6805.vhd:341:84  */
  assign n324_o = datain == 8'b00101000;
  /* 6805.vhd:341:84  */
  assign n325_o = n322_o | n324_o;
  /* 6805.vhd:342:28  */
  assign n327_o = datain == 8'b00101001;
  /* 6805.vhd:342:28  */
  assign n328_o = n325_o | n327_o;
  /* 6805.vhd:342:36  */
  assign n330_o = datain == 8'b00101010;
  /* 6805.vhd:342:36  */
  assign n331_o = n328_o | n330_o;
  /* 6805.vhd:342:44  */
  assign n333_o = datain == 8'b00101011;
  /* 6805.vhd:342:44  */
  assign n334_o = n331_o | n333_o;
  /* 6805.vhd:342:52  */
  assign n336_o = datain == 8'b00101100;
  /* 6805.vhd:342:52  */
  assign n337_o = n334_o | n336_o;
  /* 6805.vhd:342:60  */
  assign n339_o = datain == 8'b00101101;
  /* 6805.vhd:342:60  */
  assign n340_o = n337_o | n339_o;
  /* 6805.vhd:342:68  */
  assign n342_o = datain == 8'b00101110;
  /* 6805.vhd:342:68  */
  assign n343_o = n340_o | n342_o;
  /* 6805.vhd:342:76  */
  assign n345_o = datain == 8'b00101111;
  /* 6805.vhd:342:76  */
  assign n346_o = n343_o | n345_o;
  /* 6805.vhd:342:84  */
  assign n348_o = datain == 8'b11000000;
  /* 6805.vhd:342:84  */
  assign n349_o = n346_o | n348_o;
  /* 6805.vhd:343:28  */
  assign n351_o = datain == 8'b11000001;
  /* 6805.vhd:343:28  */
  assign n352_o = n349_o | n351_o;
  /* 6805.vhd:343:36  */
  assign n354_o = datain == 8'b11000010;
  /* 6805.vhd:343:36  */
  assign n355_o = n352_o | n354_o;
  /* 6805.vhd:343:44  */
  assign n357_o = datain == 8'b11000011;
  /* 6805.vhd:343:44  */
  assign n358_o = n355_o | n357_o;
  /* 6805.vhd:343:52  */
  assign n360_o = datain == 8'b11000100;
  /* 6805.vhd:343:52  */
  assign n361_o = n358_o | n360_o;
  /* 6805.vhd:344:28  */
  assign n363_o = datain == 8'b11000101;
  /* 6805.vhd:344:28  */
  assign n364_o = n361_o | n363_o;
  /* 6805.vhd:344:36  */
  assign n366_o = datain == 8'b11000110;
  /* 6805.vhd:344:36  */
  assign n367_o = n364_o | n366_o;
  /* 6805.vhd:344:44  */
  assign n369_o = datain == 8'b11000111;
  /* 6805.vhd:344:44  */
  assign n370_o = n367_o | n369_o;
  /* 6805.vhd:344:52  */
  assign n372_o = datain == 8'b11001000;
  /* 6805.vhd:344:52  */
  assign n373_o = n370_o | n372_o;
  /* 6805.vhd:345:28  */
  assign n375_o = datain == 8'b11001001;
  /* 6805.vhd:345:28  */
  assign n376_o = n373_o | n375_o;
  /* 6805.vhd:345:36  */
  assign n378_o = datain == 8'b11001010;
  /* 6805.vhd:345:36  */
  assign n379_o = n376_o | n378_o;
  /* 6805.vhd:345:44  */
  assign n381_o = datain == 8'b11001011;
  /* 6805.vhd:345:44  */
  assign n382_o = n379_o | n381_o;
  /* 6805.vhd:345:52  */
  assign n384_o = datain == 8'b11001100;
  /* 6805.vhd:345:52  */
  assign n385_o = n382_o | n384_o;
  /* 6805.vhd:346:28  */
  assign n387_o = datain == 8'b11001110;
  /* 6805.vhd:346:28  */
  assign n388_o = n385_o | n387_o;
  /* 6805.vhd:346:36  */
  assign n390_o = datain == 8'b11001111;
  /* 6805.vhd:346:36  */
  assign n391_o = n388_o | n390_o;
  /* 6805.vhd:346:44  */
  assign n393_o = datain == 8'b11010000;
  /* 6805.vhd:346:44  */
  assign n394_o = n391_o | n393_o;
  /* 6805.vhd:347:28  */
  assign n396_o = datain == 8'b11010001;
  /* 6805.vhd:347:28  */
  assign n397_o = n394_o | n396_o;
  /* 6805.vhd:347:36  */
  assign n399_o = datain == 8'b11010010;
  /* 6805.vhd:347:36  */
  assign n400_o = n397_o | n399_o;
  /* 6805.vhd:347:44  */
  assign n402_o = datain == 8'b11010011;
  /* 6805.vhd:347:44  */
  assign n403_o = n400_o | n402_o;
  /* 6805.vhd:347:52  */
  assign n405_o = datain == 8'b11010100;
  /* 6805.vhd:347:52  */
  assign n406_o = n403_o | n405_o;
  /* 6805.vhd:348:28  */
  assign n408_o = datain == 8'b11010101;
  /* 6805.vhd:348:28  */
  assign n409_o = n406_o | n408_o;
  /* 6805.vhd:348:36  */
  assign n411_o = datain == 8'b11010110;
  /* 6805.vhd:348:36  */
  assign n412_o = n409_o | n411_o;
  /* 6805.vhd:348:44  */
  assign n414_o = datain == 8'b11010111;
  /* 6805.vhd:348:44  */
  assign n415_o = n412_o | n414_o;
  /* 6805.vhd:348:52  */
  assign n417_o = datain == 8'b11011000;
  /* 6805.vhd:348:52  */
  assign n418_o = n415_o | n417_o;
  /* 6805.vhd:349:28  */
  assign n420_o = datain == 8'b11011001;
  /* 6805.vhd:349:28  */
  assign n421_o = n418_o | n420_o;
  /* 6805.vhd:349:36  */
  assign n423_o = datain == 8'b11011010;
  /* 6805.vhd:349:36  */
  assign n424_o = n421_o | n423_o;
  /* 6805.vhd:349:44  */
  assign n426_o = datain == 8'b11011011;
  /* 6805.vhd:349:44  */
  assign n427_o = n424_o | n426_o;
  /* 6805.vhd:349:52  */
  assign n429_o = datain == 8'b11011100;
  /* 6805.vhd:349:52  */
  assign n430_o = n427_o | n429_o;
  /* 6805.vhd:350:28  */
  assign n432_o = datain == 8'b11011110;
  /* 6805.vhd:350:28  */
  assign n433_o = n430_o | n432_o;
  /* 6805.vhd:350:36  */
  assign n435_o = datain == 8'b11011111;
  /* 6805.vhd:350:36  */
  assign n436_o = n433_o | n435_o;
  /* 6805.vhd:356:36  */
  assign n438_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:353:17  */
  assign n440_o = datain == 8'b01110000;
  /* 6805.vhd:353:28  */
  assign n442_o = datain == 8'b01110011;
  /* 6805.vhd:353:28  */
  assign n443_o = n440_o | n442_o;
  /* 6805.vhd:353:36  */
  assign n445_o = datain == 8'b01110100;
  /* 6805.vhd:353:36  */
  assign n446_o = n443_o | n445_o;
  /* 6805.vhd:353:44  */
  assign n448_o = datain == 8'b01110110;
  /* 6805.vhd:353:44  */
  assign n449_o = n446_o | n448_o;
  /* 6805.vhd:353:52  */
  assign n451_o = datain == 8'b01110111;
  /* 6805.vhd:353:52  */
  assign n452_o = n449_o | n451_o;
  /* 6805.vhd:353:60  */
  assign n454_o = datain == 8'b01111000;
  /* 6805.vhd:353:60  */
  assign n455_o = n452_o | n454_o;
  /* 6805.vhd:354:28  */
  assign n457_o = datain == 8'b01111001;
  /* 6805.vhd:354:28  */
  assign n458_o = n455_o | n457_o;
  /* 6805.vhd:354:36  */
  assign n460_o = datain == 8'b01111010;
  /* 6805.vhd:354:36  */
  assign n461_o = n458_o | n460_o;
  /* 6805.vhd:354:44  */
  assign n463_o = datain == 8'b01111100;
  /* 6805.vhd:354:44  */
  assign n464_o = n461_o | n463_o;
  /* 6805.vhd:354:52  */
  assign n466_o = datain == 8'b01111101;
  /* 6805.vhd:354:52  */
  assign n467_o = n464_o | n466_o;
  /* 6805.vhd:362:34  */
  assign n469_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:358:17  */
  assign n471_o = datain == 8'b10100000;
  /* 6805.vhd:358:28  */
  assign n473_o = datain == 8'b10100001;
  /* 6805.vhd:358:28  */
  assign n474_o = n471_o | n473_o;
  /* 6805.vhd:358:36  */
  assign n476_o = datain == 8'b10100010;
  /* 6805.vhd:358:36  */
  assign n477_o = n474_o | n476_o;
  /* 6805.vhd:358:44  */
  assign n479_o = datain == 8'b10100011;
  /* 6805.vhd:358:44  */
  assign n480_o = n477_o | n479_o;
  /* 6805.vhd:358:52  */
  assign n482_o = datain == 8'b10100100;
  /* 6805.vhd:358:52  */
  assign n483_o = n480_o | n482_o;
  /* 6805.vhd:359:28  */
  assign n485_o = datain == 8'b10100101;
  /* 6805.vhd:359:28  */
  assign n486_o = n483_o | n485_o;
  /* 6805.vhd:359:36  */
  assign n488_o = datain == 8'b10100110;
  /* 6805.vhd:359:36  */
  assign n489_o = n486_o | n488_o;
  /* 6805.vhd:359:44  */
  assign n491_o = datain == 8'b10101000;
  /* 6805.vhd:359:44  */
  assign n492_o = n489_o | n491_o;
  /* 6805.vhd:360:28  */
  assign n494_o = datain == 8'b10101001;
  /* 6805.vhd:360:28  */
  assign n495_o = n492_o | n494_o;
  /* 6805.vhd:360:36  */
  assign n497_o = datain == 8'b10101010;
  /* 6805.vhd:360:36  */
  assign n498_o = n495_o | n497_o;
  /* 6805.vhd:360:44  */
  assign n500_o = datain == 8'b10101011;
  /* 6805.vhd:360:44  */
  assign n501_o = n498_o | n500_o;
  /* 6805.vhd:360:52  */
  assign n503_o = datain == 8'b10101110;
  /* 6805.vhd:360:52  */
  assign n504_o = n501_o | n503_o;
  /* 6805.vhd:368:34  */
  assign n506_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:364:17  */
  assign n508_o = datain == 8'b11100000;
  /* 6805.vhd:364:28  */
  assign n510_o = datain == 8'b11100001;
  /* 6805.vhd:364:28  */
  assign n511_o = n508_o | n510_o;
  /* 6805.vhd:364:36  */
  assign n513_o = datain == 8'b11100010;
  /* 6805.vhd:364:36  */
  assign n514_o = n511_o | n513_o;
  /* 6805.vhd:364:44  */
  assign n516_o = datain == 8'b11100011;
  /* 6805.vhd:364:44  */
  assign n517_o = n514_o | n516_o;
  /* 6805.vhd:364:52  */
  assign n519_o = datain == 8'b11100100;
  /* 6805.vhd:364:52  */
  assign n520_o = n517_o | n519_o;
  /* 6805.vhd:365:28  */
  assign n522_o = datain == 8'b11100101;
  /* 6805.vhd:365:28  */
  assign n523_o = n520_o | n522_o;
  /* 6805.vhd:365:36  */
  assign n525_o = datain == 8'b11100110;
  /* 6805.vhd:365:36  */
  assign n526_o = n523_o | n525_o;
  /* 6805.vhd:365:44  */
  assign n528_o = datain == 8'b11100111;
  /* 6805.vhd:365:44  */
  assign n529_o = n526_o | n528_o;
  /* 6805.vhd:365:52  */
  assign n531_o = datain == 8'b11101000;
  /* 6805.vhd:365:52  */
  assign n532_o = n529_o | n531_o;
  /* 6805.vhd:366:28  */
  assign n534_o = datain == 8'b11101001;
  /* 6805.vhd:366:28  */
  assign n535_o = n532_o | n534_o;
  /* 6805.vhd:366:36  */
  assign n537_o = datain == 8'b11101010;
  /* 6805.vhd:366:36  */
  assign n538_o = n535_o | n537_o;
  /* 6805.vhd:366:44  */
  assign n540_o = datain == 8'b11101011;
  /* 6805.vhd:366:44  */
  assign n541_o = n538_o | n540_o;
  /* 6805.vhd:366:52  */
  assign n543_o = datain == 8'b11101100;
  /* 6805.vhd:366:52  */
  assign n544_o = n541_o | n543_o;
  /* 6805.vhd:367:28  */
  assign n546_o = datain == 8'b11101110;
  /* 6805.vhd:367:28  */
  assign n547_o = n544_o | n546_o;
  /* 6805.vhd:367:36  */
  assign n549_o = datain == 8'b11101111;
  /* 6805.vhd:367:36  */
  assign n550_o = n547_o | n549_o;
  /* 6805.vhd:375:36  */
  assign n552_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:370:17  */
  assign n554_o = datain == 8'b11110000;
  /* 6805.vhd:370:28  */
  assign n556_o = datain == 8'b11110001;
  /* 6805.vhd:370:28  */
  assign n557_o = n554_o | n556_o;
  /* 6805.vhd:370:36  */
  assign n559_o = datain == 8'b11110010;
  /* 6805.vhd:370:36  */
  assign n560_o = n557_o | n559_o;
  /* 6805.vhd:370:44  */
  assign n562_o = datain == 8'b11110011;
  /* 6805.vhd:370:44  */
  assign n563_o = n560_o | n562_o;
  /* 6805.vhd:370:52  */
  assign n565_o = datain == 8'b11110100;
  /* 6805.vhd:370:52  */
  assign n566_o = n563_o | n565_o;
  /* 6805.vhd:371:28  */
  assign n568_o = datain == 8'b11110101;
  /* 6805.vhd:371:28  */
  assign n569_o = n566_o | n568_o;
  /* 6805.vhd:371:36  */
  assign n571_o = datain == 8'b11110110;
  /* 6805.vhd:371:36  */
  assign n572_o = n569_o | n571_o;
  /* 6805.vhd:371:44  */
  assign n574_o = datain == 8'b11111000;
  /* 6805.vhd:371:44  */
  assign n575_o = n572_o | n574_o;
  /* 6805.vhd:372:28  */
  assign n577_o = datain == 8'b11111001;
  /* 6805.vhd:372:28  */
  assign n578_o = n575_o | n577_o;
  /* 6805.vhd:372:36  */
  assign n580_o = datain == 8'b11111010;
  /* 6805.vhd:372:36  */
  assign n581_o = n578_o | n580_o;
  /* 6805.vhd:372:44  */
  assign n583_o = datain == 8'b11111011;
  /* 6805.vhd:372:44  */
  assign n584_o = n581_o | n583_o;
  /* 6805.vhd:372:52  */
  assign n586_o = datain == 8'b11111110;
  /* 6805.vhd:372:52  */
  assign n587_o = n584_o | n586_o;
  /* 6805.vhd:378:34  */
  assign n589_o = {8'b00000000, regx};
  /* 6805.vhd:377:17  */
  assign n591_o = datain == 8'b11111100;
  /* 6805.vhd:382:32  */
  assign n592_o = rega[7];
  /* 6805.vhd:383:27  */
  assign n594_o = rega == 8'b00000000;
  /* 6805.vhd:383:19  */
  assign n597_o = n594_o ? 1'b1 : 1'b0;
  /* 6805.vhd:390:34  */
  assign n599_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:380:17  */
  assign n601_o = datain == 8'b11110111;
  /* 6805.vhd:394:32  */
  assign n602_o = regx[7];
  /* 6805.vhd:395:27  */
  assign n604_o = regx == 8'b00000000;
  /* 6805.vhd:395:19  */
  assign n607_o = n604_o ? 1'b1 : 1'b0;
  /* 6805.vhd:402:34  */
  assign n609_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:392:17  */
  assign n611_o = datain == 8'b11111111;
  /* 6805.vhd:405:36  */
  assign n613_o = 8'b00000000 - rega;
  /* 6805.vhd:406:36  */
  assign n615_o = 8'b00000000 - rega;
  /* 6805.vhd:407:34  */
  assign n616_o = n615_o[7];
  /* 6805.vhd:408:27  */
  assign n618_o = n615_o == 8'b00000000;
  /* 6805.vhd:408:19  */
  assign n621_o = n618_o ? 1'b1 : 1'b0;
  /* 6805.vhd:408:19  */
  assign n624_o = n618_o ? 1'b0 : 1'b1;
  /* 6805.vhd:415:34  */
  assign n626_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:404:17  */
  assign n628_o = datain == 8'b01000000;
  /* 6805.vhd:420:32  */
  assign n629_o = prod[7:0];
  /* 6805.vhd:421:32  */
  assign n630_o = prod[15:8];
  /* 6805.vhd:422:34  */
  assign n632_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:417:17  */
  assign n634_o = datain == 8'b01000010;
  /* 6805.vhd:425:35  */
  assign n636_o = rega ^ 8'b11111111;
  /* 6805.vhd:426:35  */
  assign n638_o = rega ^ 8'b11111111;
  /* 6805.vhd:428:34  */
  assign n639_o = n638_o[7];
  /* 6805.vhd:429:27  */
  assign n641_o = n638_o == 8'b00000000;
  /* 6805.vhd:429:19  */
  assign n644_o = n641_o ? 1'b1 : 1'b0;
  /* 6805.vhd:434:34  */
  assign n646_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:424:17  */
  assign n648_o = datain == 8'b01000011;
  /* 6805.vhd:437:40  */
  assign n649_o = rega[7:1];
  /* 6805.vhd:437:34  */
  assign n651_o = {1'b0, n649_o};
  /* 6805.vhd:438:40  */
  assign n652_o = rega[7:1];
  /* 6805.vhd:438:34  */
  assign n654_o = {1'b0, n652_o};
  /* 6805.vhd:440:34  */
  assign n655_o = rega[0];
  /* 6805.vhd:441:27  */
  assign n657_o = n654_o == 8'b00000000;
  /* 6805.vhd:441:19  */
  assign n660_o = n657_o ? 1'b1 : 1'b0;
  /* 6805.vhd:446:34  */
  assign n662_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:436:17  */
  assign n664_o = datain == 8'b01000100;
  /* 6805.vhd:449:42  */
  assign n665_o = rega[7:1];
  /* 6805.vhd:449:36  */
  assign n666_o = {flagc, n665_o};
  /* 6805.vhd:450:42  */
  assign n667_o = rega[7:1];
  /* 6805.vhd:450:36  */
  assign n668_o = {flagc, n667_o};
  /* 6805.vhd:452:34  */
  assign n669_o = rega[0];
  /* 6805.vhd:453:27  */
  assign n671_o = n668_o == 8'b00000000;
  /* 6805.vhd:453:19  */
  assign n674_o = n671_o ? 1'b1 : 1'b0;
  /* 6805.vhd:458:34  */
  assign n676_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:448:17  */
  assign n678_o = datain == 8'b01000110;
  /* 6805.vhd:461:34  */
  assign n679_o = rega[7];
  /* 6805.vhd:461:44  */
  assign n680_o = rega[7:1];
  /* 6805.vhd:461:38  */
  assign n681_o = {n679_o, n680_o};
  /* 6805.vhd:462:34  */
  assign n682_o = rega[7];
  /* 6805.vhd:462:44  */
  assign n683_o = rega[7:1];
  /* 6805.vhd:462:38  */
  assign n684_o = {n682_o, n683_o};
  /* 6805.vhd:463:34  */
  assign n685_o = rega[7];
  /* 6805.vhd:464:34  */
  assign n686_o = rega[0];
  /* 6805.vhd:465:27  */
  assign n688_o = n684_o == 8'b00000000;
  /* 6805.vhd:465:19  */
  assign n691_o = n688_o ? 1'b1 : 1'b0;
  /* 6805.vhd:470:34  */
  assign n693_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:460:17  */
  assign n695_o = datain == 8'b01000111;
  /* 6805.vhd:473:34  */
  assign n696_o = rega[6:0];
  /* 6805.vhd:473:47  */
  assign n698_o = {n696_o, 1'b0};
  /* 6805.vhd:474:34  */
  assign n699_o = rega[6:0];
  /* 6805.vhd:474:47  */
  assign n701_o = {n699_o, 1'b0};
  /* 6805.vhd:475:34  */
  assign n702_o = rega[6];
  /* 6805.vhd:476:34  */
  assign n703_o = rega[7];
  /* 6805.vhd:477:27  */
  assign n705_o = n701_o == 8'b00000000;
  /* 6805.vhd:477:19  */
  assign n708_o = n705_o ? 1'b1 : 1'b0;
  /* 6805.vhd:482:34  */
  assign n710_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:472:17  */
  assign n712_o = datain == 8'b01001000;
  /* 6805.vhd:485:34  */
  assign n713_o = rega[6:0];
  /* 6805.vhd:485:47  */
  assign n714_o = {n713_o, flagc};
  /* 6805.vhd:486:34  */
  assign n715_o = rega[6:0];
  /* 6805.vhd:486:47  */
  assign n716_o = {n715_o, flagc};
  /* 6805.vhd:487:34  */
  assign n717_o = rega[6];
  /* 6805.vhd:488:34  */
  assign n718_o = rega[7];
  /* 6805.vhd:489:27  */
  assign n720_o = n716_o == 8'b00000000;
  /* 6805.vhd:489:19  */
  assign n723_o = n720_o ? 1'b1 : 1'b0;
  /* 6805.vhd:494:34  */
  assign n725_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:484:17  */
  assign n727_o = datain == 8'b01001001;
  /* 6805.vhd:497:35  */
  assign n729_o = rega - 8'b00000001;
  /* 6805.vhd:498:35  */
  assign n731_o = rega - 8'b00000001;
  /* 6805.vhd:499:34  */
  assign n732_o = n731_o[7];
  /* 6805.vhd:500:27  */
  assign n734_o = n731_o == 8'b00000000;
  /* 6805.vhd:500:19  */
  assign n737_o = n734_o ? 1'b1 : 1'b0;
  /* 6805.vhd:505:34  */
  assign n739_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:496:17  */
  assign n741_o = datain == 8'b01001010;
  /* 6805.vhd:508:35  */
  assign n743_o = rega + 8'b00000001;
  /* 6805.vhd:509:35  */
  assign n745_o = rega + 8'b00000001;
  /* 6805.vhd:510:34  */
  assign n746_o = n745_o[7];
  /* 6805.vhd:511:27  */
  assign n748_o = n745_o == 8'b00000000;
  /* 6805.vhd:511:19  */
  assign n751_o = n748_o ? 1'b1 : 1'b0;
  /* 6805.vhd:516:34  */
  assign n753_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:507:17  */
  assign n755_o = datain == 8'b01001100;
  /* 6805.vhd:519:34  */
  assign n756_o = rega[7];
  /* 6805.vhd:520:27  */
  assign n758_o = rega == 8'b00000000;
  /* 6805.vhd:520:19  */
  assign n761_o = n758_o ? 1'b1 : 1'b0;
  /* 6805.vhd:525:34  */
  assign n763_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:518:17  */
  assign n765_o = datain == 8'b01001101;
  /* 6805.vhd:531:34  */
  assign n767_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:527:17  */
  assign n769_o = datain == 8'b01001111;
  /* 6805.vhd:534:33  */
  assign n771_o = 8'b00000000 - regx;
  /* 6805.vhd:535:33  */
  assign n773_o = 8'b00000000 - regx;
  /* 6805.vhd:536:34  */
  assign n774_o = n773_o[7];
  /* 6805.vhd:537:27  */
  assign n776_o = n773_o == 8'b00000000;
  /* 6805.vhd:537:19  */
  assign n779_o = n776_o ? 1'b1 : 1'b0;
  /* 6805.vhd:537:19  */
  assign n782_o = n776_o ? 1'b0 : 1'b1;
  /* 6805.vhd:544:34  */
  assign n784_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:533:17  */
  assign n786_o = datain == 8'b01010000;
  /* 6805.vhd:547:32  */
  assign n788_o = regx ^ 8'b11111111;
  /* 6805.vhd:548:32  */
  assign n790_o = regx ^ 8'b11111111;
  /* 6805.vhd:550:34  */
  assign n791_o = n790_o[7];
  /* 6805.vhd:551:27  */
  assign n793_o = n790_o == 8'b00000000;
  /* 6805.vhd:551:19  */
  assign n796_o = n793_o ? 1'b1 : 1'b0;
  /* 6805.vhd:556:34  */
  assign n798_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:546:17  */
  assign n800_o = datain == 8'b01010011;
  /* 6805.vhd:559:37  */
  assign n801_o = regx[7:1];
  /* 6805.vhd:559:31  */
  assign n803_o = {1'b0, n801_o};
  /* 6805.vhd:560:37  */
  assign n804_o = regx[7:1];
  /* 6805.vhd:560:31  */
  assign n806_o = {1'b0, n804_o};
  /* 6805.vhd:562:34  */
  assign n807_o = regx[0];
  /* 6805.vhd:563:27  */
  assign n809_o = n806_o == 8'b00000000;
  /* 6805.vhd:563:19  */
  assign n812_o = n809_o ? 1'b1 : 1'b0;
  /* 6805.vhd:568:34  */
  assign n814_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:558:17  */
  assign n816_o = datain == 8'b01010100;
  /* 6805.vhd:571:39  */
  assign n817_o = regx[7:1];
  /* 6805.vhd:571:33  */
  assign n818_o = {flagc, n817_o};
  /* 6805.vhd:572:39  */
  assign n819_o = regx[7:1];
  /* 6805.vhd:572:33  */
  assign n820_o = {flagc, n819_o};
  /* 6805.vhd:574:34  */
  assign n821_o = regx[0];
  /* 6805.vhd:575:27  */
  assign n823_o = n820_o == 8'b00000000;
  /* 6805.vhd:575:19  */
  assign n826_o = n823_o ? 1'b1 : 1'b0;
  /* 6805.vhd:580:34  */
  assign n828_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:570:17  */
  assign n830_o = datain == 8'b01010110;
  /* 6805.vhd:583:31  */
  assign n831_o = regx[7];
  /* 6805.vhd:583:41  */
  assign n832_o = regx[7:1];
  /* 6805.vhd:583:35  */
  assign n833_o = {n831_o, n832_o};
  /* 6805.vhd:584:31  */
  assign n834_o = regx[7];
  /* 6805.vhd:584:41  */
  assign n835_o = regx[7:1];
  /* 6805.vhd:584:35  */
  assign n836_o = {n834_o, n835_o};
  /* 6805.vhd:585:34  */
  assign n837_o = regx[7];
  /* 6805.vhd:586:34  */
  assign n838_o = regx[0];
  /* 6805.vhd:587:27  */
  assign n840_o = n836_o == 8'b00000000;
  /* 6805.vhd:587:19  */
  assign n843_o = n840_o ? 1'b1 : 1'b0;
  /* 6805.vhd:592:34  */
  assign n845_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:582:17  */
  assign n847_o = datain == 8'b01010111;
  /* 6805.vhd:595:31  */
  assign n848_o = regx[6:0];
  /* 6805.vhd:595:44  */
  assign n850_o = {n848_o, 1'b0};
  /* 6805.vhd:596:31  */
  assign n851_o = regx[6:0];
  /* 6805.vhd:596:44  */
  assign n853_o = {n851_o, 1'b0};
  /* 6805.vhd:597:34  */
  assign n854_o = regx[6];
  /* 6805.vhd:598:34  */
  assign n855_o = regx[7];
  /* 6805.vhd:599:27  */
  assign n857_o = n853_o == 8'b00000000;
  /* 6805.vhd:599:19  */
  assign n860_o = n857_o ? 1'b1 : 1'b0;
  /* 6805.vhd:604:34  */
  assign n862_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:594:17  */
  assign n864_o = datain == 8'b01011000;
  /* 6805.vhd:607:31  */
  assign n865_o = regx[6:0];
  /* 6805.vhd:607:44  */
  assign n866_o = {n865_o, flagc};
  /* 6805.vhd:608:31  */
  assign n867_o = regx[6:0];
  /* 6805.vhd:608:44  */
  assign n868_o = {n867_o, flagc};
  /* 6805.vhd:609:34  */
  assign n869_o = regx[6];
  /* 6805.vhd:610:34  */
  assign n870_o = regx[7];
  /* 6805.vhd:611:27  */
  assign n872_o = n868_o == 8'b00000000;
  /* 6805.vhd:611:19  */
  assign n875_o = n872_o ? 1'b1 : 1'b0;
  /* 6805.vhd:616:34  */
  assign n877_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:606:17  */
  assign n879_o = datain == 8'b01011001;
  /* 6805.vhd:619:44  */
  assign n881_o = regx - 8'b00000001;
  /* 6805.vhd:620:44  */
  assign n883_o = regx - 8'b00000001;
  /* 6805.vhd:621:34  */
  assign n884_o = n883_o[7];
  /* 6805.vhd:622:27  */
  assign n886_o = n883_o == 8'b00000000;
  /* 6805.vhd:622:19  */
  assign n889_o = n886_o ? 1'b1 : 1'b0;
  /* 6805.vhd:627:34  */
  assign n891_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:618:17  */
  assign n893_o = datain == 8'b01011010;
  /* 6805.vhd:630:44  */
  assign n895_o = regx + 8'b00000001;
  /* 6805.vhd:631:44  */
  assign n897_o = regx + 8'b00000001;
  /* 6805.vhd:632:34  */
  assign n898_o = n897_o[7];
  /* 6805.vhd:633:27  */
  assign n900_o = n897_o == 8'b00000000;
  /* 6805.vhd:633:19  */
  assign n903_o = n900_o ? 1'b1 : 1'b0;
  /* 6805.vhd:638:34  */
  assign n905_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:629:17  */
  assign n907_o = datain == 8'b01011100;
  /* 6805.vhd:641:34  */
  assign n908_o = regx[7];
  /* 6805.vhd:642:27  */
  assign n910_o = regx == 8'b00000000;
  /* 6805.vhd:642:19  */
  assign n913_o = n910_o ? 1'b1 : 1'b0;
  /* 6805.vhd:647:34  */
  assign n915_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:640:17  */
  assign n917_o = datain == 8'b01011101;
  /* 6805.vhd:653:34  */
  assign n919_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:649:17  */
  assign n921_o = datain == 8'b01011111;
  /* 6805.vhd:658:33  */
  assign n923_o = {8'b00000000, regx};
  /* 6805.vhd:659:36  */
  assign n925_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:655:17  */
  assign n927_o = datain == 8'b01100000;
  /* 6805.vhd:655:28  */
  assign n929_o = datain == 8'b01100011;
  /* 6805.vhd:655:28  */
  assign n930_o = n927_o | n929_o;
  /* 6805.vhd:655:36  */
  assign n932_o = datain == 8'b01100100;
  /* 6805.vhd:655:36  */
  assign n933_o = n930_o | n932_o;
  /* 6805.vhd:655:44  */
  assign n935_o = datain == 8'b01100110;
  /* 6805.vhd:655:44  */
  assign n936_o = n933_o | n935_o;
  /* 6805.vhd:655:52  */
  assign n938_o = datain == 8'b01100111;
  /* 6805.vhd:655:52  */
  assign n939_o = n936_o | n938_o;
  /* 6805.vhd:656:28  */
  assign n941_o = datain == 8'b01101000;
  /* 6805.vhd:656:28  */
  assign n942_o = n939_o | n941_o;
  /* 6805.vhd:656:36  */
  assign n944_o = datain == 8'b01101001;
  /* 6805.vhd:656:36  */
  assign n945_o = n942_o | n944_o;
  /* 6805.vhd:656:44  */
  assign n947_o = datain == 8'b01101010;
  /* 6805.vhd:656:44  */
  assign n948_o = n945_o | n947_o;
  /* 6805.vhd:656:52  */
  assign n950_o = datain == 8'b01101100;
  /* 6805.vhd:656:52  */
  assign n951_o = n948_o | n950_o;
  /* 6805.vhd:657:28  */
  assign n953_o = datain == 8'b01101101;
  /* 6805.vhd:657:28  */
  assign n954_o = n951_o | n953_o;
  /* 6805.vhd:657:36  */
  assign n956_o = datain == 8'b01101111;
  /* 6805.vhd:657:36  */
  assign n957_o = n954_o | n956_o;
  /* 6805.vhd:668:34  */
  assign n959_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:661:17  */
  assign n961_o = datain == 8'b01111111;
  /* 6805.vhd:671:36  */
  assign n963_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:670:17  */
  assign n965_o = datain == 8'b10000000;
  /* 6805.vhd:670:28  */
  assign n967_o = datain == 8'b10000001;
  /* 6805.vhd:670:28  */
  assign n968_o = n965_o | n967_o;
  /* 6805.vhd:675:36  */
  assign n970_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:674:17  */
  assign n972_o = datain == 8'b10000011;
  /* 6805.vhd:679:36  */
  assign n974_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:678:17  */
  assign n976_o = datain == 8'b10001110;
  /* 6805.vhd:682:36  */
  assign n978_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:681:17  */
  assign n980_o = datain == 8'b10001111;
  /* 6805.vhd:686:36  */
  assign n982_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:684:17  */
  assign n984_o = datain == 8'b10010111;
  /* 6805.vhd:689:34  */
  assign n985_o = datain[0];
  /* 6805.vhd:690:36  */
  assign n987_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:688:17  */
  assign n989_o = datain == 8'b10011000;
  /* 6805.vhd:688:28  */
  assign n991_o = datain == 8'b10011001;
  /* 6805.vhd:688:28  */
  assign n992_o = n989_o | n991_o;
  /* 6805.vhd:693:34  */
  assign n993_o = datain[0];
  /* 6805.vhd:694:36  */
  assign n995_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:692:17  */
  assign n997_o = datain == 8'b10011010;
  /* 6805.vhd:692:28  */
  assign n999_o = datain == 8'b10011011;
  /* 6805.vhd:692:28  */
  assign n1000_o = n997_o | n999_o;
  /* 6805.vhd:698:36  */
  assign n1002_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:696:17  */
  assign n1004_o = datain == 8'b10011100;
  /* 6805.vhd:708:36  */
  assign n1006_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:700:17  */
  assign n1008_o = datain == 8'b00110001;
  /* 6805.vhd:700:28  */
  assign n1010_o = datain == 8'b01000001;
  /* 6805.vhd:700:28  */
  assign n1011_o = n1008_o | n1010_o;
  /* 6805.vhd:700:36  */
  assign n1013_o = datain == 8'b00110101;
  /* 6805.vhd:700:36  */
  assign n1014_o = n1011_o | n1013_o;
  /* 6805.vhd:700:44  */
  assign n1016_o = datain == 8'b00111011;
  /* 6805.vhd:700:44  */
  assign n1017_o = n1014_o | n1016_o;
  /* 6805.vhd:700:52  */
  assign n1019_o = datain == 8'b01000101;
  /* 6805.vhd:700:52  */
  assign n1020_o = n1017_o | n1019_o;
  /* 6805.vhd:700:60  */
  assign n1022_o = datain == 8'b01001011;
  /* 6805.vhd:700:60  */
  assign n1023_o = n1020_o | n1022_o;
  /* 6805.vhd:701:28  */
  assign n1025_o = datain == 8'b01001110;
  /* 6805.vhd:701:28  */
  assign n1026_o = n1023_o | n1025_o;
  /* 6805.vhd:701:36  */
  assign n1028_o = datain == 8'b01010001;
  /* 6805.vhd:701:36  */
  assign n1029_o = n1026_o | n1028_o;
  /* 6805.vhd:701:44  */
  assign n1031_o = datain == 8'b01010010;
  /* 6805.vhd:701:44  */
  assign n1032_o = n1029_o | n1031_o;
  /* 6805.vhd:701:52  */
  assign n1034_o = datain == 8'b01010101;
  /* 6805.vhd:701:52  */
  assign n1035_o = n1032_o | n1034_o;
  /* 6805.vhd:701:60  */
  assign n1037_o = datain == 8'b01011011;
  /* 6805.vhd:701:60  */
  assign n1038_o = n1035_o | n1037_o;
  /* 6805.vhd:702:28  */
  assign n1040_o = datain == 8'b01011110;
  /* 6805.vhd:702:28  */
  assign n1041_o = n1038_o | n1040_o;
  /* 6805.vhd:702:36  */
  assign n1043_o = datain == 8'b01100001;
  /* 6805.vhd:702:36  */
  assign n1044_o = n1041_o | n1043_o;
  /* 6805.vhd:702:44  */
  assign n1046_o = datain == 8'b01100010;
  /* 6805.vhd:702:44  */
  assign n1047_o = n1044_o | n1046_o;
  /* 6805.vhd:702:52  */
  assign n1049_o = datain == 8'b01100101;
  /* 6805.vhd:702:52  */
  assign n1050_o = n1047_o | n1049_o;
  /* 6805.vhd:702:60  */
  assign n1052_o = datain == 8'b01101011;
  /* 6805.vhd:702:60  */
  assign n1053_o = n1050_o | n1052_o;
  /* 6805.vhd:703:28  */
  assign n1055_o = datain == 8'b01101110;
  /* 6805.vhd:703:28  */
  assign n1056_o = n1053_o | n1055_o;
  /* 6805.vhd:703:36  */
  assign n1058_o = datain == 8'b01110001;
  /* 6805.vhd:703:36  */
  assign n1059_o = n1056_o | n1058_o;
  /* 6805.vhd:703:44  */
  assign n1061_o = datain == 8'b01110010;
  /* 6805.vhd:703:44  */
  assign n1062_o = n1059_o | n1061_o;
  /* 6805.vhd:703:52  */
  assign n1064_o = datain == 8'b01110101;
  /* 6805.vhd:703:52  */
  assign n1065_o = n1062_o | n1064_o;
  /* 6805.vhd:703:60  */
  assign n1067_o = datain == 8'b01111011;
  /* 6805.vhd:703:60  */
  assign n1068_o = n1065_o | n1067_o;
  /* 6805.vhd:703:68  */
  assign n1070_o = datain == 8'b01111110;
  /* 6805.vhd:703:68  */
  assign n1071_o = n1068_o | n1070_o;
  /* 6805.vhd:703:76  */
  assign n1073_o = datain == 8'b10000100;
  /* 6805.vhd:703:76  */
  assign n1074_o = n1071_o | n1073_o;
  /* 6805.vhd:704:28  */
  assign n1076_o = datain == 8'b10000101;
  /* 6805.vhd:704:28  */
  assign n1077_o = n1074_o | n1076_o;
  /* 6805.vhd:704:36  */
  assign n1079_o = datain == 8'b10000110;
  /* 6805.vhd:704:36  */
  assign n1080_o = n1077_o | n1079_o;
  /* 6805.vhd:704:44  */
  assign n1082_o = datain == 8'b10000111;
  /* 6805.vhd:704:44  */
  assign n1083_o = n1080_o | n1082_o;
  /* 6805.vhd:704:52  */
  assign n1085_o = datain == 8'b10001000;
  /* 6805.vhd:704:52  */
  assign n1086_o = n1083_o | n1085_o;
  /* 6805.vhd:704:60  */
  assign n1088_o = datain == 8'b10001001;
  /* 6805.vhd:704:60  */
  assign n1089_o = n1086_o | n1088_o;
  /* 6805.vhd:705:28  */
  assign n1091_o = datain == 8'b10001010;
  /* 6805.vhd:705:28  */
  assign n1092_o = n1089_o | n1091_o;
  /* 6805.vhd:705:36  */
  assign n1094_o = datain == 8'b10001011;
  /* 6805.vhd:705:36  */
  assign n1095_o = n1092_o | n1094_o;
  /* 6805.vhd:705:44  */
  assign n1097_o = datain == 8'b10001100;
  /* 6805.vhd:705:44  */
  assign n1098_o = n1095_o | n1097_o;
  /* 6805.vhd:705:52  */
  assign n1100_o = datain == 8'b10001101;
  /* 6805.vhd:705:52  */
  assign n1101_o = n1098_o | n1100_o;
  /* 6805.vhd:705:60  */
  assign n1103_o = datain == 8'b10010000;
  /* 6805.vhd:705:60  */
  assign n1104_o = n1101_o | n1103_o;
  /* 6805.vhd:706:28  */
  assign n1106_o = datain == 8'b10010001;
  /* 6805.vhd:706:28  */
  assign n1107_o = n1104_o | n1106_o;
  /* 6805.vhd:706:36  */
  assign n1109_o = datain == 8'b10010010;
  /* 6805.vhd:706:36  */
  assign n1110_o = n1107_o | n1109_o;
  /* 6805.vhd:706:44  */
  assign n1112_o = datain == 8'b10010011;
  /* 6805.vhd:706:44  */
  assign n1113_o = n1110_o | n1112_o;
  /* 6805.vhd:706:52  */
  assign n1115_o = datain == 8'b10010100;
  /* 6805.vhd:706:52  */
  assign n1116_o = n1113_o | n1115_o;
  /* 6805.vhd:706:60  */
  assign n1118_o = datain == 8'b10010101;
  /* 6805.vhd:706:60  */
  assign n1119_o = n1116_o | n1118_o;
  /* 6805.vhd:706:68  */
  assign n1121_o = datain == 8'b10011101;
  /* 6805.vhd:706:68  */
  assign n1122_o = n1119_o | n1121_o;
  /* 6805.vhd:706:76  */
  assign n1124_o = datain == 8'b10011110;
  /* 6805.vhd:706:76  */
  assign n1125_o = n1122_o | n1124_o;
  /* 6805.vhd:706:84  */
  assign n1127_o = datain == 8'b10100111;
  /* 6805.vhd:706:84  */
  assign n1128_o = n1125_o | n1127_o;
  /* 6805.vhd:707:28  */
  assign n1130_o = datain == 8'b10101100;
  /* 6805.vhd:707:28  */
  assign n1131_o = n1128_o | n1130_o;
  /* 6805.vhd:707:36  */
  assign n1133_o = datain == 8'b10101111;
  /* 6805.vhd:707:36  */
  assign n1134_o = n1131_o | n1133_o;
  /* 6805.vhd:712:36  */
  assign n1136_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:710:17  */
  assign n1138_o = datain == 8'b10011111;
  /* 6805.vhd:715:36  */
  assign n1140_o = regpc + 16'b0000000000000010;
  /* 6805.vhd:716:36  */
  assign n1142_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:714:17  */
  assign n1144_o = datain == 8'b10101101;
  /* 6805.vhd:714:28  */
  assign n1146_o = datain == 8'b10111101;
  /* 6805.vhd:714:28  */
  assign n1147_o = n1144_o | n1146_o;
  /* 6805.vhd:714:36  */
  assign n1149_o = datain == 8'b11101101;
  /* 6805.vhd:714:36  */
  assign n1150_o = n1147_o | n1149_o;
  /* 6805.vhd:719:36  */
  assign n1152_o = regpc + 16'b0000000000000011;
  /* 6805.vhd:720:36  */
  assign n1154_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:718:17  */
  assign n1156_o = datain == 8'b11001101;
  /* 6805.vhd:718:28  */
  assign n1158_o = datain == 8'b11011101;
  /* 6805.vhd:718:28  */
  assign n1159_o = n1156_o | n1158_o;
  /* 6805.vhd:723:36  */
  assign n1161_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:727:36  */
  assign n1163_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:722:17  */
  assign n1165_o = datain == 8'b11111101;
  assign n1166_o = {n1165_o, n1159_o, n1150_o, n1138_o, n1134_o, n1004_o, n1000_o, n992_o, n984_o, n980_o, n976_o, n972_o, n968_o, n961_o, n957_o, n921_o, n917_o, n907_o, n893_o, n879_o, n864_o, n847_o, n830_o, n816_o, n800_o, n786_o, n769_o, n765_o, n755_o, n741_o, n727_o, n712_o, n695_o, n678_o, n664_o, n648_o, n634_o, n628_o, n611_o, n601_o, n591_o, n587_o, n550_o, n504_o, n467_o, n436_o, n297_o, n122_o};
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1171_o = 1'b0;
      48'b010000000000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b001000000000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000100000000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000010000000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000001000000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000100000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000010000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000001000000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000100000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000010000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000001000000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000100000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000010000000000000000000000000000000000: n1171_o = 1'b0;
      48'b000000000000001000000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000100000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000010000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000001000000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000100000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000010000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000001000000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000100000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000010000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000001000000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000100000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000010000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000001000000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000100000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000010000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000001000000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000100000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000010000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000001000000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000100000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000010000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000001000000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000100000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000010000000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000001000000000: n1171_o = 1'b0;
      48'b000000000000000000000000000000000000000100000000: n1171_o = 1'b0;
      48'b000000000000000000000000000000000000000010000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000001000000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000100000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000010000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000001000: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000000100: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000000010: n1171_o = n3828_q;
      48'b000000000000000000000000000000000000000000000001: n1171_o = n3828_q;
      default: n1171_o = n3828_q;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1173_o = rega;
      48'b010000000000000000000000000000000000000000000000: n1173_o = rega;
      48'b001000000000000000000000000000000000000000000000: n1173_o = rega;
      48'b000100000000000000000000000000000000000000000000: n1173_o = regx;
      48'b000010000000000000000000000000000000000000000000: n1173_o = rega;
      48'b000001000000000000000000000000000000000000000000: n1173_o = rega;
      48'b000000100000000000000000000000000000000000000000: n1173_o = rega;
      48'b000000010000000000000000000000000000000000000000: n1173_o = rega;
      48'b000000001000000000000000000000000000000000000000: n1173_o = rega;
      48'b000000000100000000000000000000000000000000000000: n1173_o = rega;
      48'b000000000010000000000000000000000000000000000000: n1173_o = rega;
      48'b000000000001000000000000000000000000000000000000: n1173_o = rega;
      48'b000000000000100000000000000000000000000000000000: n1173_o = rega;
      48'b000000000000010000000000000000000000000000000000: n1173_o = rega;
      48'b000000000000001000000000000000000000000000000000: n1173_o = rega;
      48'b000000000000000100000000000000000000000000000000: n1173_o = rega;
      48'b000000000000000010000000000000000000000000000000: n1173_o = rega;
      48'b000000000000000001000000000000000000000000000000: n1173_o = rega;
      48'b000000000000000000100000000000000000000000000000: n1173_o = rega;
      48'b000000000000000000010000000000000000000000000000: n1173_o = rega;
      48'b000000000000000000001000000000000000000000000000: n1173_o = rega;
      48'b000000000000000000000100000000000000000000000000: n1173_o = rega;
      48'b000000000000000000000010000000000000000000000000: n1173_o = rega;
      48'b000000000000000000000001000000000000000000000000: n1173_o = rega;
      48'b000000000000000000000000100000000000000000000000: n1173_o = rega;
      48'b000000000000000000000000010000000000000000000000: n1173_o = rega;
      48'b000000000000000000000000001000000000000000000000: n1173_o = 8'b00000000;
      48'b000000000000000000000000000100000000000000000000: n1173_o = rega;
      48'b000000000000000000000000000010000000000000000000: n1173_o = n743_o;
      48'b000000000000000000000000000001000000000000000000: n1173_o = n729_o;
      48'b000000000000000000000000000000100000000000000000: n1173_o = n714_o;
      48'b000000000000000000000000000000010000000000000000: n1173_o = n698_o;
      48'b000000000000000000000000000000001000000000000000: n1173_o = n681_o;
      48'b000000000000000000000000000000000100000000000000: n1173_o = n666_o;
      48'b000000000000000000000000000000000010000000000000: n1173_o = n651_o;
      48'b000000000000000000000000000000000001000000000000: n1173_o = n636_o;
      48'b000000000000000000000000000000000000100000000000: n1173_o = n629_o;
      48'b000000000000000000000000000000000000010000000000: n1173_o = n613_o;
      48'b000000000000000000000000000000000000001000000000: n1173_o = rega;
      48'b000000000000000000000000000000000000000100000000: n1173_o = rega;
      48'b000000000000000000000000000000000000000010000000: n1173_o = rega;
      48'b000000000000000000000000000000000000000001000000: n1173_o = rega;
      48'b000000000000000000000000000000000000000000100000: n1173_o = rega;
      48'b000000000000000000000000000000000000000000010000: n1173_o = rega;
      48'b000000000000000000000000000000000000000000001000: n1173_o = rega;
      48'b000000000000000000000000000000000000000000000100: n1173_o = rega;
      48'b000000000000000000000000000000000000000000000010: n1173_o = rega;
      48'b000000000000000000000000000000000000000000000001: n1173_o = rega;
      default: n1173_o = rega;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1175_o = regx;
      48'b010000000000000000000000000000000000000000000000: n1175_o = regx;
      48'b001000000000000000000000000000000000000000000000: n1175_o = regx;
      48'b000100000000000000000000000000000000000000000000: n1175_o = regx;
      48'b000010000000000000000000000000000000000000000000: n1175_o = regx;
      48'b000001000000000000000000000000000000000000000000: n1175_o = regx;
      48'b000000100000000000000000000000000000000000000000: n1175_o = regx;
      48'b000000010000000000000000000000000000000000000000: n1175_o = regx;
      48'b000000001000000000000000000000000000000000000000: n1175_o = rega;
      48'b000000000100000000000000000000000000000000000000: n1175_o = regx;
      48'b000000000010000000000000000000000000000000000000: n1175_o = regx;
      48'b000000000001000000000000000000000000000000000000: n1175_o = regx;
      48'b000000000000100000000000000000000000000000000000: n1175_o = regx;
      48'b000000000000010000000000000000000000000000000000: n1175_o = regx;
      48'b000000000000001000000000000000000000000000000000: n1175_o = regx;
      48'b000000000000000100000000000000000000000000000000: n1175_o = 8'b00000000;
      48'b000000000000000010000000000000000000000000000000: n1175_o = regx;
      48'b000000000000000001000000000000000000000000000000: n1175_o = n895_o;
      48'b000000000000000000100000000000000000000000000000: n1175_o = n881_o;
      48'b000000000000000000010000000000000000000000000000: n1175_o = n866_o;
      48'b000000000000000000001000000000000000000000000000: n1175_o = n850_o;
      48'b000000000000000000000100000000000000000000000000: n1175_o = n833_o;
      48'b000000000000000000000010000000000000000000000000: n1175_o = n818_o;
      48'b000000000000000000000001000000000000000000000000: n1175_o = n803_o;
      48'b000000000000000000000000100000000000000000000000: n1175_o = n788_o;
      48'b000000000000000000000000010000000000000000000000: n1175_o = n771_o;
      48'b000000000000000000000000001000000000000000000000: n1175_o = regx;
      48'b000000000000000000000000000100000000000000000000: n1175_o = regx;
      48'b000000000000000000000000000010000000000000000000: n1175_o = regx;
      48'b000000000000000000000000000001000000000000000000: n1175_o = regx;
      48'b000000000000000000000000000000100000000000000000: n1175_o = regx;
      48'b000000000000000000000000000000010000000000000000: n1175_o = regx;
      48'b000000000000000000000000000000001000000000000000: n1175_o = regx;
      48'b000000000000000000000000000000000100000000000000: n1175_o = regx;
      48'b000000000000000000000000000000000010000000000000: n1175_o = regx;
      48'b000000000000000000000000000000000001000000000000: n1175_o = regx;
      48'b000000000000000000000000000000000000100000000000: n1175_o = n630_o;
      48'b000000000000000000000000000000000000010000000000: n1175_o = regx;
      48'b000000000000000000000000000000000000001000000000: n1175_o = regx;
      48'b000000000000000000000000000000000000000100000000: n1175_o = regx;
      48'b000000000000000000000000000000000000000010000000: n1175_o = regx;
      48'b000000000000000000000000000000000000000001000000: n1175_o = regx;
      48'b000000000000000000000000000000000000000000100000: n1175_o = regx;
      48'b000000000000000000000000000000000000000000010000: n1175_o = regx;
      48'b000000000000000000000000000000000000000000001000: n1175_o = regx;
      48'b000000000000000000000000000000000000000000000100: n1175_o = regx;
      48'b000000000000000000000000000000000000000000000010: n1175_o = regx;
      48'b000000000000000000000000000000000000000000000001: n1175_o = regx;
      default: n1175_o = regx;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1177_o = regsp;
      48'b010000000000000000000000000000000000000000000000: n1177_o = regsp;
      48'b001000000000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000100000000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000010000000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000001000000000000000000000000000000000000000000: n1177_o = 16'b0000000011111111;
      48'b000000100000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000010000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000001000000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000100000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000010000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000001000000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000100000000000000000000000000000000000: n1177_o = n963_o;
      48'b000000000000010000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000001000000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000100000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000010000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000001000000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000100000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000010000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000001000000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000100000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000010000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000001000000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000100000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000010000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000001000000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000100000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000010000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000001000000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000100000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000010000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000001000000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000100000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000010000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000001000000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000100000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000010000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000001000000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000100000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000010000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000001000000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000100000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000010000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000001000: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000000100: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000000010: n1177_o = regsp;
      48'b000000000000000000000000000000000000000000000001: n1177_o = n120_o;
      default: n1177_o = regsp;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1178_o = n1163_o;
      48'b010000000000000000000000000000000000000000000000: n1178_o = n1154_o;
      48'b001000000000000000000000000000000000000000000000: n1178_o = n1142_o;
      48'b000100000000000000000000000000000000000000000000: n1178_o = n1136_o;
      48'b000010000000000000000000000000000000000000000000: n1178_o = n1006_o;
      48'b000001000000000000000000000000000000000000000000: n1178_o = n1002_o;
      48'b000000100000000000000000000000000000000000000000: n1178_o = n995_o;
      48'b000000010000000000000000000000000000000000000000: n1178_o = n987_o;
      48'b000000001000000000000000000000000000000000000000: n1178_o = n982_o;
      48'b000000000100000000000000000000000000000000000000: n1178_o = n978_o;
      48'b000000000010000000000000000000000000000000000000: n1178_o = n974_o;
      48'b000000000001000000000000000000000000000000000000: n1178_o = n970_o;
      48'b000000000000100000000000000000000000000000000000: n1178_o = regpc;
      48'b000000000000010000000000000000000000000000000000: n1178_o = n959_o;
      48'b000000000000001000000000000000000000000000000000: n1178_o = n925_o;
      48'b000000000000000100000000000000000000000000000000: n1178_o = n919_o;
      48'b000000000000000010000000000000000000000000000000: n1178_o = n915_o;
      48'b000000000000000001000000000000000000000000000000: n1178_o = n905_o;
      48'b000000000000000000100000000000000000000000000000: n1178_o = n891_o;
      48'b000000000000000000010000000000000000000000000000: n1178_o = n877_o;
      48'b000000000000000000001000000000000000000000000000: n1178_o = n862_o;
      48'b000000000000000000000100000000000000000000000000: n1178_o = n845_o;
      48'b000000000000000000000010000000000000000000000000: n1178_o = n828_o;
      48'b000000000000000000000001000000000000000000000000: n1178_o = n814_o;
      48'b000000000000000000000000100000000000000000000000: n1178_o = n798_o;
      48'b000000000000000000000000010000000000000000000000: n1178_o = n784_o;
      48'b000000000000000000000000001000000000000000000000: n1178_o = n767_o;
      48'b000000000000000000000000000100000000000000000000: n1178_o = n763_o;
      48'b000000000000000000000000000010000000000000000000: n1178_o = n753_o;
      48'b000000000000000000000000000001000000000000000000: n1178_o = n739_o;
      48'b000000000000000000000000000000100000000000000000: n1178_o = n725_o;
      48'b000000000000000000000000000000010000000000000000: n1178_o = n710_o;
      48'b000000000000000000000000000000001000000000000000: n1178_o = n693_o;
      48'b000000000000000000000000000000000100000000000000: n1178_o = n676_o;
      48'b000000000000000000000000000000000010000000000000: n1178_o = n662_o;
      48'b000000000000000000000000000000000001000000000000: n1178_o = n646_o;
      48'b000000000000000000000000000000000000100000000000: n1178_o = n632_o;
      48'b000000000000000000000000000000000000010000000000: n1178_o = n626_o;
      48'b000000000000000000000000000000000000001000000000: n1178_o = n609_o;
      48'b000000000000000000000000000000000000000100000000: n1178_o = n599_o;
      48'b000000000000000000000000000000000000000010000000: n1178_o = n589_o;
      48'b000000000000000000000000000000000000000001000000: n1178_o = n552_o;
      48'b000000000000000000000000000000000000000000100000: n1178_o = n506_o;
      48'b000000000000000000000000000000000000000000010000: n1178_o = n469_o;
      48'b000000000000000000000000000000000000000000001000: n1178_o = n438_o;
      48'b000000000000000000000000000000000000000000000100: n1178_o = n299_o;
      48'b000000000000000000000000000000000000000000000010: n1178_o = n124_o;
      48'b000000000000000000000000000000000000000000000001: n1178_o = regpc;
      default: n1178_o = regpc;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b010000000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b001000000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000100000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000010000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000001000000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000100000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000010000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000001000000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000100000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000010000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000001000000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000100000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000010000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000001000000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000100000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000010000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000001000000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000100000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000010000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000001000000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000100000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000010000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000001000000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000100000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000010000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000001000000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000100000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000010000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000001000000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000100000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000010000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000001000000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000100000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000010000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000001000000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000100000000000: n1180_o = 1'b0;
      48'b000000000000000000000000000000000000010000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000001000000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000100000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000010000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000001000000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000100000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000010000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000001000: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000000100: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000000010: n1180_o = flagh;
      48'b000000000000000000000000000000000000000000000001: n1180_o = flagh;
      default: n1180_o = flagh;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b010000000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b001000000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000100000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000010000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000001000000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000100000000000000000000000000000000000000000: n1181_o = n993_o;
      48'b000000010000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000001000000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000100000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000010000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000001000000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000100000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000010000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000001000000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000100000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000010000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000001000000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000100000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000010000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000001000000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000100000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000010000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000001000000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000100000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000010000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000001000000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000100000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000010000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000001000000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000100000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000010000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000001000000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000100000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000010000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000001000000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000100000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000010000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000001000000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000100000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000010000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000001000000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000100000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000010000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000001000: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000000100: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000000010: n1181_o = flagi;
      48'b000000000000000000000000000000000000000000000001: n1181_o = flagi;
      default: n1181_o = flagi;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b010000000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b001000000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000100000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000010000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000001000000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000100000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000010000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000001000000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000100000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000010000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000001000000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000000100000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000000010000000000000000000000000000000000: n1187_o = 1'b0;
      48'b000000000000001000000000000000000000000000000000: n1187_o = flagn;
      48'b000000000000000100000000000000000000000000000000: n1187_o = 1'b0;
      48'b000000000000000010000000000000000000000000000000: n1187_o = n908_o;
      48'b000000000000000001000000000000000000000000000000: n1187_o = n898_o;
      48'b000000000000000000100000000000000000000000000000: n1187_o = n884_o;
      48'b000000000000000000010000000000000000000000000000: n1187_o = n869_o;
      48'b000000000000000000001000000000000000000000000000: n1187_o = n854_o;
      48'b000000000000000000000100000000000000000000000000: n1187_o = n837_o;
      48'b000000000000000000000010000000000000000000000000: n1187_o = flagc;
      48'b000000000000000000000001000000000000000000000000: n1187_o = 1'b0;
      48'b000000000000000000000000100000000000000000000000: n1187_o = n791_o;
      48'b000000000000000000000000010000000000000000000000: n1187_o = n774_o;
      48'b000000000000000000000000001000000000000000000000: n1187_o = 1'b0;
      48'b000000000000000000000000000100000000000000000000: n1187_o = n756_o;
      48'b000000000000000000000000000010000000000000000000: n1187_o = n746_o;
      48'b000000000000000000000000000001000000000000000000: n1187_o = n732_o;
      48'b000000000000000000000000000000100000000000000000: n1187_o = n717_o;
      48'b000000000000000000000000000000010000000000000000: n1187_o = n702_o;
      48'b000000000000000000000000000000001000000000000000: n1187_o = n685_o;
      48'b000000000000000000000000000000000100000000000000: n1187_o = flagc;
      48'b000000000000000000000000000000000010000000000000: n1187_o = 1'b0;
      48'b000000000000000000000000000000000001000000000000: n1187_o = n639_o;
      48'b000000000000000000000000000000000000100000000000: n1187_o = flagn;
      48'b000000000000000000000000000000000000010000000000: n1187_o = n616_o;
      48'b000000000000000000000000000000000000001000000000: n1187_o = n602_o;
      48'b000000000000000000000000000000000000000100000000: n1187_o = n592_o;
      48'b000000000000000000000000000000000000000010000000: n1187_o = flagn;
      48'b000000000000000000000000000000000000000001000000: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000100000: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000010000: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000001000: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000000100: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000000010: n1187_o = flagn;
      48'b000000000000000000000000000000000000000000000001: n1187_o = flagn;
      default: n1187_o = flagn;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b010000000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b001000000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000100000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000010000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000001000000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000100000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000010000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000001000000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000100000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000010000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000001000000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000000100000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000000010000000000000000000000000000000000: n1191_o = 1'b1;
      48'b000000000000001000000000000000000000000000000000: n1191_o = flagz;
      48'b000000000000000100000000000000000000000000000000: n1191_o = 1'b1;
      48'b000000000000000010000000000000000000000000000000: n1191_o = n913_o;
      48'b000000000000000001000000000000000000000000000000: n1191_o = n903_o;
      48'b000000000000000000100000000000000000000000000000: n1191_o = n889_o;
      48'b000000000000000000010000000000000000000000000000: n1191_o = n875_o;
      48'b000000000000000000001000000000000000000000000000: n1191_o = n860_o;
      48'b000000000000000000000100000000000000000000000000: n1191_o = n843_o;
      48'b000000000000000000000010000000000000000000000000: n1191_o = n826_o;
      48'b000000000000000000000001000000000000000000000000: n1191_o = n812_o;
      48'b000000000000000000000000100000000000000000000000: n1191_o = n796_o;
      48'b000000000000000000000000010000000000000000000000: n1191_o = n779_o;
      48'b000000000000000000000000001000000000000000000000: n1191_o = 1'b1;
      48'b000000000000000000000000000100000000000000000000: n1191_o = n761_o;
      48'b000000000000000000000000000010000000000000000000: n1191_o = n751_o;
      48'b000000000000000000000000000001000000000000000000: n1191_o = n737_o;
      48'b000000000000000000000000000000100000000000000000: n1191_o = n723_o;
      48'b000000000000000000000000000000010000000000000000: n1191_o = n708_o;
      48'b000000000000000000000000000000001000000000000000: n1191_o = n691_o;
      48'b000000000000000000000000000000000100000000000000: n1191_o = n674_o;
      48'b000000000000000000000000000000000010000000000000: n1191_o = n660_o;
      48'b000000000000000000000000000000000001000000000000: n1191_o = n644_o;
      48'b000000000000000000000000000000000000100000000000: n1191_o = flagz;
      48'b000000000000000000000000000000000000010000000000: n1191_o = n621_o;
      48'b000000000000000000000000000000000000001000000000: n1191_o = n607_o;
      48'b000000000000000000000000000000000000000100000000: n1191_o = n597_o;
      48'b000000000000000000000000000000000000000010000000: n1191_o = flagz;
      48'b000000000000000000000000000000000000000001000000: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000100000: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000010000: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000001000: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000000100: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000000010: n1191_o = flagz;
      48'b000000000000000000000000000000000000000000000001: n1191_o = flagz;
      default: n1191_o = flagz;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b010000000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b001000000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000100000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000010000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000001000000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000100000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000010000000000000000000000000000000000000000: n1195_o = n985_o;
      48'b000000001000000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000100000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000010000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000001000000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000100000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000010000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000001000000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000000100000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000000010000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000000001000000000000000000000000000000: n1195_o = flagc;
      48'b000000000000000000100000000000000000000000000000: n1195_o = flagc;
      48'b000000000000000000010000000000000000000000000000: n1195_o = n870_o;
      48'b000000000000000000001000000000000000000000000000: n1195_o = n855_o;
      48'b000000000000000000000100000000000000000000000000: n1195_o = n838_o;
      48'b000000000000000000000010000000000000000000000000: n1195_o = n821_o;
      48'b000000000000000000000001000000000000000000000000: n1195_o = n807_o;
      48'b000000000000000000000000100000000000000000000000: n1195_o = 1'b1;
      48'b000000000000000000000000010000000000000000000000: n1195_o = n782_o;
      48'b000000000000000000000000001000000000000000000000: n1195_o = flagc;
      48'b000000000000000000000000000100000000000000000000: n1195_o = flagc;
      48'b000000000000000000000000000010000000000000000000: n1195_o = flagc;
      48'b000000000000000000000000000001000000000000000000: n1195_o = flagc;
      48'b000000000000000000000000000000100000000000000000: n1195_o = n718_o;
      48'b000000000000000000000000000000010000000000000000: n1195_o = n703_o;
      48'b000000000000000000000000000000001000000000000000: n1195_o = n686_o;
      48'b000000000000000000000000000000000100000000000000: n1195_o = n669_o;
      48'b000000000000000000000000000000000010000000000000: n1195_o = n655_o;
      48'b000000000000000000000000000000000001000000000000: n1195_o = 1'b1;
      48'b000000000000000000000000000000000000100000000000: n1195_o = 1'b0;
      48'b000000000000000000000000000000000000010000000000: n1195_o = n624_o;
      48'b000000000000000000000000000000000000001000000000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000100000000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000010000000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000001000000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000100000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000010000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000001000: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000000100: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000000010: n1195_o = flagc;
      48'b000000000000000000000000000000000000000000000001: n1195_o = flagc;
      default: n1195_o = flagc;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1197_o = help;
      48'b010000000000000000000000000000000000000000000000: n1197_o = help;
      48'b001000000000000000000000000000000000000000000000: n1197_o = help;
      48'b000100000000000000000000000000000000000000000000: n1197_o = help;
      48'b000010000000000000000000000000000000000000000000: n1197_o = help;
      48'b000001000000000000000000000000000000000000000000: n1197_o = help;
      48'b000000100000000000000000000000000000000000000000: n1197_o = help;
      48'b000000010000000000000000000000000000000000000000: n1197_o = help;
      48'b000000001000000000000000000000000000000000000000: n1197_o = help;
      48'b000000000100000000000000000000000000000000000000: n1197_o = help;
      48'b000000000010000000000000000000000000000000000000: n1197_o = help;
      48'b000000000001000000000000000000000000000000000000: n1197_o = help;
      48'b000000000000100000000000000000000000000000000000: n1197_o = help;
      48'b000000000000010000000000000000000000000000000000: n1197_o = 8'b00000000;
      48'b000000000000001000000000000000000000000000000000: n1197_o = help;
      48'b000000000000000100000000000000000000000000000000: n1197_o = help;
      48'b000000000000000010000000000000000000000000000000: n1197_o = help;
      48'b000000000000000001000000000000000000000000000000: n1197_o = help;
      48'b000000000000000000100000000000000000000000000000: n1197_o = help;
      48'b000000000000000000010000000000000000000000000000: n1197_o = help;
      48'b000000000000000000001000000000000000000000000000: n1197_o = help;
      48'b000000000000000000000100000000000000000000000000: n1197_o = help;
      48'b000000000000000000000010000000000000000000000000: n1197_o = help;
      48'b000000000000000000000001000000000000000000000000: n1197_o = help;
      48'b000000000000000000000000100000000000000000000000: n1197_o = help;
      48'b000000000000000000000000010000000000000000000000: n1197_o = help;
      48'b000000000000000000000000001000000000000000000000: n1197_o = help;
      48'b000000000000000000000000000100000000000000000000: n1197_o = help;
      48'b000000000000000000000000000010000000000000000000: n1197_o = help;
      48'b000000000000000000000000000001000000000000000000: n1197_o = help;
      48'b000000000000000000000000000000100000000000000000: n1197_o = help;
      48'b000000000000000000000000000000010000000000000000: n1197_o = help;
      48'b000000000000000000000000000000001000000000000000: n1197_o = help;
      48'b000000000000000000000000000000000100000000000000: n1197_o = help;
      48'b000000000000000000000000000000000010000000000000: n1197_o = help;
      48'b000000000000000000000000000000000001000000000000: n1197_o = help;
      48'b000000000000000000000000000000000000100000000000: n1197_o = help;
      48'b000000000000000000000000000000000000010000000000: n1197_o = help;
      48'b000000000000000000000000000000000000001000000000: n1197_o = help;
      48'b000000000000000000000000000000000000000100000000: n1197_o = help;
      48'b000000000000000000000000000000000000000010000000: n1197_o = help;
      48'b000000000000000000000000000000000000000001000000: n1197_o = help;
      48'b000000000000000000000000000000000000000000100000: n1197_o = help;
      48'b000000000000000000000000000000000000000000010000: n1197_o = help;
      48'b000000000000000000000000000000000000000000001000: n1197_o = help;
      48'b000000000000000000000000000000000000000000000100: n1197_o = help;
      48'b000000000000000000000000000000000000000000000010: n1197_o = help;
      48'b000000000000000000000000000000000000000000000001: n1197_o = help;
      default: n1197_o = help;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1199_o = n1161_o;
      48'b010000000000000000000000000000000000000000000000: n1199_o = n1152_o;
      48'b001000000000000000000000000000000000000000000000: n1199_o = n1140_o;
      48'b000100000000000000000000000000000000000000000000: n1199_o = temp;
      48'b000010000000000000000000000000000000000000000000: n1199_o = temp;
      48'b000001000000000000000000000000000000000000000000: n1199_o = temp;
      48'b000000100000000000000000000000000000000000000000: n1199_o = temp;
      48'b000000010000000000000000000000000000000000000000: n1199_o = temp;
      48'b000000001000000000000000000000000000000000000000: n1199_o = temp;
      48'b000000000100000000000000000000000000000000000000: n1199_o = temp;
      48'b000000000010000000000000000000000000000000000000: n1199_o = temp;
      48'b000000000001000000000000000000000000000000000000: n1199_o = temp;
      48'b000000000000100000000000000000000000000000000000: n1199_o = temp;
      48'b000000000000010000000000000000000000000000000000: n1199_o = temp;
      48'b000000000000001000000000000000000000000000000000: n1199_o = n923_o;
      48'b000000000000000100000000000000000000000000000000: n1199_o = temp;
      48'b000000000000000010000000000000000000000000000000: n1199_o = temp;
      48'b000000000000000001000000000000000000000000000000: n1199_o = temp;
      48'b000000000000000000100000000000000000000000000000: n1199_o = temp;
      48'b000000000000000000010000000000000000000000000000: n1199_o = temp;
      48'b000000000000000000001000000000000000000000000000: n1199_o = temp;
      48'b000000000000000000000100000000000000000000000000: n1199_o = temp;
      48'b000000000000000000000010000000000000000000000000: n1199_o = temp;
      48'b000000000000000000000001000000000000000000000000: n1199_o = temp;
      48'b000000000000000000000000100000000000000000000000: n1199_o = temp;
      48'b000000000000000000000000010000000000000000000000: n1199_o = temp;
      48'b000000000000000000000000001000000000000000000000: n1199_o = temp;
      48'b000000000000000000000000000100000000000000000000: n1199_o = temp;
      48'b000000000000000000000000000010000000000000000000: n1199_o = temp;
      48'b000000000000000000000000000001000000000000000000: n1199_o = temp;
      48'b000000000000000000000000000000100000000000000000: n1199_o = temp;
      48'b000000000000000000000000000000010000000000000000: n1199_o = temp;
      48'b000000000000000000000000000000001000000000000000: n1199_o = temp;
      48'b000000000000000000000000000000000100000000000000: n1199_o = temp;
      48'b000000000000000000000000000000000010000000000000: n1199_o = temp;
      48'b000000000000000000000000000000000001000000000000: n1199_o = temp;
      48'b000000000000000000000000000000000000100000000000: n1199_o = temp;
      48'b000000000000000000000000000000000000010000000000: n1199_o = temp;
      48'b000000000000000000000000000000000000001000000000: n1199_o = temp;
      48'b000000000000000000000000000000000000000100000000: n1199_o = temp;
      48'b000000000000000000000000000000000000000010000000: n1199_o = temp;
      48'b000000000000000000000000000000000000000001000000: n1199_o = temp;
      48'b000000000000000000000000000000000000000000100000: n1199_o = temp;
      48'b000000000000000000000000000000000000000000010000: n1199_o = temp;
      48'b000000000000000000000000000000000000000000001000: n1199_o = temp;
      48'b000000000000000000000000000000000000000000000100: n1199_o = temp;
      48'b000000000000000000000000000000000000000000000010: n1199_o = 16'b0000000000000000;
      48'b000000000000000000000000000000000000000000000001: n1199_o = temp;
      default: n1199_o = temp;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1249_o = 4'b0100;
      48'b010000000000000000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b001000000000000000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b000100000000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000010000000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000001000000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000100000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000010000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000001000000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000100000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000010000000000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000001000000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b000000000000100000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b000000000000010000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b000000000000001000000000000000000000000000000000: n1249_o = 4'b0011;
      48'b000000000000000100000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000010000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000001000000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000100000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000010000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000001000000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000100000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000010000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000001000000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000100000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000010000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000001000000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000100000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000010000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000001000000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000100000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000010000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000001000000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000100000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000010000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000001000000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000000100000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000000010000000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000000001000000000: n1249_o = 4'b0101;
      48'b000000000000000000000000000000000000000100000000: n1249_o = 4'b0101;
      48'b000000000000000000000000000000000000000010000000: n1249_o = 4'b0010;
      48'b000000000000000000000000000000000000000001000000: n1249_o = 4'b0101;
      48'b000000000000000000000000000000000000000000100000: n1249_o = 4'b0100;
      48'b000000000000000000000000000000000000000000010000: n1249_o = 4'b0101;
      48'b000000000000000000000000000000000000000000001000: n1249_o = 4'b0100;
      48'b000000000000000000000000000000000000000000000100: n1249_o = 4'b0011;
      48'b000000000000000000000000000000000000000000000010: n1249_o = 4'b0011;
      48'b000000000000000000000000000000000000000000000001: n1249_o = 4'b0011;
      default: n1249_o = 4'b0000;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1259_o = 3'b001;
      48'b010000000000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b001000000000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000100000000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000010000000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000001000000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000100000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000010000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000001000000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000100000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000010000000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000001000000000000000000000000000000000000: n1259_o = 3'b001;
      48'b000000000000100000000000000000000000000000000000: n1259_o = 3'b001;
      48'b000000000000010000000000000000000000000000000000: n1259_o = 3'b010;
      48'b000000000000001000000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000100000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000010000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000001000000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000100000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000010000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000001000000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000100000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000010000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000001000000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000100000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000010000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000001000000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000100000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000010000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000001000000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000100000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000010000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000001000000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000100000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000010000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000001000000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000100000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000010000000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000001000000000: n1259_o = 3'b010;
      48'b000000000000000000000000000000000000000100000000: n1259_o = 3'b010;
      48'b000000000000000000000000000000000000000010000000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000000001000000: n1259_o = 3'b010;
      48'b000000000000000000000000000000000000000000100000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000000000010000: n1259_o = addrmux;
      48'b000000000000000000000000000000000000000000001000: n1259_o = 3'b010;
      48'b000000000000000000000000000000000000000000000100: n1259_o = addrmux;
      48'b000000000000000000000000000000000000000000000010: n1259_o = addrmux;
      48'b000000000000000000000000000000000000000000000001: n1259_o = 3'b001;
      default: n1259_o = addrmux;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1264_o = 4'b0111;
      48'b010000000000000000000000000000000000000000000000: n1264_o = datamux;
      48'b001000000000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000100000000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000010000000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000001000000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000100000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000010000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000001000000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000100000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000010000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000001000000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000100000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000010000000000000000000000000000000000: n1264_o = 4'b1001;
      48'b000000000000001000000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000100000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000010000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000001000000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000100000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000010000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000001000000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000100000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000010000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000001000000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000100000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000010000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000001000000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000100000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000010000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000001000000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000100000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000010000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000001000000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000100000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000010000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000001000000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000000100000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000000010000000000: n1264_o = datamux;
      48'b000000000000000000000000000000000000001000000000: n1264_o = 4'b0010;
      48'b000000000000000000000000000000000000000100000000: n1264_o = 4'b0000;
      48'b000000000000000000000000000000000000000010000000: n1264_o = datamux;
      48'b000000000000000000000000000000000000000001000000: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000100000: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000010000: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000001000: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000000100: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000000010: n1264_o = datamux;
      48'b000000000000000000000000000000000000000000000001: n1264_o = datamux;
      default: n1264_o = datamux;
    endcase
  /* 6805.vhd:320:15  */
  always @*
    case (n1166_o)
      48'b100000000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b010000000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b001000000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000100000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000010000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000001000000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000100000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000010000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000001000000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000100000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000010000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000001000000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000100000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000010000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000001000000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000100000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000010000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000001000000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000100000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000010000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000001000000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000100000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000010000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000001000000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000100000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000010000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000001000000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000100000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000010000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000001000000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000100000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000010000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000001000000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000100000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000010000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000001000000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000100000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000010000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000001000000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000100000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000010000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000001000000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000100000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000010000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000001000: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000000100: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000000010: n1266_o = trace_i;
      48'b000000000000000000000000000000000000000000000001: n1266_o = 1'b1;
      default: n1266_o = trace_i;
    endcase
  /* 6805.vhd:314:13  */
  assign n1268_o = n118_o ? n3828_q : n1171_o;
  /* 6805.vhd:314:13  */
  assign n1269_o = n118_o ? rega : n1173_o;
  /* 6805.vhd:314:13  */
  assign n1270_o = n118_o ? regx : n1175_o;
  /* 6805.vhd:314:13  */
  assign n1271_o = n118_o ? regsp : n1177_o;
  /* 6805.vhd:314:13  */
  assign n1272_o = n118_o ? regpc : n1178_o;
  /* 6805.vhd:314:13  */
  assign n1273_o = n118_o ? flagh : n1180_o;
  /* 6805.vhd:314:13  */
  assign n1274_o = n118_o ? flagi : n1181_o;
  /* 6805.vhd:314:13  */
  assign n1275_o = n118_o ? flagn : n1187_o;
  /* 6805.vhd:314:13  */
  assign n1276_o = n118_o ? flagz : n1191_o;
  /* 6805.vhd:314:13  */
  assign n1277_o = n118_o ? flagc : n1195_o;
  /* 6805.vhd:314:13  */
  assign n1278_o = n118_o ? help : n1197_o;
  /* 6805.vhd:314:13  */
  assign n1279_o = n118_o ? temp : n1199_o;
  /* 6805.vhd:314:13  */
  assign n1281_o = n118_o ? 4'b0011 : n1249_o;
  /* 6805.vhd:314:13  */
  assign n1283_o = n118_o ? 3'b001 : n1259_o;
  /* 6805.vhd:314:13  */
  assign n1284_o = n118_o ? datamux : n1264_o;
  /* 6805.vhd:314:13  */
  assign n1286_o = n118_o ? 8'b10000011 : datain;
  /* 6805.vhd:314:13  */
  assign n1287_o = n118_o ? trace_i : n1266_o;
  /* 6805.vhd:309:13  */
  assign n1289_o = trace ? n3828_q : n1268_o;
  /* 6805.vhd:309:13  */
  assign n1290_o = trace ? rega : n1269_o;
  /* 6805.vhd:309:13  */
  assign n1291_o = trace ? regx : n1270_o;
  /* 6805.vhd:309:13  */
  assign n1292_o = trace ? regsp : n1271_o;
  /* 6805.vhd:309:13  */
  assign n1293_o = trace ? regpc : n1272_o;
  /* 6805.vhd:309:13  */
  assign n1294_o = trace ? flagh : n1273_o;
  /* 6805.vhd:309:13  */
  assign n1295_o = trace ? flagi : n1274_o;
  /* 6805.vhd:309:13  */
  assign n1296_o = trace ? flagn : n1275_o;
  /* 6805.vhd:309:13  */
  assign n1297_o = trace ? flagz : n1276_o;
  /* 6805.vhd:309:13  */
  assign n1298_o = trace ? flagc : n1277_o;
  /* 6805.vhd:309:13  */
  assign n1299_o = trace ? help : n1278_o;
  /* 6805.vhd:309:13  */
  assign n1300_o = trace ? temp : n1279_o;
  /* 6805.vhd:309:13  */
  assign n1302_o = trace ? 4'b0011 : n1281_o;
  /* 6805.vhd:309:13  */
  assign n1304_o = trace ? 3'b001 : n1283_o;
  /* 6805.vhd:309:13  */
  assign n1305_o = trace ? datamux : n1284_o;
  /* 6805.vhd:309:13  */
  assign n1307_o = trace ? 8'b10000011 : n1286_o;
  /* 6805.vhd:309:13  */
  assign n1308_o = trace ? trace_i : n1287_o;
  /* 6805.vhd:309:13  */
  assign n1309_o = trace ? datain : traceopcode;
  /* 6805.vhd:307:11  */
  assign n1312_o = mainfsm == 4'b0010;
  /* 6805.vhd:747:32  */
  assign n1314_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:738:15  */
  assign n1316_o = opcode == 8'b00000000;
  /* 6805.vhd:738:26  */
  assign n1318_o = opcode == 8'b00000010;
  /* 6805.vhd:738:26  */
  assign n1319_o = n1316_o | n1318_o;
  /* 6805.vhd:738:34  */
  assign n1321_o = opcode == 8'b00000100;
  /* 6805.vhd:738:34  */
  assign n1322_o = n1319_o | n1321_o;
  /* 6805.vhd:738:42  */
  assign n1324_o = opcode == 8'b00000110;
  /* 6805.vhd:738:42  */
  assign n1325_o = n1322_o | n1324_o;
  /* 6805.vhd:738:50  */
  assign n1327_o = opcode == 8'b00001000;
  /* 6805.vhd:738:50  */
  assign n1328_o = n1325_o | n1327_o;
  /* 6805.vhd:738:58  */
  assign n1330_o = opcode == 8'b00001010;
  /* 6805.vhd:738:58  */
  assign n1331_o = n1328_o | n1330_o;
  /* 6805.vhd:738:66  */
  assign n1333_o = opcode == 8'b00001100;
  /* 6805.vhd:738:66  */
  assign n1334_o = n1331_o | n1333_o;
  /* 6805.vhd:738:74  */
  assign n1336_o = opcode == 8'b00001110;
  /* 6805.vhd:738:74  */
  assign n1337_o = n1334_o | n1336_o;
  /* 6805.vhd:738:82  */
  assign n1339_o = opcode == 8'b00000001;
  /* 6805.vhd:738:82  */
  assign n1340_o = n1337_o | n1339_o;
  /* 6805.vhd:739:26  */
  assign n1342_o = opcode == 8'b00000011;
  /* 6805.vhd:739:26  */
  assign n1343_o = n1340_o | n1342_o;
  /* 6805.vhd:739:34  */
  assign n1345_o = opcode == 8'b00000101;
  /* 6805.vhd:739:34  */
  assign n1346_o = n1343_o | n1345_o;
  /* 6805.vhd:739:42  */
  assign n1348_o = opcode == 8'b00000111;
  /* 6805.vhd:739:42  */
  assign n1349_o = n1346_o | n1348_o;
  /* 6805.vhd:739:50  */
  assign n1351_o = opcode == 8'b00001001;
  /* 6805.vhd:739:50  */
  assign n1352_o = n1349_o | n1351_o;
  /* 6805.vhd:739:58  */
  assign n1354_o = opcode == 8'b00001011;
  /* 6805.vhd:739:58  */
  assign n1355_o = n1352_o | n1354_o;
  /* 6805.vhd:739:66  */
  assign n1357_o = opcode == 8'b00001101;
  /* 6805.vhd:739:66  */
  assign n1358_o = n1355_o | n1357_o;
  /* 6805.vhd:739:74  */
  assign n1360_o = opcode == 8'b00001111;
  /* 6805.vhd:739:74  */
  assign n1361_o = n1358_o | n1360_o;
  /* 6805.vhd:739:82  */
  assign n1363_o = opcode == 8'b00010000;
  /* 6805.vhd:739:82  */
  assign n1364_o = n1361_o | n1363_o;
  /* 6805.vhd:740:26  */
  assign n1366_o = opcode == 8'b00010010;
  /* 6805.vhd:740:26  */
  assign n1367_o = n1364_o | n1366_o;
  /* 6805.vhd:740:34  */
  assign n1369_o = opcode == 8'b00010100;
  /* 6805.vhd:740:34  */
  assign n1370_o = n1367_o | n1369_o;
  /* 6805.vhd:740:42  */
  assign n1372_o = opcode == 8'b00010110;
  /* 6805.vhd:740:42  */
  assign n1373_o = n1370_o | n1372_o;
  /* 6805.vhd:740:50  */
  assign n1375_o = opcode == 8'b00011000;
  /* 6805.vhd:740:50  */
  assign n1376_o = n1373_o | n1375_o;
  /* 6805.vhd:740:58  */
  assign n1378_o = opcode == 8'b00011010;
  /* 6805.vhd:740:58  */
  assign n1379_o = n1376_o | n1378_o;
  /* 6805.vhd:740:66  */
  assign n1381_o = opcode == 8'b00011100;
  /* 6805.vhd:740:66  */
  assign n1382_o = n1379_o | n1381_o;
  /* 6805.vhd:740:74  */
  assign n1384_o = opcode == 8'b00011110;
  /* 6805.vhd:740:74  */
  assign n1385_o = n1382_o | n1384_o;
  /* 6805.vhd:740:82  */
  assign n1387_o = opcode == 8'b00010001;
  /* 6805.vhd:740:82  */
  assign n1388_o = n1385_o | n1387_o;
  /* 6805.vhd:741:26  */
  assign n1390_o = opcode == 8'b00010011;
  /* 6805.vhd:741:26  */
  assign n1391_o = n1388_o | n1390_o;
  /* 6805.vhd:741:34  */
  assign n1393_o = opcode == 8'b00010101;
  /* 6805.vhd:741:34  */
  assign n1394_o = n1391_o | n1393_o;
  /* 6805.vhd:741:42  */
  assign n1396_o = opcode == 8'b00010111;
  /* 6805.vhd:741:42  */
  assign n1397_o = n1394_o | n1396_o;
  /* 6805.vhd:741:50  */
  assign n1399_o = opcode == 8'b00011001;
  /* 6805.vhd:741:50  */
  assign n1400_o = n1397_o | n1399_o;
  /* 6805.vhd:741:58  */
  assign n1402_o = opcode == 8'b00011011;
  /* 6805.vhd:741:58  */
  assign n1403_o = n1400_o | n1402_o;
  /* 6805.vhd:741:66  */
  assign n1405_o = opcode == 8'b00011101;
  /* 6805.vhd:741:66  */
  assign n1406_o = n1403_o | n1405_o;
  /* 6805.vhd:741:74  */
  assign n1408_o = opcode == 8'b00011111;
  /* 6805.vhd:741:74  */
  assign n1409_o = n1406_o | n1408_o;
  /* 6805.vhd:741:82  */
  assign n1411_o = opcode == 8'b00110000;
  /* 6805.vhd:741:82  */
  assign n1412_o = n1409_o | n1411_o;
  /* 6805.vhd:742:26  */
  assign n1414_o = opcode == 8'b00110011;
  /* 6805.vhd:742:26  */
  assign n1415_o = n1412_o | n1414_o;
  /* 6805.vhd:742:34  */
  assign n1417_o = opcode == 8'b00110100;
  /* 6805.vhd:742:34  */
  assign n1418_o = n1415_o | n1417_o;
  /* 6805.vhd:742:42  */
  assign n1420_o = opcode == 8'b00110110;
  /* 6805.vhd:742:42  */
  assign n1421_o = n1418_o | n1420_o;
  /* 6805.vhd:742:50  */
  assign n1423_o = opcode == 8'b00110111;
  /* 6805.vhd:742:50  */
  assign n1424_o = n1421_o | n1423_o;
  /* 6805.vhd:743:26  */
  assign n1426_o = opcode == 8'b00111000;
  /* 6805.vhd:743:26  */
  assign n1427_o = n1424_o | n1426_o;
  /* 6805.vhd:743:34  */
  assign n1429_o = opcode == 8'b00111001;
  /* 6805.vhd:743:34  */
  assign n1430_o = n1427_o | n1429_o;
  /* 6805.vhd:743:42  */
  assign n1432_o = opcode == 8'b00111010;
  /* 6805.vhd:743:42  */
  assign n1433_o = n1430_o | n1432_o;
  /* 6805.vhd:743:50  */
  assign n1435_o = opcode == 8'b00111100;
  /* 6805.vhd:743:50  */
  assign n1436_o = n1433_o | n1435_o;
  /* 6805.vhd:743:58  */
  assign n1438_o = opcode == 8'b00111101;
  /* 6805.vhd:743:58  */
  assign n1439_o = n1436_o | n1438_o;
  /* 6805.vhd:758:32  */
  assign n1441_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:749:15  */
  assign n1443_o = opcode == 8'b11000000;
  /* 6805.vhd:749:26  */
  assign n1445_o = opcode == 8'b11000001;
  /* 6805.vhd:749:26  */
  assign n1446_o = n1443_o | n1445_o;
  /* 6805.vhd:749:34  */
  assign n1448_o = opcode == 8'b11000010;
  /* 6805.vhd:749:34  */
  assign n1449_o = n1446_o | n1448_o;
  /* 6805.vhd:749:42  */
  assign n1451_o = opcode == 8'b11000011;
  /* 6805.vhd:749:42  */
  assign n1452_o = n1449_o | n1451_o;
  /* 6805.vhd:749:50  */
  assign n1454_o = opcode == 8'b11000100;
  /* 6805.vhd:749:50  */
  assign n1455_o = n1452_o | n1454_o;
  /* 6805.vhd:750:26  */
  assign n1457_o = opcode == 8'b11000101;
  /* 6805.vhd:750:26  */
  assign n1458_o = n1455_o | n1457_o;
  /* 6805.vhd:750:34  */
  assign n1460_o = opcode == 8'b11000110;
  /* 6805.vhd:750:34  */
  assign n1461_o = n1458_o | n1460_o;
  /* 6805.vhd:750:42  */
  assign n1463_o = opcode == 8'b11000111;
  /* 6805.vhd:750:42  */
  assign n1464_o = n1461_o | n1463_o;
  /* 6805.vhd:750:50  */
  assign n1466_o = opcode == 8'b11001000;
  /* 6805.vhd:750:50  */
  assign n1467_o = n1464_o | n1466_o;
  /* 6805.vhd:751:26  */
  assign n1469_o = opcode == 8'b11001001;
  /* 6805.vhd:751:26  */
  assign n1470_o = n1467_o | n1469_o;
  /* 6805.vhd:751:34  */
  assign n1472_o = opcode == 8'b11001010;
  /* 6805.vhd:751:34  */
  assign n1473_o = n1470_o | n1472_o;
  /* 6805.vhd:751:42  */
  assign n1475_o = opcode == 8'b11001011;
  /* 6805.vhd:751:42  */
  assign n1476_o = n1473_o | n1475_o;
  /* 6805.vhd:751:50  */
  assign n1478_o = opcode == 8'b11001100;
  /* 6805.vhd:751:50  */
  assign n1479_o = n1476_o | n1478_o;
  /* 6805.vhd:752:26  */
  assign n1481_o = opcode == 8'b11001110;
  /* 6805.vhd:752:26  */
  assign n1482_o = n1479_o | n1481_o;
  /* 6805.vhd:752:34  */
  assign n1484_o = opcode == 8'b11001111;
  /* 6805.vhd:752:34  */
  assign n1485_o = n1482_o | n1484_o;
  /* 6805.vhd:752:42  */
  assign n1487_o = opcode == 8'b11010000;
  /* 6805.vhd:752:42  */
  assign n1488_o = n1485_o | n1487_o;
  /* 6805.vhd:753:26  */
  assign n1490_o = opcode == 8'b11010001;
  /* 6805.vhd:753:26  */
  assign n1491_o = n1488_o | n1490_o;
  /* 6805.vhd:753:34  */
  assign n1493_o = opcode == 8'b11010010;
  /* 6805.vhd:753:34  */
  assign n1494_o = n1491_o | n1493_o;
  /* 6805.vhd:753:42  */
  assign n1496_o = opcode == 8'b11010011;
  /* 6805.vhd:753:42  */
  assign n1497_o = n1494_o | n1496_o;
  /* 6805.vhd:753:50  */
  assign n1499_o = opcode == 8'b11010100;
  /* 6805.vhd:753:50  */
  assign n1500_o = n1497_o | n1499_o;
  /* 6805.vhd:754:26  */
  assign n1502_o = opcode == 8'b11010101;
  /* 6805.vhd:754:26  */
  assign n1503_o = n1500_o | n1502_o;
  /* 6805.vhd:754:34  */
  assign n1505_o = opcode == 8'b11010110;
  /* 6805.vhd:754:34  */
  assign n1506_o = n1503_o | n1505_o;
  /* 6805.vhd:754:42  */
  assign n1508_o = opcode == 8'b11010111;
  /* 6805.vhd:754:42  */
  assign n1509_o = n1506_o | n1508_o;
  /* 6805.vhd:754:50  */
  assign n1511_o = opcode == 8'b11011000;
  /* 6805.vhd:754:50  */
  assign n1512_o = n1509_o | n1511_o;
  /* 6805.vhd:755:26  */
  assign n1514_o = opcode == 8'b11011001;
  /* 6805.vhd:755:26  */
  assign n1515_o = n1512_o | n1514_o;
  /* 6805.vhd:755:34  */
  assign n1517_o = opcode == 8'b11011010;
  /* 6805.vhd:755:34  */
  assign n1518_o = n1515_o | n1517_o;
  /* 6805.vhd:755:42  */
  assign n1520_o = opcode == 8'b11011011;
  /* 6805.vhd:755:42  */
  assign n1521_o = n1518_o | n1520_o;
  /* 6805.vhd:755:50  */
  assign n1523_o = opcode == 8'b11011100;
  /* 6805.vhd:755:50  */
  assign n1524_o = n1521_o | n1523_o;
  /* 6805.vhd:756:26  */
  assign n1526_o = opcode == 8'b11011110;
  /* 6805.vhd:756:26  */
  assign n1527_o = n1524_o | n1526_o;
  /* 6805.vhd:756:34  */
  assign n1529_o = opcode == 8'b11011111;
  /* 6805.vhd:756:34  */
  assign n1530_o = n1527_o | n1529_o;
  /* 6805.vhd:765:32  */
  assign n1532_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:760:15  */
  assign n1534_o = opcode == 8'b10110111;
  /* 6805.vhd:772:32  */
  assign n1536_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:767:15  */
  assign n1538_o = opcode == 8'b10111111;
  /* 6805.vhd:780:32  */
  assign n1540_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:774:15  */
  assign n1542_o = opcode == 8'b10110000;
  /* 6805.vhd:774:26  */
  assign n1544_o = opcode == 8'b10110001;
  /* 6805.vhd:774:26  */
  assign n1545_o = n1542_o | n1544_o;
  /* 6805.vhd:774:34  */
  assign n1547_o = opcode == 8'b10110010;
  /* 6805.vhd:774:34  */
  assign n1548_o = n1545_o | n1547_o;
  /* 6805.vhd:774:42  */
  assign n1550_o = opcode == 8'b10110011;
  /* 6805.vhd:774:42  */
  assign n1551_o = n1548_o | n1550_o;
  /* 6805.vhd:774:50  */
  assign n1553_o = opcode == 8'b10110100;
  /* 6805.vhd:774:50  */
  assign n1554_o = n1551_o | n1553_o;
  /* 6805.vhd:775:26  */
  assign n1556_o = opcode == 8'b10110101;
  /* 6805.vhd:775:26  */
  assign n1557_o = n1554_o | n1556_o;
  /* 6805.vhd:775:34  */
  assign n1559_o = opcode == 8'b10110110;
  /* 6805.vhd:775:34  */
  assign n1560_o = n1557_o | n1559_o;
  /* 6805.vhd:775:42  */
  assign n1562_o = opcode == 8'b10111000;
  /* 6805.vhd:775:42  */
  assign n1563_o = n1560_o | n1562_o;
  /* 6805.vhd:776:26  */
  assign n1565_o = opcode == 8'b10111001;
  /* 6805.vhd:776:26  */
  assign n1566_o = n1563_o | n1565_o;
  /* 6805.vhd:776:34  */
  assign n1568_o = opcode == 8'b10111010;
  /* 6805.vhd:776:34  */
  assign n1569_o = n1566_o | n1568_o;
  /* 6805.vhd:776:42  */
  assign n1571_o = opcode == 8'b10111011;
  /* 6805.vhd:776:42  */
  assign n1572_o = n1569_o | n1571_o;
  /* 6805.vhd:776:50  */
  assign n1574_o = opcode == 8'b10111110;
  /* 6805.vhd:776:50  */
  assign n1575_o = n1572_o | n1574_o;
  /* 6805.vhd:784:26  */
  assign n1576_o = datain[7];
  /* 6805.vhd:784:30  */
  assign n1577_o = ~n1576_o;
  /* 6805.vhd:785:43  */
  assign n1579_o = {8'b00000000, datain};
  /* 6805.vhd:785:34  */
  assign n1580_o = regpc + n1579_o;
  /* 6805.vhd:785:53  */
  assign n1582_o = n1580_o + 16'b0000000000000001;
  /* 6805.vhd:787:43  */
  assign n1584_o = {8'b11111111, datain};
  /* 6805.vhd:787:34  */
  assign n1585_o = regpc + n1584_o;
  /* 6805.vhd:787:53  */
  assign n1587_o = n1585_o + 16'b0000000000000001;
  /* 6805.vhd:784:17  */
  assign n1588_o = n1577_o ? n1582_o : n1587_o;
  /* 6805.vhd:783:15  */
  assign n1590_o = opcode == 8'b00100000;
  /* 6805.vhd:791:32  */
  assign n1592_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:790:15  */
  assign n1594_o = opcode == 8'b00100001;
  /* 6805.vhd:794:27  */
  assign n1595_o = flagc | flagz;
  /* 6805.vhd:794:45  */
  assign n1596_o = opcode[0];
  /* 6805.vhd:794:37  */
  assign n1597_o = n1595_o == n1596_o;
  /* 6805.vhd:795:28  */
  assign n1598_o = datain[7];
  /* 6805.vhd:795:32  */
  assign n1599_o = ~n1598_o;
  /* 6805.vhd:796:45  */
  assign n1601_o = {8'b00000000, datain};
  /* 6805.vhd:796:36  */
  assign n1602_o = regpc + n1601_o;
  /* 6805.vhd:796:55  */
  assign n1604_o = n1602_o + 16'b0000000000000001;
  /* 6805.vhd:798:45  */
  assign n1606_o = {8'b11111111, datain};
  /* 6805.vhd:798:36  */
  assign n1607_o = regpc + n1606_o;
  /* 6805.vhd:798:55  */
  assign n1609_o = n1607_o + 16'b0000000000000001;
  /* 6805.vhd:795:19  */
  assign n1610_o = n1599_o ? n1604_o : n1609_o;
  /* 6805.vhd:801:34  */
  assign n1612_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:794:17  */
  assign n1613_o = n1597_o ? n1610_o : n1612_o;
  /* 6805.vhd:793:15  */
  assign n1615_o = opcode == 8'b00100010;
  /* 6805.vhd:793:26  */
  assign n1617_o = opcode == 8'b00100011;
  /* 6805.vhd:793:26  */
  assign n1618_o = n1615_o | n1617_o;
  /* 6805.vhd:805:35  */
  assign n1619_o = opcode[0];
  /* 6805.vhd:805:27  */
  assign n1620_o = flagc == n1619_o;
  /* 6805.vhd:806:28  */
  assign n1621_o = datain[7];
  /* 6805.vhd:806:32  */
  assign n1622_o = ~n1621_o;
  /* 6805.vhd:807:45  */
  assign n1624_o = {8'b00000000, datain};
  /* 6805.vhd:807:36  */
  assign n1625_o = regpc + n1624_o;
  /* 6805.vhd:807:55  */
  assign n1627_o = n1625_o + 16'b0000000000000001;
  /* 6805.vhd:809:45  */
  assign n1629_o = {8'b11111111, datain};
  /* 6805.vhd:809:36  */
  assign n1630_o = regpc + n1629_o;
  /* 6805.vhd:809:55  */
  assign n1632_o = n1630_o + 16'b0000000000000001;
  /* 6805.vhd:806:19  */
  assign n1633_o = n1622_o ? n1627_o : n1632_o;
  /* 6805.vhd:812:34  */
  assign n1635_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:805:17  */
  assign n1636_o = n1620_o ? n1633_o : n1635_o;
  /* 6805.vhd:804:15  */
  assign n1638_o = opcode == 8'b00100100;
  /* 6805.vhd:804:26  */
  assign n1640_o = opcode == 8'b00100101;
  /* 6805.vhd:804:26  */
  assign n1641_o = n1638_o | n1640_o;
  /* 6805.vhd:816:35  */
  assign n1642_o = opcode[0];
  /* 6805.vhd:816:27  */
  assign n1643_o = flagz == n1642_o;
  /* 6805.vhd:817:28  */
  assign n1644_o = datain[7];
  /* 6805.vhd:817:32  */
  assign n1645_o = ~n1644_o;
  /* 6805.vhd:818:45  */
  assign n1647_o = {8'b00000000, datain};
  /* 6805.vhd:818:36  */
  assign n1648_o = regpc + n1647_o;
  /* 6805.vhd:818:55  */
  assign n1650_o = n1648_o + 16'b0000000000000001;
  /* 6805.vhd:820:45  */
  assign n1652_o = {8'b11111111, datain};
  /* 6805.vhd:820:36  */
  assign n1653_o = regpc + n1652_o;
  /* 6805.vhd:820:55  */
  assign n1655_o = n1653_o + 16'b0000000000000001;
  /* 6805.vhd:817:19  */
  assign n1656_o = n1645_o ? n1650_o : n1655_o;
  /* 6805.vhd:823:34  */
  assign n1658_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:816:17  */
  assign n1659_o = n1643_o ? n1656_o : n1658_o;
  /* 6805.vhd:815:15  */
  assign n1661_o = opcode == 8'b00100110;
  /* 6805.vhd:815:26  */
  assign n1663_o = opcode == 8'b00100111;
  /* 6805.vhd:815:26  */
  assign n1664_o = n1661_o | n1663_o;
  /* 6805.vhd:827:35  */
  assign n1665_o = opcode[0];
  /* 6805.vhd:827:27  */
  assign n1666_o = flagh == n1665_o;
  /* 6805.vhd:828:28  */
  assign n1667_o = datain[7];
  /* 6805.vhd:828:32  */
  assign n1668_o = ~n1667_o;
  /* 6805.vhd:829:45  */
  assign n1670_o = {8'b00000000, datain};
  /* 6805.vhd:829:36  */
  assign n1671_o = regpc + n1670_o;
  /* 6805.vhd:829:55  */
  assign n1673_o = n1671_o + 16'b0000000000000001;
  /* 6805.vhd:831:45  */
  assign n1675_o = {8'b11111111, datain};
  /* 6805.vhd:831:36  */
  assign n1676_o = regpc + n1675_o;
  /* 6805.vhd:831:55  */
  assign n1678_o = n1676_o + 16'b0000000000000001;
  /* 6805.vhd:828:19  */
  assign n1679_o = n1668_o ? n1673_o : n1678_o;
  /* 6805.vhd:834:34  */
  assign n1681_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:827:17  */
  assign n1682_o = n1666_o ? n1679_o : n1681_o;
  /* 6805.vhd:826:15  */
  assign n1684_o = opcode == 8'b00101000;
  /* 6805.vhd:826:26  */
  assign n1686_o = opcode == 8'b00101001;
  /* 6805.vhd:826:26  */
  assign n1687_o = n1684_o | n1686_o;
  /* 6805.vhd:838:35  */
  assign n1688_o = opcode[0];
  /* 6805.vhd:838:27  */
  assign n1689_o = flagn == n1688_o;
  /* 6805.vhd:839:28  */
  assign n1690_o = datain[7];
  /* 6805.vhd:839:32  */
  assign n1691_o = ~n1690_o;
  /* 6805.vhd:840:45  */
  assign n1693_o = {8'b00000000, datain};
  /* 6805.vhd:840:36  */
  assign n1694_o = regpc + n1693_o;
  /* 6805.vhd:840:55  */
  assign n1696_o = n1694_o + 16'b0000000000000001;
  /* 6805.vhd:842:45  */
  assign n1698_o = {8'b11111111, datain};
  /* 6805.vhd:842:36  */
  assign n1699_o = regpc + n1698_o;
  /* 6805.vhd:842:55  */
  assign n1701_o = n1699_o + 16'b0000000000000001;
  /* 6805.vhd:839:19  */
  assign n1702_o = n1691_o ? n1696_o : n1701_o;
  /* 6805.vhd:845:34  */
  assign n1704_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:838:17  */
  assign n1705_o = n1689_o ? n1702_o : n1704_o;
  /* 6805.vhd:837:15  */
  assign n1707_o = opcode == 8'b00101010;
  /* 6805.vhd:837:26  */
  assign n1709_o = opcode == 8'b00101011;
  /* 6805.vhd:837:26  */
  assign n1710_o = n1707_o | n1709_o;
  /* 6805.vhd:849:35  */
  assign n1711_o = opcode[0];
  /* 6805.vhd:849:27  */
  assign n1712_o = flagi == n1711_o;
  /* 6805.vhd:850:28  */
  assign n1713_o = datain[7];
  /* 6805.vhd:850:32  */
  assign n1714_o = ~n1713_o;
  /* 6805.vhd:851:45  */
  assign n1716_o = {8'b00000000, datain};
  /* 6805.vhd:851:36  */
  assign n1717_o = regpc + n1716_o;
  /* 6805.vhd:851:55  */
  assign n1719_o = n1717_o + 16'b0000000000000001;
  /* 6805.vhd:853:45  */
  assign n1721_o = {8'b11111111, datain};
  /* 6805.vhd:853:36  */
  assign n1722_o = regpc + n1721_o;
  /* 6805.vhd:853:55  */
  assign n1724_o = n1722_o + 16'b0000000000000001;
  /* 6805.vhd:850:19  */
  assign n1725_o = n1714_o ? n1719_o : n1724_o;
  /* 6805.vhd:856:34  */
  assign n1727_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:849:17  */
  assign n1728_o = n1712_o ? n1725_o : n1727_o;
  /* 6805.vhd:848:15  */
  assign n1730_o = opcode == 8'b00101100;
  /* 6805.vhd:848:26  */
  assign n1732_o = opcode == 8'b00101101;
  /* 6805.vhd:848:26  */
  assign n1733_o = n1730_o | n1732_o;
  /* 6805.vhd:860:36  */
  assign n1734_o = opcode[0];
  /* 6805.vhd:860:28  */
  assign n1735_o = extirq == n1734_o;
  /* 6805.vhd:861:28  */
  assign n1736_o = datain[7];
  /* 6805.vhd:861:32  */
  assign n1737_o = ~n1736_o;
  /* 6805.vhd:862:45  */
  assign n1739_o = {8'b00000000, datain};
  /* 6805.vhd:862:36  */
  assign n1740_o = regpc + n1739_o;
  /* 6805.vhd:862:55  */
  assign n1742_o = n1740_o + 16'b0000000000000001;
  /* 6805.vhd:864:45  */
  assign n1744_o = {8'b11111111, datain};
  /* 6805.vhd:864:36  */
  assign n1745_o = regpc + n1744_o;
  /* 6805.vhd:864:55  */
  assign n1747_o = n1745_o + 16'b0000000000000001;
  /* 6805.vhd:861:19  */
  assign n1748_o = n1737_o ? n1742_o : n1747_o;
  /* 6805.vhd:867:34  */
  assign n1750_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:860:17  */
  assign n1751_o = n1735_o ? n1748_o : n1750_o;
  /* 6805.vhd:859:15  */
  assign n1753_o = opcode == 8'b00101110;
  /* 6805.vhd:859:26  */
  assign n1755_o = opcode == 8'b00101111;
  /* 6805.vhd:859:26  */
  assign n1756_o = n1753_o | n1755_o;
  /* 6805.vhd:873:19  */
  assign n1758_o = opcode == 8'b00111111;
  /* 6805.vhd:876:46  */
  assign n1760_o = {8'b00000000, datain};
  /* 6805.vhd:876:37  */
  assign n1761_o = temp + n1760_o;
  /* 6805.vhd:875:19  */
  assign n1763_o = opcode == 8'b01101111;
  assign n1764_o = {n1763_o, n1758_o};
  assign n1765_o = n1761_o[7:0];
  /* 6805.vhd:872:17  */
  always @*
    case (n1764_o)
      2'b10: n1767_o = n1765_o;
      2'b01: n1767_o = datain;
      default: n1767_o = 8'b00000000;
    endcase
  assign n1768_o = n1761_o[15:8];
  assign n1770_o = temp[15:8];
  /* 6805.vhd:872:17  */
  always @*
    case (n1764_o)
      2'b10: n1771_o = n1768_o;
      2'b01: n1771_o = n1770_o;
      default: n1771_o = 8'b00000000;
    endcase
  /* 6805.vhd:885:34  */
  assign n1773_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:870:15  */
  assign n1775_o = opcode == 8'b00111111;
  /* 6805.vhd:870:26  */
  assign n1777_o = opcode == 8'b01101111;
  /* 6805.vhd:870:26  */
  assign n1778_o = n1775_o | n1777_o;
  /* 6805.vhd:890:42  */
  assign n1780_o = {8'b00000000, datain};
  /* 6805.vhd:890:33  */
  assign n1781_o = temp + n1780_o;
  /* 6805.vhd:891:34  */
  assign n1783_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:887:15  */
  assign n1785_o = opcode == 8'b01100000;
  /* 6805.vhd:887:26  */
  assign n1787_o = opcode == 8'b01100011;
  /* 6805.vhd:887:26  */
  assign n1788_o = n1785_o | n1787_o;
  /* 6805.vhd:887:34  */
  assign n1790_o = opcode == 8'b01100100;
  /* 6805.vhd:887:34  */
  assign n1791_o = n1788_o | n1790_o;
  /* 6805.vhd:887:42  */
  assign n1793_o = opcode == 8'b01100110;
  /* 6805.vhd:887:42  */
  assign n1794_o = n1791_o | n1793_o;
  /* 6805.vhd:887:50  */
  assign n1796_o = opcode == 8'b01100111;
  /* 6805.vhd:887:50  */
  assign n1797_o = n1794_o | n1796_o;
  /* 6805.vhd:888:26  */
  assign n1799_o = opcode == 8'b01101000;
  /* 6805.vhd:888:26  */
  assign n1800_o = n1797_o | n1799_o;
  /* 6805.vhd:888:34  */
  assign n1802_o = opcode == 8'b01101001;
  /* 6805.vhd:888:34  */
  assign n1803_o = n1800_o | n1802_o;
  /* 6805.vhd:888:42  */
  assign n1805_o = opcode == 8'b01101010;
  /* 6805.vhd:888:42  */
  assign n1806_o = n1803_o | n1805_o;
  /* 6805.vhd:888:50  */
  assign n1808_o = opcode == 8'b01101100;
  /* 6805.vhd:888:50  */
  assign n1809_o = n1806_o | n1808_o;
  /* 6805.vhd:889:26  */
  assign n1811_o = opcode == 8'b01101101;
  /* 6805.vhd:889:26  */
  assign n1812_o = n1809_o | n1811_o;
  /* 6805.vhd:894:15  */
  assign n1814_o = opcode == 8'b01111111;
  /* 6805.vhd:899:32  */
  assign n1815_o = datain[4];
  /* 6805.vhd:900:32  */
  assign n1816_o = datain[3];
  /* 6805.vhd:901:32  */
  assign n1817_o = datain[2];
  /* 6805.vhd:902:32  */
  assign n1818_o = datain[1];
  /* 6805.vhd:903:32  */
  assign n1819_o = datain[0];
  /* 6805.vhd:904:32  */
  assign n1821_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:898:15  */
  assign n1823_o = opcode == 8'b10000000;
  /* 6805.vhd:898:26  */
  assign n1825_o = opcode == 8'b10000010;
  /* 6805.vhd:898:26  */
  assign n1826_o = n1823_o | n1825_o;
  /* 6805.vhd:908:32  */
  assign n1828_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:906:15  */
  assign n1830_o = opcode == 8'b10000001;
  /* 6805.vhd:910:15  */
  assign n1832_o = opcode == 8'b10000011;
  /* 6805.vhd:915:32  */
  assign n1834_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:914:15  */
  assign n1836_o = opcode == 8'b10101101;
  /* 6805.vhd:914:26  */
  assign n1838_o = opcode == 8'b10111101;
  /* 6805.vhd:914:26  */
  assign n1839_o = n1836_o | n1838_o;
  /* 6805.vhd:914:34  */
  assign n1841_o = opcode == 8'b11101101;
  /* 6805.vhd:914:34  */
  assign n1842_o = n1839_o | n1841_o;
  /* 6805.vhd:922:33  */
  assign n1844_o = {8'b00000000, datain};
  /* 6805.vhd:921:15  */
  assign n1846_o = opcode == 8'b10111100;
  /* 6805.vhd:926:32  */
  assign n1848_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:924:15  */
  assign n1850_o = opcode == 8'b11001101;
  /* 6805.vhd:924:26  */
  assign n1852_o = opcode == 8'b11011101;
  /* 6805.vhd:924:26  */
  assign n1853_o = n1850_o | n1852_o;
  assign n1854_o = {n1853_o, n1846_o, n1842_o, n1832_o, n1830_o, n1826_o, n1814_o, n1812_o, n1778_o, n1756_o, n1733_o, n1710_o, n1687_o, n1664_o, n1641_o, n1618_o, n1594_o, n1590_o, n1575_o, n1538_o, n1534_o, n1530_o, n1439_o};
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1861_o = n3828_q;
      23'b01000000000000000000000: n1861_o = n3828_q;
      23'b00100000000000000000000: n1861_o = 1'b0;
      23'b00010000000000000000000: n1861_o = 1'b0;
      23'b00001000000000000000000: n1861_o = n3828_q;
      23'b00000100000000000000000: n1861_o = n3828_q;
      23'b00000010000000000000000: n1861_o = 1'b1;
      23'b00000001000000000000000: n1861_o = n3828_q;
      23'b00000000100000000000000: n1861_o = 1'b0;
      23'b00000000010000000000000: n1861_o = n3828_q;
      23'b00000000001000000000000: n1861_o = n3828_q;
      23'b00000000000100000000000: n1861_o = n3828_q;
      23'b00000000000010000000000: n1861_o = n3828_q;
      23'b00000000000001000000000: n1861_o = n3828_q;
      23'b00000000000000100000000: n1861_o = n3828_q;
      23'b00000000000000010000000: n1861_o = n3828_q;
      23'b00000000000000001000000: n1861_o = n3828_q;
      23'b00000000000000000100000: n1861_o = n3828_q;
      23'b00000000000000000010000: n1861_o = n3828_q;
      23'b00000000000000000001000: n1861_o = 1'b0;
      23'b00000000000000000000100: n1861_o = 1'b0;
      23'b00000000000000000000010: n1861_o = n3828_q;
      23'b00000000000000000000001: n1861_o = n3828_q;
      default: n1861_o = n3828_q;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1862_o = regsp;
      23'b01000000000000000000000: n1862_o = regsp;
      23'b00100000000000000000000: n1862_o = regsp;
      23'b00010000000000000000000: n1862_o = regsp;
      23'b00001000000000000000000: n1862_o = n1828_o;
      23'b00000100000000000000000: n1862_o = n1821_o;
      23'b00000010000000000000000: n1862_o = regsp;
      23'b00000001000000000000000: n1862_o = regsp;
      23'b00000000100000000000000: n1862_o = regsp;
      23'b00000000010000000000000: n1862_o = regsp;
      23'b00000000001000000000000: n1862_o = regsp;
      23'b00000000000100000000000: n1862_o = regsp;
      23'b00000000000010000000000: n1862_o = regsp;
      23'b00000000000001000000000: n1862_o = regsp;
      23'b00000000000000100000000: n1862_o = regsp;
      23'b00000000000000010000000: n1862_o = regsp;
      23'b00000000000000001000000: n1862_o = regsp;
      23'b00000000000000000100000: n1862_o = regsp;
      23'b00000000000000000010000: n1862_o = regsp;
      23'b00000000000000000001000: n1862_o = regsp;
      23'b00000000000000000000100: n1862_o = regsp;
      23'b00000000000000000000010: n1862_o = regsp;
      23'b00000000000000000000001: n1862_o = regsp;
      default: n1862_o = regsp;
    endcase
  assign n1863_o = n1314_o[7:0];
  assign n1864_o = n1441_o[7:0];
  assign n1865_o = n1532_o[7:0];
  assign n1866_o = n1536_o[7:0];
  assign n1867_o = n1540_o[7:0];
  assign n1868_o = n1588_o[7:0];
  assign n1869_o = n1592_o[7:0];
  assign n1870_o = n1613_o[7:0];
  assign n1871_o = n1636_o[7:0];
  assign n1872_o = n1659_o[7:0];
  assign n1873_o = n1682_o[7:0];
  assign n1874_o = n1705_o[7:0];
  assign n1875_o = n1728_o[7:0];
  assign n1876_o = n1751_o[7:0];
  assign n1877_o = n1773_o[7:0];
  assign n1878_o = n1783_o[7:0];
  assign n1879_o = n1834_o[7:0];
  assign n1880_o = n1844_o[7:0];
  assign n1881_o = n1848_o[7:0];
  assign n1882_o = regpc[7:0];
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1883_o = n1881_o;
      23'b01000000000000000000000: n1883_o = n1880_o;
      23'b00100000000000000000000: n1883_o = n1879_o;
      23'b00010000000000000000000: n1883_o = n1882_o;
      23'b00001000000000000000000: n1883_o = n1882_o;
      23'b00000100000000000000000: n1883_o = n1882_o;
      23'b00000010000000000000000: n1883_o = n1882_o;
      23'b00000001000000000000000: n1883_o = n1878_o;
      23'b00000000100000000000000: n1883_o = n1877_o;
      23'b00000000010000000000000: n1883_o = n1876_o;
      23'b00000000001000000000000: n1883_o = n1875_o;
      23'b00000000000100000000000: n1883_o = n1874_o;
      23'b00000000000010000000000: n1883_o = n1873_o;
      23'b00000000000001000000000: n1883_o = n1872_o;
      23'b00000000000000100000000: n1883_o = n1871_o;
      23'b00000000000000010000000: n1883_o = n1870_o;
      23'b00000000000000001000000: n1883_o = n1869_o;
      23'b00000000000000000100000: n1883_o = n1868_o;
      23'b00000000000000000010000: n1883_o = n1867_o;
      23'b00000000000000000001000: n1883_o = n1866_o;
      23'b00000000000000000000100: n1883_o = n1865_o;
      23'b00000000000000000000010: n1883_o = n1864_o;
      23'b00000000000000000000001: n1883_o = n1863_o;
      default: n1883_o = n1882_o;
    endcase
  assign n1884_o = n1314_o[15:8];
  assign n1885_o = n1441_o[15:8];
  assign n1886_o = n1532_o[15:8];
  assign n1887_o = n1536_o[15:8];
  assign n1888_o = n1540_o[15:8];
  assign n1889_o = n1588_o[15:8];
  assign n1890_o = n1592_o[15:8];
  assign n1891_o = n1613_o[15:8];
  assign n1892_o = n1636_o[15:8];
  assign n1893_o = n1659_o[15:8];
  assign n1894_o = n1682_o[15:8];
  assign n1895_o = n1705_o[15:8];
  assign n1896_o = n1728_o[15:8];
  assign n1897_o = n1751_o[15:8];
  assign n1898_o = n1773_o[15:8];
  assign n1899_o = n1783_o[15:8];
  assign n1900_o = n1834_o[15:8];
  assign n1901_o = n1844_o[15:8];
  assign n1902_o = n1848_o[15:8];
  assign n1903_o = regpc[15:8];
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1904_o = n1902_o;
      23'b01000000000000000000000: n1904_o = n1901_o;
      23'b00100000000000000000000: n1904_o = n1900_o;
      23'b00010000000000000000000: n1904_o = n1903_o;
      23'b00001000000000000000000: n1904_o = datain;
      23'b00000100000000000000000: n1904_o = n1903_o;
      23'b00000010000000000000000: n1904_o = n1903_o;
      23'b00000001000000000000000: n1904_o = n1899_o;
      23'b00000000100000000000000: n1904_o = n1898_o;
      23'b00000000010000000000000: n1904_o = n1897_o;
      23'b00000000001000000000000: n1904_o = n1896_o;
      23'b00000000000100000000000: n1904_o = n1895_o;
      23'b00000000000010000000000: n1904_o = n1894_o;
      23'b00000000000001000000000: n1904_o = n1893_o;
      23'b00000000000000100000000: n1904_o = n1892_o;
      23'b00000000000000010000000: n1904_o = n1891_o;
      23'b00000000000000001000000: n1904_o = n1890_o;
      23'b00000000000000000100000: n1904_o = n1889_o;
      23'b00000000000000000010000: n1904_o = n1888_o;
      23'b00000000000000000001000: n1904_o = n1887_o;
      23'b00000000000000000000100: n1904_o = n1886_o;
      23'b00000000000000000000010: n1904_o = n1885_o;
      23'b00000000000000000000001: n1904_o = n1884_o;
      default: n1904_o = n1903_o;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1905_o = flagh;
      23'b01000000000000000000000: n1905_o = flagh;
      23'b00100000000000000000000: n1905_o = flagh;
      23'b00010000000000000000000: n1905_o = flagh;
      23'b00001000000000000000000: n1905_o = flagh;
      23'b00000100000000000000000: n1905_o = n1815_o;
      23'b00000010000000000000000: n1905_o = flagh;
      23'b00000001000000000000000: n1905_o = flagh;
      23'b00000000100000000000000: n1905_o = flagh;
      23'b00000000010000000000000: n1905_o = flagh;
      23'b00000000001000000000000: n1905_o = flagh;
      23'b00000000000100000000000: n1905_o = flagh;
      23'b00000000000010000000000: n1905_o = flagh;
      23'b00000000000001000000000: n1905_o = flagh;
      23'b00000000000000100000000: n1905_o = flagh;
      23'b00000000000000010000000: n1905_o = flagh;
      23'b00000000000000001000000: n1905_o = flagh;
      23'b00000000000000000100000: n1905_o = flagh;
      23'b00000000000000000010000: n1905_o = flagh;
      23'b00000000000000000001000: n1905_o = flagh;
      23'b00000000000000000000100: n1905_o = flagh;
      23'b00000000000000000000010: n1905_o = flagh;
      23'b00000000000000000000001: n1905_o = flagh;
      default: n1905_o = flagh;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1906_o = flagi;
      23'b01000000000000000000000: n1906_o = flagi;
      23'b00100000000000000000000: n1906_o = flagi;
      23'b00010000000000000000000: n1906_o = flagi;
      23'b00001000000000000000000: n1906_o = flagi;
      23'b00000100000000000000000: n1906_o = n1816_o;
      23'b00000010000000000000000: n1906_o = flagi;
      23'b00000001000000000000000: n1906_o = flagi;
      23'b00000000100000000000000: n1906_o = flagi;
      23'b00000000010000000000000: n1906_o = flagi;
      23'b00000000001000000000000: n1906_o = flagi;
      23'b00000000000100000000000: n1906_o = flagi;
      23'b00000000000010000000000: n1906_o = flagi;
      23'b00000000000001000000000: n1906_o = flagi;
      23'b00000000000000100000000: n1906_o = flagi;
      23'b00000000000000010000000: n1906_o = flagi;
      23'b00000000000000001000000: n1906_o = flagi;
      23'b00000000000000000100000: n1906_o = flagi;
      23'b00000000000000000010000: n1906_o = flagi;
      23'b00000000000000000001000: n1906_o = flagi;
      23'b00000000000000000000100: n1906_o = flagi;
      23'b00000000000000000000010: n1906_o = flagi;
      23'b00000000000000000000001: n1906_o = flagi;
      default: n1906_o = flagi;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1908_o = flagn;
      23'b01000000000000000000000: n1908_o = flagn;
      23'b00100000000000000000000: n1908_o = flagn;
      23'b00010000000000000000000: n1908_o = flagn;
      23'b00001000000000000000000: n1908_o = flagn;
      23'b00000100000000000000000: n1908_o = n1817_o;
      23'b00000010000000000000000: n1908_o = flagn;
      23'b00000001000000000000000: n1908_o = flagn;
      23'b00000000100000000000000: n1908_o = 1'b0;
      23'b00000000010000000000000: n1908_o = flagn;
      23'b00000000001000000000000: n1908_o = flagn;
      23'b00000000000100000000000: n1908_o = flagn;
      23'b00000000000010000000000: n1908_o = flagn;
      23'b00000000000001000000000: n1908_o = flagn;
      23'b00000000000000100000000: n1908_o = flagn;
      23'b00000000000000010000000: n1908_o = flagn;
      23'b00000000000000001000000: n1908_o = flagn;
      23'b00000000000000000100000: n1908_o = flagn;
      23'b00000000000000000010000: n1908_o = flagn;
      23'b00000000000000000001000: n1908_o = flagn;
      23'b00000000000000000000100: n1908_o = flagn;
      23'b00000000000000000000010: n1908_o = flagn;
      23'b00000000000000000000001: n1908_o = flagn;
      default: n1908_o = flagn;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1910_o = flagz;
      23'b01000000000000000000000: n1910_o = flagz;
      23'b00100000000000000000000: n1910_o = flagz;
      23'b00010000000000000000000: n1910_o = flagz;
      23'b00001000000000000000000: n1910_o = flagz;
      23'b00000100000000000000000: n1910_o = n1818_o;
      23'b00000010000000000000000: n1910_o = flagz;
      23'b00000001000000000000000: n1910_o = flagz;
      23'b00000000100000000000000: n1910_o = 1'b1;
      23'b00000000010000000000000: n1910_o = flagz;
      23'b00000000001000000000000: n1910_o = flagz;
      23'b00000000000100000000000: n1910_o = flagz;
      23'b00000000000010000000000: n1910_o = flagz;
      23'b00000000000001000000000: n1910_o = flagz;
      23'b00000000000000100000000: n1910_o = flagz;
      23'b00000000000000010000000: n1910_o = flagz;
      23'b00000000000000001000000: n1910_o = flagz;
      23'b00000000000000000100000: n1910_o = flagz;
      23'b00000000000000000010000: n1910_o = flagz;
      23'b00000000000000000001000: n1910_o = flagz;
      23'b00000000000000000000100: n1910_o = flagz;
      23'b00000000000000000000010: n1910_o = flagz;
      23'b00000000000000000000001: n1910_o = flagz;
      default: n1910_o = flagz;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1911_o = flagc;
      23'b01000000000000000000000: n1911_o = flagc;
      23'b00100000000000000000000: n1911_o = flagc;
      23'b00010000000000000000000: n1911_o = flagc;
      23'b00001000000000000000000: n1911_o = flagc;
      23'b00000100000000000000000: n1911_o = n1819_o;
      23'b00000010000000000000000: n1911_o = flagc;
      23'b00000001000000000000000: n1911_o = flagc;
      23'b00000000100000000000000: n1911_o = flagc;
      23'b00000000010000000000000: n1911_o = flagc;
      23'b00000000001000000000000: n1911_o = flagc;
      23'b00000000000100000000000: n1911_o = flagc;
      23'b00000000000010000000000: n1911_o = flagc;
      23'b00000000000001000000000: n1911_o = flagc;
      23'b00000000000000100000000: n1911_o = flagc;
      23'b00000000000000010000000: n1911_o = flagc;
      23'b00000000000000001000000: n1911_o = flagc;
      23'b00000000000000000100000: n1911_o = flagc;
      23'b00000000000000000010000: n1911_o = flagc;
      23'b00000000000000000001000: n1911_o = flagc;
      23'b00000000000000000000100: n1911_o = flagc;
      23'b00000000000000000000010: n1911_o = flagc;
      23'b00000000000000000000001: n1911_o = flagc;
      default: n1911_o = flagc;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1913_o = help;
      23'b01000000000000000000000: n1913_o = help;
      23'b00100000000000000000000: n1913_o = datain;
      23'b00010000000000000000000: n1913_o = help;
      23'b00001000000000000000000: n1913_o = help;
      23'b00000100000000000000000: n1913_o = help;
      23'b00000010000000000000000: n1913_o = help;
      23'b00000001000000000000000: n1913_o = help;
      23'b00000000100000000000000: n1913_o = 8'b00000000;
      23'b00000000010000000000000: n1913_o = help;
      23'b00000000001000000000000: n1913_o = help;
      23'b00000000000100000000000: n1913_o = help;
      23'b00000000000010000000000: n1913_o = help;
      23'b00000000000001000000000: n1913_o = help;
      23'b00000000000000100000000: n1913_o = help;
      23'b00000000000000010000000: n1913_o = help;
      23'b00000000000000001000000: n1913_o = help;
      23'b00000000000000000100000: n1913_o = help;
      23'b00000000000000000010000: n1913_o = help;
      23'b00000000000000000001000: n1913_o = help;
      23'b00000000000000000000100: n1913_o = help;
      23'b00000000000000000000010: n1913_o = help;
      23'b00000000000000000000001: n1913_o = help;
      default: n1913_o = help;
    endcase
  assign n1914_o = n1781_o[7:0];
  assign n1915_o = temp[7:0];
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1916_o = n1915_o;
      23'b01000000000000000000000: n1916_o = n1915_o;
      23'b00100000000000000000000: n1916_o = n1915_o;
      23'b00010000000000000000000: n1916_o = n1915_o;
      23'b00001000000000000000000: n1916_o = n1915_o;
      23'b00000100000000000000000: n1916_o = n1915_o;
      23'b00000010000000000000000: n1916_o = n1915_o;
      23'b00000001000000000000000: n1916_o = n1914_o;
      23'b00000000100000000000000: n1916_o = n1767_o;
      23'b00000000010000000000000: n1916_o = n1915_o;
      23'b00000000001000000000000: n1916_o = n1915_o;
      23'b00000000000100000000000: n1916_o = n1915_o;
      23'b00000000000010000000000: n1916_o = n1915_o;
      23'b00000000000001000000000: n1916_o = n1915_o;
      23'b00000000000000100000000: n1916_o = n1915_o;
      23'b00000000000000010000000: n1916_o = n1915_o;
      23'b00000000000000001000000: n1916_o = n1915_o;
      23'b00000000000000000100000: n1916_o = n1915_o;
      23'b00000000000000000010000: n1916_o = datain;
      23'b00000000000000000001000: n1916_o = datain;
      23'b00000000000000000000100: n1916_o = datain;
      23'b00000000000000000000010: n1916_o = n1915_o;
      23'b00000000000000000000001: n1916_o = datain;
      default: n1916_o = n1915_o;
    endcase
  assign n1917_o = n1781_o[15:8];
  assign n1918_o = temp[15:8];
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1919_o = datain;
      23'b01000000000000000000000: n1919_o = n1918_o;
      23'b00100000000000000000000: n1919_o = n1918_o;
      23'b00010000000000000000000: n1919_o = n1918_o;
      23'b00001000000000000000000: n1919_o = n1918_o;
      23'b00000100000000000000000: n1919_o = n1918_o;
      23'b00000010000000000000000: n1919_o = n1918_o;
      23'b00000001000000000000000: n1919_o = n1917_o;
      23'b00000000100000000000000: n1919_o = n1771_o;
      23'b00000000010000000000000: n1919_o = n1918_o;
      23'b00000000001000000000000: n1919_o = n1918_o;
      23'b00000000000100000000000: n1919_o = n1918_o;
      23'b00000000000010000000000: n1919_o = n1918_o;
      23'b00000000000001000000000: n1919_o = n1918_o;
      23'b00000000000000100000000: n1919_o = n1918_o;
      23'b00000000000000010000000: n1919_o = n1918_o;
      23'b00000000000000001000000: n1919_o = n1918_o;
      23'b00000000000000000100000: n1919_o = n1918_o;
      23'b00000000000000000010000: n1919_o = n1918_o;
      23'b00000000000000000001000: n1919_o = n1918_o;
      23'b00000000000000000000100: n1919_o = n1918_o;
      23'b00000000000000000000010: n1919_o = datain;
      23'b00000000000000000000001: n1919_o = n1918_o;
      default: n1919_o = n1918_o;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1944_o = 4'b0100;
      23'b01000000000000000000000: n1944_o = 4'b0010;
      23'b00100000000000000000000: n1944_o = 4'b0100;
      23'b00010000000000000000000: n1944_o = 4'b0100;
      23'b00001000000000000000000: n1944_o = 4'b0100;
      23'b00000100000000000000000: n1944_o = 4'b0100;
      23'b00000010000000000000000: n1944_o = 4'b0010;
      23'b00000001000000000000000: n1944_o = 4'b0100;
      23'b00000000100000000000000: n1944_o = 4'b0100;
      23'b00000000010000000000000: n1944_o = 4'b0010;
      23'b00000000001000000000000: n1944_o = 4'b0010;
      23'b00000000000100000000000: n1944_o = 4'b0010;
      23'b00000000000010000000000: n1944_o = 4'b0010;
      23'b00000000000001000000000: n1944_o = 4'b0010;
      23'b00000000000000100000000: n1944_o = 4'b0010;
      23'b00000000000000010000000: n1944_o = 4'b0010;
      23'b00000000000000001000000: n1944_o = 4'b0010;
      23'b00000000000000000100000: n1944_o = 4'b0010;
      23'b00000000000000000010000: n1944_o = 4'b0101;
      23'b00000000000000000001000: n1944_o = 4'b0101;
      23'b00000000000000000000100: n1944_o = 4'b0101;
      23'b00000000000000000000010: n1944_o = 4'b0100;
      23'b00000000000000000000001: n1944_o = 4'b0100;
      default: n1944_o = 4'b0000;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1953_o = addrmux;
      23'b01000000000000000000000: n1953_o = addrmux;
      23'b00100000000000000000000: n1953_o = 3'b001;
      23'b00010000000000000000000: n1953_o = addrmux;
      23'b00001000000000000000000: n1953_o = addrmux;
      23'b00000100000000000000000: n1953_o = addrmux;
      23'b00000010000000000000000: n1953_o = 3'b000;
      23'b00000001000000000000000: n1953_o = 3'b011;
      23'b00000000100000000000000: n1953_o = 3'b011;
      23'b00000000010000000000000: n1953_o = addrmux;
      23'b00000000001000000000000: n1953_o = addrmux;
      23'b00000000000100000000000: n1953_o = addrmux;
      23'b00000000000010000000000: n1953_o = addrmux;
      23'b00000000000001000000000: n1953_o = addrmux;
      23'b00000000000000100000000: n1953_o = addrmux;
      23'b00000000000000010000000: n1953_o = addrmux;
      23'b00000000000000001000000: n1953_o = addrmux;
      23'b00000000000000000100000: n1953_o = addrmux;
      23'b00000000000000000010000: n1953_o = 3'b011;
      23'b00000000000000000001000: n1953_o = 3'b011;
      23'b00000000000000000000100: n1953_o = 3'b011;
      23'b00000000000000000000010: n1953_o = addrmux;
      23'b00000000000000000000001: n1953_o = 3'b011;
      default: n1953_o = addrmux;
    endcase
  /* 6805.vhd:737:13  */
  always @*
    case (n1854_o)
      23'b10000000000000000000000: n1959_o = datamux;
      23'b01000000000000000000000: n1959_o = datamux;
      23'b00100000000000000000000: n1959_o = 4'b0101;
      23'b00010000000000000000000: n1959_o = 4'b0101;
      23'b00001000000000000000000: n1959_o = datamux;
      23'b00000100000000000000000: n1959_o = datamux;
      23'b00000010000000000000000: n1959_o = datamux;
      23'b00000001000000000000000: n1959_o = datamux;
      23'b00000000100000000000000: n1959_o = 4'b1001;
      23'b00000000010000000000000: n1959_o = datamux;
      23'b00000000001000000000000: n1959_o = datamux;
      23'b00000000000100000000000: n1959_o = datamux;
      23'b00000000000010000000000: n1959_o = datamux;
      23'b00000000000001000000000: n1959_o = datamux;
      23'b00000000000000100000000: n1959_o = datamux;
      23'b00000000000000010000000: n1959_o = datamux;
      23'b00000000000000001000000: n1959_o = datamux;
      23'b00000000000000000100000: n1959_o = datamux;
      23'b00000000000000000010000: n1959_o = datamux;
      23'b00000000000000000001000: n1959_o = 4'b0010;
      23'b00000000000000000000100: n1959_o = 4'b0000;
      23'b00000000000000000000010: n1959_o = datamux;
      23'b00000000000000000000001: n1959_o = datamux;
      default: n1959_o = datamux;
    endcase
  /* 6805.vhd:736:11  */
  assign n1961_o = mainfsm == 4'b0011;
  /* 6805.vhd:937:57  */
  assign n1962_o = opcode[3:1];
  /* 6805.vhd:937:38  */
  assign n1965_o = 3'b111 - n1962_o;
  /* 6805.vhd:937:28  */
  assign n1968_o = datain & n3842_o;
  /* 6805.vhd:937:73  */
  assign n1970_o = n1968_o != 8'b00000000;
  /* 6805.vhd:937:17  */
  assign n1973_o = n1970_o ? 1'b1 : 1'b0;
  /* 6805.vhd:935:15  */
  assign n1975_o = opcode == 8'b00000000;
  /* 6805.vhd:935:26  */
  assign n1977_o = opcode == 8'b00000010;
  /* 6805.vhd:935:26  */
  assign n1978_o = n1975_o | n1977_o;
  /* 6805.vhd:935:34  */
  assign n1980_o = opcode == 8'b00000100;
  /* 6805.vhd:935:34  */
  assign n1981_o = n1978_o | n1980_o;
  /* 6805.vhd:935:42  */
  assign n1983_o = opcode == 8'b00000110;
  /* 6805.vhd:935:42  */
  assign n1984_o = n1981_o | n1983_o;
  /* 6805.vhd:935:50  */
  assign n1986_o = opcode == 8'b00001000;
  /* 6805.vhd:935:50  */
  assign n1987_o = n1984_o | n1986_o;
  /* 6805.vhd:935:58  */
  assign n1989_o = opcode == 8'b00001010;
  /* 6805.vhd:935:58  */
  assign n1990_o = n1987_o | n1989_o;
  /* 6805.vhd:935:66  */
  assign n1992_o = opcode == 8'b00001100;
  /* 6805.vhd:935:66  */
  assign n1993_o = n1990_o | n1992_o;
  /* 6805.vhd:935:74  */
  assign n1995_o = opcode == 8'b00001110;
  /* 6805.vhd:935:74  */
  assign n1996_o = n1993_o | n1995_o;
  /* 6805.vhd:935:82  */
  assign n1998_o = opcode == 8'b00000001;
  /* 6805.vhd:935:82  */
  assign n1999_o = n1996_o | n1998_o;
  /* 6805.vhd:936:26  */
  assign n2001_o = opcode == 8'b00000011;
  /* 6805.vhd:936:26  */
  assign n2002_o = n1999_o | n2001_o;
  /* 6805.vhd:936:34  */
  assign n2004_o = opcode == 8'b00000101;
  /* 6805.vhd:936:34  */
  assign n2005_o = n2002_o | n2004_o;
  /* 6805.vhd:936:42  */
  assign n2007_o = opcode == 8'b00000111;
  /* 6805.vhd:936:42  */
  assign n2008_o = n2005_o | n2007_o;
  /* 6805.vhd:936:50  */
  assign n2010_o = opcode == 8'b00001001;
  /* 6805.vhd:936:50  */
  assign n2011_o = n2008_o | n2010_o;
  /* 6805.vhd:936:58  */
  assign n2013_o = opcode == 8'b00001011;
  /* 6805.vhd:936:58  */
  assign n2014_o = n2011_o | n2013_o;
  /* 6805.vhd:936:66  */
  assign n2016_o = opcode == 8'b00001101;
  /* 6805.vhd:936:66  */
  assign n2017_o = n2014_o | n2016_o;
  /* 6805.vhd:936:74  */
  assign n2019_o = opcode == 8'b00001111;
  /* 6805.vhd:936:74  */
  assign n2020_o = n2017_o | n2019_o;
  /* 6805.vhd:948:26  */
  assign n2021_o = opcode[0];
  /* 6805.vhd:948:30  */
  assign n2022_o = ~n2021_o;
  /* 6805.vhd:949:63  */
  assign n2023_o = opcode[3:1];
  /* 6805.vhd:949:44  */
  assign n2026_o = 3'b111 - n2023_o;
  /* 6805.vhd:949:34  */
  assign n2029_o = datain | n3856_o;
  /* 6805.vhd:951:63  */
  assign n2030_o = opcode[3:1];
  /* 6805.vhd:951:44  */
  assign n2033_o = 3'b111 - n2030_o;
  /* 6805.vhd:951:34  */
  assign n2036_o = datain & n3870_o;
  /* 6805.vhd:948:17  */
  assign n2037_o = n2022_o ? n2029_o : n2036_o;
  /* 6805.vhd:944:15  */
  assign n2039_o = opcode == 8'b00010000;
  /* 6805.vhd:944:26  */
  assign n2041_o = opcode == 8'b00010010;
  /* 6805.vhd:944:26  */
  assign n2042_o = n2039_o | n2041_o;
  /* 6805.vhd:944:34  */
  assign n2044_o = opcode == 8'b00010100;
  /* 6805.vhd:944:34  */
  assign n2045_o = n2042_o | n2044_o;
  /* 6805.vhd:944:42  */
  assign n2047_o = opcode == 8'b00010110;
  /* 6805.vhd:944:42  */
  assign n2048_o = n2045_o | n2047_o;
  /* 6805.vhd:944:50  */
  assign n2050_o = opcode == 8'b00011000;
  /* 6805.vhd:944:50  */
  assign n2051_o = n2048_o | n2050_o;
  /* 6805.vhd:944:58  */
  assign n2053_o = opcode == 8'b00011010;
  /* 6805.vhd:944:58  */
  assign n2054_o = n2051_o | n2053_o;
  /* 6805.vhd:944:66  */
  assign n2056_o = opcode == 8'b00011100;
  /* 6805.vhd:944:66  */
  assign n2057_o = n2054_o | n2056_o;
  /* 6805.vhd:944:74  */
  assign n2059_o = opcode == 8'b00011110;
  /* 6805.vhd:944:74  */
  assign n2060_o = n2057_o | n2059_o;
  /* 6805.vhd:944:82  */
  assign n2062_o = opcode == 8'b00010001;
  /* 6805.vhd:944:82  */
  assign n2063_o = n2060_o | n2062_o;
  /* 6805.vhd:945:26  */
  assign n2065_o = opcode == 8'b00010011;
  /* 6805.vhd:945:26  */
  assign n2066_o = n2063_o | n2065_o;
  /* 6805.vhd:945:34  */
  assign n2068_o = opcode == 8'b00010101;
  /* 6805.vhd:945:34  */
  assign n2069_o = n2066_o | n2068_o;
  /* 6805.vhd:945:42  */
  assign n2071_o = opcode == 8'b00010111;
  /* 6805.vhd:945:42  */
  assign n2072_o = n2069_o | n2071_o;
  /* 6805.vhd:945:50  */
  assign n2074_o = opcode == 8'b00011001;
  /* 6805.vhd:945:50  */
  assign n2075_o = n2072_o | n2074_o;
  /* 6805.vhd:945:58  */
  assign n2077_o = opcode == 8'b00011011;
  /* 6805.vhd:945:58  */
  assign n2078_o = n2075_o | n2077_o;
  /* 6805.vhd:945:66  */
  assign n2080_o = opcode == 8'b00011101;
  /* 6805.vhd:945:66  */
  assign n2081_o = n2078_o | n2080_o;
  /* 6805.vhd:945:74  */
  assign n2083_o = opcode == 8'b00011111;
  /* 6805.vhd:945:74  */
  assign n2084_o = n2081_o | n2083_o;
  /* 6805.vhd:967:28  */
  assign n2085_o = opcode[7:4];
  /* 6805.vhd:968:19  */
  assign n2087_o = n2085_o == 4'b1100;
  /* 6805.vhd:970:19  */
  assign n2089_o = n2085_o == 4'b1101;
  /* 6805.vhd:972:19  */
  assign n2091_o = n2085_o == 4'b1110;
  assign n2092_o = {n2091_o, n2089_o, n2087_o};
  /* 6805.vhd:967:17  */
  always @*
    case (n2092_o)
      3'b100: n2096_o = 3'b110;
      3'b010: n2096_o = 3'b100;
      3'b001: n2096_o = 3'b011;
      default: n2096_o = addrmux;
    endcase
  /* 6805.vhd:977:32  */
  assign n2098_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:954:15  */
  assign n2100_o = opcode == 8'b11000000;
  /* 6805.vhd:954:26  */
  assign n2102_o = opcode == 8'b11000001;
  /* 6805.vhd:954:26  */
  assign n2103_o = n2100_o | n2102_o;
  /* 6805.vhd:954:34  */
  assign n2105_o = opcode == 8'b11000010;
  /* 6805.vhd:954:34  */
  assign n2106_o = n2103_o | n2105_o;
  /* 6805.vhd:954:42  */
  assign n2108_o = opcode == 8'b11000011;
  /* 6805.vhd:954:42  */
  assign n2109_o = n2106_o | n2108_o;
  /* 6805.vhd:954:50  */
  assign n2111_o = opcode == 8'b11000100;
  /* 6805.vhd:954:50  */
  assign n2112_o = n2109_o | n2111_o;
  /* 6805.vhd:955:26  */
  assign n2114_o = opcode == 8'b11000101;
  /* 6805.vhd:955:26  */
  assign n2115_o = n2112_o | n2114_o;
  /* 6805.vhd:955:34  */
  assign n2117_o = opcode == 8'b11000110;
  /* 6805.vhd:955:34  */
  assign n2118_o = n2115_o | n2117_o;
  /* 6805.vhd:955:42  */
  assign n2120_o = opcode == 8'b11001000;
  /* 6805.vhd:955:42  */
  assign n2121_o = n2118_o | n2120_o;
  /* 6805.vhd:956:26  */
  assign n2123_o = opcode == 8'b11001001;
  /* 6805.vhd:956:26  */
  assign n2124_o = n2121_o | n2123_o;
  /* 6805.vhd:956:34  */
  assign n2126_o = opcode == 8'b11001010;
  /* 6805.vhd:956:34  */
  assign n2127_o = n2124_o | n2126_o;
  /* 6805.vhd:956:42  */
  assign n2129_o = opcode == 8'b11001011;
  /* 6805.vhd:956:42  */
  assign n2130_o = n2127_o | n2129_o;
  /* 6805.vhd:956:50  */
  assign n2132_o = opcode == 8'b11001110;
  /* 6805.vhd:956:50  */
  assign n2133_o = n2130_o | n2132_o;
  /* 6805.vhd:957:26  */
  assign n2135_o = opcode == 8'b11010000;
  /* 6805.vhd:957:26  */
  assign n2136_o = n2133_o | n2135_o;
  /* 6805.vhd:958:26  */
  assign n2138_o = opcode == 8'b11010001;
  /* 6805.vhd:958:26  */
  assign n2139_o = n2136_o | n2138_o;
  /* 6805.vhd:958:34  */
  assign n2141_o = opcode == 8'b11010010;
  /* 6805.vhd:958:34  */
  assign n2142_o = n2139_o | n2141_o;
  /* 6805.vhd:958:42  */
  assign n2144_o = opcode == 8'b11010011;
  /* 6805.vhd:958:42  */
  assign n2145_o = n2142_o | n2144_o;
  /* 6805.vhd:958:50  */
  assign n2147_o = opcode == 8'b11010100;
  /* 6805.vhd:958:50  */
  assign n2148_o = n2145_o | n2147_o;
  /* 6805.vhd:959:26  */
  assign n2150_o = opcode == 8'b11010101;
  /* 6805.vhd:959:26  */
  assign n2151_o = n2148_o | n2150_o;
  /* 6805.vhd:959:34  */
  assign n2153_o = opcode == 8'b11010110;
  /* 6805.vhd:959:34  */
  assign n2154_o = n2151_o | n2153_o;
  /* 6805.vhd:959:42  */
  assign n2156_o = opcode == 8'b11011000;
  /* 6805.vhd:959:42  */
  assign n2157_o = n2154_o | n2156_o;
  /* 6805.vhd:960:26  */
  assign n2159_o = opcode == 8'b11011001;
  /* 6805.vhd:960:26  */
  assign n2160_o = n2157_o | n2159_o;
  /* 6805.vhd:960:34  */
  assign n2162_o = opcode == 8'b11011010;
  /* 6805.vhd:960:34  */
  assign n2163_o = n2160_o | n2162_o;
  /* 6805.vhd:960:42  */
  assign n2165_o = opcode == 8'b11011011;
  /* 6805.vhd:960:42  */
  assign n2166_o = n2163_o | n2165_o;
  /* 6805.vhd:960:50  */
  assign n2168_o = opcode == 8'b11011110;
  /* 6805.vhd:960:50  */
  assign n2169_o = n2166_o | n2168_o;
  /* 6805.vhd:961:26  */
  assign n2171_o = opcode == 8'b11100000;
  /* 6805.vhd:961:26  */
  assign n2172_o = n2169_o | n2171_o;
  /* 6805.vhd:962:26  */
  assign n2174_o = opcode == 8'b11100001;
  /* 6805.vhd:962:26  */
  assign n2175_o = n2172_o | n2174_o;
  /* 6805.vhd:962:34  */
  assign n2177_o = opcode == 8'b11100010;
  /* 6805.vhd:962:34  */
  assign n2178_o = n2175_o | n2177_o;
  /* 6805.vhd:962:42  */
  assign n2180_o = opcode == 8'b11100011;
  /* 6805.vhd:962:42  */
  assign n2181_o = n2178_o | n2180_o;
  /* 6805.vhd:962:50  */
  assign n2183_o = opcode == 8'b11100100;
  /* 6805.vhd:962:50  */
  assign n2184_o = n2181_o | n2183_o;
  /* 6805.vhd:963:26  */
  assign n2186_o = opcode == 8'b11100101;
  /* 6805.vhd:963:26  */
  assign n2187_o = n2184_o | n2186_o;
  /* 6805.vhd:963:34  */
  assign n2189_o = opcode == 8'b11100110;
  /* 6805.vhd:963:34  */
  assign n2190_o = n2187_o | n2189_o;
  /* 6805.vhd:963:42  */
  assign n2192_o = opcode == 8'b11101000;
  /* 6805.vhd:963:42  */
  assign n2193_o = n2190_o | n2192_o;
  /* 6805.vhd:964:26  */
  assign n2195_o = opcode == 8'b11101001;
  /* 6805.vhd:964:26  */
  assign n2196_o = n2193_o | n2195_o;
  /* 6805.vhd:964:34  */
  assign n2198_o = opcode == 8'b11101010;
  /* 6805.vhd:964:34  */
  assign n2199_o = n2196_o | n2198_o;
  /* 6805.vhd:964:42  */
  assign n2201_o = opcode == 8'b11101011;
  /* 6805.vhd:964:42  */
  assign n2202_o = n2199_o | n2201_o;
  /* 6805.vhd:964:50  */
  assign n2204_o = opcode == 8'b11101110;
  /* 6805.vhd:964:50  */
  assign n2205_o = n2202_o | n2204_o;
  /* 6805.vhd:980:30  */
  assign n2206_o = temp[15:8];
  /* 6805.vhd:980:44  */
  assign n2207_o = {n2206_o, datain};
  /* 6805.vhd:979:15  */
  assign n2209_o = opcode == 8'b11001100;
  /* 6805.vhd:983:31  */
  assign n2210_o = temp[15:8];
  /* 6805.vhd:983:45  */
  assign n2211_o = {n2210_o, datain};
  /* 6805.vhd:983:64  */
  assign n2213_o = {8'b00000000, regx};
  /* 6805.vhd:983:55  */
  assign n2214_o = n2211_o + n2213_o;
  /* 6805.vhd:982:15  */
  assign n2216_o = opcode == 8'b11011100;
  /* 6805.vhd:986:33  */
  assign n2218_o = {8'b00000000, datain};
  /* 6805.vhd:986:52  */
  assign n2220_o = {8'b00000000, regx};
  /* 6805.vhd:986:43  */
  assign n2221_o = n2218_o + n2220_o;
  /* 6805.vhd:985:15  */
  assign n2223_o = opcode == 8'b11101100;
  /* 6805.vhd:990:30  */
  assign n2224_o = rega[7];
  /* 6805.vhd:991:25  */
  assign n2226_o = rega == 8'b00000000;
  /* 6805.vhd:991:17  */
  assign n2229_o = n2226_o ? 1'b1 : 1'b0;
  /* 6805.vhd:999:32  */
  assign n2231_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:988:15  */
  assign n2233_o = opcode == 8'b11000111;
  /* 6805.vhd:1003:30  */
  assign n2234_o = rega[7];
  /* 6805.vhd:1004:25  */
  assign n2236_o = rega == 8'b00000000;
  /* 6805.vhd:1004:17  */
  assign n2239_o = n2236_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1012:32  */
  assign n2241_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1001:15  */
  assign n2243_o = opcode == 8'b11010111;
  /* 6805.vhd:1016:30  */
  assign n2244_o = rega[7];
  /* 6805.vhd:1017:25  */
  assign n2246_o = rega == 8'b00000000;
  /* 6805.vhd:1017:17  */
  assign n2249_o = n2246_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1025:32  */
  assign n2251_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1014:15  */
  assign n2253_o = opcode == 8'b11100111;
  /* 6805.vhd:1029:30  */
  assign n2254_o = regx[7];
  /* 6805.vhd:1030:25  */
  assign n2256_o = regx == 8'b00000000;
  /* 6805.vhd:1030:17  */
  assign n2259_o = n2256_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1038:32  */
  assign n2261_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1027:15  */
  assign n2263_o = opcode == 8'b11001111;
  /* 6805.vhd:1042:30  */
  assign n2264_o = regx[7];
  /* 6805.vhd:1043:25  */
  assign n2266_o = regx == 8'b00000000;
  /* 6805.vhd:1043:17  */
  assign n2269_o = n2266_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1051:32  */
  assign n2271_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1040:15  */
  assign n2273_o = opcode == 8'b11011111;
  /* 6805.vhd:1055:30  */
  assign n2274_o = regx[7];
  /* 6805.vhd:1056:25  */
  assign n2276_o = regx == 8'b00000000;
  /* 6805.vhd:1056:17  */
  assign n2279_o = n2276_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1064:32  */
  assign n2281_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1053:15  */
  assign n2283_o = opcode == 8'b11101111;
  /* 6805.vhd:1069:34  */
  assign n2285_o = 8'b00000000 - datain;
  /* 6805.vhd:1070:34  */
  assign n2287_o = 8'b00000000 - datain;
  /* 6805.vhd:1071:32  */
  assign n2288_o = n2287_o[7];
  /* 6805.vhd:1072:25  */
  assign n2290_o = n2287_o == 8'b00000000;
  /* 6805.vhd:1072:17  */
  assign n2293_o = n2290_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1072:17  */
  assign n2296_o = n2290_o ? 1'b0 : 1'b1;
  /* 6805.vhd:1066:15  */
  assign n2298_o = opcode == 8'b00110000;
  /* 6805.vhd:1066:26  */
  assign n2300_o = opcode == 8'b01100000;
  /* 6805.vhd:1066:26  */
  assign n2301_o = n2298_o | n2300_o;
  /* 6805.vhd:1066:34  */
  assign n2303_o = opcode == 8'b01110000;
  /* 6805.vhd:1066:34  */
  assign n2304_o = n2301_o | n2303_o;
  /* 6805.vhd:1083:35  */
  assign n2306_o = datain ^ 8'b11111111;
  /* 6805.vhd:1084:35  */
  assign n2308_o = datain ^ 8'b11111111;
  /* 6805.vhd:1086:32  */
  assign n2309_o = n2308_o[7];
  /* 6805.vhd:1087:25  */
  assign n2311_o = n2308_o == 8'b00000000;
  /* 6805.vhd:1087:17  */
  assign n2314_o = n2311_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1080:15  */
  assign n2316_o = opcode == 8'b00110011;
  /* 6805.vhd:1080:26  */
  assign n2318_o = opcode == 8'b01100011;
  /* 6805.vhd:1080:26  */
  assign n2319_o = n2316_o | n2318_o;
  /* 6805.vhd:1080:34  */
  assign n2321_o = opcode == 8'b01110011;
  /* 6805.vhd:1080:34  */
  assign n2322_o = n2319_o | n2321_o;
  /* 6805.vhd:1096:40  */
  assign n2323_o = datain[7:1];
  /* 6805.vhd:1096:32  */
  assign n2325_o = {1'b0, n2323_o};
  /* 6805.vhd:1097:40  */
  assign n2326_o = datain[7:1];
  /* 6805.vhd:1097:32  */
  assign n2328_o = {1'b0, n2326_o};
  /* 6805.vhd:1099:34  */
  assign n2329_o = datain[0];
  /* 6805.vhd:1100:25  */
  assign n2331_o = n2328_o == 8'b00000000;
  /* 6805.vhd:1100:17  */
  assign n2334_o = n2331_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1093:15  */
  assign n2336_o = opcode == 8'b00110100;
  /* 6805.vhd:1093:26  */
  assign n2338_o = opcode == 8'b01100100;
  /* 6805.vhd:1093:26  */
  assign n2339_o = n2336_o | n2338_o;
  /* 6805.vhd:1093:34  */
  assign n2341_o = opcode == 8'b01110100;
  /* 6805.vhd:1093:34  */
  assign n2342_o = n2339_o | n2341_o;
  /* 6805.vhd:1109:42  */
  assign n2343_o = datain[7:1];
  /* 6805.vhd:1109:34  */
  assign n2344_o = {flagc, n2343_o};
  /* 6805.vhd:1110:42  */
  assign n2345_o = datain[7:1];
  /* 6805.vhd:1110:34  */
  assign n2346_o = {flagc, n2345_o};
  /* 6805.vhd:1112:34  */
  assign n2347_o = datain[0];
  /* 6805.vhd:1113:25  */
  assign n2349_o = n2346_o == 8'b00000000;
  /* 6805.vhd:1113:17  */
  assign n2352_o = n2349_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1106:15  */
  assign n2354_o = opcode == 8'b00110110;
  /* 6805.vhd:1106:26  */
  assign n2356_o = opcode == 8'b01100110;
  /* 6805.vhd:1106:26  */
  assign n2357_o = n2354_o | n2356_o;
  /* 6805.vhd:1106:34  */
  assign n2359_o = opcode == 8'b01110110;
  /* 6805.vhd:1106:34  */
  assign n2360_o = n2357_o | n2359_o;
  /* 6805.vhd:1122:34  */
  assign n2361_o = datain[7];
  /* 6805.vhd:1122:46  */
  assign n2362_o = datain[7:1];
  /* 6805.vhd:1122:38  */
  assign n2363_o = {n2361_o, n2362_o};
  /* 6805.vhd:1123:34  */
  assign n2364_o = datain[7];
  /* 6805.vhd:1123:46  */
  assign n2365_o = datain[7:1];
  /* 6805.vhd:1123:38  */
  assign n2366_o = {n2364_o, n2365_o};
  /* 6805.vhd:1124:34  */
  assign n2367_o = datain[7];
  /* 6805.vhd:1125:34  */
  assign n2368_o = datain[0];
  /* 6805.vhd:1126:25  */
  assign n2370_o = n2366_o == 8'b00000000;
  /* 6805.vhd:1126:17  */
  assign n2373_o = n2370_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1119:15  */
  assign n2375_o = opcode == 8'b00110111;
  /* 6805.vhd:1119:26  */
  assign n2377_o = opcode == 8'b01100111;
  /* 6805.vhd:1119:26  */
  assign n2378_o = n2375_o | n2377_o;
  /* 6805.vhd:1119:34  */
  assign n2380_o = opcode == 8'b01110111;
  /* 6805.vhd:1119:34  */
  assign n2381_o = n2378_o | n2380_o;
  /* 6805.vhd:1135:34  */
  assign n2382_o = datain[6:0];
  /* 6805.vhd:1135:47  */
  assign n2384_o = {n2382_o, 1'b0};
  /* 6805.vhd:1136:34  */
  assign n2385_o = datain[6:0];
  /* 6805.vhd:1136:47  */
  assign n2387_o = {n2385_o, 1'b0};
  /* 6805.vhd:1137:34  */
  assign n2388_o = datain[6];
  /* 6805.vhd:1138:34  */
  assign n2389_o = datain[7];
  /* 6805.vhd:1139:25  */
  assign n2391_o = n2387_o == 8'b00000000;
  /* 6805.vhd:1139:17  */
  assign n2394_o = n2391_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1132:15  */
  assign n2396_o = opcode == 8'b00111000;
  /* 6805.vhd:1132:26  */
  assign n2398_o = opcode == 8'b01101000;
  /* 6805.vhd:1132:26  */
  assign n2399_o = n2396_o | n2398_o;
  /* 6805.vhd:1132:34  */
  assign n2401_o = opcode == 8'b01111000;
  /* 6805.vhd:1132:34  */
  assign n2402_o = n2399_o | n2401_o;
  /* 6805.vhd:1148:34  */
  assign n2403_o = datain[6:0];
  /* 6805.vhd:1148:47  */
  assign n2404_o = {n2403_o, flagc};
  /* 6805.vhd:1149:34  */
  assign n2405_o = datain[6:0];
  /* 6805.vhd:1149:47  */
  assign n2406_o = {n2405_o, flagc};
  /* 6805.vhd:1150:34  */
  assign n2407_o = datain[6];
  /* 6805.vhd:1151:34  */
  assign n2408_o = datain[7];
  /* 6805.vhd:1152:25  */
  assign n2410_o = n2406_o == 8'b00000000;
  /* 6805.vhd:1152:17  */
  assign n2413_o = n2410_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1145:15  */
  assign n2415_o = opcode == 8'b00111001;
  /* 6805.vhd:1145:26  */
  assign n2417_o = opcode == 8'b01101001;
  /* 6805.vhd:1145:26  */
  assign n2418_o = n2415_o | n2417_o;
  /* 6805.vhd:1145:34  */
  assign n2420_o = opcode == 8'b01111001;
  /* 6805.vhd:1145:34  */
  assign n2421_o = n2418_o | n2420_o;
  /* 6805.vhd:1161:35  */
  assign n2423_o = datain - 8'b00000001;
  /* 6805.vhd:1162:35  */
  assign n2425_o = datain - 8'b00000001;
  /* 6805.vhd:1163:32  */
  assign n2426_o = n2425_o[7];
  /* 6805.vhd:1164:25  */
  assign n2428_o = n2425_o == 8'b00000000;
  /* 6805.vhd:1164:17  */
  assign n2431_o = n2428_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1158:15  */
  assign n2433_o = opcode == 8'b00111010;
  /* 6805.vhd:1158:26  */
  assign n2435_o = opcode == 8'b01101010;
  /* 6805.vhd:1158:26  */
  assign n2436_o = n2433_o | n2435_o;
  /* 6805.vhd:1158:34  */
  assign n2438_o = opcode == 8'b01111010;
  /* 6805.vhd:1158:34  */
  assign n2439_o = n2436_o | n2438_o;
  /* 6805.vhd:1173:35  */
  assign n2441_o = datain + 8'b00000001;
  /* 6805.vhd:1174:35  */
  assign n2443_o = datain + 8'b00000001;
  /* 6805.vhd:1175:32  */
  assign n2444_o = n2443_o[7];
  /* 6805.vhd:1176:25  */
  assign n2446_o = n2443_o == 8'b00000000;
  /* 6805.vhd:1176:17  */
  assign n2449_o = n2446_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1170:15  */
  assign n2451_o = opcode == 8'b00111100;
  /* 6805.vhd:1170:26  */
  assign n2453_o = opcode == 8'b01101100;
  /* 6805.vhd:1170:26  */
  assign n2454_o = n2451_o | n2453_o;
  /* 6805.vhd:1170:34  */
  assign n2456_o = opcode == 8'b01111100;
  /* 6805.vhd:1170:34  */
  assign n2457_o = n2454_o | n2456_o;
  /* 6805.vhd:1183:34  */
  assign n2458_o = datain[7];
  /* 6805.vhd:1184:27  */
  assign n2460_o = datain == 8'b00000000;
  /* 6805.vhd:1184:17  */
  assign n2463_o = n2460_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1182:15  */
  assign n2465_o = opcode == 8'b00111101;
  /* 6805.vhd:1182:26  */
  assign n2467_o = opcode == 8'b01101101;
  /* 6805.vhd:1182:26  */
  assign n2468_o = n2465_o | n2467_o;
  /* 6805.vhd:1182:34  */
  assign n2470_o = opcode == 8'b01111101;
  /* 6805.vhd:1182:34  */
  assign n2471_o = n2468_o | n2470_o;
  /* 6805.vhd:1191:15  */
  assign n2473_o = opcode == 8'b00111111;
  /* 6805.vhd:1191:26  */
  assign n2475_o = opcode == 8'b01101111;
  /* 6805.vhd:1191:26  */
  assign n2476_o = n2473_o | n2475_o;
  /* 6805.vhd:1197:32  */
  assign n2478_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1195:15  */
  assign n2480_o = opcode == 8'b10000000;
  /* 6805.vhd:1195:26  */
  assign n2482_o = opcode == 8'b10000010;
  /* 6805.vhd:1195:26  */
  assign n2483_o = n2480_o | n2482_o;
  /* 6805.vhd:1199:15  */
  assign n2485_o = opcode == 8'b10000001;
  /* 6805.vhd:1204:32  */
  assign n2487_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1203:15  */
  assign n2489_o = opcode == 8'b10000011;
  /* 6805.vhd:1208:32  */
  assign n2491_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1207:15  */
  assign n2493_o = opcode == 8'b10101101;
  /* 6805.vhd:1207:26  */
  assign n2495_o = opcode == 8'b10111101;
  /* 6805.vhd:1207:26  */
  assign n2496_o = n2493_o | n2495_o;
  /* 6805.vhd:1207:34  */
  assign n2498_o = opcode == 8'b11101101;
  /* 6805.vhd:1207:34  */
  assign n2499_o = n2496_o | n2498_o;
  /* 6805.vhd:1212:32  */
  assign n2501_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1211:15  */
  assign n2503_o = opcode == 8'b11111101;
  /* 6805.vhd:1218:34  */
  assign n2505_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1215:15  */
  assign n2507_o = opcode == 8'b11001101;
  /* 6805.vhd:1215:26  */
  assign n2509_o = opcode == 8'b11011101;
  /* 6805.vhd:1215:26  */
  assign n2510_o = n2507_o | n2509_o;
  assign n2511_o = {n2510_o, n2503_o, n2499_o, n2489_o, n2485_o, n2483_o, n2476_o, n2471_o, n2457_o, n2439_o, n2421_o, n2402_o, n2381_o, n2360_o, n2342_o, n2322_o, n2304_o, n2283_o, n2273_o, n2263_o, n2253_o, n2243_o, n2233_o, n2223_o, n2216_o, n2209_o, n2205_o, n2084_o, n2020_o};
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2530_o = 1'b0;
      29'b01000000000000000000000000000: n2530_o = n3828_q;
      29'b00100000000000000000000000000: n2530_o = n3828_q;
      29'b00010000000000000000000000000: n2530_o = n3828_q;
      29'b00001000000000000000000000000: n2530_o = n3828_q;
      29'b00000100000000000000000000000: n2530_o = n3828_q;
      29'b00000010000000000000000000000: n2530_o = 1'b1;
      29'b00000001000000000000000000000: n2530_o = n3828_q;
      29'b00000000100000000000000000000: n2530_o = 1'b0;
      29'b00000000010000000000000000000: n2530_o = 1'b0;
      29'b00000000001000000000000000000: n2530_o = 1'b0;
      29'b00000000000100000000000000000: n2530_o = 1'b0;
      29'b00000000000010000000000000000: n2530_o = 1'b0;
      29'b00000000000001000000000000000: n2530_o = 1'b0;
      29'b00000000000000100000000000000: n2530_o = 1'b0;
      29'b00000000000000010000000000000: n2530_o = 1'b0;
      29'b00000000000000001000000000000: n2530_o = 1'b0;
      29'b00000000000000000100000000000: n2530_o = 1'b0;
      29'b00000000000000000010000000000: n2530_o = 1'b0;
      29'b00000000000000000001000000000: n2530_o = 1'b0;
      29'b00000000000000000000100000000: n2530_o = 1'b0;
      29'b00000000000000000000010000000: n2530_o = 1'b0;
      29'b00000000000000000000001000000: n2530_o = 1'b0;
      29'b00000000000000000000000100000: n2530_o = n3828_q;
      29'b00000000000000000000000010000: n2530_o = n3828_q;
      29'b00000000000000000000000001000: n2530_o = n3828_q;
      29'b00000000000000000000000000100: n2530_o = n3828_q;
      29'b00000000000000000000000000010: n2530_o = 1'b0;
      29'b00000000000000000000000000001: n2530_o = n3828_q;
      default: n2530_o = n3828_q;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2531_o = rega;
      29'b01000000000000000000000000000: n2531_o = rega;
      29'b00100000000000000000000000000: n2531_o = rega;
      29'b00010000000000000000000000000: n2531_o = rega;
      29'b00001000000000000000000000000: n2531_o = rega;
      29'b00000100000000000000000000000: n2531_o = datain;
      29'b00000010000000000000000000000: n2531_o = rega;
      29'b00000001000000000000000000000: n2531_o = rega;
      29'b00000000100000000000000000000: n2531_o = rega;
      29'b00000000010000000000000000000: n2531_o = rega;
      29'b00000000001000000000000000000: n2531_o = rega;
      29'b00000000000100000000000000000: n2531_o = rega;
      29'b00000000000010000000000000000: n2531_o = rega;
      29'b00000000000001000000000000000: n2531_o = rega;
      29'b00000000000000100000000000000: n2531_o = rega;
      29'b00000000000000010000000000000: n2531_o = rega;
      29'b00000000000000001000000000000: n2531_o = rega;
      29'b00000000000000000100000000000: n2531_o = rega;
      29'b00000000000000000010000000000: n2531_o = rega;
      29'b00000000000000000001000000000: n2531_o = rega;
      29'b00000000000000000000100000000: n2531_o = rega;
      29'b00000000000000000000010000000: n2531_o = rega;
      29'b00000000000000000000001000000: n2531_o = rega;
      29'b00000000000000000000000100000: n2531_o = rega;
      29'b00000000000000000000000010000: n2531_o = rega;
      29'b00000000000000000000000001000: n2531_o = rega;
      29'b00000000000000000000000000100: n2531_o = rega;
      29'b00000000000000000000000000010: n2531_o = rega;
      29'b00000000000000000000000000001: n2531_o = rega;
      default: n2531_o = rega;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2532_o = regsp;
      29'b01000000000000000000000000000: n2532_o = n2501_o;
      29'b00100000000000000000000000000: n2532_o = n2491_o;
      29'b00010000000000000000000000000: n2532_o = n2487_o;
      29'b00001000000000000000000000000: n2532_o = regsp;
      29'b00000100000000000000000000000: n2532_o = n2478_o;
      29'b00000010000000000000000000000: n2532_o = regsp;
      29'b00000001000000000000000000000: n2532_o = regsp;
      29'b00000000100000000000000000000: n2532_o = regsp;
      29'b00000000010000000000000000000: n2532_o = regsp;
      29'b00000000001000000000000000000: n2532_o = regsp;
      29'b00000000000100000000000000000: n2532_o = regsp;
      29'b00000000000010000000000000000: n2532_o = regsp;
      29'b00000000000001000000000000000: n2532_o = regsp;
      29'b00000000000000100000000000000: n2532_o = regsp;
      29'b00000000000000010000000000000: n2532_o = regsp;
      29'b00000000000000001000000000000: n2532_o = regsp;
      29'b00000000000000000100000000000: n2532_o = regsp;
      29'b00000000000000000010000000000: n2532_o = regsp;
      29'b00000000000000000001000000000: n2532_o = regsp;
      29'b00000000000000000000100000000: n2532_o = regsp;
      29'b00000000000000000000010000000: n2532_o = regsp;
      29'b00000000000000000000001000000: n2532_o = regsp;
      29'b00000000000000000000000100000: n2532_o = regsp;
      29'b00000000000000000000000010000: n2532_o = regsp;
      29'b00000000000000000000000001000: n2532_o = regsp;
      29'b00000000000000000000000000100: n2532_o = regsp;
      29'b00000000000000000000000000010: n2532_o = regsp;
      29'b00000000000000000000000000001: n2532_o = regsp;
      default: n2532_o = regsp;
    endcase
  assign n2533_o = n2098_o[7:0];
  assign n2534_o = n2207_o[7:0];
  assign n2535_o = n2214_o[7:0];
  assign n2536_o = n2221_o[7:0];
  assign n2537_o = n2231_o[7:0];
  assign n2538_o = n2241_o[7:0];
  assign n2539_o = n2251_o[7:0];
  assign n2540_o = n2261_o[7:0];
  assign n2541_o = n2271_o[7:0];
  assign n2542_o = n2281_o[7:0];
  assign n2543_o = n2505_o[7:0];
  assign n2544_o = regpc[7:0];
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2545_o = n2543_o;
      29'b01000000000000000000000000000: n2545_o = n2544_o;
      29'b00100000000000000000000000000: n2545_o = n2544_o;
      29'b00010000000000000000000000000: n2545_o = n2544_o;
      29'b00001000000000000000000000000: n2545_o = datain;
      29'b00000100000000000000000000000: n2545_o = n2544_o;
      29'b00000010000000000000000000000: n2545_o = n2544_o;
      29'b00000001000000000000000000000: n2545_o = n2544_o;
      29'b00000000100000000000000000000: n2545_o = n2544_o;
      29'b00000000010000000000000000000: n2545_o = n2544_o;
      29'b00000000001000000000000000000: n2545_o = n2544_o;
      29'b00000000000100000000000000000: n2545_o = n2544_o;
      29'b00000000000010000000000000000: n2545_o = n2544_o;
      29'b00000000000001000000000000000: n2545_o = n2544_o;
      29'b00000000000000100000000000000: n2545_o = n2544_o;
      29'b00000000000000010000000000000: n2545_o = n2544_o;
      29'b00000000000000001000000000000: n2545_o = n2544_o;
      29'b00000000000000000100000000000: n2545_o = n2542_o;
      29'b00000000000000000010000000000: n2545_o = n2541_o;
      29'b00000000000000000001000000000: n2545_o = n2540_o;
      29'b00000000000000000000100000000: n2545_o = n2539_o;
      29'b00000000000000000000010000000: n2545_o = n2538_o;
      29'b00000000000000000000001000000: n2545_o = n2537_o;
      29'b00000000000000000000000100000: n2545_o = n2536_o;
      29'b00000000000000000000000010000: n2545_o = n2535_o;
      29'b00000000000000000000000001000: n2545_o = n2534_o;
      29'b00000000000000000000000000100: n2545_o = n2533_o;
      29'b00000000000000000000000000010: n2545_o = n2544_o;
      29'b00000000000000000000000000001: n2545_o = n2544_o;
      default: n2545_o = n2544_o;
    endcase
  assign n2546_o = n2098_o[15:8];
  assign n2547_o = n2207_o[15:8];
  assign n2548_o = n2214_o[15:8];
  assign n2549_o = n2221_o[15:8];
  assign n2550_o = n2231_o[15:8];
  assign n2551_o = n2241_o[15:8];
  assign n2552_o = n2251_o[15:8];
  assign n2553_o = n2261_o[15:8];
  assign n2554_o = n2271_o[15:8];
  assign n2555_o = n2281_o[15:8];
  assign n2556_o = n2505_o[15:8];
  assign n2557_o = regpc[15:8];
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2558_o = n2556_o;
      29'b01000000000000000000000000000: n2558_o = n2557_o;
      29'b00100000000000000000000000000: n2558_o = n2557_o;
      29'b00010000000000000000000000000: n2558_o = n2557_o;
      29'b00001000000000000000000000000: n2558_o = n2557_o;
      29'b00000100000000000000000000000: n2558_o = n2557_o;
      29'b00000010000000000000000000000: n2558_o = n2557_o;
      29'b00000001000000000000000000000: n2558_o = n2557_o;
      29'b00000000100000000000000000000: n2558_o = n2557_o;
      29'b00000000010000000000000000000: n2558_o = n2557_o;
      29'b00000000001000000000000000000: n2558_o = n2557_o;
      29'b00000000000100000000000000000: n2558_o = n2557_o;
      29'b00000000000010000000000000000: n2558_o = n2557_o;
      29'b00000000000001000000000000000: n2558_o = n2557_o;
      29'b00000000000000100000000000000: n2558_o = n2557_o;
      29'b00000000000000010000000000000: n2558_o = n2557_o;
      29'b00000000000000001000000000000: n2558_o = n2557_o;
      29'b00000000000000000100000000000: n2558_o = n2555_o;
      29'b00000000000000000010000000000: n2558_o = n2554_o;
      29'b00000000000000000001000000000: n2558_o = n2553_o;
      29'b00000000000000000000100000000: n2558_o = n2552_o;
      29'b00000000000000000000010000000: n2558_o = n2551_o;
      29'b00000000000000000000001000000: n2558_o = n2550_o;
      29'b00000000000000000000000100000: n2558_o = n2549_o;
      29'b00000000000000000000000010000: n2558_o = n2548_o;
      29'b00000000000000000000000001000: n2558_o = n2547_o;
      29'b00000000000000000000000000100: n2558_o = n2546_o;
      29'b00000000000000000000000000010: n2558_o = n2557_o;
      29'b00000000000000000000000000001: n2558_o = n2557_o;
      default: n2558_o = n2557_o;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2560_o = flagn;
      29'b01000000000000000000000000000: n2560_o = flagn;
      29'b00100000000000000000000000000: n2560_o = flagn;
      29'b00010000000000000000000000000: n2560_o = flagn;
      29'b00001000000000000000000000000: n2560_o = flagn;
      29'b00000100000000000000000000000: n2560_o = flagn;
      29'b00000010000000000000000000000: n2560_o = flagn;
      29'b00000001000000000000000000000: n2560_o = n2458_o;
      29'b00000000100000000000000000000: n2560_o = n2444_o;
      29'b00000000010000000000000000000: n2560_o = n2426_o;
      29'b00000000001000000000000000000: n2560_o = n2407_o;
      29'b00000000000100000000000000000: n2560_o = n2388_o;
      29'b00000000000010000000000000000: n2560_o = n2367_o;
      29'b00000000000001000000000000000: n2560_o = flagc;
      29'b00000000000000100000000000000: n2560_o = 1'b0;
      29'b00000000000000010000000000000: n2560_o = n2309_o;
      29'b00000000000000001000000000000: n2560_o = n2288_o;
      29'b00000000000000000100000000000: n2560_o = n2274_o;
      29'b00000000000000000010000000000: n2560_o = n2264_o;
      29'b00000000000000000001000000000: n2560_o = n2254_o;
      29'b00000000000000000000100000000: n2560_o = n2244_o;
      29'b00000000000000000000010000000: n2560_o = n2234_o;
      29'b00000000000000000000001000000: n2560_o = n2224_o;
      29'b00000000000000000000000100000: n2560_o = flagn;
      29'b00000000000000000000000010000: n2560_o = flagn;
      29'b00000000000000000000000001000: n2560_o = flagn;
      29'b00000000000000000000000000100: n2560_o = flagn;
      29'b00000000000000000000000000010: n2560_o = flagn;
      29'b00000000000000000000000000001: n2560_o = flagn;
      default: n2560_o = flagn;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2561_o = flagz;
      29'b01000000000000000000000000000: n2561_o = flagz;
      29'b00100000000000000000000000000: n2561_o = flagz;
      29'b00010000000000000000000000000: n2561_o = flagz;
      29'b00001000000000000000000000000: n2561_o = flagz;
      29'b00000100000000000000000000000: n2561_o = flagz;
      29'b00000010000000000000000000000: n2561_o = flagz;
      29'b00000001000000000000000000000: n2561_o = n2463_o;
      29'b00000000100000000000000000000: n2561_o = n2449_o;
      29'b00000000010000000000000000000: n2561_o = n2431_o;
      29'b00000000001000000000000000000: n2561_o = n2413_o;
      29'b00000000000100000000000000000: n2561_o = n2394_o;
      29'b00000000000010000000000000000: n2561_o = n2373_o;
      29'b00000000000001000000000000000: n2561_o = n2352_o;
      29'b00000000000000100000000000000: n2561_o = n2334_o;
      29'b00000000000000010000000000000: n2561_o = n2314_o;
      29'b00000000000000001000000000000: n2561_o = n2293_o;
      29'b00000000000000000100000000000: n2561_o = n2279_o;
      29'b00000000000000000010000000000: n2561_o = n2269_o;
      29'b00000000000000000001000000000: n2561_o = n2259_o;
      29'b00000000000000000000100000000: n2561_o = n2249_o;
      29'b00000000000000000000010000000: n2561_o = n2239_o;
      29'b00000000000000000000001000000: n2561_o = n2229_o;
      29'b00000000000000000000000100000: n2561_o = flagz;
      29'b00000000000000000000000010000: n2561_o = flagz;
      29'b00000000000000000000000001000: n2561_o = flagz;
      29'b00000000000000000000000000100: n2561_o = flagz;
      29'b00000000000000000000000000010: n2561_o = flagz;
      29'b00000000000000000000000000001: n2561_o = flagz;
      default: n2561_o = flagz;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2563_o = flagc;
      29'b01000000000000000000000000000: n2563_o = flagc;
      29'b00100000000000000000000000000: n2563_o = flagc;
      29'b00010000000000000000000000000: n2563_o = flagc;
      29'b00001000000000000000000000000: n2563_o = flagc;
      29'b00000100000000000000000000000: n2563_o = flagc;
      29'b00000010000000000000000000000: n2563_o = flagc;
      29'b00000001000000000000000000000: n2563_o = flagc;
      29'b00000000100000000000000000000: n2563_o = flagc;
      29'b00000000010000000000000000000: n2563_o = flagc;
      29'b00000000001000000000000000000: n2563_o = n2408_o;
      29'b00000000000100000000000000000: n2563_o = n2389_o;
      29'b00000000000010000000000000000: n2563_o = n2368_o;
      29'b00000000000001000000000000000: n2563_o = n2347_o;
      29'b00000000000000100000000000000: n2563_o = n2329_o;
      29'b00000000000000010000000000000: n2563_o = 1'b1;
      29'b00000000000000001000000000000: n2563_o = n2296_o;
      29'b00000000000000000100000000000: n2563_o = flagc;
      29'b00000000000000000010000000000: n2563_o = flagc;
      29'b00000000000000000001000000000: n2563_o = flagc;
      29'b00000000000000000000100000000: n2563_o = flagc;
      29'b00000000000000000000010000000: n2563_o = flagc;
      29'b00000000000000000000001000000: n2563_o = flagc;
      29'b00000000000000000000000100000: n2563_o = flagc;
      29'b00000000000000000000000010000: n2563_o = flagc;
      29'b00000000000000000000000001000: n2563_o = flagc;
      29'b00000000000000000000000000100: n2563_o = flagc;
      29'b00000000000000000000000000010: n2563_o = flagc;
      29'b00000000000000000000000000001: n2563_o = n1973_o;
      default: n2563_o = flagc;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2564_o = help;
      29'b01000000000000000000000000000: n2564_o = help;
      29'b00100000000000000000000000000: n2564_o = help;
      29'b00010000000000000000000000000: n2564_o = help;
      29'b00001000000000000000000000000: n2564_o = help;
      29'b00000100000000000000000000000: n2564_o = help;
      29'b00000010000000000000000000000: n2564_o = help;
      29'b00000001000000000000000000000: n2564_o = help;
      29'b00000000100000000000000000000: n2564_o = n2441_o;
      29'b00000000010000000000000000000: n2564_o = n2423_o;
      29'b00000000001000000000000000000: n2564_o = n2404_o;
      29'b00000000000100000000000000000: n2564_o = n2384_o;
      29'b00000000000010000000000000000: n2564_o = n2363_o;
      29'b00000000000001000000000000000: n2564_o = n2344_o;
      29'b00000000000000100000000000000: n2564_o = n2325_o;
      29'b00000000000000010000000000000: n2564_o = n2306_o;
      29'b00000000000000001000000000000: n2564_o = n2285_o;
      29'b00000000000000000100000000000: n2564_o = help;
      29'b00000000000000000010000000000: n2564_o = help;
      29'b00000000000000000001000000000: n2564_o = help;
      29'b00000000000000000000100000000: n2564_o = help;
      29'b00000000000000000000010000000: n2564_o = help;
      29'b00000000000000000000001000000: n2564_o = help;
      29'b00000000000000000000000100000: n2564_o = help;
      29'b00000000000000000000000010000: n2564_o = help;
      29'b00000000000000000000000001000: n2564_o = help;
      29'b00000000000000000000000000100: n2564_o = help;
      29'b00000000000000000000000000010: n2564_o = n2037_o;
      29'b00000000000000000000000000001: n2564_o = help;
      default: n2564_o = help;
    endcase
  assign n2565_o = temp[7:0];
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2566_o = datain;
      29'b01000000000000000000000000000: n2566_o = n2565_o;
      29'b00100000000000000000000000000: n2566_o = n2565_o;
      29'b00010000000000000000000000000: n2566_o = n2565_o;
      29'b00001000000000000000000000000: n2566_o = n2565_o;
      29'b00000100000000000000000000000: n2566_o = n2565_o;
      29'b00000010000000000000000000000: n2566_o = n2565_o;
      29'b00000001000000000000000000000: n2566_o = n2565_o;
      29'b00000000100000000000000000000: n2566_o = n2565_o;
      29'b00000000010000000000000000000: n2566_o = n2565_o;
      29'b00000000001000000000000000000: n2566_o = n2565_o;
      29'b00000000000100000000000000000: n2566_o = n2565_o;
      29'b00000000000010000000000000000: n2566_o = n2565_o;
      29'b00000000000001000000000000000: n2566_o = n2565_o;
      29'b00000000000000100000000000000: n2566_o = n2565_o;
      29'b00000000000000010000000000000: n2566_o = n2565_o;
      29'b00000000000000001000000000000: n2566_o = n2565_o;
      29'b00000000000000000100000000000: n2566_o = datain;
      29'b00000000000000000010000000000: n2566_o = datain;
      29'b00000000000000000001000000000: n2566_o = datain;
      29'b00000000000000000000100000000: n2566_o = datain;
      29'b00000000000000000000010000000: n2566_o = datain;
      29'b00000000000000000000001000000: n2566_o = datain;
      29'b00000000000000000000000100000: n2566_o = n2565_o;
      29'b00000000000000000000000010000: n2566_o = n2565_o;
      29'b00000000000000000000000001000: n2566_o = n2565_o;
      29'b00000000000000000000000000100: n2566_o = datain;
      29'b00000000000000000000000000010: n2566_o = n2565_o;
      29'b00000000000000000000000000001: n2566_o = n2565_o;
      default: n2566_o = n2565_o;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2597_o = 4'b0101;
      29'b01000000000000000000000000000: n2597_o = 4'b0101;
      29'b00100000000000000000000000000: n2597_o = 4'b0101;
      29'b00010000000000000000000000000: n2597_o = 4'b0101;
      29'b00001000000000000000000000000: n2597_o = 4'b0010;
      29'b00000100000000000000000000000: n2597_o = 4'b0101;
      29'b00000010000000000000000000000: n2597_o = 4'b0010;
      29'b00000001000000000000000000000: n2597_o = 4'b0010;
      29'b00000000100000000000000000000: n2597_o = 4'b0101;
      29'b00000000010000000000000000000: n2597_o = 4'b0101;
      29'b00000000001000000000000000000: n2597_o = 4'b0101;
      29'b00000000000100000000000000000: n2597_o = 4'b0101;
      29'b00000000000010000000000000000: n2597_o = 4'b0101;
      29'b00000000000001000000000000000: n2597_o = 4'b0101;
      29'b00000000000000100000000000000: n2597_o = 4'b0101;
      29'b00000000000000010000000000000: n2597_o = 4'b0101;
      29'b00000000000000001000000000000: n2597_o = 4'b0101;
      29'b00000000000000000100000000000: n2597_o = 4'b0101;
      29'b00000000000000000010000000000: n2597_o = 4'b0101;
      29'b00000000000000000001000000000: n2597_o = 4'b0101;
      29'b00000000000000000000100000000: n2597_o = 4'b0101;
      29'b00000000000000000000010000000: n2597_o = 4'b0101;
      29'b00000000000000000000001000000: n2597_o = 4'b0101;
      29'b00000000000000000000000100000: n2597_o = 4'b0010;
      29'b00000000000000000000000010000: n2597_o = 4'b0010;
      29'b00000000000000000000000001000: n2597_o = 4'b0010;
      29'b00000000000000000000000000100: n2597_o = 4'b0101;
      29'b00000000000000000000000000010: n2597_o = 4'b0101;
      29'b00000000000000000000000000001: n2597_o = 4'b0101;
      default: n2597_o = 4'b0000;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2609_o = 3'b001;
      29'b01000000000000000000000000000: n2609_o = addrmux;
      29'b00100000000000000000000000000: n2609_o = addrmux;
      29'b00010000000000000000000000000: n2609_o = addrmux;
      29'b00001000000000000000000000000: n2609_o = 3'b000;
      29'b00000100000000000000000000000: n2609_o = addrmux;
      29'b00000010000000000000000000000: n2609_o = 3'b000;
      29'b00000001000000000000000000000: n2609_o = 3'b000;
      29'b00000000100000000000000000000: n2609_o = addrmux;
      29'b00000000010000000000000000000: n2609_o = addrmux;
      29'b00000000001000000000000000000: n2609_o = addrmux;
      29'b00000000000100000000000000000: n2609_o = addrmux;
      29'b00000000000010000000000000000: n2609_o = addrmux;
      29'b00000000000001000000000000000: n2609_o = addrmux;
      29'b00000000000000100000000000000: n2609_o = addrmux;
      29'b00000000000000010000000000000: n2609_o = addrmux;
      29'b00000000000000001000000000000: n2609_o = addrmux;
      29'b00000000000000000100000000000: n2609_o = 3'b110;
      29'b00000000000000000010000000000: n2609_o = 3'b100;
      29'b00000000000000000001000000000: n2609_o = 3'b011;
      29'b00000000000000000000100000000: n2609_o = 3'b110;
      29'b00000000000000000000010000000: n2609_o = 3'b100;
      29'b00000000000000000000001000000: n2609_o = 3'b011;
      29'b00000000000000000000000100000: n2609_o = addrmux;
      29'b00000000000000000000000010000: n2609_o = addrmux;
      29'b00000000000000000000000001000: n2609_o = addrmux;
      29'b00000000000000000000000000100: n2609_o = n2096_o;
      29'b00000000000000000000000000010: n2609_o = addrmux;
      29'b00000000000000000000000000001: n2609_o = 3'b000;
      default: n2609_o = addrmux;
    endcase
  /* 6805.vhd:934:13  */
  always @*
    case (n2511_o)
      29'b10000000000000000000000000000: n2630_o = 4'b0101;
      29'b01000000000000000000000000000: n2630_o = 4'b1000;
      29'b00100000000000000000000000000: n2630_o = 4'b0110;
      29'b00010000000000000000000000000: n2630_o = 4'b0110;
      29'b00001000000000000000000000000: n2630_o = datamux;
      29'b00000100000000000000000000000: n2630_o = datamux;
      29'b00000010000000000000000000000: n2630_o = datamux;
      29'b00000001000000000000000000000: n2630_o = datamux;
      29'b00000000100000000000000000000: n2630_o = 4'b1001;
      29'b00000000010000000000000000000: n2630_o = 4'b1001;
      29'b00000000001000000000000000000: n2630_o = 4'b1001;
      29'b00000000000100000000000000000: n2630_o = 4'b1001;
      29'b00000000000010000000000000000: n2630_o = 4'b1001;
      29'b00000000000001000000000000000: n2630_o = 4'b1001;
      29'b00000000000000100000000000000: n2630_o = 4'b1001;
      29'b00000000000000010000000000000: n2630_o = 4'b1001;
      29'b00000000000000001000000000000: n2630_o = 4'b1001;
      29'b00000000000000000100000000000: n2630_o = 4'b0010;
      29'b00000000000000000010000000000: n2630_o = 4'b0010;
      29'b00000000000000000001000000000: n2630_o = 4'b0010;
      29'b00000000000000000000100000000: n2630_o = 4'b0000;
      29'b00000000000000000000010000000: n2630_o = 4'b0000;
      29'b00000000000000000000001000000: n2630_o = 4'b0000;
      29'b00000000000000000000000100000: n2630_o = datamux;
      29'b00000000000000000000000010000: n2630_o = datamux;
      29'b00000000000000000000000001000: n2630_o = datamux;
      29'b00000000000000000000000000100: n2630_o = datamux;
      29'b00000000000000000000000000010: n2630_o = 4'b1001;
      29'b00000000000000000000000000001: n2630_o = datamux;
      default: n2630_o = datamux;
    endcase
  /* 6805.vhd:933:11  */
  assign n2633_o = mainfsm == 4'b0100;
  /* 6805.vhd:1231:27  */
  assign n2634_o = opcode[0];
  /* 6805.vhd:1231:31  */
  assign n2635_o = n2634_o ^ flagc;
  /* 6805.vhd:1232:28  */
  assign n2636_o = datain[7];
  /* 6805.vhd:1232:32  */
  assign n2637_o = ~n2636_o;
  /* 6805.vhd:1233:45  */
  assign n2639_o = {8'b00000000, datain};
  /* 6805.vhd:1233:36  */
  assign n2640_o = regpc + n2639_o;
  /* 6805.vhd:1233:55  */
  assign n2642_o = n2640_o + 16'b0000000000000001;
  /* 6805.vhd:1235:45  */
  assign n2644_o = {8'b11111111, datain};
  /* 6805.vhd:1235:36  */
  assign n2645_o = regpc + n2644_o;
  /* 6805.vhd:1235:55  */
  assign n2647_o = n2645_o + 16'b0000000000000001;
  /* 6805.vhd:1232:19  */
  assign n2648_o = n2637_o ? n2642_o : n2647_o;
  /* 6805.vhd:1238:34  */
  assign n2650_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1231:17  */
  assign n2651_o = n2635_o ? n2648_o : n2650_o;
  /* 6805.vhd:1229:15  */
  assign n2653_o = opcode == 8'b00000000;
  /* 6805.vhd:1229:26  */
  assign n2655_o = opcode == 8'b00000010;
  /* 6805.vhd:1229:26  */
  assign n2656_o = n2653_o | n2655_o;
  /* 6805.vhd:1229:34  */
  assign n2658_o = opcode == 8'b00000100;
  /* 6805.vhd:1229:34  */
  assign n2659_o = n2656_o | n2658_o;
  /* 6805.vhd:1229:42  */
  assign n2661_o = opcode == 8'b00000110;
  /* 6805.vhd:1229:42  */
  assign n2662_o = n2659_o | n2661_o;
  /* 6805.vhd:1229:50  */
  assign n2664_o = opcode == 8'b00001000;
  /* 6805.vhd:1229:50  */
  assign n2665_o = n2662_o | n2664_o;
  /* 6805.vhd:1229:58  */
  assign n2667_o = opcode == 8'b00001010;
  /* 6805.vhd:1229:58  */
  assign n2668_o = n2665_o | n2667_o;
  /* 6805.vhd:1229:66  */
  assign n2670_o = opcode == 8'b00001100;
  /* 6805.vhd:1229:66  */
  assign n2671_o = n2668_o | n2670_o;
  /* 6805.vhd:1229:74  */
  assign n2673_o = opcode == 8'b00001110;
  /* 6805.vhd:1229:74  */
  assign n2674_o = n2671_o | n2673_o;
  /* 6805.vhd:1229:82  */
  assign n2676_o = opcode == 8'b00000001;
  /* 6805.vhd:1229:82  */
  assign n2677_o = n2674_o | n2676_o;
  /* 6805.vhd:1230:26  */
  assign n2679_o = opcode == 8'b00000011;
  /* 6805.vhd:1230:26  */
  assign n2680_o = n2677_o | n2679_o;
  /* 6805.vhd:1230:34  */
  assign n2682_o = opcode == 8'b00000101;
  /* 6805.vhd:1230:34  */
  assign n2683_o = n2680_o | n2682_o;
  /* 6805.vhd:1230:42  */
  assign n2685_o = opcode == 8'b00000111;
  /* 6805.vhd:1230:42  */
  assign n2686_o = n2683_o | n2685_o;
  /* 6805.vhd:1230:50  */
  assign n2688_o = opcode == 8'b00001001;
  /* 6805.vhd:1230:50  */
  assign n2689_o = n2686_o | n2688_o;
  /* 6805.vhd:1230:58  */
  assign n2691_o = opcode == 8'b00001011;
  /* 6805.vhd:1230:58  */
  assign n2692_o = n2689_o | n2691_o;
  /* 6805.vhd:1230:66  */
  assign n2694_o = opcode == 8'b00001101;
  /* 6805.vhd:1230:66  */
  assign n2695_o = n2692_o | n2694_o;
  /* 6805.vhd:1230:74  */
  assign n2697_o = opcode == 8'b00001111;
  /* 6805.vhd:1230:74  */
  assign n2698_o = n2695_o | n2697_o;
  /* 6805.vhd:1242:15  */
  assign n2700_o = opcode == 8'b00010000;
  /* 6805.vhd:1242:26  */
  assign n2702_o = opcode == 8'b00010010;
  /* 6805.vhd:1242:26  */
  assign n2703_o = n2700_o | n2702_o;
  /* 6805.vhd:1242:34  */
  assign n2705_o = opcode == 8'b00010100;
  /* 6805.vhd:1242:34  */
  assign n2706_o = n2703_o | n2705_o;
  /* 6805.vhd:1242:42  */
  assign n2708_o = opcode == 8'b00010110;
  /* 6805.vhd:1242:42  */
  assign n2709_o = n2706_o | n2708_o;
  /* 6805.vhd:1242:50  */
  assign n2711_o = opcode == 8'b00011000;
  /* 6805.vhd:1242:50  */
  assign n2712_o = n2709_o | n2711_o;
  /* 6805.vhd:1242:58  */
  assign n2714_o = opcode == 8'b00011010;
  /* 6805.vhd:1242:58  */
  assign n2715_o = n2712_o | n2714_o;
  /* 6805.vhd:1242:66  */
  assign n2717_o = opcode == 8'b00011100;
  /* 6805.vhd:1242:66  */
  assign n2718_o = n2715_o | n2717_o;
  /* 6805.vhd:1242:74  */
  assign n2720_o = opcode == 8'b00011110;
  /* 6805.vhd:1242:74  */
  assign n2721_o = n2718_o | n2720_o;
  /* 6805.vhd:1242:82  */
  assign n2723_o = opcode == 8'b00010001;
  /* 6805.vhd:1242:82  */
  assign n2724_o = n2721_o | n2723_o;
  /* 6805.vhd:1243:26  */
  assign n2726_o = opcode == 8'b00010011;
  /* 6805.vhd:1243:26  */
  assign n2727_o = n2724_o | n2726_o;
  /* 6805.vhd:1243:34  */
  assign n2729_o = opcode == 8'b00010101;
  /* 6805.vhd:1243:34  */
  assign n2730_o = n2727_o | n2729_o;
  /* 6805.vhd:1243:42  */
  assign n2732_o = opcode == 8'b00010111;
  /* 6805.vhd:1243:42  */
  assign n2733_o = n2730_o | n2732_o;
  /* 6805.vhd:1243:50  */
  assign n2735_o = opcode == 8'b00011001;
  /* 6805.vhd:1243:50  */
  assign n2736_o = n2733_o | n2735_o;
  /* 6805.vhd:1243:58  */
  assign n2738_o = opcode == 8'b00011011;
  /* 6805.vhd:1243:58  */
  assign n2739_o = n2736_o | n2738_o;
  /* 6805.vhd:1243:66  */
  assign n2741_o = opcode == 8'b00011101;
  /* 6805.vhd:1243:66  */
  assign n2742_o = n2739_o | n2741_o;
  /* 6805.vhd:1243:74  */
  assign n2744_o = opcode == 8'b00011111;
  /* 6805.vhd:1243:74  */
  assign n2745_o = n2742_o | n2744_o;
  /* 6805.vhd:1243:82  */
  assign n2747_o = opcode == 8'b00110000;
  /* 6805.vhd:1243:82  */
  assign n2748_o = n2745_o | n2747_o;
  /* 6805.vhd:1244:26  */
  assign n2750_o = opcode == 8'b00110011;
  /* 6805.vhd:1244:26  */
  assign n2751_o = n2748_o | n2750_o;
  /* 6805.vhd:1244:34  */
  assign n2753_o = opcode == 8'b00110100;
  /* 6805.vhd:1244:34  */
  assign n2754_o = n2751_o | n2753_o;
  /* 6805.vhd:1244:42  */
  assign n2756_o = opcode == 8'b00110110;
  /* 6805.vhd:1244:42  */
  assign n2757_o = n2754_o | n2756_o;
  /* 6805.vhd:1244:50  */
  assign n2759_o = opcode == 8'b00110111;
  /* 6805.vhd:1244:50  */
  assign n2760_o = n2757_o | n2759_o;
  /* 6805.vhd:1245:26  */
  assign n2762_o = opcode == 8'b00111000;
  /* 6805.vhd:1245:26  */
  assign n2763_o = n2760_o | n2762_o;
  /* 6805.vhd:1245:34  */
  assign n2765_o = opcode == 8'b00111001;
  /* 6805.vhd:1245:34  */
  assign n2766_o = n2763_o | n2765_o;
  /* 6805.vhd:1245:42  */
  assign n2768_o = opcode == 8'b00111010;
  /* 6805.vhd:1245:42  */
  assign n2769_o = n2766_o | n2768_o;
  /* 6805.vhd:1245:50  */
  assign n2771_o = opcode == 8'b00111100;
  /* 6805.vhd:1245:50  */
  assign n2772_o = n2769_o | n2771_o;
  /* 6805.vhd:1245:58  */
  assign n2774_o = opcode == 8'b01100000;
  /* 6805.vhd:1245:58  */
  assign n2775_o = n2772_o | n2774_o;
  /* 6805.vhd:1246:26  */
  assign n2777_o = opcode == 8'b01100011;
  /* 6805.vhd:1246:26  */
  assign n2778_o = n2775_o | n2777_o;
  /* 6805.vhd:1246:34  */
  assign n2780_o = opcode == 8'b01100100;
  /* 6805.vhd:1246:34  */
  assign n2781_o = n2778_o | n2780_o;
  /* 6805.vhd:1246:42  */
  assign n2783_o = opcode == 8'b01100110;
  /* 6805.vhd:1246:42  */
  assign n2784_o = n2781_o | n2783_o;
  /* 6805.vhd:1246:50  */
  assign n2786_o = opcode == 8'b01100111;
  /* 6805.vhd:1246:50  */
  assign n2787_o = n2784_o | n2786_o;
  /* 6805.vhd:1246:58  */
  assign n2789_o = opcode == 8'b01101000;
  /* 6805.vhd:1246:58  */
  assign n2790_o = n2787_o | n2789_o;
  /* 6805.vhd:1247:26  */
  assign n2792_o = opcode == 8'b01101001;
  /* 6805.vhd:1247:26  */
  assign n2793_o = n2790_o | n2792_o;
  /* 6805.vhd:1247:34  */
  assign n2795_o = opcode == 8'b01101010;
  /* 6805.vhd:1247:34  */
  assign n2796_o = n2793_o | n2795_o;
  /* 6805.vhd:1247:42  */
  assign n2798_o = opcode == 8'b01101100;
  /* 6805.vhd:1247:42  */
  assign n2799_o = n2796_o | n2798_o;
  /* 6805.vhd:1247:50  */
  assign n2801_o = opcode == 8'b01110000;
  /* 6805.vhd:1247:50  */
  assign n2802_o = n2799_o | n2801_o;
  /* 6805.vhd:1248:26  */
  assign n2804_o = opcode == 8'b01110011;
  /* 6805.vhd:1248:26  */
  assign n2805_o = n2802_o | n2804_o;
  /* 6805.vhd:1248:34  */
  assign n2807_o = opcode == 8'b01110100;
  /* 6805.vhd:1248:34  */
  assign n2808_o = n2805_o | n2807_o;
  /* 6805.vhd:1248:42  */
  assign n2810_o = opcode == 8'b01110110;
  /* 6805.vhd:1248:42  */
  assign n2811_o = n2808_o | n2810_o;
  /* 6805.vhd:1248:50  */
  assign n2813_o = opcode == 8'b01110111;
  /* 6805.vhd:1248:50  */
  assign n2814_o = n2811_o | n2813_o;
  /* 6805.vhd:1248:58  */
  assign n2816_o = opcode == 8'b01111000;
  /* 6805.vhd:1248:58  */
  assign n2817_o = n2814_o | n2816_o;
  /* 6805.vhd:1248:66  */
  assign n2819_o = opcode == 8'b01111001;
  /* 6805.vhd:1248:66  */
  assign n2820_o = n2817_o | n2819_o;
  /* 6805.vhd:1248:74  */
  assign n2822_o = opcode == 8'b01111010;
  /* 6805.vhd:1248:74  */
  assign n2823_o = n2820_o | n2822_o;
  /* 6805.vhd:1249:26  */
  assign n2825_o = opcode == 8'b01111100;
  /* 6805.vhd:1249:26  */
  assign n2826_o = n2823_o | n2825_o;
  /* 6805.vhd:1249:34  */
  assign n2828_o = opcode == 8'b10110111;
  /* 6805.vhd:1249:34  */
  assign n2829_o = n2826_o | n2828_o;
  /* 6805.vhd:1250:26  */
  assign n2831_o = opcode == 8'b10111111;
  /* 6805.vhd:1250:26  */
  assign n2832_o = n2829_o | n2831_o;
  /* 6805.vhd:1250:34  */
  assign n2834_o = opcode == 8'b11000111;
  /* 6805.vhd:1250:34  */
  assign n2835_o = n2832_o | n2834_o;
  /* 6805.vhd:1250:42  */
  assign n2837_o = opcode == 8'b11001111;
  /* 6805.vhd:1250:42  */
  assign n2838_o = n2835_o | n2837_o;
  /* 6805.vhd:1250:50  */
  assign n2840_o = opcode == 8'b11010111;
  /* 6805.vhd:1250:50  */
  assign n2841_o = n2838_o | n2840_o;
  /* 6805.vhd:1251:26  */
  assign n2843_o = opcode == 8'b11011111;
  /* 6805.vhd:1251:26  */
  assign n2844_o = n2841_o | n2843_o;
  /* 6805.vhd:1251:34  */
  assign n2846_o = opcode == 8'b11100111;
  /* 6805.vhd:1251:34  */
  assign n2847_o = n2844_o | n2846_o;
  /* 6805.vhd:1251:42  */
  assign n2849_o = opcode == 8'b11101111;
  /* 6805.vhd:1251:42  */
  assign n2850_o = n2847_o | n2849_o;
  /* 6805.vhd:1251:50  */
  assign n2852_o = opcode == 8'b11110111;
  /* 6805.vhd:1251:50  */
  assign n2853_o = n2850_o | n2852_o;
  /* 6805.vhd:1252:26  */
  assign n2855_o = opcode == 8'b11111111;
  /* 6805.vhd:1252:26  */
  assign n2856_o = n2853_o | n2855_o;
  /* 6805.vhd:1258:32  */
  assign n2858_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1256:15  */
  assign n2860_o = opcode == 8'b10000000;
  /* 6805.vhd:1256:26  */
  assign n2862_o = opcode == 8'b10000010;
  /* 6805.vhd:1256:26  */
  assign n2863_o = n2860_o | n2862_o;
  /* 6805.vhd:1261:32  */
  assign n2865_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1260:15  */
  assign n2870_o = opcode == 8'b10000011;
  /* 6805.vhd:1274:30  */
  assign n2871_o = rega - datain;
  /* 6805.vhd:1275:30  */
  assign n2872_o = rega - datain;
  /* 6805.vhd:1276:30  */
  assign n2873_o = n2872_o[7];
  /* 6805.vhd:1277:25  */
  assign n2875_o = n2872_o == 8'b00000000;
  /* 6805.vhd:1277:17  */
  assign n2878_o = n2875_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1282:36  */
  assign n2879_o = rega[7];
  /* 6805.vhd:1282:28  */
  assign n2880_o = ~n2879_o;
  /* 6805.vhd:1282:51  */
  assign n2881_o = datain[7];
  /* 6805.vhd:1282:41  */
  assign n2882_o = n2880_o & n2881_o;
  /* 6805.vhd:1283:33  */
  assign n2883_o = datain[7];
  /* 6805.vhd:1283:45  */
  assign n2884_o = n2872_o[7];
  /* 6805.vhd:1283:37  */
  assign n2885_o = n2883_o & n2884_o;
  /* 6805.vhd:1282:56  */
  assign n2886_o = n2882_o | n2885_o;
  /* 6805.vhd:1284:31  */
  assign n2887_o = n2872_o[7];
  /* 6805.vhd:1284:48  */
  assign n2888_o = rega[7];
  /* 6805.vhd:1284:40  */
  assign n2889_o = ~n2888_o;
  /* 6805.vhd:1284:35  */
  assign n2890_o = n2887_o & n2889_o;
  /* 6805.vhd:1283:50  */
  assign n2891_o = n2886_o | n2890_o;
  /* 6805.vhd:1285:27  */
  assign n2893_o = opcode == 8'b10100000;
  /* 6805.vhd:1286:34  */
  assign n2895_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1285:17  */
  assign n2896_o = n2893_o ? n2895_o : regpc;
  /* 6805.vhd:1272:15  */
  assign n2898_o = opcode == 8'b10100000;
  /* 6805.vhd:1272:26  */
  assign n2900_o = opcode == 8'b10110000;
  /* 6805.vhd:1272:26  */
  assign n2901_o = n2898_o | n2900_o;
  /* 6805.vhd:1272:34  */
  assign n2903_o = opcode == 8'b11000000;
  /* 6805.vhd:1272:34  */
  assign n2904_o = n2901_o | n2903_o;
  /* 6805.vhd:1272:42  */
  assign n2906_o = opcode == 8'b11010000;
  /* 6805.vhd:1272:42  */
  assign n2907_o = n2904_o | n2906_o;
  /* 6805.vhd:1272:50  */
  assign n2909_o = opcode == 8'b11100000;
  /* 6805.vhd:1272:50  */
  assign n2910_o = n2907_o | n2909_o;
  /* 6805.vhd:1272:58  */
  assign n2912_o = opcode == 8'b11110000;
  /* 6805.vhd:1272:58  */
  assign n2913_o = n2910_o | n2912_o;
  /* 6805.vhd:1291:30  */
  assign n2914_o = rega - datain;
  /* 6805.vhd:1292:30  */
  assign n2915_o = n2914_o[7];
  /* 6805.vhd:1293:25  */
  assign n2917_o = n2914_o == 8'b00000000;
  /* 6805.vhd:1293:17  */
  assign n2920_o = n2917_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1298:36  */
  assign n2921_o = rega[7];
  /* 6805.vhd:1298:28  */
  assign n2922_o = ~n2921_o;
  /* 6805.vhd:1298:51  */
  assign n2923_o = datain[7];
  /* 6805.vhd:1298:41  */
  assign n2924_o = n2922_o & n2923_o;
  /* 6805.vhd:1299:33  */
  assign n2925_o = datain[7];
  /* 6805.vhd:1299:45  */
  assign n2926_o = n2914_o[7];
  /* 6805.vhd:1299:37  */
  assign n2927_o = n2925_o & n2926_o;
  /* 6805.vhd:1298:56  */
  assign n2928_o = n2924_o | n2927_o;
  /* 6805.vhd:1300:31  */
  assign n2929_o = n2914_o[7];
  /* 6805.vhd:1300:48  */
  assign n2930_o = rega[7];
  /* 6805.vhd:1300:40  */
  assign n2931_o = ~n2930_o;
  /* 6805.vhd:1300:35  */
  assign n2932_o = n2929_o & n2931_o;
  /* 6805.vhd:1299:50  */
  assign n2933_o = n2928_o | n2932_o;
  /* 6805.vhd:1301:27  */
  assign n2935_o = opcode == 8'b10100001;
  /* 6805.vhd:1302:34  */
  assign n2937_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1301:17  */
  assign n2938_o = n2935_o ? n2937_o : regpc;
  /* 6805.vhd:1289:15  */
  assign n2940_o = opcode == 8'b10100001;
  /* 6805.vhd:1289:26  */
  assign n2942_o = opcode == 8'b10110001;
  /* 6805.vhd:1289:26  */
  assign n2943_o = n2940_o | n2942_o;
  /* 6805.vhd:1289:34  */
  assign n2945_o = opcode == 8'b11000001;
  /* 6805.vhd:1289:34  */
  assign n2946_o = n2943_o | n2945_o;
  /* 6805.vhd:1289:42  */
  assign n2948_o = opcode == 8'b11010001;
  /* 6805.vhd:1289:42  */
  assign n2949_o = n2946_o | n2948_o;
  /* 6805.vhd:1289:50  */
  assign n2951_o = opcode == 8'b11100001;
  /* 6805.vhd:1289:50  */
  assign n2952_o = n2949_o | n2951_o;
  /* 6805.vhd:1289:58  */
  assign n2954_o = opcode == 8'b11110001;
  /* 6805.vhd:1289:58  */
  assign n2955_o = n2952_o | n2954_o;
  /* 6805.vhd:1307:30  */
  assign n2956_o = rega - datain;
  /* 6805.vhd:1307:52  */
  assign n2958_o = {7'b0000000, flagc};
  /* 6805.vhd:1307:39  */
  assign n2959_o = n2956_o - n2958_o;
  /* 6805.vhd:1308:30  */
  assign n2960_o = rega - datain;
  /* 6805.vhd:1308:52  */
  assign n2962_o = {7'b0000000, flagc};
  /* 6805.vhd:1308:39  */
  assign n2963_o = n2960_o - n2962_o;
  /* 6805.vhd:1309:30  */
  assign n2964_o = n2963_o[7];
  /* 6805.vhd:1310:25  */
  assign n2966_o = n2963_o == 8'b00000000;
  /* 6805.vhd:1310:17  */
  assign n2969_o = n2966_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1315:36  */
  assign n2970_o = rega[7];
  /* 6805.vhd:1315:28  */
  assign n2971_o = ~n2970_o;
  /* 6805.vhd:1315:51  */
  assign n2972_o = datain[7];
  /* 6805.vhd:1315:41  */
  assign n2973_o = n2971_o & n2972_o;
  /* 6805.vhd:1316:33  */
  assign n2974_o = datain[7];
  /* 6805.vhd:1316:45  */
  assign n2975_o = n2963_o[7];
  /* 6805.vhd:1316:37  */
  assign n2976_o = n2974_o & n2975_o;
  /* 6805.vhd:1315:56  */
  assign n2977_o = n2973_o | n2976_o;
  /* 6805.vhd:1317:31  */
  assign n2978_o = n2963_o[7];
  /* 6805.vhd:1317:48  */
  assign n2979_o = rega[7];
  /* 6805.vhd:1317:40  */
  assign n2980_o = ~n2979_o;
  /* 6805.vhd:1317:35  */
  assign n2981_o = n2978_o & n2980_o;
  /* 6805.vhd:1316:50  */
  assign n2982_o = n2977_o | n2981_o;
  /* 6805.vhd:1318:27  */
  assign n2984_o = opcode == 8'b10100010;
  /* 6805.vhd:1319:34  */
  assign n2986_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1318:17  */
  assign n2987_o = n2984_o ? n2986_o : regpc;
  /* 6805.vhd:1305:15  */
  assign n2989_o = opcode == 8'b10100010;
  /* 6805.vhd:1305:26  */
  assign n2991_o = opcode == 8'b10110010;
  /* 6805.vhd:1305:26  */
  assign n2992_o = n2989_o | n2991_o;
  /* 6805.vhd:1305:34  */
  assign n2994_o = opcode == 8'b11000010;
  /* 6805.vhd:1305:34  */
  assign n2995_o = n2992_o | n2994_o;
  /* 6805.vhd:1305:42  */
  assign n2997_o = opcode == 8'b11010010;
  /* 6805.vhd:1305:42  */
  assign n2998_o = n2995_o | n2997_o;
  /* 6805.vhd:1305:50  */
  assign n3000_o = opcode == 8'b11100010;
  /* 6805.vhd:1305:50  */
  assign n3001_o = n2998_o | n3000_o;
  /* 6805.vhd:1305:58  */
  assign n3003_o = opcode == 8'b11110010;
  /* 6805.vhd:1305:58  */
  assign n3004_o = n3001_o | n3003_o;
  /* 6805.vhd:1324:30  */
  assign n3005_o = regx - datain;
  /* 6805.vhd:1325:30  */
  assign n3006_o = n3005_o[7];
  /* 6805.vhd:1326:25  */
  assign n3008_o = n3005_o == 8'b00000000;
  /* 6805.vhd:1326:17  */
  assign n3011_o = n3008_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1331:36  */
  assign n3012_o = regx[7];
  /* 6805.vhd:1331:28  */
  assign n3013_o = ~n3012_o;
  /* 6805.vhd:1331:51  */
  assign n3014_o = datain[7];
  /* 6805.vhd:1331:41  */
  assign n3015_o = n3013_o & n3014_o;
  /* 6805.vhd:1332:33  */
  assign n3016_o = datain[7];
  /* 6805.vhd:1332:45  */
  assign n3017_o = n3005_o[7];
  /* 6805.vhd:1332:37  */
  assign n3018_o = n3016_o & n3017_o;
  /* 6805.vhd:1331:56  */
  assign n3019_o = n3015_o | n3018_o;
  /* 6805.vhd:1333:31  */
  assign n3020_o = n3005_o[7];
  /* 6805.vhd:1333:48  */
  assign n3021_o = regx[7];
  /* 6805.vhd:1333:40  */
  assign n3022_o = ~n3021_o;
  /* 6805.vhd:1333:35  */
  assign n3023_o = n3020_o & n3022_o;
  /* 6805.vhd:1332:50  */
  assign n3024_o = n3019_o | n3023_o;
  /* 6805.vhd:1334:27  */
  assign n3026_o = opcode == 8'b10100011;
  /* 6805.vhd:1335:34  */
  assign n3028_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1334:17  */
  assign n3029_o = n3026_o ? n3028_o : regpc;
  /* 6805.vhd:1322:15  */
  assign n3031_o = opcode == 8'b10100011;
  /* 6805.vhd:1322:26  */
  assign n3033_o = opcode == 8'b10110011;
  /* 6805.vhd:1322:26  */
  assign n3034_o = n3031_o | n3033_o;
  /* 6805.vhd:1322:34  */
  assign n3036_o = opcode == 8'b11000011;
  /* 6805.vhd:1322:34  */
  assign n3037_o = n3034_o | n3036_o;
  /* 6805.vhd:1322:42  */
  assign n3039_o = opcode == 8'b11010011;
  /* 6805.vhd:1322:42  */
  assign n3040_o = n3037_o | n3039_o;
  /* 6805.vhd:1322:50  */
  assign n3042_o = opcode == 8'b11100011;
  /* 6805.vhd:1322:50  */
  assign n3043_o = n3040_o | n3042_o;
  /* 6805.vhd:1322:58  */
  assign n3045_o = opcode == 8'b11110011;
  /* 6805.vhd:1322:58  */
  assign n3046_o = n3043_o | n3045_o;
  /* 6805.vhd:1340:30  */
  assign n3047_o = rega & datain;
  /* 6805.vhd:1341:30  */
  assign n3048_o = rega & datain;
  /* 6805.vhd:1342:30  */
  assign n3049_o = n3048_o[7];
  /* 6805.vhd:1343:25  */
  assign n3051_o = n3048_o == 8'b00000000;
  /* 6805.vhd:1343:17  */
  assign n3054_o = n3051_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1348:27  */
  assign n3056_o = opcode == 8'b10100100;
  /* 6805.vhd:1349:34  */
  assign n3058_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1348:17  */
  assign n3059_o = n3056_o ? n3058_o : regpc;
  /* 6805.vhd:1338:15  */
  assign n3061_o = opcode == 8'b10100100;
  /* 6805.vhd:1338:26  */
  assign n3063_o = opcode == 8'b10110100;
  /* 6805.vhd:1338:26  */
  assign n3064_o = n3061_o | n3063_o;
  /* 6805.vhd:1338:34  */
  assign n3066_o = opcode == 8'b11000100;
  /* 6805.vhd:1338:34  */
  assign n3067_o = n3064_o | n3066_o;
  /* 6805.vhd:1338:42  */
  assign n3069_o = opcode == 8'b11010100;
  /* 6805.vhd:1338:42  */
  assign n3070_o = n3067_o | n3069_o;
  /* 6805.vhd:1338:50  */
  assign n3072_o = opcode == 8'b11100100;
  /* 6805.vhd:1338:50  */
  assign n3073_o = n3070_o | n3072_o;
  /* 6805.vhd:1338:58  */
  assign n3075_o = opcode == 8'b11110100;
  /* 6805.vhd:1338:58  */
  assign n3076_o = n3073_o | n3075_o;
  /* 6805.vhd:1354:30  */
  assign n3077_o = rega & datain;
  /* 6805.vhd:1355:30  */
  assign n3078_o = n3077_o[7];
  /* 6805.vhd:1356:25  */
  assign n3080_o = n3077_o == 8'b00000000;
  /* 6805.vhd:1356:17  */
  assign n3083_o = n3080_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1361:27  */
  assign n3085_o = opcode == 8'b10100101;
  /* 6805.vhd:1362:34  */
  assign n3087_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1361:17  */
  assign n3088_o = n3085_o ? n3087_o : regpc;
  /* 6805.vhd:1352:15  */
  assign n3090_o = opcode == 8'b10100101;
  /* 6805.vhd:1352:26  */
  assign n3092_o = opcode == 8'b10110101;
  /* 6805.vhd:1352:26  */
  assign n3093_o = n3090_o | n3092_o;
  /* 6805.vhd:1352:34  */
  assign n3095_o = opcode == 8'b11000101;
  /* 6805.vhd:1352:34  */
  assign n3096_o = n3093_o | n3095_o;
  /* 6805.vhd:1352:42  */
  assign n3098_o = opcode == 8'b11010101;
  /* 6805.vhd:1352:42  */
  assign n3099_o = n3096_o | n3098_o;
  /* 6805.vhd:1352:50  */
  assign n3101_o = opcode == 8'b11100101;
  /* 6805.vhd:1352:50  */
  assign n3102_o = n3099_o | n3101_o;
  /* 6805.vhd:1352:58  */
  assign n3104_o = opcode == 8'b11110101;
  /* 6805.vhd:1352:58  */
  assign n3105_o = n3102_o | n3104_o;
  /* 6805.vhd:1368:32  */
  assign n3106_o = datain[7];
  /* 6805.vhd:1369:27  */
  assign n3108_o = datain == 8'b00000000;
  /* 6805.vhd:1369:17  */
  assign n3111_o = n3108_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1374:27  */
  assign n3113_o = opcode == 8'b10100110;
  /* 6805.vhd:1375:34  */
  assign n3115_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1374:17  */
  assign n3116_o = n3113_o ? n3115_o : regpc;
  /* 6805.vhd:1365:15  */
  assign n3118_o = opcode == 8'b10100110;
  /* 6805.vhd:1365:26  */
  assign n3120_o = opcode == 8'b10110110;
  /* 6805.vhd:1365:26  */
  assign n3121_o = n3118_o | n3120_o;
  /* 6805.vhd:1365:34  */
  assign n3123_o = opcode == 8'b11000110;
  /* 6805.vhd:1365:34  */
  assign n3124_o = n3121_o | n3123_o;
  /* 6805.vhd:1365:42  */
  assign n3126_o = opcode == 8'b11010110;
  /* 6805.vhd:1365:42  */
  assign n3127_o = n3124_o | n3126_o;
  /* 6805.vhd:1365:50  */
  assign n3129_o = opcode == 8'b11100110;
  /* 6805.vhd:1365:50  */
  assign n3130_o = n3127_o | n3129_o;
  /* 6805.vhd:1365:58  */
  assign n3132_o = opcode == 8'b11110110;
  /* 6805.vhd:1365:58  */
  assign n3133_o = n3130_o | n3132_o;
  /* 6805.vhd:1380:30  */
  assign n3134_o = rega ^ datain;
  /* 6805.vhd:1381:30  */
  assign n3135_o = rega ^ datain;
  /* 6805.vhd:1382:30  */
  assign n3136_o = n3135_o[7];
  /* 6805.vhd:1383:25  */
  assign n3138_o = n3135_o == 8'b00000000;
  /* 6805.vhd:1383:17  */
  assign n3141_o = n3138_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1388:27  */
  assign n3143_o = opcode == 8'b10101000;
  /* 6805.vhd:1389:34  */
  assign n3145_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1388:17  */
  assign n3146_o = n3143_o ? n3145_o : regpc;
  /* 6805.vhd:1378:15  */
  assign n3148_o = opcode == 8'b10101000;
  /* 6805.vhd:1378:26  */
  assign n3150_o = opcode == 8'b10111000;
  /* 6805.vhd:1378:26  */
  assign n3151_o = n3148_o | n3150_o;
  /* 6805.vhd:1378:34  */
  assign n3153_o = opcode == 8'b11001000;
  /* 6805.vhd:1378:34  */
  assign n3154_o = n3151_o | n3153_o;
  /* 6805.vhd:1378:42  */
  assign n3156_o = opcode == 8'b11011000;
  /* 6805.vhd:1378:42  */
  assign n3157_o = n3154_o | n3156_o;
  /* 6805.vhd:1378:50  */
  assign n3159_o = opcode == 8'b11101000;
  /* 6805.vhd:1378:50  */
  assign n3160_o = n3157_o | n3159_o;
  /* 6805.vhd:1378:58  */
  assign n3162_o = opcode == 8'b11111000;
  /* 6805.vhd:1378:58  */
  assign n3163_o = n3160_o | n3162_o;
  /* 6805.vhd:1394:30  */
  assign n3164_o = rega + datain;
  /* 6805.vhd:1394:52  */
  assign n3166_o = {7'b0000000, flagc};
  /* 6805.vhd:1394:39  */
  assign n3167_o = n3164_o + n3166_o;
  /* 6805.vhd:1395:30  */
  assign n3168_o = rega + datain;
  /* 6805.vhd:1395:52  */
  assign n3170_o = {7'b0000000, flagc};
  /* 6805.vhd:1395:39  */
  assign n3171_o = n3168_o + n3170_o;
  /* 6805.vhd:1396:30  */
  assign n3172_o = n3171_o[7];
  /* 6805.vhd:1397:25  */
  assign n3174_o = n3171_o == 8'b00000000;
  /* 6805.vhd:1397:17  */
  assign n3177_o = n3174_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1402:31  */
  assign n3178_o = rega[3];
  /* 6805.vhd:1402:45  */
  assign n3179_o = datain[3];
  /* 6805.vhd:1402:35  */
  assign n3180_o = n3178_o & n3179_o;
  /* 6805.vhd:1403:33  */
  assign n3181_o = datain[3];
  /* 6805.vhd:1403:50  */
  assign n3182_o = n3171_o[3];
  /* 6805.vhd:1403:42  */
  assign n3183_o = ~n3182_o;
  /* 6805.vhd:1403:37  */
  assign n3184_o = n3181_o & n3183_o;
  /* 6805.vhd:1402:50  */
  assign n3185_o = n3180_o | n3184_o;
  /* 6805.vhd:1404:36  */
  assign n3186_o = n3171_o[3];
  /* 6805.vhd:1404:28  */
  assign n3187_o = ~n3186_o;
  /* 6805.vhd:1404:49  */
  assign n3188_o = rega[3];
  /* 6805.vhd:1404:41  */
  assign n3189_o = n3187_o & n3188_o;
  /* 6805.vhd:1403:56  */
  assign n3190_o = n3185_o | n3189_o;
  /* 6805.vhd:1405:31  */
  assign n3191_o = rega[7];
  /* 6805.vhd:1405:45  */
  assign n3192_o = datain[7];
  /* 6805.vhd:1405:35  */
  assign n3193_o = n3191_o & n3192_o;
  /* 6805.vhd:1406:33  */
  assign n3194_o = datain[7];
  /* 6805.vhd:1406:50  */
  assign n3195_o = n3171_o[7];
  /* 6805.vhd:1406:42  */
  assign n3196_o = ~n3195_o;
  /* 6805.vhd:1406:37  */
  assign n3197_o = n3194_o & n3196_o;
  /* 6805.vhd:1405:50  */
  assign n3198_o = n3193_o | n3197_o;
  /* 6805.vhd:1407:36  */
  assign n3199_o = n3171_o[7];
  /* 6805.vhd:1407:28  */
  assign n3200_o = ~n3199_o;
  /* 6805.vhd:1407:49  */
  assign n3201_o = rega[7];
  /* 6805.vhd:1407:41  */
  assign n3202_o = n3200_o & n3201_o;
  /* 6805.vhd:1406:56  */
  assign n3203_o = n3198_o | n3202_o;
  /* 6805.vhd:1408:27  */
  assign n3205_o = opcode == 8'b10101001;
  /* 6805.vhd:1409:34  */
  assign n3207_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1408:17  */
  assign n3208_o = n3205_o ? n3207_o : regpc;
  /* 6805.vhd:1392:15  */
  assign n3210_o = opcode == 8'b10101001;
  /* 6805.vhd:1392:26  */
  assign n3212_o = opcode == 8'b10111001;
  /* 6805.vhd:1392:26  */
  assign n3213_o = n3210_o | n3212_o;
  /* 6805.vhd:1392:34  */
  assign n3215_o = opcode == 8'b11001001;
  /* 6805.vhd:1392:34  */
  assign n3216_o = n3213_o | n3215_o;
  /* 6805.vhd:1392:42  */
  assign n3218_o = opcode == 8'b11011001;
  /* 6805.vhd:1392:42  */
  assign n3219_o = n3216_o | n3218_o;
  /* 6805.vhd:1392:50  */
  assign n3221_o = opcode == 8'b11101001;
  /* 6805.vhd:1392:50  */
  assign n3222_o = n3219_o | n3221_o;
  /* 6805.vhd:1392:58  */
  assign n3224_o = opcode == 8'b11111001;
  /* 6805.vhd:1392:58  */
  assign n3225_o = n3222_o | n3224_o;
  /* 6805.vhd:1414:30  */
  assign n3226_o = rega | datain;
  /* 6805.vhd:1415:30  */
  assign n3227_o = rega | datain;
  /* 6805.vhd:1416:30  */
  assign n3228_o = n3227_o[7];
  /* 6805.vhd:1417:25  */
  assign n3230_o = n3227_o == 8'b00000000;
  /* 6805.vhd:1417:17  */
  assign n3233_o = n3230_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1422:27  */
  assign n3235_o = opcode == 8'b10101010;
  /* 6805.vhd:1423:34  */
  assign n3237_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1422:17  */
  assign n3238_o = n3235_o ? n3237_o : regpc;
  /* 6805.vhd:1412:15  */
  assign n3240_o = opcode == 8'b10101010;
  /* 6805.vhd:1412:26  */
  assign n3242_o = opcode == 8'b10111010;
  /* 6805.vhd:1412:26  */
  assign n3243_o = n3240_o | n3242_o;
  /* 6805.vhd:1412:34  */
  assign n3245_o = opcode == 8'b11001010;
  /* 6805.vhd:1412:34  */
  assign n3246_o = n3243_o | n3245_o;
  /* 6805.vhd:1412:42  */
  assign n3248_o = opcode == 8'b11011010;
  /* 6805.vhd:1412:42  */
  assign n3249_o = n3246_o | n3248_o;
  /* 6805.vhd:1412:50  */
  assign n3251_o = opcode == 8'b11101010;
  /* 6805.vhd:1412:50  */
  assign n3252_o = n3249_o | n3251_o;
  /* 6805.vhd:1412:58  */
  assign n3254_o = opcode == 8'b11111010;
  /* 6805.vhd:1412:58  */
  assign n3255_o = n3252_o | n3254_o;
  /* 6805.vhd:1428:30  */
  assign n3256_o = rega + datain;
  /* 6805.vhd:1429:30  */
  assign n3257_o = rega + datain;
  /* 6805.vhd:1430:30  */
  assign n3258_o = n3257_o[7];
  /* 6805.vhd:1431:25  */
  assign n3260_o = n3257_o == 8'b00000000;
  /* 6805.vhd:1431:17  */
  assign n3263_o = n3260_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1436:31  */
  assign n3264_o = rega[3];
  /* 6805.vhd:1436:45  */
  assign n3265_o = datain[3];
  /* 6805.vhd:1436:35  */
  assign n3266_o = n3264_o & n3265_o;
  /* 6805.vhd:1437:33  */
  assign n3267_o = datain[3];
  /* 6805.vhd:1437:50  */
  assign n3268_o = n3257_o[3];
  /* 6805.vhd:1437:42  */
  assign n3269_o = ~n3268_o;
  /* 6805.vhd:1437:37  */
  assign n3270_o = n3267_o & n3269_o;
  /* 6805.vhd:1436:50  */
  assign n3271_o = n3266_o | n3270_o;
  /* 6805.vhd:1438:36  */
  assign n3272_o = n3257_o[3];
  /* 6805.vhd:1438:28  */
  assign n3273_o = ~n3272_o;
  /* 6805.vhd:1438:49  */
  assign n3274_o = rega[3];
  /* 6805.vhd:1438:41  */
  assign n3275_o = n3273_o & n3274_o;
  /* 6805.vhd:1437:56  */
  assign n3276_o = n3271_o | n3275_o;
  /* 6805.vhd:1439:31  */
  assign n3277_o = rega[7];
  /* 6805.vhd:1439:45  */
  assign n3278_o = datain[7];
  /* 6805.vhd:1439:35  */
  assign n3279_o = n3277_o & n3278_o;
  /* 6805.vhd:1440:33  */
  assign n3280_o = datain[7];
  /* 6805.vhd:1440:50  */
  assign n3281_o = n3257_o[7];
  /* 6805.vhd:1440:42  */
  assign n3282_o = ~n3281_o;
  /* 6805.vhd:1440:37  */
  assign n3283_o = n3280_o & n3282_o;
  /* 6805.vhd:1439:50  */
  assign n3284_o = n3279_o | n3283_o;
  /* 6805.vhd:1441:36  */
  assign n3285_o = n3257_o[7];
  /* 6805.vhd:1441:28  */
  assign n3286_o = ~n3285_o;
  /* 6805.vhd:1441:49  */
  assign n3287_o = rega[7];
  /* 6805.vhd:1441:41  */
  assign n3288_o = n3286_o & n3287_o;
  /* 6805.vhd:1440:56  */
  assign n3289_o = n3284_o | n3288_o;
  /* 6805.vhd:1442:27  */
  assign n3291_o = opcode == 8'b10101011;
  /* 6805.vhd:1443:34  */
  assign n3293_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1442:17  */
  assign n3294_o = n3291_o ? n3293_o : regpc;
  /* 6805.vhd:1426:15  */
  assign n3296_o = opcode == 8'b10101011;
  /* 6805.vhd:1426:26  */
  assign n3298_o = opcode == 8'b10111011;
  /* 6805.vhd:1426:26  */
  assign n3299_o = n3296_o | n3298_o;
  /* 6805.vhd:1426:34  */
  assign n3301_o = opcode == 8'b11001011;
  /* 6805.vhd:1426:34  */
  assign n3302_o = n3299_o | n3301_o;
  /* 6805.vhd:1426:42  */
  assign n3304_o = opcode == 8'b11011011;
  /* 6805.vhd:1426:42  */
  assign n3305_o = n3302_o | n3304_o;
  /* 6805.vhd:1426:50  */
  assign n3307_o = opcode == 8'b11101011;
  /* 6805.vhd:1426:50  */
  assign n3308_o = n3305_o | n3307_o;
  /* 6805.vhd:1426:58  */
  assign n3310_o = opcode == 8'b11111011;
  /* 6805.vhd:1426:58  */
  assign n3311_o = n3308_o | n3310_o;
  /* 6805.vhd:1449:32  */
  assign n3312_o = datain[7];
  /* 6805.vhd:1450:27  */
  assign n3314_o = datain == 8'b00000000;
  /* 6805.vhd:1450:17  */
  assign n3317_o = n3314_o ? 1'b1 : 1'b0;
  /* 6805.vhd:1455:27  */
  assign n3319_o = opcode == 8'b10101110;
  /* 6805.vhd:1456:34  */
  assign n3321_o = regpc + 16'b0000000000000001;
  /* 6805.vhd:1455:17  */
  assign n3322_o = n3319_o ? n3321_o : regpc;
  /* 6805.vhd:1446:15  */
  assign n3324_o = opcode == 8'b10101110;
  /* 6805.vhd:1446:26  */
  assign n3326_o = opcode == 8'b10111110;
  /* 6805.vhd:1446:26  */
  assign n3327_o = n3324_o | n3326_o;
  /* 6805.vhd:1446:34  */
  assign n3329_o = opcode == 8'b11001110;
  /* 6805.vhd:1446:34  */
  assign n3330_o = n3327_o | n3329_o;
  /* 6805.vhd:1446:42  */
  assign n3332_o = opcode == 8'b11011110;
  /* 6805.vhd:1446:42  */
  assign n3333_o = n3330_o | n3332_o;
  /* 6805.vhd:1446:50  */
  assign n3335_o = opcode == 8'b11101110;
  /* 6805.vhd:1446:50  */
  assign n3336_o = n3333_o | n3335_o;
  /* 6805.vhd:1446:58  */
  assign n3338_o = opcode == 8'b11111110;
  /* 6805.vhd:1446:58  */
  assign n3339_o = n3336_o | n3338_o;
  /* 6805.vhd:1462:24  */
  assign n3340_o = help[7];
  /* 6805.vhd:1462:28  */
  assign n3341_o = ~n3340_o;
  /* 6805.vhd:1463:43  */
  assign n3343_o = {8'b00000000, help};
  /* 6805.vhd:1463:34  */
  assign n3344_o = regpc + n3343_o;
  /* 6805.vhd:1465:43  */
  assign n3346_o = {8'b11111111, help};
  /* 6805.vhd:1465:34  */
  assign n3347_o = regpc + n3346_o;
  /* 6805.vhd:1462:17  */
  assign n3348_o = n3341_o ? n3344_o : n3347_o;
  /* 6805.vhd:1467:32  */
  assign n3350_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1459:15  */
  assign n3352_o = opcode == 8'b10101101;
  /* 6805.vhd:1472:32  */
  assign n3354_o = {8'b00000000, help};
  /* 6805.vhd:1473:32  */
  assign n3356_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1469:15  */
  assign n3358_o = opcode == 8'b10111101;
  /* 6805.vhd:1476:32  */
  assign n3360_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1475:15  */
  assign n3362_o = opcode == 8'b11001101;
  /* 6805.vhd:1475:26  */
  assign n3364_o = opcode == 8'b11011101;
  /* 6805.vhd:1475:26  */
  assign n3365_o = n3362_o | n3364_o;
  /* 6805.vhd:1482:33  */
  assign n3367_o = {8'b00000000, help};
  /* 6805.vhd:1482:50  */
  assign n3369_o = {8'b00000000, regx};
  /* 6805.vhd:1482:41  */
  assign n3370_o = n3367_o + n3369_o;
  /* 6805.vhd:1483:32  */
  assign n3372_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1479:15  */
  assign n3374_o = opcode == 8'b11101101;
  /* 6805.vhd:1488:33  */
  assign n3376_o = {8'b00000000, regx};
  /* 6805.vhd:1489:32  */
  assign n3378_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1485:15  */
  assign n3380_o = opcode == 8'b11111101;
  assign n3381_o = {n3380_o, n3374_o, n3365_o, n3358_o, n3352_o, n3339_o, n3311_o, n3255_o, n3225_o, n3163_o, n3133_o, n3105_o, n3076_o, n3046_o, n3004_o, n2955_o, n2913_o, n2870_o, n2863_o, n2856_o, n2698_o};
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3387_o = 1'b1;
      21'b010000000000000000000: n3387_o = 1'b1;
      21'b001000000000000000000: n3387_o = n3828_q;
      21'b000100000000000000000: n3387_o = 1'b1;
      21'b000010000000000000000: n3387_o = 1'b1;
      21'b000001000000000000000: n3387_o = n3828_q;
      21'b000000100000000000000: n3387_o = n3828_q;
      21'b000000010000000000000: n3387_o = n3828_q;
      21'b000000001000000000000: n3387_o = n3828_q;
      21'b000000000100000000000: n3387_o = n3828_q;
      21'b000000000010000000000: n3387_o = n3828_q;
      21'b000000000001000000000: n3387_o = n3828_q;
      21'b000000000000100000000: n3387_o = n3828_q;
      21'b000000000000010000000: n3387_o = n3828_q;
      21'b000000000000001000000: n3387_o = n3828_q;
      21'b000000000000000100000: n3387_o = n3828_q;
      21'b000000000000000010000: n3387_o = n3828_q;
      21'b000000000000000001000: n3387_o = n3828_q;
      21'b000000000000000000100: n3387_o = n3828_q;
      21'b000000000000000000010: n3387_o = 1'b1;
      21'b000000000000000000001: n3387_o = n3828_q;
      default: n3387_o = n3828_q;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3388_o = rega;
      21'b010000000000000000000: n3388_o = rega;
      21'b001000000000000000000: n3388_o = rega;
      21'b000100000000000000000: n3388_o = rega;
      21'b000010000000000000000: n3388_o = rega;
      21'b000001000000000000000: n3388_o = rega;
      21'b000000100000000000000: n3388_o = n3256_o;
      21'b000000010000000000000: n3388_o = n3226_o;
      21'b000000001000000000000: n3388_o = n3167_o;
      21'b000000000100000000000: n3388_o = n3134_o;
      21'b000000000010000000000: n3388_o = datain;
      21'b000000000001000000000: n3388_o = rega;
      21'b000000000000100000000: n3388_o = n3047_o;
      21'b000000000000010000000: n3388_o = rega;
      21'b000000000000001000000: n3388_o = n2959_o;
      21'b000000000000000100000: n3388_o = rega;
      21'b000000000000000010000: n3388_o = n2871_o;
      21'b000000000000000001000: n3388_o = rega;
      21'b000000000000000000100: n3388_o = rega;
      21'b000000000000000000010: n3388_o = rega;
      21'b000000000000000000001: n3388_o = rega;
      default: n3388_o = rega;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3389_o = regx;
      21'b010000000000000000000: n3389_o = regx;
      21'b001000000000000000000: n3389_o = regx;
      21'b000100000000000000000: n3389_o = regx;
      21'b000010000000000000000: n3389_o = regx;
      21'b000001000000000000000: n3389_o = datain;
      21'b000000100000000000000: n3389_o = regx;
      21'b000000010000000000000: n3389_o = regx;
      21'b000000001000000000000: n3389_o = regx;
      21'b000000000100000000000: n3389_o = regx;
      21'b000000000010000000000: n3389_o = regx;
      21'b000000000001000000000: n3389_o = regx;
      21'b000000000000100000000: n3389_o = regx;
      21'b000000000000010000000: n3389_o = regx;
      21'b000000000000001000000: n3389_o = regx;
      21'b000000000000000100000: n3389_o = regx;
      21'b000000000000000010000: n3389_o = regx;
      21'b000000000000000001000: n3389_o = regx;
      21'b000000000000000000100: n3389_o = datain;
      21'b000000000000000000010: n3389_o = regx;
      21'b000000000000000000001: n3389_o = regx;
      default: n3389_o = regx;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3390_o = n3378_o;
      21'b010000000000000000000: n3390_o = n3372_o;
      21'b001000000000000000000: n3390_o = n3360_o;
      21'b000100000000000000000: n3390_o = n3356_o;
      21'b000010000000000000000: n3390_o = n3350_o;
      21'b000001000000000000000: n3390_o = regsp;
      21'b000000100000000000000: n3390_o = regsp;
      21'b000000010000000000000: n3390_o = regsp;
      21'b000000001000000000000: n3390_o = regsp;
      21'b000000000100000000000: n3390_o = regsp;
      21'b000000000010000000000: n3390_o = regsp;
      21'b000000000001000000000: n3390_o = regsp;
      21'b000000000000100000000: n3390_o = regsp;
      21'b000000000000010000000: n3390_o = regsp;
      21'b000000000000001000000: n3390_o = regsp;
      21'b000000000000000100000: n3390_o = regsp;
      21'b000000000000000010000: n3390_o = regsp;
      21'b000000000000000001000: n3390_o = n2865_o;
      21'b000000000000000000100: n3390_o = n2858_o;
      21'b000000000000000000010: n3390_o = regsp;
      21'b000000000000000000001: n3390_o = regsp;
      default: n3390_o = regsp;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3391_o = n3376_o;
      21'b010000000000000000000: n3391_o = n3370_o;
      21'b001000000000000000000: n3391_o = regpc;
      21'b000100000000000000000: n3391_o = n3354_o;
      21'b000010000000000000000: n3391_o = n3348_o;
      21'b000001000000000000000: n3391_o = n3322_o;
      21'b000000100000000000000: n3391_o = n3294_o;
      21'b000000010000000000000: n3391_o = n3238_o;
      21'b000000001000000000000: n3391_o = n3208_o;
      21'b000000000100000000000: n3391_o = n3146_o;
      21'b000000000010000000000: n3391_o = n3116_o;
      21'b000000000001000000000: n3391_o = n3088_o;
      21'b000000000000100000000: n3391_o = n3059_o;
      21'b000000000000010000000: n3391_o = n3029_o;
      21'b000000000000001000000: n3391_o = n2987_o;
      21'b000000000000000100000: n3391_o = n2938_o;
      21'b000000000000000010000: n3391_o = n2896_o;
      21'b000000000000000001000: n3391_o = regpc;
      21'b000000000000000000100: n3391_o = regpc;
      21'b000000000000000000010: n3391_o = regpc;
      21'b000000000000000000001: n3391_o = n2651_o;
      default: n3391_o = regpc;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3392_o = flagh;
      21'b010000000000000000000: n3392_o = flagh;
      21'b001000000000000000000: n3392_o = flagh;
      21'b000100000000000000000: n3392_o = flagh;
      21'b000010000000000000000: n3392_o = flagh;
      21'b000001000000000000000: n3392_o = flagh;
      21'b000000100000000000000: n3392_o = n3276_o;
      21'b000000010000000000000: n3392_o = flagh;
      21'b000000001000000000000: n3392_o = n3190_o;
      21'b000000000100000000000: n3392_o = flagh;
      21'b000000000010000000000: n3392_o = flagh;
      21'b000000000001000000000: n3392_o = flagh;
      21'b000000000000100000000: n3392_o = flagh;
      21'b000000000000010000000: n3392_o = flagh;
      21'b000000000000001000000: n3392_o = flagh;
      21'b000000000000000100000: n3392_o = flagh;
      21'b000000000000000010000: n3392_o = flagh;
      21'b000000000000000001000: n3392_o = flagh;
      21'b000000000000000000100: n3392_o = flagh;
      21'b000000000000000000010: n3392_o = flagh;
      21'b000000000000000000001: n3392_o = flagh;
      default: n3392_o = flagh;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3393_o = flagn;
      21'b010000000000000000000: n3393_o = flagn;
      21'b001000000000000000000: n3393_o = flagn;
      21'b000100000000000000000: n3393_o = flagn;
      21'b000010000000000000000: n3393_o = flagn;
      21'b000001000000000000000: n3393_o = n3312_o;
      21'b000000100000000000000: n3393_o = n3258_o;
      21'b000000010000000000000: n3393_o = n3228_o;
      21'b000000001000000000000: n3393_o = n3172_o;
      21'b000000000100000000000: n3393_o = n3136_o;
      21'b000000000010000000000: n3393_o = n3106_o;
      21'b000000000001000000000: n3393_o = n3078_o;
      21'b000000000000100000000: n3393_o = n3049_o;
      21'b000000000000010000000: n3393_o = n3006_o;
      21'b000000000000001000000: n3393_o = n2964_o;
      21'b000000000000000100000: n3393_o = n2915_o;
      21'b000000000000000010000: n3393_o = n2873_o;
      21'b000000000000000001000: n3393_o = flagn;
      21'b000000000000000000100: n3393_o = flagn;
      21'b000000000000000000010: n3393_o = flagn;
      21'b000000000000000000001: n3393_o = flagn;
      default: n3393_o = flagn;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3394_o = flagz;
      21'b010000000000000000000: n3394_o = flagz;
      21'b001000000000000000000: n3394_o = flagz;
      21'b000100000000000000000: n3394_o = flagz;
      21'b000010000000000000000: n3394_o = flagz;
      21'b000001000000000000000: n3394_o = n3317_o;
      21'b000000100000000000000: n3394_o = n3263_o;
      21'b000000010000000000000: n3394_o = n3233_o;
      21'b000000001000000000000: n3394_o = n3177_o;
      21'b000000000100000000000: n3394_o = n3141_o;
      21'b000000000010000000000: n3394_o = n3111_o;
      21'b000000000001000000000: n3394_o = n3083_o;
      21'b000000000000100000000: n3394_o = n3054_o;
      21'b000000000000010000000: n3394_o = n3011_o;
      21'b000000000000001000000: n3394_o = n2969_o;
      21'b000000000000000100000: n3394_o = n2920_o;
      21'b000000000000000010000: n3394_o = n2878_o;
      21'b000000000000000001000: n3394_o = flagz;
      21'b000000000000000000100: n3394_o = flagz;
      21'b000000000000000000010: n3394_o = flagz;
      21'b000000000000000000001: n3394_o = flagz;
      default: n3394_o = flagz;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3395_o = flagc;
      21'b010000000000000000000: n3395_o = flagc;
      21'b001000000000000000000: n3395_o = flagc;
      21'b000100000000000000000: n3395_o = flagc;
      21'b000010000000000000000: n3395_o = flagc;
      21'b000001000000000000000: n3395_o = flagc;
      21'b000000100000000000000: n3395_o = n3289_o;
      21'b000000010000000000000: n3395_o = flagc;
      21'b000000001000000000000: n3395_o = n3203_o;
      21'b000000000100000000000: n3395_o = flagc;
      21'b000000000010000000000: n3395_o = flagc;
      21'b000000000001000000000: n3395_o = flagc;
      21'b000000000000100000000: n3395_o = flagc;
      21'b000000000000010000000: n3395_o = n3024_o;
      21'b000000000000001000000: n3395_o = n2982_o;
      21'b000000000000000100000: n3395_o = n2933_o;
      21'b000000000000000010000: n3395_o = n2891_o;
      21'b000000000000000001000: n3395_o = flagc;
      21'b000000000000000000100: n3395_o = flagc;
      21'b000000000000000000010: n3395_o = flagc;
      21'b000000000000000000001: n3395_o = flagc;
      default: n3395_o = flagc;
    endcase
  assign n3396_o = help[0];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3397_o = n3396_o;
      21'b010000000000000000000: n3397_o = n3396_o;
      21'b001000000000000000000: n3397_o = n3396_o;
      21'b000100000000000000000: n3397_o = n3396_o;
      21'b000010000000000000000: n3397_o = n3396_o;
      21'b000001000000000000000: n3397_o = n3396_o;
      21'b000000100000000000000: n3397_o = n3396_o;
      21'b000000010000000000000: n3397_o = n3396_o;
      21'b000000001000000000000: n3397_o = n3396_o;
      21'b000000000100000000000: n3397_o = n3396_o;
      21'b000000000010000000000: n3397_o = n3396_o;
      21'b000000000001000000000: n3397_o = n3396_o;
      21'b000000000000100000000: n3397_o = n3396_o;
      21'b000000000000010000000: n3397_o = n3396_o;
      21'b000000000000001000000: n3397_o = n3396_o;
      21'b000000000000000100000: n3397_o = n3396_o;
      21'b000000000000000010000: n3397_o = n3396_o;
      21'b000000000000000001000: n3397_o = flagc;
      21'b000000000000000000100: n3397_o = n3396_o;
      21'b000000000000000000010: n3397_o = n3396_o;
      21'b000000000000000000001: n3397_o = n3396_o;
      default: n3397_o = n3396_o;
    endcase
  assign n3398_o = help[1];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3399_o = n3398_o;
      21'b010000000000000000000: n3399_o = n3398_o;
      21'b001000000000000000000: n3399_o = n3398_o;
      21'b000100000000000000000: n3399_o = n3398_o;
      21'b000010000000000000000: n3399_o = n3398_o;
      21'b000001000000000000000: n3399_o = n3398_o;
      21'b000000100000000000000: n3399_o = n3398_o;
      21'b000000010000000000000: n3399_o = n3398_o;
      21'b000000001000000000000: n3399_o = n3398_o;
      21'b000000000100000000000: n3399_o = n3398_o;
      21'b000000000010000000000: n3399_o = n3398_o;
      21'b000000000001000000000: n3399_o = n3398_o;
      21'b000000000000100000000: n3399_o = n3398_o;
      21'b000000000000010000000: n3399_o = n3398_o;
      21'b000000000000001000000: n3399_o = n3398_o;
      21'b000000000000000100000: n3399_o = n3398_o;
      21'b000000000000000010000: n3399_o = n3398_o;
      21'b000000000000000001000: n3399_o = flagz;
      21'b000000000000000000100: n3399_o = n3398_o;
      21'b000000000000000000010: n3399_o = n3398_o;
      21'b000000000000000000001: n3399_o = n3398_o;
      default: n3399_o = n3398_o;
    endcase
  assign n3400_o = help[2];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3401_o = n3400_o;
      21'b010000000000000000000: n3401_o = n3400_o;
      21'b001000000000000000000: n3401_o = n3400_o;
      21'b000100000000000000000: n3401_o = n3400_o;
      21'b000010000000000000000: n3401_o = n3400_o;
      21'b000001000000000000000: n3401_o = n3400_o;
      21'b000000100000000000000: n3401_o = n3400_o;
      21'b000000010000000000000: n3401_o = n3400_o;
      21'b000000001000000000000: n3401_o = n3400_o;
      21'b000000000100000000000: n3401_o = n3400_o;
      21'b000000000010000000000: n3401_o = n3400_o;
      21'b000000000001000000000: n3401_o = n3400_o;
      21'b000000000000100000000: n3401_o = n3400_o;
      21'b000000000000010000000: n3401_o = n3400_o;
      21'b000000000000001000000: n3401_o = n3400_o;
      21'b000000000000000100000: n3401_o = n3400_o;
      21'b000000000000000010000: n3401_o = n3400_o;
      21'b000000000000000001000: n3401_o = flagn;
      21'b000000000000000000100: n3401_o = n3400_o;
      21'b000000000000000000010: n3401_o = n3400_o;
      21'b000000000000000000001: n3401_o = n3400_o;
      default: n3401_o = n3400_o;
    endcase
  assign n3402_o = help[3];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
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
      21'b000000000000000001000: n3403_o = flagi;
      21'b000000000000000000100: n3403_o = n3402_o;
      21'b000000000000000000010: n3403_o = n3402_o;
      21'b000000000000000000001: n3403_o = n3402_o;
      default: n3403_o = n3402_o;
    endcase
  assign n3404_o = help[4];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
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
      21'b000000000000000001000: n3405_o = flagh;
      21'b000000000000000000100: n3405_o = n3404_o;
      21'b000000000000000000010: n3405_o = n3404_o;
      21'b000000000000000000001: n3405_o = n3404_o;
      default: n3405_o = n3404_o;
    endcase
  assign n3406_o = help[5];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
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
      21'b000000000000000001000: n3407_o = 1'b1;
      21'b000000000000000000100: n3407_o = n3406_o;
      21'b000000000000000000010: n3407_o = n3406_o;
      21'b000000000000000000001: n3407_o = n3406_o;
      default: n3407_o = n3406_o;
    endcase
  assign n3408_o = help[6];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
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
      21'b000000000000000001000: n3409_o = 1'b1;
      21'b000000000000000000100: n3409_o = n3408_o;
      21'b000000000000000000010: n3409_o = n3408_o;
      21'b000000000000000000001: n3409_o = n3408_o;
      default: n3409_o = n3408_o;
    endcase
  assign n3410_o = help[7];
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
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
      21'b000000000000000001000: n3411_o = 1'b1;
      21'b000000000000000000100: n3411_o = n3410_o;
      21'b000000000000000000010: n3411_o = n3410_o;
      21'b000000000000000000001: n3411_o = n3410_o;
      default: n3411_o = n3410_o;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3434_o = 4'b0010;
      21'b010000000000000000000: n3434_o = 4'b0010;
      21'b001000000000000000000: n3434_o = 4'b0110;
      21'b000100000000000000000: n3434_o = 4'b0010;
      21'b000010000000000000000: n3434_o = 4'b0010;
      21'b000001000000000000000: n3434_o = 4'b0010;
      21'b000000100000000000000: n3434_o = 4'b0010;
      21'b000000010000000000000: n3434_o = 4'b0010;
      21'b000000001000000000000: n3434_o = 4'b0010;
      21'b000000000100000000000: n3434_o = 4'b0010;
      21'b000000000010000000000: n3434_o = 4'b0010;
      21'b000000000001000000000: n3434_o = 4'b0010;
      21'b000000000000100000000: n3434_o = 4'b0010;
      21'b000000000000010000000: n3434_o = 4'b0010;
      21'b000000000000001000000: n3434_o = 4'b0010;
      21'b000000000000000100000: n3434_o = 4'b0010;
      21'b000000000000000010000: n3434_o = 4'b0010;
      21'b000000000000000001000: n3434_o = 4'b0110;
      21'b000000000000000000100: n3434_o = 4'b0110;
      21'b000000000000000000010: n3434_o = 4'b0010;
      21'b000000000000000000001: n3434_o = 4'b0010;
      default: n3434_o = 4'b0000;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3453_o = 3'b000;
      21'b010000000000000000000: n3453_o = 3'b000;
      21'b001000000000000000000: n3453_o = addrmux;
      21'b000100000000000000000: n3453_o = 3'b000;
      21'b000010000000000000000: n3453_o = 3'b000;
      21'b000001000000000000000: n3453_o = 3'b000;
      21'b000000100000000000000: n3453_o = 3'b000;
      21'b000000010000000000000: n3453_o = 3'b000;
      21'b000000001000000000000: n3453_o = 3'b000;
      21'b000000000100000000000: n3453_o = 3'b000;
      21'b000000000010000000000: n3453_o = 3'b000;
      21'b000000000001000000000: n3453_o = 3'b000;
      21'b000000000000100000000: n3453_o = 3'b000;
      21'b000000000000010000000: n3453_o = 3'b000;
      21'b000000000000001000000: n3453_o = 3'b000;
      21'b000000000000000100000: n3453_o = 3'b000;
      21'b000000000000000010000: n3453_o = 3'b000;
      21'b000000000000000001000: n3453_o = addrmux;
      21'b000000000000000000100: n3453_o = addrmux;
      21'b000000000000000000010: n3453_o = 3'b000;
      21'b000000000000000000001: n3453_o = 3'b000;
      default: n3453_o = addrmux;
    endcase
  /* 6805.vhd:1228:13  */
  always @*
    case (n3381_o)
      21'b100000000000000000000: n3456_o = datamux;
      21'b010000000000000000000: n3456_o = datamux;
      21'b001000000000000000000: n3456_o = 4'b0110;
      21'b000100000000000000000: n3456_o = datamux;
      21'b000010000000000000000: n3456_o = datamux;
      21'b000001000000000000000: n3456_o = datamux;
      21'b000000100000000000000: n3456_o = datamux;
      21'b000000010000000000000: n3456_o = datamux;
      21'b000000001000000000000: n3456_o = datamux;
      21'b000000000100000000000: n3456_o = datamux;
      21'b000000000010000000000: n3456_o = datamux;
      21'b000000000001000000000: n3456_o = datamux;
      21'b000000000000100000000: n3456_o = datamux;
      21'b000000000000010000000: n3456_o = datamux;
      21'b000000000000001000000: n3456_o = datamux;
      21'b000000000000000100000: n3456_o = datamux;
      21'b000000000000000010000: n3456_o = datamux;
      21'b000000000000000001000: n3456_o = 4'b0010;
      21'b000000000000000000100: n3456_o = datamux;
      21'b000000000000000000010: n3456_o = datamux;
      21'b000000000000000000001: n3456_o = datamux;
      default: n3456_o = datamux;
    endcase
  /* 6805.vhd:1227:11  */
  assign n3459_o = mainfsm == 4'b0101;
  /* 6805.vhd:1500:32  */
  assign n3461_o = regsp + 16'b0000000000000001;
  /* 6805.vhd:1498:15  */
  assign n3463_o = opcode == 8'b10000000;
  /* 6805.vhd:1498:26  */
  assign n3465_o = opcode == 8'b10000010;
  /* 6805.vhd:1498:26  */
  assign n3466_o = n3463_o | n3465_o;
  /* 6805.vhd:1503:32  */
  assign n3468_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1502:15  */
  assign n3470_o = opcode == 8'b10000011;
  /* 6805.vhd:1509:32  */
  assign n3472_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1506:15  */
  assign n3474_o = opcode == 8'b11001101;
  /* 6805.vhd:1515:32  */
  assign n3476_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1516:40  */
  assign n3478_o = {8'b00000000, regx};
  /* 6805.vhd:1516:31  */
  assign n3479_o = temp + n3478_o;
  /* 6805.vhd:1512:15  */
  assign n3481_o = opcode == 8'b11011101;
  assign n3482_o = {n3481_o, n3474_o, n3470_o, n3466_o};
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3485_o = 1'b1;
      4'b0100: n3485_o = 1'b1;
      4'b0010: n3485_o = n3828_q;
      4'b0001: n3485_o = n3828_q;
      default: n3485_o = n3828_q;
    endcase
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3486_o = n3476_o;
      4'b0100: n3486_o = n3472_o;
      4'b0010: n3486_o = n3468_o;
      4'b0001: n3486_o = n3461_o;
      default: n3486_o = regsp;
    endcase
  assign n3487_o = temp[7:0];
  assign n3488_o = n3479_o[7:0];
  assign n3489_o = regpc[7:0];
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3490_o = n3488_o;
      4'b0100: n3490_o = n3487_o;
      4'b0010: n3490_o = n3489_o;
      4'b0001: n3490_o = n3489_o;
      default: n3490_o = n3489_o;
    endcase
  assign n3491_o = temp[15:8];
  assign n3492_o = n3479_o[15:8];
  assign n3493_o = regpc[15:8];
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3494_o = n3492_o;
      4'b0100: n3494_o = n3491_o;
      4'b0010: n3494_o = n3493_o;
      4'b0001: n3494_o = datain;
      default: n3494_o = n3493_o;
    endcase
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3500_o = 4'b0010;
      4'b0100: n3500_o = 4'b0010;
      4'b0010: n3500_o = 4'b0111;
      4'b0001: n3500_o = 4'b0111;
      default: n3500_o = 4'b0000;
    endcase
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3503_o = 3'b000;
      4'b0100: n3503_o = 3'b000;
      4'b0010: n3503_o = addrmux;
      4'b0001: n3503_o = addrmux;
      default: n3503_o = addrmux;
    endcase
  /* 6805.vhd:1497:13  */
  always @*
    case (n3482_o)
      4'b1000: n3505_o = datamux;
      4'b0100: n3505_o = datamux;
      4'b0010: n3505_o = 4'b0000;
      4'b0001: n3505_o = datamux;
      default: n3505_o = datamux;
    endcase
  /* 6805.vhd:1496:11  */
  assign n3507_o = mainfsm == 4'b0110;
  /* 6805.vhd:1525:15  */
  assign n3509_o = opcode == 8'b10000000;
  /* 6805.vhd:1525:26  */
  assign n3511_o = opcode == 8'b10000010;
  /* 6805.vhd:1525:26  */
  assign n3512_o = n3509_o | n3511_o;
  /* 6805.vhd:1530:34  */
  assign n3514_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1533:26  */
  assign n3515_o = ~trace;
  /* 6805.vhd:1537:19  */
  assign n3518_o = timerirqrequest ? 16'b0001111111111000 : 16'b0001111111111100;
  /* 6805.vhd:1537:19  */
  assign n3520_o = timerirqrequest ? 1'b0 : n111_o;
  /* 6805.vhd:1534:19  */
  assign n3522_o = extirqrequest ? 16'b0001111111111010 : n3518_o;
  /* 6805.vhd:1533:17  */
  assign n3524_o = n3531_o ? 1'b0 : n106_o;
  /* 6805.vhd:1534:19  */
  assign n3525_o = extirqrequest ? n111_o : n3520_o;
  /* 6805.vhd:1533:17  */
  assign n3527_o = n3515_o ? n3522_o : 16'b0001111111111000;
  /* 6805.vhd:1533:17  */
  assign n3530_o = n3515_o ? 4'b1000 : 4'b1011;
  /* 6805.vhd:1533:17  */
  assign n3531_o = extirqrequest & n3515_o;
  /* 6805.vhd:1533:17  */
  assign n3532_o = n3515_o ? n3525_o : n111_o;
  /* 6805.vhd:1529:15  */
  assign n3534_o = opcode == 8'b10000011;
  assign n3535_o = {n3534_o, n3512_o};
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3536_o = n3514_o;
      2'b01: n3536_o = regsp;
      default: n3536_o = regsp;
    endcase
  assign n3537_o = regpc[7:0];
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3538_o = n3537_o;
      2'b01: n3538_o = datain;
      default: n3538_o = n3537_o;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3540_o = 1'b1;
      2'b01: n3540_o = flagi;
      default: n3540_o = flagi;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3541_o = n3527_o;
      2'b01: n3541_o = temp;
      default: n3541_o = temp;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3544_o = n3530_o;
      2'b01: n3544_o = 4'b0010;
      default: n3544_o = 4'b0000;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3546_o = addrmux;
      2'b01: n3546_o = 3'b000;
      default: n3546_o = addrmux;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3548_o = 4'b1001;
      2'b01: n3548_o = datamux;
      default: n3548_o = datamux;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3549_o = n3524_o;
      2'b01: n3549_o = n106_o;
      default: n3549_o = n106_o;
    endcase
  /* 6805.vhd:1524:13  */
  always @*
    case (n3535_o)
      2'b10: n3550_o = n3532_o;
      2'b01: n3550_o = n111_o;
      default: n3550_o = n111_o;
    endcase
  /* 6805.vhd:1523:11  */
  assign n3552_o = mainfsm == 4'b0111;
  /* 6805.vhd:1558:34  */
  assign n3554_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1555:15  */
  assign n3556_o = opcode == 8'b10000011;
  /* 6805.vhd:1554:13  */
  always @*
    case (n3556_o)
      1'b1: n3558_o = 1'b1;
      default: n3558_o = n3828_q;
    endcase
  /* 6805.vhd:1554:13  */
  always @*
    case (n3556_o)
      1'b1: n3559_o = n3554_o;
      default: n3559_o = regsp;
    endcase
  /* 6805.vhd:1554:13  */
  always @*
    case (n3556_o)
      1'b1: n3562_o = 4'b1001;
      default: n3562_o = 4'b0000;
    endcase
  /* 6805.vhd:1554:13  */
  always @*
    case (n3556_o)
      1'b1: n3564_o = 3'b011;
      default: n3564_o = addrmux;
    endcase
  /* 6805.vhd:1553:11  */
  assign n3566_o = mainfsm == 4'b1000;
  /* 6805.vhd:1568:30  */
  assign n3568_o = temp + 16'b0000000000000001;
  /* 6805.vhd:1566:15  */
  assign n3570_o = opcode == 8'b10000011;
  assign n3571_o = regpc[15:8];
  /* 6805.vhd:1565:13  */
  always @*
    case (n3570_o)
      1'b1: n3572_o = datain;
      default: n3572_o = n3571_o;
    endcase
  /* 6805.vhd:1565:13  */
  always @*
    case (n3570_o)
      1'b1: n3573_o = n3568_o;
      default: n3573_o = temp;
    endcase
  /* 6805.vhd:1565:13  */
  always @*
    case (n3570_o)
      1'b1: n3576_o = 4'b1010;
      default: n3576_o = 4'b0000;
    endcase
  /* 6805.vhd:1564:11  */
  assign n3578_o = mainfsm == 4'b1001;
  /* 6805.vhd:1576:15  */
  assign n3580_o = opcode == 8'b10000011;
  assign n3581_o = regpc[7:0];
  /* 6805.vhd:1575:13  */
  always @*
    case (n3580_o)
      1'b1: n3582_o = datain;
      default: n3582_o = n3581_o;
    endcase
  /* 6805.vhd:1575:13  */
  always @*
    case (n3580_o)
      1'b1: n3585_o = 4'b0010;
      default: n3585_o = 4'b0000;
    endcase
  /* 6805.vhd:1575:13  */
  always @*
    case (n3580_o)
      1'b1: n3587_o = 3'b000;
      default: n3587_o = addrmux;
    endcase
  /* 6805.vhd:1574:11  */
  assign n3589_o = mainfsm == 4'b1010;
  /* 6805.vhd:1585:30  */
  assign n3591_o = regsp - 16'b0000000000000001;
  /* 6805.vhd:1584:11  */
  assign n3593_o = mainfsm == 4'b1011;
  assign n3594_o = {n3593_o, n3589_o, n3578_o, n3566_o, n3552_o, n3507_o, n3459_o, n2633_o, n1961_o, n1312_o, n117_o, n115_o};
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3595_o = n3828_q;
      12'b010000000000: n3595_o = n3828_q;
      12'b001000000000: n3595_o = n3828_q;
      12'b000100000000: n3595_o = n3558_o;
      12'b000010000000: n3595_o = n3828_q;
      12'b000001000000: n3595_o = n3485_o;
      12'b000000100000: n3595_o = n3387_o;
      12'b000000010000: n3595_o = n2530_o;
      12'b000000001000: n3595_o = n1861_o;
      12'b000000000100: n3595_o = n1289_o;
      12'b000000000010: n3595_o = n3828_q;
      12'b000000000001: n3595_o = n3828_q;
      default: n3595_o = n3828_q;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3596_o = rega;
      12'b010000000000: n3596_o = rega;
      12'b001000000000: n3596_o = rega;
      12'b000100000000: n3596_o = rega;
      12'b000010000000: n3596_o = rega;
      12'b000001000000: n3596_o = rega;
      12'b000000100000: n3596_o = n3388_o;
      12'b000000010000: n3596_o = n2531_o;
      12'b000000001000: n3596_o = rega;
      12'b000000000100: n3596_o = n1290_o;
      12'b000000000010: n3596_o = rega;
      12'b000000000001: n3596_o = rega;
      default: n3596_o = rega;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3597_o = regx;
      12'b010000000000: n3597_o = regx;
      12'b001000000000: n3597_o = regx;
      12'b000100000000: n3597_o = regx;
      12'b000010000000: n3597_o = regx;
      12'b000001000000: n3597_o = regx;
      12'b000000100000: n3597_o = n3389_o;
      12'b000000010000: n3597_o = regx;
      12'b000000001000: n3597_o = regx;
      12'b000000000100: n3597_o = n1291_o;
      12'b000000000010: n3597_o = regx;
      12'b000000000001: n3597_o = regx;
      default: n3597_o = regx;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3598_o = n3591_o;
      12'b010000000000: n3598_o = regsp;
      12'b001000000000: n3598_o = regsp;
      12'b000100000000: n3598_o = n3559_o;
      12'b000010000000: n3598_o = n3536_o;
      12'b000001000000: n3598_o = n3486_o;
      12'b000000100000: n3598_o = n3390_o;
      12'b000000010000: n3598_o = n2532_o;
      12'b000000001000: n3598_o = n1862_o;
      12'b000000000100: n3598_o = n1292_o;
      12'b000000000010: n3598_o = regsp;
      12'b000000000001: n3598_o = regsp;
      default: n3598_o = regsp;
    endcase
  assign n3599_o = n1293_o[7:0];
  assign n3600_o = n3391_o[7:0];
  assign n3601_o = regpc[7:0];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3602_o = n3601_o;
      12'b010000000000: n3602_o = n3582_o;
      12'b001000000000: n3602_o = n3601_o;
      12'b000100000000: n3602_o = n3601_o;
      12'b000010000000: n3602_o = n3538_o;
      12'b000001000000: n3602_o = n3490_o;
      12'b000000100000: n3602_o = n3600_o;
      12'b000000010000: n3602_o = n2545_o;
      12'b000000001000: n3602_o = n1883_o;
      12'b000000000100: n3602_o = n3599_o;
      12'b000000000010: n3602_o = datain;
      12'b000000000001: n3602_o = n3601_o;
      default: n3602_o = n3601_o;
    endcase
  assign n3603_o = n1293_o[15:8];
  assign n3604_o = n3391_o[15:8];
  assign n3605_o = regpc[15:8];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3606_o = n3605_o;
      12'b010000000000: n3606_o = n3605_o;
      12'b001000000000: n3606_o = n3572_o;
      12'b000100000000: n3606_o = n3605_o;
      12'b000010000000: n3606_o = n3605_o;
      12'b000001000000: n3606_o = n3494_o;
      12'b000000100000: n3606_o = n3604_o;
      12'b000000010000: n3606_o = n2558_o;
      12'b000000001000: n3606_o = n1904_o;
      12'b000000000100: n3606_o = n3603_o;
      12'b000000000010: n3606_o = n3605_o;
      12'b000000000001: n3606_o = datain;
      default: n3606_o = n3605_o;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3607_o = flagh;
      12'b010000000000: n3607_o = flagh;
      12'b001000000000: n3607_o = flagh;
      12'b000100000000: n3607_o = flagh;
      12'b000010000000: n3607_o = flagh;
      12'b000001000000: n3607_o = flagh;
      12'b000000100000: n3607_o = n3392_o;
      12'b000000010000: n3607_o = flagh;
      12'b000000001000: n3607_o = n1905_o;
      12'b000000000100: n3607_o = n1294_o;
      12'b000000000010: n3607_o = flagh;
      12'b000000000001: n3607_o = flagh;
      default: n3607_o = flagh;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3608_o = flagi;
      12'b010000000000: n3608_o = flagi;
      12'b001000000000: n3608_o = flagi;
      12'b000100000000: n3608_o = flagi;
      12'b000010000000: n3608_o = n3540_o;
      12'b000001000000: n3608_o = flagi;
      12'b000000100000: n3608_o = flagi;
      12'b000000010000: n3608_o = flagi;
      12'b000000001000: n3608_o = n1906_o;
      12'b000000000100: n3608_o = n1295_o;
      12'b000000000010: n3608_o = flagi;
      12'b000000000001: n3608_o = flagi;
      default: n3608_o = flagi;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3609_o = flagn;
      12'b010000000000: n3609_o = flagn;
      12'b001000000000: n3609_o = flagn;
      12'b000100000000: n3609_o = flagn;
      12'b000010000000: n3609_o = flagn;
      12'b000001000000: n3609_o = flagn;
      12'b000000100000: n3609_o = n3393_o;
      12'b000000010000: n3609_o = n2560_o;
      12'b000000001000: n3609_o = n1908_o;
      12'b000000000100: n3609_o = n1296_o;
      12'b000000000010: n3609_o = flagn;
      12'b000000000001: n3609_o = flagn;
      default: n3609_o = flagn;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3610_o = flagz;
      12'b010000000000: n3610_o = flagz;
      12'b001000000000: n3610_o = flagz;
      12'b000100000000: n3610_o = flagz;
      12'b000010000000: n3610_o = flagz;
      12'b000001000000: n3610_o = flagz;
      12'b000000100000: n3610_o = n3394_o;
      12'b000000010000: n3610_o = n2561_o;
      12'b000000001000: n3610_o = n1910_o;
      12'b000000000100: n3610_o = n1297_o;
      12'b000000000010: n3610_o = flagz;
      12'b000000000001: n3610_o = flagz;
      default: n3610_o = flagz;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3611_o = flagc;
      12'b010000000000: n3611_o = flagc;
      12'b001000000000: n3611_o = flagc;
      12'b000100000000: n3611_o = flagc;
      12'b000010000000: n3611_o = flagc;
      12'b000001000000: n3611_o = flagc;
      12'b000000100000: n3611_o = n3395_o;
      12'b000000010000: n3611_o = n2563_o;
      12'b000000001000: n3611_o = n1911_o;
      12'b000000000100: n3611_o = n1298_o;
      12'b000000000010: n3611_o = flagc;
      12'b000000000001: n3611_o = flagc;
      default: n3611_o = flagc;
    endcase
  assign n3612_o = n1299_o[0];
  assign n3613_o = n1913_o[0];
  assign n3614_o = n2564_o[0];
  assign n3615_o = help[0];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3616_o = n3615_o;
      12'b010000000000: n3616_o = n3615_o;
      12'b001000000000: n3616_o = n3615_o;
      12'b000100000000: n3616_o = n3615_o;
      12'b000010000000: n3616_o = n3615_o;
      12'b000001000000: n3616_o = n3615_o;
      12'b000000100000: n3616_o = n3397_o;
      12'b000000010000: n3616_o = n3614_o;
      12'b000000001000: n3616_o = n3613_o;
      12'b000000000100: n3616_o = n3612_o;
      12'b000000000010: n3616_o = n3615_o;
      12'b000000000001: n3616_o = n3615_o;
      default: n3616_o = n3615_o;
    endcase
  assign n3617_o = n1299_o[1];
  assign n3618_o = n1913_o[1];
  assign n3619_o = n2564_o[1];
  assign n3620_o = help[1];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3621_o = n3620_o;
      12'b010000000000: n3621_o = n3620_o;
      12'b001000000000: n3621_o = n3620_o;
      12'b000100000000: n3621_o = n3620_o;
      12'b000010000000: n3621_o = n3620_o;
      12'b000001000000: n3621_o = n3620_o;
      12'b000000100000: n3621_o = n3399_o;
      12'b000000010000: n3621_o = n3619_o;
      12'b000000001000: n3621_o = n3618_o;
      12'b000000000100: n3621_o = n3617_o;
      12'b000000000010: n3621_o = n3620_o;
      12'b000000000001: n3621_o = n3620_o;
      default: n3621_o = n3620_o;
    endcase
  assign n3622_o = n1299_o[2];
  assign n3623_o = n1913_o[2];
  assign n3624_o = n2564_o[2];
  assign n3625_o = help[2];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3626_o = n3625_o;
      12'b010000000000: n3626_o = n3625_o;
      12'b001000000000: n3626_o = n3625_o;
      12'b000100000000: n3626_o = n3625_o;
      12'b000010000000: n3626_o = n3625_o;
      12'b000001000000: n3626_o = n3625_o;
      12'b000000100000: n3626_o = n3401_o;
      12'b000000010000: n3626_o = n3624_o;
      12'b000000001000: n3626_o = n3623_o;
      12'b000000000100: n3626_o = n3622_o;
      12'b000000000010: n3626_o = n3625_o;
      12'b000000000001: n3626_o = n3625_o;
      default: n3626_o = n3625_o;
    endcase
  assign n3627_o = n1299_o[3];
  assign n3628_o = n1913_o[3];
  assign n3629_o = n2564_o[3];
  assign n3630_o = help[3];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3631_o = n3630_o;
      12'b010000000000: n3631_o = n3630_o;
      12'b001000000000: n3631_o = n3630_o;
      12'b000100000000: n3631_o = n3630_o;
      12'b000010000000: n3631_o = n3630_o;
      12'b000001000000: n3631_o = n3630_o;
      12'b000000100000: n3631_o = n3403_o;
      12'b000000010000: n3631_o = n3629_o;
      12'b000000001000: n3631_o = n3628_o;
      12'b000000000100: n3631_o = n3627_o;
      12'b000000000010: n3631_o = n3630_o;
      12'b000000000001: n3631_o = n3630_o;
      default: n3631_o = n3630_o;
    endcase
  assign n3632_o = n1299_o[4];
  assign n3633_o = n1913_o[4];
  assign n3634_o = n2564_o[4];
  assign n3635_o = help[4];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3636_o = n3635_o;
      12'b010000000000: n3636_o = n3635_o;
      12'b001000000000: n3636_o = n3635_o;
      12'b000100000000: n3636_o = n3635_o;
      12'b000010000000: n3636_o = n3635_o;
      12'b000001000000: n3636_o = n3635_o;
      12'b000000100000: n3636_o = n3405_o;
      12'b000000010000: n3636_o = n3634_o;
      12'b000000001000: n3636_o = n3633_o;
      12'b000000000100: n3636_o = n3632_o;
      12'b000000000010: n3636_o = n3635_o;
      12'b000000000001: n3636_o = n3635_o;
      default: n3636_o = n3635_o;
    endcase
  assign n3637_o = n1299_o[5];
  assign n3638_o = n1913_o[5];
  assign n3639_o = n2564_o[5];
  assign n3640_o = help[5];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3641_o = n3640_o;
      12'b010000000000: n3641_o = n3640_o;
      12'b001000000000: n3641_o = n3640_o;
      12'b000100000000: n3641_o = n3640_o;
      12'b000010000000: n3641_o = n3640_o;
      12'b000001000000: n3641_o = n3640_o;
      12'b000000100000: n3641_o = n3407_o;
      12'b000000010000: n3641_o = n3639_o;
      12'b000000001000: n3641_o = n3638_o;
      12'b000000000100: n3641_o = n3637_o;
      12'b000000000010: n3641_o = n3640_o;
      12'b000000000001: n3641_o = n3640_o;
      default: n3641_o = n3640_o;
    endcase
  assign n3642_o = n1299_o[6];
  assign n3643_o = n1913_o[6];
  assign n3644_o = n2564_o[6];
  assign n3645_o = help[6];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3646_o = n3645_o;
      12'b010000000000: n3646_o = n3645_o;
      12'b001000000000: n3646_o = n3645_o;
      12'b000100000000: n3646_o = n3645_o;
      12'b000010000000: n3646_o = n3645_o;
      12'b000001000000: n3646_o = n3645_o;
      12'b000000100000: n3646_o = n3409_o;
      12'b000000010000: n3646_o = n3644_o;
      12'b000000001000: n3646_o = n3643_o;
      12'b000000000100: n3646_o = n3642_o;
      12'b000000000010: n3646_o = n3645_o;
      12'b000000000001: n3646_o = n3645_o;
      default: n3646_o = n3645_o;
    endcase
  assign n3647_o = n1299_o[7];
  assign n3648_o = n1913_o[7];
  assign n3649_o = n2564_o[7];
  assign n3650_o = help[7];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3651_o = n3650_o;
      12'b010000000000: n3651_o = n3650_o;
      12'b001000000000: n3651_o = n3650_o;
      12'b000100000000: n3651_o = n3650_o;
      12'b000010000000: n3651_o = n3650_o;
      12'b000001000000: n3651_o = n3650_o;
      12'b000000100000: n3651_o = n3411_o;
      12'b000000010000: n3651_o = n3649_o;
      12'b000000001000: n3651_o = n3648_o;
      12'b000000000100: n3651_o = n3647_o;
      12'b000000000010: n3651_o = n3650_o;
      12'b000000000001: n3651_o = n3650_o;
      default: n3651_o = n3650_o;
    endcase
  assign n3652_o = n113_o[7:0];
  assign n3653_o = n1300_o[7:0];
  assign n3654_o = n3541_o[7:0];
  assign n3655_o = n3573_o[7:0];
  assign n3656_o = temp[7:0];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3657_o = n3656_o;
      12'b010000000000: n3657_o = n3656_o;
      12'b001000000000: n3657_o = n3655_o;
      12'b000100000000: n3657_o = n3656_o;
      12'b000010000000: n3657_o = n3654_o;
      12'b000001000000: n3657_o = n3656_o;
      12'b000000100000: n3657_o = n3656_o;
      12'b000000010000: n3657_o = n2566_o;
      12'b000000001000: n3657_o = n1916_o;
      12'b000000000100: n3657_o = n3653_o;
      12'b000000000010: n3657_o = n3656_o;
      12'b000000000001: n3657_o = n3652_o;
      default: n3657_o = n3656_o;
    endcase
  assign n3658_o = n113_o[15:8];
  assign n3659_o = n1300_o[15:8];
  assign n3660_o = n3541_o[15:8];
  assign n3661_o = n3573_o[15:8];
  assign n3662_o = temp[15:8];
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3663_o = n3662_o;
      12'b010000000000: n3663_o = n3662_o;
      12'b001000000000: n3663_o = n3661_o;
      12'b000100000000: n3663_o = n3662_o;
      12'b000010000000: n3663_o = n3660_o;
      12'b000001000000: n3663_o = n3662_o;
      12'b000000100000: n3663_o = n3662_o;
      12'b000000010000: n3663_o = n3662_o;
      12'b000000001000: n3663_o = n1919_o;
      12'b000000000100: n3663_o = n3659_o;
      12'b000000000010: n3663_o = n3662_o;
      12'b000000000001: n3663_o = n3658_o;
      default: n3663_o = n3662_o;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3668_o = 4'b1000;
      12'b010000000000: n3668_o = n3585_o;
      12'b001000000000: n3668_o = n3576_o;
      12'b000100000000: n3668_o = n3562_o;
      12'b000010000000: n3668_o = n3544_o;
      12'b000001000000: n3668_o = n3500_o;
      12'b000000100000: n3668_o = n3434_o;
      12'b000000010000: n3668_o = n2597_o;
      12'b000000001000: n3668_o = n1944_o;
      12'b000000000100: n3668_o = n1302_o;
      12'b000000000010: n3668_o = 4'b0010;
      12'b000000000001: n3668_o = 4'b0001;
      default: n3668_o = 4'b0000;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3670_o = addrmux;
      12'b010000000000: n3670_o = n3587_o;
      12'b001000000000: n3670_o = addrmux;
      12'b000100000000: n3670_o = n3564_o;
      12'b000010000000: n3670_o = n3546_o;
      12'b000001000000: n3670_o = n3503_o;
      12'b000000100000: n3670_o = n3453_o;
      12'b000000010000: n3670_o = n2609_o;
      12'b000000001000: n3670_o = n1953_o;
      12'b000000000100: n3670_o = n1304_o;
      12'b000000000010: n3670_o = 3'b000;
      12'b000000000001: n3670_o = addrmux;
      default: n3670_o = addrmux;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3672_o = 4'b1010;
      12'b010000000000: n3672_o = datamux;
      12'b001000000000: n3672_o = datamux;
      12'b000100000000: n3672_o = datamux;
      12'b000010000000: n3672_o = n3548_o;
      12'b000001000000: n3672_o = n3505_o;
      12'b000000100000: n3672_o = n3456_o;
      12'b000000010000: n3672_o = n2630_o;
      12'b000000001000: n3672_o = n1959_o;
      12'b000000000100: n3672_o = n1305_o;
      12'b000000000010: n3672_o = datamux;
      12'b000000000001: n3672_o = datamux;
      default: n3672_o = datamux;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3673_o = opcode;
      12'b010000000000: n3673_o = opcode;
      12'b001000000000: n3673_o = opcode;
      12'b000100000000: n3673_o = opcode;
      12'b000010000000: n3673_o = opcode;
      12'b000001000000: n3673_o = opcode;
      12'b000000100000: n3673_o = opcode;
      12'b000000010000: n3673_o = opcode;
      12'b000000001000: n3673_o = opcode;
      12'b000000000100: n3673_o = n1307_o;
      12'b000000000010: n3673_o = opcode;
      12'b000000000001: n3673_o = opcode;
      default: n3673_o = opcode;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3674_o = n106_o;
      12'b010000000000: n3674_o = n106_o;
      12'b001000000000: n3674_o = n106_o;
      12'b000100000000: n3674_o = n106_o;
      12'b000010000000: n3674_o = n3549_o;
      12'b000001000000: n3674_o = n106_o;
      12'b000000100000: n3674_o = n106_o;
      12'b000000010000: n3674_o = n106_o;
      12'b000000001000: n3674_o = n106_o;
      12'b000000000100: n3674_o = n106_o;
      12'b000000000010: n3674_o = n106_o;
      12'b000000000001: n3674_o = n106_o;
      default: n3674_o = n106_o;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3675_o = n111_o;
      12'b010000000000: n3675_o = n111_o;
      12'b001000000000: n3675_o = n111_o;
      12'b000100000000: n3675_o = n111_o;
      12'b000010000000: n3675_o = n3550_o;
      12'b000001000000: n3675_o = n111_o;
      12'b000000100000: n3675_o = n111_o;
      12'b000000010000: n3675_o = n111_o;
      12'b000000001000: n3675_o = n111_o;
      12'b000000000100: n3675_o = n111_o;
      12'b000000000010: n3675_o = n111_o;
      12'b000000000001: n3675_o = n111_o;
      default: n3675_o = n111_o;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3677_o = 1'b0;
      12'b010000000000: n3677_o = trace;
      12'b001000000000: n3677_o = trace;
      12'b000100000000: n3677_o = trace;
      12'b000010000000: n3677_o = trace;
      12'b000001000000: n3677_o = trace;
      12'b000000100000: n3677_o = trace;
      12'b000000010000: n3677_o = trace;
      12'b000000001000: n3677_o = trace;
      12'b000000000100: n3677_o = trace_i;
      12'b000000000010: n3677_o = trace;
      12'b000000000001: n3677_o = trace;
      default: n3677_o = trace;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3679_o = 1'b0;
      12'b010000000000: n3679_o = trace_i;
      12'b001000000000: n3679_o = trace_i;
      12'b000100000000: n3679_o = trace_i;
      12'b000010000000: n3679_o = trace_i;
      12'b000001000000: n3679_o = trace_i;
      12'b000000100000: n3679_o = trace_i;
      12'b000000010000: n3679_o = trace_i;
      12'b000000001000: n3679_o = trace_i;
      12'b000000000100: n3679_o = n1308_o;
      12'b000000000010: n3679_o = trace_i;
      12'b000000000001: n3679_o = trace_i;
      default: n3679_o = trace_i;
    endcase
  /* 6805.vhd:297:9  */
  always @*
    case (n3594_o)
      12'b100000000000: n3680_o = traceopcode;
      12'b010000000000: n3680_o = traceopcode;
      12'b001000000000: n3680_o = traceopcode;
      12'b000100000000: n3680_o = traceopcode;
      12'b000010000000: n3680_o = traceopcode;
      12'b000001000000: n3680_o = traceopcode;
      12'b000000100000: n3680_o = traceopcode;
      12'b000000010000: n3680_o = traceopcode;
      12'b000000001000: n3680_o = traceopcode;
      12'b000000000100: n3680_o = n1309_o;
      12'b000000000010: n3680_o = traceopcode;
      12'b000000000001: n3680_o = traceopcode;
      default: n3680_o = traceopcode;
    endcase
  assign n3686_o = {n3606_o, n3602_o};
  assign n3693_o = {n3651_o, n3646_o, n3641_o, n3636_o, n3631_o, n3626_o, n3621_o, n3616_o};
  assign n3695_o = {n3663_o, n3657_o};
  /* 6805.vhd:296:7  */
  assign n3701_o = clken ? n3674_o : n106_o;
  /* 6805.vhd:296:7  */
  assign n3702_o = clken ? n3675_o : n111_o;
  /* 6805.vhd:260:5  */
  assign n3781_o = {8'b11111110, 8'b11111101, 8'b11111011, 8'b11110111, 8'b11101111, 8'b11011111, 8'b10111111, 8'b01111111};
  assign n3782_o = {8'b00000001, 8'b00000010, 8'b00000100, 8'b00001000, 8'b00010000, 8'b00100000, 8'b01000000, 8'b10000000};
  /* 6805.vhd:284:7  */
  assign n3783_o = clken ? n3596_o : rega;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3784_q <= 8'b00000000;
    else
      n3784_q <= n3783_o;
  /* 6805.vhd:284:7  */
  assign n3785_o = clken ? n3597_o : regx;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3786_q <= 8'b00000000;
    else
      n3786_q <= n3785_o;
  /* 6805.vhd:284:7  */
  assign n3787_o = clken ? n3598_o : regsp;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3788_q <= 16'b0000000011111111;
    else
      n3788_q <= n3787_o;
  /* 6805.vhd:284:7  */
  assign n3789_o = clken ? n3686_o : regpc;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3790_q <= 16'b0001111111111110;
    else
      n3790_q <= n3789_o;
  /* 6805.vhd:284:7  */
  assign n3791_o = clken ? n3607_o : flagh;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3792_q <= 1'b0;
    else
      n3792_q <= n3791_o;
  /* 6805.vhd:284:7  */
  assign n3793_o = clken ? n3608_o : flagi;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3794_q <= 1'b1;
    else
      n3794_q <= n3793_o;
  /* 6805.vhd:284:7  */
  assign n3795_o = clken ? n3609_o : flagn;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3796_q <= 1'b0;
    else
      n3796_q <= n3795_o;
  /* 6805.vhd:284:7  */
  assign n3797_o = clken ? n3610_o : flagz;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3798_q <= 1'b0;
    else
      n3798_q <= n3797_o;
  /* 6805.vhd:284:7  */
  assign n3799_o = clken ? n3611_o : flagc;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3800_q <= 1'b0;
    else
      n3800_q <= n3799_o;
  /* 6805.vhd:284:7  */
  assign n3801_o = clken ? n3693_o : help;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3802_q <= 8'b00000000;
    else
      n3802_q <= n3801_o;
  /* 6805.vhd:284:7  */
  assign n3803_o = clken ? n3695_o : temp;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3804_q <= 16'b0001111111111110;
    else
      n3804_q <= n3803_o;
  /* 6805.vhd:284:7  */
  assign n3805_o = clken ? n3668_o : mainfsm;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3806_q <= 4'b0000;
    else
      n3806_q <= n3805_o;
  /* 6805.vhd:284:7  */
  assign n3807_o = clken ? n3670_o : addrmux;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3808_q <= 3'b011;
    else
      n3808_q <= n3807_o;
  /* 6805.vhd:284:7  */
  assign n3809_o = clken ? n3672_o : datamux;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3810_q <= 4'b0000;
    else
      n3810_q <= n3809_o;
  /* 6805.vhd:256:3  */
  assign n3811_o = ~n100_o;
  /* 6805.vhd:256:3  */
  assign n3812_o = clken & n3811_o;
  /* 6805.vhd:284:7  */
  assign n3813_o = n3812_o ? n3673_o : opcode;
  /* 6805.vhd:284:7  */
  always @(posedge clk)
    n3814_q <= n3813_o;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3815_q <= 1'b1;
    else
      n3815_q <= extirq;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3816_q <= 1'b1;
    else
      n3816_q <= timerirq;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3817_q <= 1'b0;
    else
      n3817_q <= n3701_o;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3818_q <= 1'b0;
    else
      n3818_q <= n3702_o;
  /* 6805.vhd:284:7  */
  assign n3819_o = clken ? n3677_o : trace;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3820_q <= 1'b0;
    else
      n3820_q <= n3819_o;
  /* 6805.vhd:284:7  */
  assign n3821_o = clken ? n3679_o : trace_i;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3822_q <= 1'b0;
    else
      n3822_q <= n3821_o;
  /* 6805.vhd:256:3  */
  assign n3823_o = ~n100_o;
  /* 6805.vhd:256:3  */
  assign n3824_o = clken & n3823_o;
  /* 6805.vhd:284:7  */
  assign n3825_o = n3824_o ? n3680_o : traceopcode;
  /* 6805.vhd:284:7  */
  always @(posedge clk)
    n3826_q <= n3825_o;
  /* 6805.vhd:284:7  */
  assign n3827_o = clken ? n3595_o : n3828_q;
  /* 6805.vhd:284:7  */
  always @(posedge clk or posedge n100_o)
    if (n100_o)
      n3828_q <= 1'b1;
    else
      n3828_q <= n3827_o;
  /* 6805.vhd:213:13  */
  assign n3829_o = mask1[7:0];
  /* 6805.vhd:210:3  */
  assign n3830_o = mask1[15:8];
  /* 6805.vhd:145:6  */
  assign n3831_o = mask1[23:16];
  /* 6805.vhd:144:6  */
  assign n3832_o = mask1[31:24];
  /* 6805.vhd:142:6  */
  assign n3833_o = mask1[39:32];
  /* 6805.vhd:141:6  */
  assign n3834_o = mask1[47:40];
  /* 6805.vhd:284:7  */
  assign n3835_o = mask1[55:48];
  /* 6805.vhd:284:7  */
  assign n3836_o = mask1[63:56];
  /* 6805.vhd:937:37  */
  assign n3837_o = n1965_o[1:0];
  /* 6805.vhd:937:37  */
  always @*
    case (n3837_o)
      2'b00: n3838_o = n3829_o;
      2'b01: n3838_o = n3830_o;
      2'b10: n3838_o = n3831_o;
      2'b11: n3838_o = n3832_o;
    endcase
  /* 6805.vhd:937:37  */
  assign n3839_o = n1965_o[1:0];
  /* 6805.vhd:937:37  */
  always @*
    case (n3839_o)
      2'b00: n3840_o = n3833_o;
      2'b01: n3840_o = n3834_o;
      2'b10: n3840_o = n3835_o;
      2'b11: n3840_o = n3836_o;
    endcase
  /* 6805.vhd:937:37  */
  assign n3841_o = n1965_o[2];
  /* 6805.vhd:937:37  */
  assign n3842_o = n3841_o ? n3840_o : n3838_o;
  /* 6805.vhd:937:37  */
  assign n3843_o = mask1[7:0];
  /* 6805.vhd:937:38  */
  assign n3844_o = mask1[15:8];
  /* 6805.vhd:284:7  */
  assign n3845_o = mask1[23:16];
  /* 6805.vhd:284:7  */
  assign n3846_o = mask1[31:24];
  /* 6805.vhd:284:7  */
  assign n3847_o = mask1[39:32];
  /* 6805.vhd:284:7  */
  assign n3848_o = mask1[47:40];
  /* 6805.vhd:284:7  */
  assign n3849_o = mask1[55:48];
  /* 6805.vhd:284:7  */
  assign n3850_o = mask1[63:56];
  /* 6805.vhd:949:43  */
  assign n3851_o = n2026_o[1:0];
  /* 6805.vhd:949:43  */
  always @*
    case (n3851_o)
      2'b00: n3852_o = n3843_o;
      2'b01: n3852_o = n3844_o;
      2'b10: n3852_o = n3845_o;
      2'b11: n3852_o = n3846_o;
    endcase
  /* 6805.vhd:949:43  */
  assign n3853_o = n2026_o[1:0];
  /* 6805.vhd:949:43  */
  always @*
    case (n3853_o)
      2'b00: n3854_o = n3847_o;
      2'b01: n3854_o = n3848_o;
      2'b10: n3854_o = n3849_o;
      2'b11: n3854_o = n3850_o;
    endcase
  /* 6805.vhd:949:43  */
  assign n3855_o = n2026_o[2];
  /* 6805.vhd:949:43  */
  assign n3856_o = n3855_o ? n3854_o : n3852_o;
  /* 6805.vhd:949:43  */
  assign n3857_o = mask0[7:0];
  /* 6805.vhd:949:44  */
  assign n3858_o = mask0[15:8];
  /* 6805.vhd:284:7  */
  assign n3859_o = mask0[23:16];
  /* 6805.vhd:284:7  */
  assign n3860_o = mask0[31:24];
  /* 6805.vhd:284:7  */
  assign n3861_o = mask0[39:32];
  /* 6805.vhd:284:7  */
  assign n3862_o = mask0[47:40];
  /* 6805.vhd:284:7  */
  assign n3863_o = mask0[55:48];
  /* 6805.vhd:297:9  */
  assign n3864_o = mask0[63:56];
  /* 6805.vhd:951:43  */
  assign n3865_o = n2033_o[1:0];
  /* 6805.vhd:951:43  */
  always @*
    case (n3865_o)
      2'b00: n3866_o = n3857_o;
      2'b01: n3866_o = n3858_o;
      2'b10: n3866_o = n3859_o;
      2'b11: n3866_o = n3860_o;
    endcase
  /* 6805.vhd:951:43  */
  assign n3867_o = n2033_o[1:0];
  /* 6805.vhd:951:43  */
  always @*
    case (n3867_o)
      2'b00: n3868_o = n3861_o;
      2'b01: n3868_o = n3862_o;
      2'b10: n3868_o = n3863_o;
      2'b11: n3868_o = n3864_o;
    endcase
  /* 6805.vhd:951:43  */
  assign n3869_o = n2033_o[2];
  /* 6805.vhd:951:43  */
  assign n3870_o = n3869_o ? n3868_o : n3866_o;
endmodule

