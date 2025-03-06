module full_subber(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [9:0] _result_T_2 = _result_T - 9'h0; // @[BinaryDesigns.scala 69:34]
  wire [8:0] result = _result_T_2[8:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 70:23]
  assign io_out_c = result[8]; // @[BinaryDesigns.scala 71:23]
endmodule
module twoscomplement(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 8'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module full_adder(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [23:0] io_out_s,
  output        io_out_c
);
  wire [24:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [25:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [24:0] result = _result_T_1[24:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[23:0]; // @[BinaryDesigns.scala 56:23]
  assign io_out_c = result[24]; // @[BinaryDesigns.scala 57:23]
endmodule
module twoscomplement_1(
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire [23:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 24'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module shifter(
  input  [23:0] io_in_a,
  input  [4:0]  io_in_b,
  output [23:0] io_out_s
);
  wire [23:0] _result_T = io_in_a >> io_in_b; // @[BinaryDesigns.scala 39:25]
  wire [54:0] _GEN_0 = {{31'd0}, _result_T}; // @[BinaryDesigns.scala 38:26 39:14 41:14]
  assign io_out_s = _GEN_0[23:0]; // @[BinaryDesigns.scala 36:22]
endmodule
module leadingOneDetector(
  input  [23:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] _hotValue_T = io_in[1] ? 2'h2 : 2'h1; // @[Mux.scala 47:70]
  wire [1:0] _hotValue_T_1 = io_in[2] ? 2'h3 : _hotValue_T; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_2 = io_in[3] ? 3'h4 : {{1'd0}, _hotValue_T_1}; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_3 = io_in[4] ? 3'h5 : _hotValue_T_2; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_4 = io_in[5] ? 3'h6 : _hotValue_T_3; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_5 = io_in[6] ? 3'h7 : _hotValue_T_4; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_6 = io_in[7] ? 4'h8 : {{1'd0}, _hotValue_T_5}; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_7 = io_in[8] ? 4'h9 : _hotValue_T_6; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_8 = io_in[9] ? 4'ha : _hotValue_T_7; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_9 = io_in[10] ? 4'hb : _hotValue_T_8; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_10 = io_in[11] ? 4'hc : _hotValue_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_11 = io_in[12] ? 4'hd : _hotValue_T_10; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_12 = io_in[13] ? 4'he : _hotValue_T_11; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_13 = io_in[14] ? 4'hf : _hotValue_T_12; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_14 = io_in[15] ? 5'h10 : {{1'd0}, _hotValue_T_13}; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_15 = io_in[16] ? 5'h11 : _hotValue_T_14; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_16 = io_in[17] ? 5'h12 : _hotValue_T_15; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_17 = io_in[18] ? 5'h13 : _hotValue_T_16; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_18 = io_in[19] ? 5'h14 : _hotValue_T_17; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_19 = io_in[20] ? 5'h15 : _hotValue_T_18; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_20 = io_in[21] ? 5'h16 : _hotValue_T_19; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_21 = io_in[22] ? 5'h17 : _hotValue_T_20; // @[Mux.scala 47:70]
  assign io_out = io_in[23] ? 5'h18 : _hotValue_T_21; // @[Mux.scala 47:70]
endmodule
module FP_adder(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 131:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 131:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 131:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 131:24]
  wire [7:0] complement_io_in; // @[FloatingPointDesigns.scala 137:28]
  wire [7:0] complement_io_out; // @[FloatingPointDesigns.scala 137:28]
  wire [23:0] adder_io_in_a; // @[FloatingPointDesigns.scala 141:23]
  wire [23:0] adder_io_in_b; // @[FloatingPointDesigns.scala 141:23]
  wire [23:0] adder_io_out_s; // @[FloatingPointDesigns.scala 141:23]
  wire  adder_io_out_c; // @[FloatingPointDesigns.scala 141:23]
  wire [23:0] complementN_0_io_in; // @[FloatingPointDesigns.scala 147:31]
  wire [23:0] complementN_0_io_out; // @[FloatingPointDesigns.scala 147:31]
  wire [23:0] complementN_1_io_in; // @[FloatingPointDesigns.scala 149:31]
  wire [23:0] complementN_1_io_out; // @[FloatingPointDesigns.scala 149:31]
  wire [23:0] shifter_io_in_a; // @[FloatingPointDesigns.scala 153:25]
  wire [4:0] shifter_io_in_b; // @[FloatingPointDesigns.scala 153:25]
  wire [23:0] shifter_io_out_s; // @[FloatingPointDesigns.scala 153:25]
  wire [23:0] complementN_2_io_in; // @[FloatingPointDesigns.scala 198:31]
  wire [23:0] complementN_2_io_out; // @[FloatingPointDesigns.scala 198:31]
  wire [23:0] leadingOneFinder_io_in; // @[FloatingPointDesigns.scala 218:34]
  wire [4:0] leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 218:34]
  wire [7:0] subber2_io_in_a; // @[FloatingPointDesigns.scala 220:25]
  wire [7:0] subber2_io_in_b; // @[FloatingPointDesigns.scala 220:25]
  wire [7:0] subber2_io_out_s; // @[FloatingPointDesigns.scala 220:25]
  wire  subber2_io_out_c; // @[FloatingPointDesigns.scala 220:25]
  wire  sign_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 93:23]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 94:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 98:62]
  wire [8:0] _GEN_31 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 98:34]
  wire [8:0] _GEN_0 = _GEN_31 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 101:14 98:68 99:14]
  wire [8:0] _GEN_32 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 103:34]
  wire [8:0] _GEN_1 = _GEN_32 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 103:68 104:14 106:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 111:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 112:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 116:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 117:26]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 97:19]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 97:19]
  wire [7:0] out_exp = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 159:34 160:15 170:15]
  wire [7:0] sub_exp = subber_io_out_c ? complement_io_out : subber_io_out_s; // @[FloatingPointDesigns.scala 159:34 161:15 171:15]
  wire  out_s = subber_io_out_c ? sign_1 : sign_0; // @[FloatingPointDesigns.scala 159:34 162:13 172:13]
  wire [22:0] out_frac = subber_io_out_c ? frac_1 : frac_0; // @[FloatingPointDesigns.scala 159:34 163:16 173:16]
  wire [23:0] _GEN_8 = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 142:19 159:34 167:21]
  wire [23:0] _GEN_9 = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 143:19 159:34 177:21]
  wire  _new_s_T = ~adder_io_out_c; // @[FloatingPointDesigns.scala 193:15]
  wire  _D_T_1 = sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 206:39]
  wire  D = _new_s_T | sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 206:28]
  wire  E = _new_s_T & ~adder_io_out_s[23] | _new_s_T & ~_D_T_1 | adder_io_out_c & adder_io_out_s[23] & _D_T_1; // @[FloatingPointDesigns.scala 209:99]
  wire  _GEN_25 = sub_exp >= 8'h17 ? out_s : ~adder_io_out_c & sign_0 | sign_0 & sign_1 | ~adder_io_out_c & sign_1; // @[FloatingPointDesigns.scala 193:11 228:39 229:13]
  wire  new_s = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 1'h0 : _GEN_25; // @[FloatingPointDesigns.scala 224:62 225:13]
  wire [23:0] adder_result = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 212:18 213:47 214:20]
  wire [4:0] _subber2_io_in_b_T_1 = 5'h18 - leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 222:42]
  wire [8:0] _GEN_33 = {{1'd0}, out_exp}; // @[FloatingPointDesigns.scala 236:20]
  wire [23:0] _new_out_frac_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 238:51]
  wire [7:0] _new_out_exp_T_3 = out_exp + 8'h1; // @[FloatingPointDesigns.scala 240:32]
  wire [8:0] _GEN_13 = _GEN_33 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_T_3}; // @[FloatingPointDesigns.scala 236:56 237:21 240:21]
  wire [23:0] _GEN_14 = _GEN_33 == _T_2 ? _new_out_frac_T_2 : {{1'd0}, adder_result[23:1]}; // @[FloatingPointDesigns.scala 236:56 238:22 241:22]
  wire [53:0] _GEN_2 = {{31'd0}, adder_result[22:0]}; // @[FloatingPointDesigns.scala 252:57]
  wire [53:0] _new_out_frac_T_7 = _GEN_2 << _subber2_io_in_b_T_1; // @[FloatingPointDesigns.scala 252:57]
  wire [7:0] _GEN_15 = subber2_io_out_c ? 8'h1 : subber2_io_out_s; // @[FloatingPointDesigns.scala 247:39 248:23 251:23]
  wire [53:0] _GEN_16 = subber2_io_out_c ? 54'h400000 : _new_out_frac_T_7; // @[FloatingPointDesigns.scala 247:39 249:24 252:24]
  wire [7:0] _GEN_17 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:0
    ]) ? 8'h0 : _GEN_15; // @[FloatingPointDesigns.scala 244:141 245:21]
  wire [53:0] _GEN_18 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:
    0]) ? 54'h0 : _GEN_16; // @[FloatingPointDesigns.scala 244:141 194:18]
  wire [7:0] _GEN_19 = D ? _GEN_17 : 8'h0; // @[FloatingPointDesigns.scala 195:17 243:26]
  wire [53:0] _GEN_20 = D ? _GEN_18 : 54'h0; // @[FloatingPointDesigns.scala 194:18 243:26]
  wire [8:0] _GEN_21 = ~D ? _GEN_13 : {{1'd0}, _GEN_19}; // @[FloatingPointDesigns.scala 235:26]
  wire [53:0] _GEN_22 = ~D ? {{30'd0}, _GEN_14} : _GEN_20; // @[FloatingPointDesigns.scala 235:26]
  wire [8:0] _GEN_23 = E ? {{1'd0}, out_exp} : _GEN_21; // @[FloatingPointDesigns.scala 232:26 233:19]
  wire [53:0] _GEN_24 = E ? {{31'd0}, adder_result[22:0]} : _GEN_22; // @[FloatingPointDesigns.scala 232:26 234:20]
  wire [53:0] _GEN_26 = sub_exp >= 8'h17 ? {{31'd0}, out_frac} : _GEN_24; // @[FloatingPointDesigns.scala 228:39 230:20]
  wire [8:0] _GEN_27 = sub_exp >= 8'h17 ? {{1'd0}, out_exp} : _GEN_23; // @[FloatingPointDesigns.scala 228:39 231:19]
  wire [8:0] _GEN_29 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 9'h0 : _GEN_27; // @[FloatingPointDesigns.scala 224:62 226:19]
  wire [53:0] _GEN_30 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 54'h0 : _GEN_26; // @[FloatingPointDesigns.scala 224:62 227:20]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 256:28]
  wire [7:0] new_out_exp = _GEN_29[7:0]; // @[FloatingPointDesigns.scala 192:27]
  wire [22:0] new_out_frac = _GEN_30[22:0]; // @[FloatingPointDesigns.scala 191:28]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_out_exp,new_out_frac}; // @[FloatingPointDesigns.scala 258:39]
  full_subber subber ( // @[FloatingPointDesigns.scala 131:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complement ( // @[FloatingPointDesigns.scala 137:28]
    .io_in(complement_io_in),
    .io_out(complement_io_out)
  );
  full_adder adder ( // @[FloatingPointDesigns.scala 141:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  twoscomplement_1 complementN_0 ( // @[FloatingPointDesigns.scala 147:31]
    .io_in(complementN_0_io_in),
    .io_out(complementN_0_io_out)
  );
  twoscomplement_1 complementN_1 ( // @[FloatingPointDesigns.scala 149:31]
    .io_in(complementN_1_io_in),
    .io_out(complementN_1_io_out)
  );
  shifter shifter ( // @[FloatingPointDesigns.scala 153:25]
    .io_in_a(shifter_io_in_a),
    .io_in_b(shifter_io_in_b),
    .io_out_s(shifter_io_out_s)
  );
  twoscomplement_1 complementN_2 ( // @[FloatingPointDesigns.scala 198:31]
    .io_in(complementN_2_io_in),
    .io_out(complementN_2_io_out)
  );
  leadingOneDetector leadingOneFinder ( // @[FloatingPointDesigns.scala 218:34]
    .io_in(leadingOneFinder_io_in),
    .io_out(leadingOneFinder_io_out)
  );
  full_subber subber2 ( // @[FloatingPointDesigns.scala 220:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 260:14]
  assign subber_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 97:19]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 97:19]
  assign complement_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 138:22]
  assign adder_io_in_a = sign_0 & ~sign_1 ? complementN_0_io_out : _GEN_8; // @[FloatingPointDesigns.scala 182:45 183:21]
  assign adder_io_in_b = sign_1 & ~sign_0 ? complementN_1_io_out : _GEN_9; // @[FloatingPointDesigns.scala 186:45 187:21]
  assign complementN_0_io_in = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 142:19 159:34 167:21]
  assign complementN_1_io_in = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 143:19 159:34 177:21]
  assign shifter_io_in_a = subber_io_out_c ? whole_frac_0 : whole_frac_1; // @[FloatingPointDesigns.scala 159:34 164:23 174:23]
  assign shifter_io_in_b = sub_exp[4:0];
  assign complementN_2_io_in = adder_io_out_s; // @[FloatingPointDesigns.scala 199:25]
  assign leadingOneFinder_io_in = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 212:18 213:47 214:20]
  assign subber2_io_in_a = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 159:34 160:15 170:15]
  assign subber2_io_in_b = {{3'd0}, _subber2_io_in_b_T_1}; // @[FloatingPointDesigns.scala 222:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 256:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 256:28]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 258:15]
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
module FP_subber(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 272:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 272:26]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 272:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 272:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 272:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 275:23]
  FP_adder FP_adder ( // @[FloatingPointDesigns.scala 272:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 278:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 276:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 275:39]
endmodule
module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[BinaryDesigns.scala 81:23]
endmodule
module full_adder_2(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s
);
  wire [8:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [9:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [8:0] result = _result_T_1[8:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 56:23]
endmodule
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
  wire [23:0] multiplier_io_in_a; // @[FloatingPointDesigns.scala 342:28]
  wire [23:0] multiplier_io_in_b; // @[FloatingPointDesigns.scala 342:28]
  wire [47:0] multiplier_io_out_s; // @[FloatingPointDesigns.scala 342:28]
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 347:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 347:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 347:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 347:24]
  wire [7:0] complementN_io_in; // @[FloatingPointDesigns.scala 353:29]
  wire [7:0] complementN_io_out; // @[FloatingPointDesigns.scala 353:29]
  wire [7:0] adderN_io_in_a; // @[FloatingPointDesigns.scala 357:24]
  wire [7:0] adderN_io_in_b; // @[FloatingPointDesigns.scala 357:24]
  wire [7:0] adderN_io_out_s; // @[FloatingPointDesigns.scala 357:24]
  wire  s_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 307:20]
  wire  s_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 308:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 312:62]
  wire [8:0] _GEN_13 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 312:34]
  wire [8:0] _GEN_0 = _GEN_13 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 312:68 313:14 315:14]
  wire [8:0] _GEN_14 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 317:34]
  wire [8:0] _GEN_1 = _GEN_14 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 317:68 318:14 320:14]
  wire [22:0] exp_check_0 = {{15'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 323:25 324:18]
  wire [22:0] _cond_holder_T_1 = exp_check_0 + 23'h1; // @[FloatingPointDesigns.scala 328:34]
  wire [22:0] exp_check_1 = {{15'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 323:25 325:18]
  wire [22:0] _cond_holder_T_3 = 23'h7f - exp_check_1; // @[FloatingPointDesigns.scala 328:80]
  wire [22:0] _cond_holder_T_4 = ~_cond_holder_T_3; // @[FloatingPointDesigns.scala 328:42]
  wire [22:0] _cond_holder_T_6 = _cond_holder_T_1 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 328:40]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 332:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 333:23]
  wire  new_s = s_0 ^ s_1; // @[FloatingPointDesigns.scala 364:19]
  wire [7:0] _new_exp_T_1 = adderN_io_out_s + 8'h1; // @[FloatingPointDesigns.scala 375:34]
  wire [22:0] _cond_holder_T_8 = exp_check_0 + 23'h2; // @[FloatingPointDesigns.scala 377:36]
  wire [22:0] _cond_holder_T_13 = _cond_holder_T_8 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 377:42]
  wire [23:0] _new_mant_T_2 = {multiplier_io_out_s[46:24], 1'h0}; // @[FloatingPointDesigns.scala 383:73]
  wire [7:0] _GEN_2 = multiplier_io_out_s[47] ? _new_exp_T_1 : adderN_io_out_s; // @[FloatingPointDesigns.scala 374:60 375:15 380:15]
  wire [22:0] cond_holder = multiplier_io_out_s[47] ? _cond_holder_T_13 : _cond_holder_T_6; // @[FloatingPointDesigns.scala 374:60 377:19 382:19]
  wire [23:0] _GEN_5 = multiplier_io_out_s[47] ? {{1'd0}, multiplier_io_out_s[46:24]} : _new_mant_T_2; // @[FloatingPointDesigns.scala 374:60 378:16 383:16]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 385:28]
  wire [22:0] _T_12 = ~cond_holder; // @[FloatingPointDesigns.scala 387:51]
  wire [22:0] _T_14 = 23'h1 + _T_12; // @[FloatingPointDesigns.scala 387:49]
  wire [22:0] _GEN_15 = {{14'd0}, _T_2}; // @[FloatingPointDesigns.scala 387:42]
  wire [8:0] _GEN_6 = cond_holder > _GEN_15 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 392:63 393:17]
  wire [8:0] _GEN_9 = _GEN_15 >= _T_14 ? 9'h1 : _GEN_6; // @[FloatingPointDesigns.scala 387:67 388:15]
  wire [7:0] new_exp = _GEN_9[7:0]; // @[FloatingPointDesigns.scala 367:23]
  wire [23:0] _new_mant_T_4 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 394:47]
  wire [23:0] _GEN_7 = cond_holder > _GEN_15 ? _new_mant_T_4 : _GEN_5; // @[FloatingPointDesigns.scala 392:63 394:18]
  wire [23:0] _GEN_10 = _GEN_15 >= _T_14 ? 24'h400000 : _GEN_7; // @[FloatingPointDesigns.scala 387:67 389:16]
  wire [22:0] new_mant = _GEN_10[22:0]; // @[FloatingPointDesigns.scala 369:24]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_exp,new_mant}; // @[FloatingPointDesigns.scala 390:37]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 311:19]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 311:19]
  multiplier multiplier ( // @[FloatingPointDesigns.scala 342:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FloatingPointDesigns.scala 347:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complementN ( // @[FloatingPointDesigns.scala 353:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder_2 adderN ( // @[FloatingPointDesigns.scala 357:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 402:14]
  assign multiplier_io_in_a = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 337:24]
  assign multiplier_io_in_b = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 338:24]
  assign subber_io_in_a = 8'h7f; // @[FloatingPointDesigns.scala 348:20]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 311:19]
  assign complementN_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 354:23]
  assign adderN_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 311:19]
  assign adderN_io_in_b = complementN_io_out; // @[FloatingPointDesigns.scala 359:20]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 385:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 385:28]
    end else if (exp_0 == 8'h0 | exp_1 == 8'h0) begin // @[FloatingPointDesigns.scala 397:43]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 398:17]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 400:17]
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
module FP_reciprocal(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 466:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 466:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 466:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 466:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 466:29]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 476:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 476:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 476:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 476:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 476:29]
  wire  sub_clock; // @[FloatingPointDesigns.scala 487:21]
  wire  sub_reset; // @[FloatingPointDesigns.scala 487:21]
  wire [31:0] sub_io_in_a; // @[FloatingPointDesigns.scala 487:21]
  wire [31:0] sub_io_in_b; // @[FloatingPointDesigns.scala 487:21]
  wire [31:0] sub_io_out_s; // @[FloatingPointDesigns.scala 487:21]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 495:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 495:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 495:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 495:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 495:29]
  wire  multiplier5_clock; // @[FloatingPointDesigns.scala 506:29]
  wire  multiplier5_reset; // @[FloatingPointDesigns.scala 506:29]
  wire [31:0] multiplier5_io_in_a; // @[FloatingPointDesigns.scala 506:29]
  wire [31:0] multiplier5_io_in_b; // @[FloatingPointDesigns.scala 506:29]
  wire [31:0] multiplier5_io_out_s; // @[FloatingPointDesigns.scala 506:29]
  wire  multiplier6_clock; // @[FloatingPointDesigns.scala 515:29]
  wire  multiplier6_reset; // @[FloatingPointDesigns.scala 515:29]
  wire [31:0] multiplier6_io_in_a; // @[FloatingPointDesigns.scala 515:29]
  wire [31:0] multiplier6_io_in_b; // @[FloatingPointDesigns.scala 515:29]
  wire [31:0] multiplier6_io_out_s; // @[FloatingPointDesigns.scala 515:29]
  wire  sub2_clock; // @[FloatingPointDesigns.scala 524:22]
  wire  sub2_reset; // @[FloatingPointDesigns.scala 524:22]
  wire [31:0] sub2_io_in_a; // @[FloatingPointDesigns.scala 524:22]
  wire [31:0] sub2_io_in_b; // @[FloatingPointDesigns.scala 524:22]
  wire [31:0] sub2_io_out_s; // @[FloatingPointDesigns.scala 524:22]
  wire  multiplier7_clock; // @[FloatingPointDesigns.scala 533:29]
  wire  multiplier7_reset; // @[FloatingPointDesigns.scala 533:29]
  wire [31:0] multiplier7_io_in_a; // @[FloatingPointDesigns.scala 533:29]
  wire [31:0] multiplier7_io_in_b; // @[FloatingPointDesigns.scala 533:29]
  wire [31:0] multiplier7_io_out_s; // @[FloatingPointDesigns.scala 533:29]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 540:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 540:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 540:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 540:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 540:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 443:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 440:46 441:14 443:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 437:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 451:25]
  wire [7:0] exp = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 454:38]
  wire [31:0] half_input = {io_in_a[31],exp,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 457:42]
  reg [31:0] half_input_reg_1; // @[FloatingPointDesigns.scala 459:35]
  reg [31:0] result_reg_1; // @[FloatingPointDesigns.scala 461:31]
  reg [31:0] input_reg_1; // @[FloatingPointDesigns.scala 463:30]
  reg [31:0] half_input_reg_2; // @[FloatingPointDesigns.scala 470:35]
  reg [31:0] result_reg_2; // @[FloatingPointDesigns.scala 472:31]
  reg [31:0] input_reg_2; // @[FloatingPointDesigns.scala 474:30]
  reg [31:0] half_input_reg_3; // @[FloatingPointDesigns.scala 481:35]
  reg [31:0] result_reg_3; // @[FloatingPointDesigns.scala 483:31]
  reg [31:0] input_reg_3; // @[FloatingPointDesigns.scala 485:30]
  reg [31:0] half_input_reg_4; // @[FloatingPointDesigns.scala 491:35]
  reg [31:0] input_reg_4; // @[FloatingPointDesigns.scala 493:30]
  reg [31:0] mult3_reg_1; // @[FloatingPointDesigns.scala 500:30]
  reg [31:0] half_input_reg_5; // @[FloatingPointDesigns.scala 502:35]
  reg [31:0] input_reg_5; // @[FloatingPointDesigns.scala 504:30]
  reg [31:0] mult3_reg_2; // @[FloatingPointDesigns.scala 511:30]
  reg [31:0] input_reg_6; // @[FloatingPointDesigns.scala 513:30]
  reg [31:0] mult3_reg_3; // @[FloatingPointDesigns.scala 520:30]
  reg [31:0] input_reg_7; // @[FloatingPointDesigns.scala 522:30]
  reg [31:0] input_reg_8; // @[FloatingPointDesigns.scala 531:30]
  reg [31:0] input_reg_9; // @[FloatingPointDesigns.scala 537:30]
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 466:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 476:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_subber sub ( // @[FloatingPointDesigns.scala 487:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_in_a(sub_io_in_a),
    .io_in_b(sub_io_in_b),
    .io_out_s(sub_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 495:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_multiplier multiplier5 ( // @[FloatingPointDesigns.scala 506:29]
    .clock(multiplier5_clock),
    .reset(multiplier5_reset),
    .io_in_a(multiplier5_io_in_a),
    .io_in_b(multiplier5_io_in_b),
    .io_out_s(multiplier5_io_out_s)
  );
  FP_multiplier multiplier6 ( // @[FloatingPointDesigns.scala 515:29]
    .clock(multiplier6_clock),
    .reset(multiplier6_reset),
    .io_in_a(multiplier6_io_in_a),
    .io_in_b(multiplier6_io_in_b),
    .io_out_s(multiplier6_io_out_s)
  );
  FP_subber sub2 ( // @[FloatingPointDesigns.scala 524:22]
    .clock(sub2_clock),
    .reset(sub2_reset),
    .io_in_a(sub2_io_in_a),
    .io_in_b(sub2_io_in_b),
    .io_out_s(sub2_io_out_s)
  );
  FP_multiplier multiplier7 ( // @[FloatingPointDesigns.scala 533:29]
    .clock(multiplier7_clock),
    .reset(multiplier7_reset),
    .io_in_a(multiplier7_io_in_a),
    .io_in_b(multiplier7_io_in_b),
    .io_out_s(multiplier7_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 540:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {input_reg_9[31],multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 543:37]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 467:37]
  assign multiplier1_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 468:37]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 477:25]
  assign multiplier2_io_in_b = {1'h0,half_input_reg_1[30:0]}; // @[FloatingPointDesigns.scala 478:37]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 438:26 439:16]
  assign sub_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 489:17]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = sub_io_out_s; // @[FloatingPointDesigns.scala 496:25]
  assign multiplier3_io_in_b = {1'h0,result_reg_3[30:0]}; // @[FloatingPointDesigns.scala 497:37]
  assign multiplier5_clock = clock;
  assign multiplier5_reset = reset;
  assign multiplier5_io_in_a = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 507:37]
  assign multiplier5_io_in_b = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 508:37]
  assign multiplier6_clock = clock;
  assign multiplier6_reset = reset;
  assign multiplier6_io_in_a = multiplier5_io_out_s; // @[FloatingPointDesigns.scala 516:25]
  assign multiplier6_io_in_b = {1'h0,half_input_reg_5[30:0]}; // @[FloatingPointDesigns.scala 517:37]
  assign sub2_clock = clock;
  assign sub2_reset = reset;
  assign sub2_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 438:26 439:16]
  assign sub2_io_in_b = multiplier6_io_out_s; // @[FloatingPointDesigns.scala 526:18]
  assign multiplier7_clock = clock;
  assign multiplier7_reset = reset;
  assign multiplier7_io_in_a = sub2_io_out_s; // @[FloatingPointDesigns.scala 534:25]
  assign multiplier7_io_in_b = {1'h0,mult3_reg_3[30:0]}; // @[FloatingPointDesigns.scala 535:37]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 541:37]
  assign multiplier4_io_in_b = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 542:37]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 459:35]
      half_input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 459:35]
    end else begin
      half_input_reg_1 <= half_input; // @[FloatingPointDesigns.scala 460:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 461:31]
      result_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 461:31]
    end else begin
      result_reg_1 <= result; // @[FloatingPointDesigns.scala 462:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 463:30]
      input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 463:30]
    end else begin
      input_reg_1 <= io_in_a; // @[FloatingPointDesigns.scala 464:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 470:35]
      half_input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 470:35]
    end else begin
      half_input_reg_2 <= half_input_reg_1; // @[FloatingPointDesigns.scala 471:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 472:31]
      result_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 472:31]
    end else begin
      result_reg_2 <= result_reg_1; // @[FloatingPointDesigns.scala 473:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 474:30]
      input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 474:30]
    end else begin
      input_reg_2 <= input_reg_1; // @[FloatingPointDesigns.scala 475:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 481:35]
      half_input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 481:35]
    end else begin
      half_input_reg_3 <= half_input_reg_2; // @[FloatingPointDesigns.scala 482:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 483:31]
      result_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 483:31]
    end else begin
      result_reg_3 <= result_reg_2; // @[FloatingPointDesigns.scala 484:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 485:30]
      input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 485:30]
    end else begin
      input_reg_3 <= input_reg_2; // @[FloatingPointDesigns.scala 486:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 491:35]
      half_input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 491:35]
    end else begin
      half_input_reg_4 <= half_input_reg_3; // @[FloatingPointDesigns.scala 492:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 493:30]
      input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 493:30]
    end else begin
      input_reg_4 <= input_reg_3; // @[FloatingPointDesigns.scala 494:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 500:30]
      mult3_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 500:30]
    end else begin
      mult3_reg_1 <= multiplier3_io_out_s; // @[FloatingPointDesigns.scala 501:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 502:35]
      half_input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 502:35]
    end else begin
      half_input_reg_5 <= half_input_reg_4; // @[FloatingPointDesigns.scala 503:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 504:30]
      input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 504:30]
    end else begin
      input_reg_5 <= input_reg_4; // @[FloatingPointDesigns.scala 505:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 511:30]
      mult3_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 511:30]
    end else begin
      mult3_reg_2 <= mult3_reg_1; // @[FloatingPointDesigns.scala 512:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 513:30]
      input_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 513:30]
    end else begin
      input_reg_6 <= input_reg_5; // @[FloatingPointDesigns.scala 514:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 520:30]
      mult3_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 520:30]
    end else begin
      mult3_reg_3 <= mult3_reg_2; // @[FloatingPointDesigns.scala 521:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 522:30]
      input_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 522:30]
    end else begin
      input_reg_7 <= input_reg_6; // @[FloatingPointDesigns.scala 523:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 531:30]
      input_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 531:30]
    end else begin
      input_reg_8 <= input_reg_7; // @[FloatingPointDesigns.scala 532:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 537:30]
      input_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 537:30]
    end else begin
      input_reg_9 <= input_reg_8; // @[FloatingPointDesigns.scala 538:17]
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
  half_input_reg_1 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  result_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_reg_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  half_input_reg_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  result_reg_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_reg_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  half_input_reg_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  result_reg_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_reg_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  half_input_reg_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  input_reg_4 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mult3_reg_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  half_input_reg_5 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  input_reg_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mult3_reg_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  input_reg_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mult3_reg_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  input_reg_7 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  input_reg_8 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  input_reg_9 = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP_divider(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 553:28]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 553:28]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 553:28]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 553:28]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 554:28]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 554:28]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 554:28]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 554:28]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 554:28]
  reg [31:0] regs_0; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_1; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_2; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_3; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_4; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_5; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_6; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_7; // @[FloatingPointDesigns.scala 555:23]
  reg [31:0] regs_8; // @[FloatingPointDesigns.scala 555:23]
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 553:28]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 554:28]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  assign io_out_s = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 563:14]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = io_in_b; // @[FloatingPointDesigns.scala 560:21]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = regs_8; // @[FloatingPointDesigns.scala 561:21]
  assign FP_multiplier_io_in_b = FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 562:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_0 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_0 <= io_in_a; // @[FloatingPointDesigns.scala 556:13]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_1 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_1 <= regs_0; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_2 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_2 <= regs_1; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_3 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_3 <= regs_2; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_4 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_4 <= regs_3; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_5 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_5 <= regs_4; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_6 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_6 <= regs_5; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_7 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_7 <= regs_6; // @[FloatingPointDesigns.scala 558:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:23]
      regs_8 <= 32'h0; // @[FloatingPointDesigns.scala 555:23]
    end else begin
      regs_8 <= regs_7; // @[FloatingPointDesigns.scala 558:17]
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
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP_square_root(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 624:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 624:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 624:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 624:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 624:29]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 634:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 634:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 634:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 634:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 634:29]
  wire  sub_clock; // @[FloatingPointDesigns.scala 645:21]
  wire  sub_reset; // @[FloatingPointDesigns.scala 645:21]
  wire [31:0] sub_io_in_a; // @[FloatingPointDesigns.scala 645:21]
  wire [31:0] sub_io_in_b; // @[FloatingPointDesigns.scala 645:21]
  wire [31:0] sub_io_out_s; // @[FloatingPointDesigns.scala 645:21]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 653:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 653:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 653:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 653:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 653:29]
  wire  multiplier5_clock; // @[FloatingPointDesigns.scala 664:29]
  wire  multiplier5_reset; // @[FloatingPointDesigns.scala 664:29]
  wire [31:0] multiplier5_io_in_a; // @[FloatingPointDesigns.scala 664:29]
  wire [31:0] multiplier5_io_in_b; // @[FloatingPointDesigns.scala 664:29]
  wire [31:0] multiplier5_io_out_s; // @[FloatingPointDesigns.scala 664:29]
  wire  multiplier6_clock; // @[FloatingPointDesigns.scala 673:29]
  wire  multiplier6_reset; // @[FloatingPointDesigns.scala 673:29]
  wire [31:0] multiplier6_io_in_a; // @[FloatingPointDesigns.scala 673:29]
  wire [31:0] multiplier6_io_in_b; // @[FloatingPointDesigns.scala 673:29]
  wire [31:0] multiplier6_io_out_s; // @[FloatingPointDesigns.scala 673:29]
  wire  sub2_clock; // @[FloatingPointDesigns.scala 682:22]
  wire  sub2_reset; // @[FloatingPointDesigns.scala 682:22]
  wire [31:0] sub2_io_in_a; // @[FloatingPointDesigns.scala 682:22]
  wire [31:0] sub2_io_in_b; // @[FloatingPointDesigns.scala 682:22]
  wire [31:0] sub2_io_out_s; // @[FloatingPointDesigns.scala 682:22]
  wire  multiplier7_clock; // @[FloatingPointDesigns.scala 691:29]
  wire  multiplier7_reset; // @[FloatingPointDesigns.scala 691:29]
  wire [31:0] multiplier7_io_in_a; // @[FloatingPointDesigns.scala 691:29]
  wire [31:0] multiplier7_io_in_b; // @[FloatingPointDesigns.scala 691:29]
  wire [31:0] multiplier7_io_out_s; // @[FloatingPointDesigns.scala 691:29]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 698:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 698:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 698:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 698:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 698:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 601:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 598:46 599:14 601:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 595:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 609:25]
  wire [7:0] exp = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 612:38]
  wire [31:0] half_input = {io_in_a[31],exp,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 615:42]
  reg [31:0] half_input_reg_1; // @[FloatingPointDesigns.scala 617:35]
  reg [31:0] result_reg_1; // @[FloatingPointDesigns.scala 619:31]
  reg [31:0] input_reg_1; // @[FloatingPointDesigns.scala 621:30]
  reg [31:0] half_input_reg_2; // @[FloatingPointDesigns.scala 628:35]
  reg [31:0] result_reg_2; // @[FloatingPointDesigns.scala 630:31]
  reg [31:0] input_reg_2; // @[FloatingPointDesigns.scala 632:30]
  reg [31:0] half_input_reg_3; // @[FloatingPointDesigns.scala 639:35]
  reg [31:0] result_reg_3; // @[FloatingPointDesigns.scala 641:31]
  reg [31:0] input_reg_3; // @[FloatingPointDesigns.scala 643:30]
  reg [31:0] half_input_reg_4; // @[FloatingPointDesigns.scala 649:35]
  reg [31:0] input_reg_4; // @[FloatingPointDesigns.scala 651:30]
  reg [31:0] mult3_reg_1; // @[FloatingPointDesigns.scala 658:30]
  reg [31:0] half_input_reg_5; // @[FloatingPointDesigns.scala 660:35]
  reg [31:0] input_reg_5; // @[FloatingPointDesigns.scala 662:30]
  reg [31:0] mult3_reg_2; // @[FloatingPointDesigns.scala 669:30]
  reg [31:0] input_reg_6; // @[FloatingPointDesigns.scala 671:30]
  reg [31:0] mult3_reg_3; // @[FloatingPointDesigns.scala 678:30]
  reg [31:0] input_reg_7; // @[FloatingPointDesigns.scala 680:30]
  reg [31:0] input_reg_8; // @[FloatingPointDesigns.scala 689:30]
  reg [31:0] input_reg_9; // @[FloatingPointDesigns.scala 695:30]
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 624:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 634:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_subber sub ( // @[FloatingPointDesigns.scala 645:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_in_a(sub_io_in_a),
    .io_in_b(sub_io_in_b),
    .io_out_s(sub_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 653:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_multiplier multiplier5 ( // @[FloatingPointDesigns.scala 664:29]
    .clock(multiplier5_clock),
    .reset(multiplier5_reset),
    .io_in_a(multiplier5_io_in_a),
    .io_in_b(multiplier5_io_in_b),
    .io_out_s(multiplier5_io_out_s)
  );
  FP_multiplier multiplier6 ( // @[FloatingPointDesigns.scala 673:29]
    .clock(multiplier6_clock),
    .reset(multiplier6_reset),
    .io_in_a(multiplier6_io_in_a),
    .io_in_b(multiplier6_io_in_b),
    .io_out_s(multiplier6_io_out_s)
  );
  FP_subber sub2 ( // @[FloatingPointDesigns.scala 682:22]
    .clock(sub2_clock),
    .reset(sub2_reset),
    .io_in_a(sub2_io_in_a),
    .io_in_b(sub2_io_in_b),
    .io_out_s(sub2_io_out_s)
  );
  FP_multiplier multiplier7 ( // @[FloatingPointDesigns.scala 691:29]
    .clock(multiplier7_clock),
    .reset(multiplier7_reset),
    .io_in_a(multiplier7_io_in_a),
    .io_in_b(multiplier7_io_in_b),
    .io_out_s(multiplier7_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 698:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {input_reg_9[31],multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 701:37]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 625:37]
  assign multiplier1_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 626:37]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 635:25]
  assign multiplier2_io_in_b = {1'h0,half_input_reg_1[30:0]}; // @[FloatingPointDesigns.scala 636:37]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 596:26 597:16]
  assign sub_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 647:17]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = sub_io_out_s; // @[FloatingPointDesigns.scala 654:25]
  assign multiplier3_io_in_b = {1'h0,result_reg_3[30:0]}; // @[FloatingPointDesigns.scala 655:37]
  assign multiplier5_clock = clock;
  assign multiplier5_reset = reset;
  assign multiplier5_io_in_a = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 665:37]
  assign multiplier5_io_in_b = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 666:37]
  assign multiplier6_clock = clock;
  assign multiplier6_reset = reset;
  assign multiplier6_io_in_a = multiplier5_io_out_s; // @[FloatingPointDesigns.scala 674:25]
  assign multiplier6_io_in_b = {1'h0,half_input_reg_5[30:0]}; // @[FloatingPointDesigns.scala 675:37]
  assign sub2_clock = clock;
  assign sub2_reset = reset;
  assign sub2_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 596:26 597:16]
  assign sub2_io_in_b = multiplier6_io_out_s; // @[FloatingPointDesigns.scala 684:18]
  assign multiplier7_clock = clock;
  assign multiplier7_reset = reset;
  assign multiplier7_io_in_a = sub2_io_out_s; // @[FloatingPointDesigns.scala 692:25]
  assign multiplier7_io_in_b = {1'h0,mult3_reg_3[30:0]}; // @[FloatingPointDesigns.scala 693:37]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {input_reg_8[31],multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 699:48]
  assign multiplier4_io_in_b = input_reg_8; // @[FloatingPointDesigns.scala 700:25]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 617:35]
      half_input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 617:35]
    end else begin
      half_input_reg_1 <= half_input; // @[FloatingPointDesigns.scala 618:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 619:31]
      result_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 619:31]
    end else begin
      result_reg_1 <= result; // @[FloatingPointDesigns.scala 620:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 621:30]
      input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 621:30]
    end else begin
      input_reg_1 <= io_in_a; // @[FloatingPointDesigns.scala 622:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 628:35]
      half_input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 628:35]
    end else begin
      half_input_reg_2 <= half_input_reg_1; // @[FloatingPointDesigns.scala 629:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 630:31]
      result_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 630:31]
    end else begin
      result_reg_2 <= result_reg_1; // @[FloatingPointDesigns.scala 631:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 632:30]
      input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 632:30]
    end else begin
      input_reg_2 <= input_reg_1; // @[FloatingPointDesigns.scala 633:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 639:35]
      half_input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 639:35]
    end else begin
      half_input_reg_3 <= half_input_reg_2; // @[FloatingPointDesigns.scala 640:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 641:31]
      result_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 641:31]
    end else begin
      result_reg_3 <= result_reg_2; // @[FloatingPointDesigns.scala 642:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 643:30]
      input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 643:30]
    end else begin
      input_reg_3 <= input_reg_2; // @[FloatingPointDesigns.scala 644:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 649:35]
      half_input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 649:35]
    end else begin
      half_input_reg_4 <= half_input_reg_3; // @[FloatingPointDesigns.scala 650:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 651:30]
      input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 651:30]
    end else begin
      input_reg_4 <= input_reg_3; // @[FloatingPointDesigns.scala 652:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 658:30]
      mult3_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 658:30]
    end else begin
      mult3_reg_1 <= multiplier3_io_out_s; // @[FloatingPointDesigns.scala 659:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 660:35]
      half_input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 660:35]
    end else begin
      half_input_reg_5 <= half_input_reg_4; // @[FloatingPointDesigns.scala 661:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 662:30]
      input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 662:30]
    end else begin
      input_reg_5 <= input_reg_4; // @[FloatingPointDesigns.scala 663:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 669:30]
      mult3_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 669:30]
    end else begin
      mult3_reg_2 <= mult3_reg_1; // @[FloatingPointDesigns.scala 670:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 671:30]
      input_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 671:30]
    end else begin
      input_reg_6 <= input_reg_5; // @[FloatingPointDesigns.scala 672:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 678:30]
      mult3_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 678:30]
    end else begin
      mult3_reg_3 <= mult3_reg_2; // @[FloatingPointDesigns.scala 679:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 680:30]
      input_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 680:30]
    end else begin
      input_reg_7 <= input_reg_6; // @[FloatingPointDesigns.scala 681:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 689:30]
      input_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 689:30]
    end else begin
      input_reg_8 <= input_reg_7; // @[FloatingPointDesigns.scala 690:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 695:30]
      input_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 695:30]
    end else begin
      input_reg_9 <= input_reg_8; // @[FloatingPointDesigns.scala 696:17]
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
  half_input_reg_1 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  result_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_reg_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  half_input_reg_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  result_reg_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_reg_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  half_input_reg_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  result_reg_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_reg_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  half_input_reg_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  input_reg_4 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mult3_reg_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  half_input_reg_5 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  input_reg_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mult3_reg_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  input_reg_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mult3_reg_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  input_reg_7 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  input_reg_8 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  input_reg_9 = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module full_subber_40(
  input  [22:0] io_in_b,
  output        io_out_c
);
  wire [23:0] _result_T = 23'h340000 - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [24:0] _result_T_2 = _result_T - 24'h0; // @[BinaryDesigns.scala 69:34]
  wire [23:0] result = _result_T_2[23:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_c = result[23]; // @[BinaryDesigns.scala 71:23]
endmodule
module FP_comparator(
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire [7:0] full_subber_io_in_a; // @[FloatingPointDesigns.scala 1025:24]
  wire [7:0] full_subber_io_in_b; // @[FloatingPointDesigns.scala 1025:24]
  wire [7:0] full_subber_io_out_s; // @[FloatingPointDesigns.scala 1025:24]
  wire  full_subber_io_out_c; // @[FloatingPointDesigns.scala 1025:24]
  wire [22:0] full_subber_1_io_in_b; // @[FloatingPointDesigns.scala 1030:25]
  wire  full_subber_1_io_out_c; // @[FloatingPointDesigns.scala 1030:25]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1004:62]
  wire [8:0] _GEN_0 = 9'h85 > _T_2 ? _T_2 : 9'h85; // @[FloatingPointDesigns.scala 1004:68 1005:14 1007:14]
  wire [8:0] _GEN_5 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1009:34]
  wire [8:0] _GEN_1 = _GEN_5 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1009:68 1010:14 1012:14]
  wire [31:0] _GEN_2 = full_subber_1_io_out_c ? io_in_b : 32'h42b40000; // @[FloatingPointDesigns.scala 1040:34 1041:18 1043:18]
  wire [31:0] _GEN_3 = full_subber_io_out_s > 8'h0 ? 32'h42b40000 : _GEN_2; // @[FloatingPointDesigns.scala 1037:35 1038:16]
  full_subber full_subber ( // @[FloatingPointDesigns.scala 1025:24]
    .io_in_a(full_subber_io_in_a),
    .io_in_b(full_subber_io_in_b),
    .io_out_s(full_subber_io_out_s),
    .io_out_c(full_subber_io_out_c)
  );
  full_subber_40 full_subber_1 ( // @[FloatingPointDesigns.scala 1030:25]
    .io_in_b(full_subber_1_io_in_b),
    .io_out_c(full_subber_1_io_out_c)
  );
  assign io_out_s = full_subber_io_out_c ? io_in_b : _GEN_3; // @[FloatingPointDesigns.scala 1035:31 1036:16]
  assign full_subber_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 1003:19]
  assign full_subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 1003:19]
  assign full_subber_1_io_in_b = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1018:23]
endmodule
module leadingOneDetector_8(
  input  [22:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] _hotValue_T = io_in[1] ? 2'h2 : 2'h1; // @[Mux.scala 47:70]
  wire [1:0] _hotValue_T_1 = io_in[2] ? 2'h3 : _hotValue_T; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_2 = io_in[3] ? 3'h4 : {{1'd0}, _hotValue_T_1}; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_3 = io_in[4] ? 3'h5 : _hotValue_T_2; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_4 = io_in[5] ? 3'h6 : _hotValue_T_3; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_5 = io_in[6] ? 3'h7 : _hotValue_T_4; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_6 = io_in[7] ? 4'h8 : {{1'd0}, _hotValue_T_5}; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_7 = io_in[8] ? 4'h9 : _hotValue_T_6; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_8 = io_in[9] ? 4'ha : _hotValue_T_7; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_9 = io_in[10] ? 4'hb : _hotValue_T_8; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_10 = io_in[11] ? 4'hc : _hotValue_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_11 = io_in[12] ? 4'hd : _hotValue_T_10; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_12 = io_in[13] ? 4'he : _hotValue_T_11; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_13 = io_in[14] ? 4'hf : _hotValue_T_12; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_14 = io_in[15] ? 5'h10 : {{1'd0}, _hotValue_T_13}; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_15 = io_in[16] ? 5'h11 : _hotValue_T_14; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_16 = io_in[17] ? 5'h12 : _hotValue_T_15; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_17 = io_in[18] ? 5'h13 : _hotValue_T_16; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_18 = io_in[19] ? 5'h14 : _hotValue_T_17; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_19 = io_in[20] ? 5'h15 : _hotValue_T_18; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_20 = io_in[21] ? 5'h16 : _hotValue_T_19; // @[Mux.scala 47:70]
  assign io_out = io_in[22] ? 5'h17 : _hotValue_T_20; // @[Mux.scala 47:70]
endmodule
module FP_extract(
  input  [31:0] io_in_a,
  output [31:0] io_out_frac,
  output [31:0] io_out
);
  wire [22:0] leadingOne_io_in; // @[FloatingPointDesigns.scala 943:28]
  wire [4:0] leadingOne_io_out; // @[FloatingPointDesigns.scala 943:28]
  wire [7:0] exp = io_in_a[30:23]; // @[FloatingPointDesigns.scala 937:19]
  wire [22:0] mant = io_in_a[22:0]; // @[FloatingPointDesigns.scala 939:20]
  wire [23:0] whole_mant = {1'h1,mant}; // @[FloatingPointDesigns.scala 941:28]
  wire [7:0] subres = exp - 8'h7f; // @[FloatingPointDesigns.scala 947:21]
  wire [7:0] _expr_T_1 = 8'h17 - subres; // @[FloatingPointDesigns.scala 948:41]
  wire [23:0] _expr_T_2 = whole_mant >> _expr_T_1; // @[FloatingPointDesigns.scala 948:26]
  wire [277:0] _GEN_3 = {{255'd0}, mant}; // @[FloatingPointDesigns.scala 950:27]
  wire [277:0] _firstshiftf_T = _GEN_3 << subres; // @[FloatingPointDesigns.scala 950:27]
  wire [4:0] _new_exp_T_1 = 5'h17 - leadingOne_io_out; // @[FloatingPointDesigns.scala 953:39]
  wire [4:0] _new_exp_T_3 = _new_exp_T_1 + 5'h1; // @[FloatingPointDesigns.scala 953:59]
  wire [6:0] _GEN_5 = {{2'd0}, _new_exp_T_3}; // @[FloatingPointDesigns.scala 953:25]
  wire [6:0] _new_exp_T_5 = 7'h7f - _GEN_5; // @[FloatingPointDesigns.scala 953:25]
  wire [22:0] firstshiftf = _firstshiftf_T[22:0]; // @[FloatingPointDesigns.scala 949:29 950:19]
  wire [53:0] _GEN_4 = {{31'd0}, firstshiftf}; // @[FloatingPointDesigns.scala 955:31]
  wire [53:0] _new_mant_T_4 = _GEN_4 << _new_exp_T_3; // @[FloatingPointDesigns.scala 955:31]
  wire [7:0] new_exp = {{1'd0}, _new_exp_T_5}; // @[FloatingPointDesigns.scala 952:25 953:15]
  wire [22:0] new_mant = _new_mant_T_4[22:0]; // @[FloatingPointDesigns.scala 954:26 955:16]
  wire [31:0] _result_frac_T_2 = {io_in_a[31],new_exp,new_mant}; // @[FloatingPointDesigns.scala 956:47]
  wire [7:0] _GEN_6 = {{3'd0}, _new_exp_T_3}; // @[FloatingPointDesigns.scala 962:22]
  wire [7:0] new_exp_1 = exp - _GEN_6; // @[FloatingPointDesigns.scala 962:22]
  wire [53:0] _GEN_7 = {{31'd0}, mant}; // @[FloatingPointDesigns.scala 964:24]
  wire [53:0] _new_mant_T_9 = _GEN_7 << _new_exp_T_3; // @[FloatingPointDesigns.scala 964:24]
  wire [22:0] new_mant_1 = _new_mant_T_9[22:0]; // @[FloatingPointDesigns.scala 963:26 964:16]
  wire [31:0] _result_frac_T_5 = {io_in_a[31],new_exp_1,new_mant_1}; // @[FloatingPointDesigns.scala 965:47]
  wire [31:0] _GEN_0 = exp < 8'h7f ? io_in_a : _result_frac_T_5; // @[FloatingPointDesigns.scala 957:29 958:19 965:19]
  wire  _GEN_1 = exp < 8'h7f ? 1'h0 : 1'h1; // @[FloatingPointDesigns.scala 935:10 957:29 960:12]
  wire [23:0] _GEN_2 = exp > 8'h7f ? _expr_T_2 : {{23'd0}, _GEN_1}; // @[FloatingPointDesigns.scala 945:24 948:12]
  leadingOneDetector_8 leadingOne ( // @[FloatingPointDesigns.scala 943:28]
    .io_in(leadingOne_io_in),
    .io_out(leadingOne_io_out)
  );
  assign io_out_frac = exp > 8'h7f ? _result_frac_T_2 : _GEN_0; // @[FloatingPointDesigns.scala 945:24 956:19]
  assign io_out = {{8'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 934:20]
  assign leadingOne_io_in = exp > 8'h7f ? firstshiftf : mant; // @[FloatingPointDesigns.scala 944:22 945:24 951:24]
endmodule
module FP_exponential2(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
  wire  multiplier0_clock; // @[FloatingPointDesigns.scala 857:29]
  wire  multiplier0_reset; // @[FloatingPointDesigns.scala 857:29]
  wire [31:0] multiplier0_io_in_a; // @[FloatingPointDesigns.scala 857:29]
  wire [31:0] multiplier0_io_in_b; // @[FloatingPointDesigns.scala 857:29]
  wire [31:0] multiplier0_io_out_s; // @[FloatingPointDesigns.scala 857:29]
  wire  adder0_clock; // @[FloatingPointDesigns.scala 861:24]
  wire  adder0_reset; // @[FloatingPointDesigns.scala 861:24]
  wire [31:0] adder0_io_in_a; // @[FloatingPointDesigns.scala 861:24]
  wire [31:0] adder0_io_in_b; // @[FloatingPointDesigns.scala 861:24]
  wire [31:0] adder0_io_out_s; // @[FloatingPointDesigns.scala 861:24]
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 864:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 864:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 864:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 864:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 864:29]
  wire  adder1_clock; // @[FloatingPointDesigns.scala 868:24]
  wire  adder1_reset; // @[FloatingPointDesigns.scala 868:24]
  wire [31:0] adder1_io_in_a; // @[FloatingPointDesigns.scala 868:24]
  wire [31:0] adder1_io_in_b; // @[FloatingPointDesigns.scala 868:24]
  wire [31:0] adder1_io_out_s; // @[FloatingPointDesigns.scala 868:24]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 871:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 871:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 871:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 871:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 871:29]
  wire  adder2_clock; // @[FloatingPointDesigns.scala 875:24]
  wire  adder2_reset; // @[FloatingPointDesigns.scala 875:24]
  wire [31:0] adder2_io_in_a; // @[FloatingPointDesigns.scala 875:24]
  wire [31:0] adder2_io_in_b; // @[FloatingPointDesigns.scala 875:24]
  wire [31:0] adder2_io_out_s; // @[FloatingPointDesigns.scala 875:24]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 878:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 878:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 878:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 878:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 878:29]
  wire  adder3_clock; // @[FloatingPointDesigns.scala 882:24]
  wire  adder3_reset; // @[FloatingPointDesigns.scala 882:24]
  wire [31:0] adder3_io_in_a; // @[FloatingPointDesigns.scala 882:24]
  wire [31:0] adder3_io_in_b; // @[FloatingPointDesigns.scala 882:24]
  wire [31:0] adder3_io_out_s; // @[FloatingPointDesigns.scala 882:24]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 885:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 885:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 885:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 885:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 885:29]
  wire  adder4_clock; // @[FloatingPointDesigns.scala 889:24]
  wire  adder4_reset; // @[FloatingPointDesigns.scala 889:24]
  wire [31:0] adder4_io_in_a; // @[FloatingPointDesigns.scala 889:24]
  wire [31:0] adder4_io_in_b; // @[FloatingPointDesigns.scala 889:24]
  wire [31:0] adder4_io_out_s; // @[FloatingPointDesigns.scala 889:24]
  wire  recip_clock; // @[FloatingPointDesigns.scala 896:23]
  wire  recip_reset; // @[FloatingPointDesigns.scala 896:23]
  wire [31:0] recip_io_in_a; // @[FloatingPointDesigns.scala 896:23]
  wire [31:0] recip_io_out_s; // @[FloatingPointDesigns.scala 896:23]
  FP_multiplier multiplier0 ( // @[FloatingPointDesigns.scala 857:29]
    .clock(multiplier0_clock),
    .reset(multiplier0_reset),
    .io_in_a(multiplier0_io_in_a),
    .io_in_b(multiplier0_io_in_b),
    .io_out_s(multiplier0_io_out_s)
  );
  FP_adder adder0 ( // @[FloatingPointDesigns.scala 861:24]
    .clock(adder0_clock),
    .reset(adder0_reset),
    .io_in_a(adder0_io_in_a),
    .io_in_b(adder0_io_in_b),
    .io_out_s(adder0_io_out_s)
  );
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 864:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_adder adder1 ( // @[FloatingPointDesigns.scala 868:24]
    .clock(adder1_clock),
    .reset(adder1_reset),
    .io_in_a(adder1_io_in_a),
    .io_in_b(adder1_io_in_b),
    .io_out_s(adder1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 871:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_adder adder2 ( // @[FloatingPointDesigns.scala 875:24]
    .clock(adder2_clock),
    .reset(adder2_reset),
    .io_in_a(adder2_io_in_a),
    .io_in_b(adder2_io_in_b),
    .io_out_s(adder2_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 878:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_adder adder3 ( // @[FloatingPointDesigns.scala 882:24]
    .clock(adder3_clock),
    .reset(adder3_reset),
    .io_in_a(adder3_io_in_a),
    .io_in_b(adder3_io_in_b),
    .io_out_s(adder3_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 885:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  FP_adder adder4 ( // @[FloatingPointDesigns.scala 889:24]
    .clock(adder4_clock),
    .reset(adder4_reset),
    .io_in_a(adder4_io_in_a),
    .io_in_b(adder4_io_in_b),
    .io_out_s(adder4_io_out_s)
  );
  FP_reciprocal recip ( // @[FloatingPointDesigns.scala 896:23]
    .clock(recip_clock),
    .reset(recip_reset),
    .io_in_a(recip_io_in_a),
    .io_out_s(recip_io_out_s)
  );
  assign io_out_s = io_in_a[31] ? recip_io_out_s : adder4_io_out_s; // @[FloatingPointDesigns.scala 894:12 899:32 900:14]
  assign multiplier0_clock = clock;
  assign multiplier0_reset = reset;
  assign multiplier0_io_in_a = 32'h3c088700; // @[FloatingPointDesigns.scala 849:34 855:27]
  assign multiplier0_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 859:37]
  assign adder0_clock = clock;
  assign adder0_reset = reset;
  assign adder0_io_in_a = 32'h3d2aaaa0; // @[FloatingPointDesigns.scala 849:34 854:27]
  assign adder0_io_in_b = multiplier0_io_out_s; // @[FloatingPointDesigns.scala 863:20]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = adder0_io_out_s; // @[FloatingPointDesigns.scala 865:25]
  assign multiplier1_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 866:37]
  assign adder1_clock = clock;
  assign adder1_reset = reset;
  assign adder1_io_in_a = 32'h3e2aaac0; // @[FloatingPointDesigns.scala 849:34 853:27]
  assign adder1_io_in_b = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 870:20]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = adder1_io_out_s; // @[FloatingPointDesigns.scala 872:25]
  assign multiplier2_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 873:37]
  assign adder2_clock = clock;
  assign adder2_reset = reset;
  assign adder2_io_in_a = 32'h3f000000; // @[FloatingPointDesigns.scala 849:34 852:27]
  assign adder2_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 877:20]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = adder2_io_out_s; // @[FloatingPointDesigns.scala 879:25]
  assign multiplier3_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 880:37]
  assign adder3_clock = clock;
  assign adder3_reset = reset;
  assign adder3_io_in_a = 32'h3f800000; // @[FloatingPointDesigns.scala 849:34 851:27]
  assign adder3_io_in_b = multiplier3_io_out_s; // @[FloatingPointDesigns.scala 884:20]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = adder3_io_out_s; // @[FloatingPointDesigns.scala 886:25]
  assign multiplier4_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 887:37]
  assign adder4_clock = clock;
  assign adder4_reset = reset;
  assign adder4_io_in_a = 32'h3f800000; // @[FloatingPointDesigns.scala 849:34 850:27]
  assign adder4_io_in_b = multiplier4_io_out_s; // @[FloatingPointDesigns.scala 891:20]
  assign recip_clock = clock;
  assign recip_reset = reset;
  assign recip_io_in_a = adder4_io_out_s; // @[FloatingPointDesigns.scala 897:19]
endmodule
module FP_exponential(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
  wire [31:0] FP_comparator_io_in_b; // @[FloatingPointDesigns.scala 746:29]
  wire [31:0] FP_comparator_io_out_s; // @[FloatingPointDesigns.scala 746:29]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 759:29]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 759:29]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 759:29]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 759:29]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 759:29]
  wire [31:0] FP_extract_io_in_a; // @[FloatingPointDesigns.scala 762:32]
  wire [31:0] FP_extract_io_out_frac; // @[FloatingPointDesigns.scala 762:32]
  wire [31:0] FP_extract_io_out; // @[FloatingPointDesigns.scala 762:32]
  wire  FP_multiplier_1_clock; // @[FloatingPointDesigns.scala 765:29]
  wire  FP_multiplier_1_reset; // @[FloatingPointDesigns.scala 765:29]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FloatingPointDesigns.scala 765:29]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FloatingPointDesigns.scala 765:29]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FloatingPointDesigns.scala 765:29]
  wire  FP_exponential2_clock; // @[FloatingPointDesigns.scala 768:28]
  wire  FP_exponential2_reset; // @[FloatingPointDesigns.scala 768:28]
  wire [31:0] FP_exponential2_io_in_a; // @[FloatingPointDesigns.scala 768:28]
  wire [31:0] FP_exponential2_io_out_s; // @[FloatingPointDesigns.scala 768:28]
  wire  FP_multiplier_2_clock; // @[FloatingPointDesigns.scala 770:29]
  wire  FP_multiplier_2_reset; // @[FloatingPointDesigns.scala 770:29]
  wire [31:0] FP_multiplier_2_io_in_a; // @[FloatingPointDesigns.scala 770:29]
  wire [31:0] FP_multiplier_2_io_in_b; // @[FloatingPointDesigns.scala 770:29]
  wire [31:0] FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 770:29]
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 791:23]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 791:23]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 791:23]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 791:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 737:62]
  wire [8:0] _GEN_5 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 737:34]
  wire [23:0] _nf_T_1 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 741:39]
  wire [7:0] ne = _T_2[7:0]; // @[FloatingPointDesigns.scala 738:20 740:10]
  wire [22:0] nf = _nf_T_1[22:0]; // @[FloatingPointDesigns.scala 739:20 741:10]
  wire [31:0] _inputvalue_T_2 = {io_in_a[31],ne,nf}; // @[FloatingPointDesigns.scala 742:41]
  wire [31:0] inputvalue = _GEN_5 > _T_2 ? _inputvalue_T_2 : io_in_a; // @[FloatingPointDesigns.scala 737:68 742:18 744:18]
  wire [31:0] inputvalue2 = FP_comparator_io_out_s != 32'h42b40000 ? 32'h42b40000 : inputvalue; // @[FloatingPointDesigns.scala 751:39 752:19 754:19]
  wire [31:0] check_exp = 32'h7f + FP_extract_io_out; // @[FloatingPointDesigns.scala 772:39]
  wire [31:0] _GEN_6 = {{23'd0}, _T_2}; // @[FloatingPointDesigns.scala 777:20]
  wire [31:0] _GEN_2 = check_exp > _GEN_6 ? {{23'd0}, _T_2} : check_exp; // @[FloatingPointDesigns.scala 777:54 778:15 781:15]
  wire [23:0] _GEN_3 = check_exp > _GEN_6 ? _nf_T_1 : 24'h0; // @[FloatingPointDesigns.scala 777:54 779:16 782:16]
  wire [7:0] new_exp = _GEN_2[7:0]; // @[FloatingPointDesigns.scala 773:23]
  wire [8:0] _T_12 = {1'h0,new_exp}; // @[FloatingPointDesigns.scala 784:36]
  wire [22:0] new_frac = _GEN_3[22:0]; // @[FloatingPointDesigns.scala 775:24]
  wire [31:0] result = FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 788:22 789:12]
  FP_comparator FP_comparator ( // @[FloatingPointDesigns.scala 746:29]
    .io_in_b(FP_comparator_io_in_b),
    .io_out_s(FP_comparator_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 759:29]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_extract FP_extract ( // @[FloatingPointDesigns.scala 762:32]
    .io_in_a(FP_extract_io_in_a),
    .io_out_frac(FP_extract_io_out_frac),
    .io_out(FP_extract_io_out)
  );
  FP_multiplier FP_multiplier_1 ( // @[FloatingPointDesigns.scala 765:29]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  FP_exponential2 FP_exponential2 ( // @[FloatingPointDesigns.scala 768:28]
    .clock(FP_exponential2_clock),
    .reset(FP_exponential2_reset),
    .io_in_a(FP_exponential2_io_in_a),
    .io_out_s(FP_exponential2_io_out_s)
  );
  FP_multiplier FP_multiplier_2 ( // @[FloatingPointDesigns.scala 770:29]
    .clock(FP_multiplier_2_clock),
    .reset(FP_multiplier_2_reset),
    .io_in_a(FP_multiplier_2_io_in_a),
    .io_in_b(FP_multiplier_2_io_in_b),
    .io_out_s(FP_multiplier_2_io_out_s)
  );
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 791:23]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  assign io_out_s = io_in_a[31] ? FP_reciprocal_io_out_s : result; // @[FloatingPointDesigns.scala 794:32 795:16 797:16]
  assign FP_comparator_io_in_b = {1'h0,inputvalue[30:0]}; // @[FloatingPointDesigns.scala 748:33]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = 32'h3fb8aa3b; // @[FloatingPointDesigns.scala 760:22]
  assign FP_multiplier_io_in_b = {1'h0,inputvalue2[30:0]}; // @[FloatingPointDesigns.scala 761:34]
  assign FP_extract_io_in_a = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 763:25]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = 32'h3f317216; // @[FloatingPointDesigns.scala 766:22]
  assign FP_multiplier_1_io_in_b = FP_extract_io_out_frac; // @[FloatingPointDesigns.scala 767:22]
  assign FP_exponential2_clock = clock;
  assign FP_exponential2_reset = reset;
  assign FP_exponential2_io_in_a = FP_multiplier_1_io_out_s; // @[FloatingPointDesigns.scala 769:21]
  assign FP_multiplier_2_clock = clock;
  assign FP_multiplier_2_reset = reset;
  assign FP_multiplier_2_io_in_a = {_T_12,new_frac}; // @[FloatingPointDesigns.scala 784:47]
  assign FP_multiplier_2_io_in_b = FP_exponential2_io_out_s; // @[FloatingPointDesigns.scala 785:22]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 788:22 789:12]
endmodule
module FPU_ls_lib(
  input         clock,
  input         reset,
  input  [31:0] io_add_a,
  input  [31:0] io_add_b,
  output [31:0] io_add_s,
  input  [31:0] io_sub_a,
  input  [31:0] io_sub_b,
  output [31:0] io_sub_s,
  input  [31:0] io_mul_a,
  input  [31:0] io_mul_b,
  output [31:0] io_mul_s,
  input  [31:0] io_div_a,
  input  [31:0] io_div_b,
  output [31:0] io_div_s,
  input  [31:0] io_rec_a,
  output [31:0] io_rec_s,
  input  [31:0] io_sqr_a,
  output [31:0] io_sqr_s,
  input  [31:0] io_exp_a,
  output [31:0] io_exp_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 35:21]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 35:21]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 35:21]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 35:21]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 35:21]
  wire  FP_subber_clock; // @[FloatingPointDesigns.scala 36:21]
  wire  FP_subber_reset; // @[FloatingPointDesigns.scala 36:21]
  wire [31:0] FP_subber_io_in_a; // @[FloatingPointDesigns.scala 36:21]
  wire [31:0] FP_subber_io_in_b; // @[FloatingPointDesigns.scala 36:21]
  wire [31:0] FP_subber_io_out_s; // @[FloatingPointDesigns.scala 36:21]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 37:21]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 37:21]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 37:21]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 37:21]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 37:21]
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 38:21]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 38:21]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 38:21]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 38:21]
  wire  FP_divider_clock; // @[FloatingPointDesigns.scala 39:21]
  wire  FP_divider_reset; // @[FloatingPointDesigns.scala 39:21]
  wire [31:0] FP_divider_io_in_a; // @[FloatingPointDesigns.scala 39:21]
  wire [31:0] FP_divider_io_in_b; // @[FloatingPointDesigns.scala 39:21]
  wire [31:0] FP_divider_io_out_s; // @[FloatingPointDesigns.scala 39:21]
  wire  FP_square_root_clock; // @[FloatingPointDesigns.scala 40:21]
  wire  FP_square_root_reset; // @[FloatingPointDesigns.scala 40:21]
  wire [31:0] FP_square_root_io_in_a; // @[FloatingPointDesigns.scala 40:21]
  wire [31:0] FP_square_root_io_out_s; // @[FloatingPointDesigns.scala 40:21]
  wire  FP_exponential_clock; // @[FloatingPointDesigns.scala 41:21]
  wire  FP_exponential_reset; // @[FloatingPointDesigns.scala 41:21]
  wire [31:0] FP_exponential_io_in_a; // @[FloatingPointDesigns.scala 41:21]
  wire [31:0] FP_exponential_io_out_s; // @[FloatingPointDesigns.scala 41:21]
  FP_adder FP_adder ( // @[FloatingPointDesigns.scala 35:21]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_subber FP_subber ( // @[FloatingPointDesigns.scala 36:21]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 37:21]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 38:21]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  FP_divider FP_divider ( // @[FloatingPointDesigns.scala 39:21]
    .clock(FP_divider_clock),
    .reset(FP_divider_reset),
    .io_in_a(FP_divider_io_in_a),
    .io_in_b(FP_divider_io_in_b),
    .io_out_s(FP_divider_io_out_s)
  );
  FP_square_root FP_square_root ( // @[FloatingPointDesigns.scala 40:21]
    .clock(FP_square_root_clock),
    .reset(FP_square_root_reset),
    .io_in_a(FP_square_root_io_in_a),
    .io_out_s(FP_square_root_io_out_s)
  );
  FP_exponential FP_exponential ( // @[FloatingPointDesigns.scala 41:21]
    .clock(FP_exponential_clock),
    .reset(FP_exponential_reset),
    .io_in_a(FP_exponential_io_in_a),
    .io_out_s(FP_exponential_io_out_s)
  );
  assign io_add_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 44:14]
  assign io_sub_s = FP_subber_io_out_s; // @[FloatingPointDesigns.scala 47:14]
  assign io_mul_s = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 50:14]
  assign io_div_s = FP_divider_io_out_s; // @[FloatingPointDesigns.scala 53:14]
  assign io_rec_s = FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 55:14]
  assign io_sqr_s = FP_square_root_io_out_s; // @[FloatingPointDesigns.scala 57:14]
  assign io_exp_s = FP_exponential_io_out_s; // @[FloatingPointDesigns.scala 59:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_add_a; // @[FloatingPointDesigns.scala 42:14]
  assign FP_adder_io_in_b = io_add_b; // @[FloatingPointDesigns.scala 43:14]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = io_sub_a; // @[FloatingPointDesigns.scala 45:14]
  assign FP_subber_io_in_b = io_sub_b; // @[FloatingPointDesigns.scala 46:14]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = io_mul_a; // @[FloatingPointDesigns.scala 48:14]
  assign FP_multiplier_io_in_b = io_mul_b; // @[FloatingPointDesigns.scala 49:14]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = io_rec_a; // @[FloatingPointDesigns.scala 54:14]
  assign FP_divider_clock = clock;
  assign FP_divider_reset = reset;
  assign FP_divider_io_in_a = io_div_a; // @[FloatingPointDesigns.scala 51:14]
  assign FP_divider_io_in_b = io_div_b; // @[FloatingPointDesigns.scala 52:14]
  assign FP_square_root_clock = clock;
  assign FP_square_root_reset = reset;
  assign FP_square_root_io_in_a = io_sqr_a; // @[FloatingPointDesigns.scala 56:14]
  assign FP_exponential_clock = clock;
  assign FP_exponential_reset = reset;
  assign FP_exponential_io_in_a = io_exp_a; // @[FloatingPointDesigns.scala 58:14]
endmodule

