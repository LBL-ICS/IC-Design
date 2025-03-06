module FP_multiplier(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] multiplier_io_in_a; // @[FPArithmetic.scala 1219:28]
  wire [23:0] multiplier_io_in_b; // @[FPArithmetic.scala 1219:28]
  wire [47:0] multiplier_io_out_s; // @[FPArithmetic.scala 1219:28]
  wire [7:0] subber_io_in_b; // @[FPArithmetic.scala 1224:24]
  wire [7:0] subber_io_out_s; // @[FPArithmetic.scala 1224:24]
  wire [7:0] complementN_io_in; // @[FPArithmetic.scala 1230:29]
  wire [7:0] complementN_io_out; // @[FPArithmetic.scala 1230:29]
  wire [7:0] adderN_io_in_a; // @[FPArithmetic.scala 1234:24]
  wire [7:0] adderN_io_in_b; // @[FPArithmetic.scala 1234:24]
  wire [7:0] adderN_io_out_s; // @[FPArithmetic.scala 1234:24]
  wire  s_0 = io_in_a[31]; // @[FPArithmetic.scala 1184:20]
  wire  s_1 = io_in_b[31]; // @[FPArithmetic.scala 1185:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FPArithmetic.scala 1189:62]
  wire [8:0] _GEN_13 = {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 1189:34]
  wire [8:0] _GEN_0 = _GEN_13 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 1189:68 1190:14 1192:14]
  wire [8:0] _GEN_14 = {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 1194:34]
  wire [8:0] _GEN_1 = _GEN_14 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 1194:68 1195:14 1197:14]
  wire [22:0] exp_check_0 = {{15'd0}, io_in_a[30:23]}; // @[FPArithmetic.scala 1200:25 1201:18]
  wire [22:0] _cond_holder_T_1 = exp_check_0 + 23'h1; // @[FPArithmetic.scala 1205:34]
  wire [22:0] exp_check_1 = {{15'd0}, io_in_b[30:23]}; // @[FPArithmetic.scala 1200:25 1202:18]
  wire [22:0] _cond_holder_T_3 = 23'h7f - exp_check_1; // @[FPArithmetic.scala 1205:80]
  wire [22:0] _cond_holder_T_4 = ~_cond_holder_T_3; // @[FPArithmetic.scala 1205:42]
  wire [22:0] _cond_holder_T_6 = _cond_holder_T_1 + _cond_holder_T_4; // @[FPArithmetic.scala 1205:40]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FPArithmetic.scala 1209:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FPArithmetic.scala 1210:23]
  wire  new_s = s_0 ^ s_1; // @[FPArithmetic.scala 1241:19]
  wire [7:0] _new_exp_T_1 = adderN_io_out_s + 8'h1; // @[FPArithmetic.scala 1252:34]
  wire [22:0] _cond_holder_T_8 = exp_check_0 + 23'h2; // @[FPArithmetic.scala 1254:36]
  wire [22:0] _cond_holder_T_13 = _cond_holder_T_8 + _cond_holder_T_4; // @[FPArithmetic.scala 1254:42]
  wire [23:0] _new_mant_T_2 = {multiplier_io_out_s[46:24], 1'h0}; // @[FPArithmetic.scala 1260:73]
  wire [7:0] _GEN_2 = multiplier_io_out_s[47] ? _new_exp_T_1 : adderN_io_out_s; // @[FPArithmetic.scala 1251:60 1252:15 1257:15]
  wire [22:0] cond_holder = multiplier_io_out_s[47] ? _cond_holder_T_13 : _cond_holder_T_6; // @[FPArithmetic.scala 1251:60 1254:19 1259:19]
  wire [23:0] _GEN_5 = multiplier_io_out_s[47] ? {{1'd0}, multiplier_io_out_s[46:24]} : _new_mant_T_2; // @[FPArithmetic.scala 1251:60 1255:16 1260:16]
  reg [31:0] reg_out_s; // @[FPArithmetic.scala 1262:28]
  wire [22:0] _T_12 = ~cond_holder; // @[FPArithmetic.scala 1264:51]
  wire [22:0] _T_14 = 23'h1 + _T_12; // @[FPArithmetic.scala 1264:49]
  wire [22:0] _GEN_15 = {{14'd0}, _T_2}; // @[FPArithmetic.scala 1264:42]
  wire [8:0] _GEN_6 = cond_holder > _GEN_15 ? _T_2 : {{1'd0}, _GEN_2}; // @[FPArithmetic.scala 1269:61 1270:15]
  wire [8:0] _GEN_9 = _GEN_15 >= _T_14 ? 9'h1 : _GEN_6; // @[FPArithmetic.scala 1264:67 1265:15]
  wire [7:0] new_exp = _GEN_9[7:0]; // @[FPArithmetic.scala 1244:23]
  wire [23:0] _new_mant_T_4 = 24'h800000 - 24'h1; // @[FPArithmetic.scala 1271:45]
  wire [23:0] _GEN_7 = cond_holder > _GEN_15 ? _new_mant_T_4 : _GEN_5; // @[FPArithmetic.scala 1269:61 1271:16]
  wire [23:0] _GEN_10 = _GEN_15 >= _T_14 ? 24'h400000 : _GEN_7; // @[FPArithmetic.scala 1264:67 1266:16]
  wire [22:0] new_mant = _GEN_10[22:0]; // @[FPArithmetic.scala 1246:24]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_exp,new_mant}; // @[FPArithmetic.scala 1267:37]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FPArithmetic.scala 1188:19]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FPArithmetic.scala 1188:19]
  multiplier multiplier ( // @[FPArithmetic.scala 1219:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber_one_output subber ( // @[FPArithmetic.scala 1224:24]
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s)
  );
  twoscomplement complementN ( // @[FPArithmetic.scala 1230:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder_8bit adderN ( // @[FPArithmetic.scala 1234:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s)
  );
  assign io_out_s = reg_out_s; // @[FPArithmetic.scala 1279:14]
  assign multiplier_io_in_a = {1'h1,frac_0}; // @[FPArithmetic.scala 1214:24]
  assign multiplier_io_in_b = {1'h1,frac_1}; // @[FPArithmetic.scala 1215:24]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FPArithmetic.scala 1188:19]
  assign complementN_io_in = subber_io_out_s; // @[FPArithmetic.scala 1231:23]
  assign adderN_io_in_a = _GEN_0[7:0]; // @[FPArithmetic.scala 1188:19]
  assign adderN_io_in_b = complementN_io_out; // @[FPArithmetic.scala 1236:20]
  always @(posedge clock) begin
    if (reset) begin // @[FPArithmetic.scala 1262:28]
      reg_out_s <= 32'h0; // @[FPArithmetic.scala 1262:28]
    end else if (exp_0 == 8'h0 | exp_1 == 8'h0) begin // @[FPArithmetic.scala 1274:43]
      reg_out_s <= 32'h0; // @[FPArithmetic.scala 1275:17]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FPArithmetic.scala 1277:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_out_s = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

