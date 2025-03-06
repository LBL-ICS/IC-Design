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
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 186:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 186:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 186:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 186:24]
  wire [7:0] complement_io_in; // @[FloatingPointDesigns.scala 192:28]
  wire [7:0] complement_io_out; // @[FloatingPointDesigns.scala 192:28]
  wire [23:0] adder_io_in_a; // @[FloatingPointDesigns.scala 196:23]
  wire [23:0] adder_io_in_b; // @[FloatingPointDesigns.scala 196:23]
  wire [23:0] adder_io_out_s; // @[FloatingPointDesigns.scala 196:23]
  wire  adder_io_out_c; // @[FloatingPointDesigns.scala 196:23]
  wire [23:0] complementN_0_io_in; // @[FloatingPointDesigns.scala 202:31]
  wire [23:0] complementN_0_io_out; // @[FloatingPointDesigns.scala 202:31]
  wire [23:0] complementN_1_io_in; // @[FloatingPointDesigns.scala 204:31]
  wire [23:0] complementN_1_io_out; // @[FloatingPointDesigns.scala 204:31]
  wire [23:0] shifter_io_in_a; // @[FloatingPointDesigns.scala 208:25]
  wire [4:0] shifter_io_in_b; // @[FloatingPointDesigns.scala 208:25]
  wire [23:0] shifter_io_out_s; // @[FloatingPointDesigns.scala 208:25]
  wire [23:0] complementN_2_io_in; // @[FloatingPointDesigns.scala 253:31]
  wire [23:0] complementN_2_io_out; // @[FloatingPointDesigns.scala 253:31]
  wire [23:0] leadingOneFinder_io_in; // @[FloatingPointDesigns.scala 273:34]
  wire [4:0] leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 273:34]
  wire [7:0] subber2_io_in_a; // @[FloatingPointDesigns.scala 275:25]
  wire [7:0] subber2_io_in_b; // @[FloatingPointDesigns.scala 275:25]
  wire [7:0] subber2_io_out_s; // @[FloatingPointDesigns.scala 275:25]
  wire  subber2_io_out_c; // @[FloatingPointDesigns.scala 275:25]
  wire  sign_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 148:23]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 149:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 153:62]
  wire [8:0] _GEN_31 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 153:34]
  wire [8:0] _GEN_0 = _GEN_31 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 153:68 154:14 156:14]
  wire [8:0] _GEN_32 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 158:34]
  wire [8:0] _GEN_1 = _GEN_32 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 158:68 159:14 161:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 166:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 167:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 171:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 172:26]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 152:19]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 152:19]
  wire [7:0] out_exp = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 214:34 215:15 225:15]
  wire [7:0] sub_exp = subber_io_out_c ? complement_io_out : subber_io_out_s; // @[FloatingPointDesigns.scala 214:34 216:15 226:15]
  wire  out_s = subber_io_out_c ? sign_1 : sign_0; // @[FloatingPointDesigns.scala 214:34 217:13 227:13]
  wire [22:0] out_frac = subber_io_out_c ? frac_1 : frac_0; // @[FloatingPointDesigns.scala 214:34 218:16 228:16]
  wire [23:0] _GEN_8 = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 197:19 214:34 222:21]
  wire [23:0] _GEN_9 = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 198:19 214:34 232:21]
  wire  _new_s_T = ~adder_io_out_c; // @[FloatingPointDesigns.scala 248:15]
  wire  _D_T_1 = sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 261:39]
  wire  D = _new_s_T | sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 261:28]
  wire  E = _new_s_T & ~adder_io_out_s[23] | _new_s_T & ~_D_T_1 | adder_io_out_c & adder_io_out_s[23] & _D_T_1; // @[FloatingPointDesigns.scala 264:99]
  wire  _GEN_25 = sub_exp >= 8'h17 ? out_s : ~adder_io_out_c & sign_0 | sign_0 & sign_1 | ~adder_io_out_c & sign_1; // @[FloatingPointDesigns.scala 248:11 283:39 284:13]
  wire  new_s = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 1'h0 : _GEN_25; // @[FloatingPointDesigns.scala 279:62 280:13]
  wire [23:0] adder_result = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 267:18 268:47 269:20]
  wire [4:0] _subber2_io_in_b_T_1 = 5'h18 - leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 277:42]
  wire [8:0] _GEN_33 = {{1'd0}, out_exp}; // @[FloatingPointDesigns.scala 291:20]
  wire [23:0] _new_out_frac_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 293:51]
  wire [7:0] _new_out_exp_T_3 = out_exp + 8'h1; // @[FloatingPointDesigns.scala 295:32]
  wire [8:0] _GEN_13 = _GEN_33 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_T_3}; // @[FloatingPointDesigns.scala 291:56 292:21 295:21]
  wire [23:0] _GEN_14 = _GEN_33 == _T_2 ? _new_out_frac_T_2 : {{1'd0}, adder_result[23:1]}; // @[FloatingPointDesigns.scala 291:56 293:22 296:22]
  wire [53:0] _GEN_2 = {{31'd0}, adder_result[22:0]}; // @[FloatingPointDesigns.scala 307:57]
  wire [53:0] _new_out_frac_T_7 = _GEN_2 << _subber2_io_in_b_T_1; // @[FloatingPointDesigns.scala 307:57]
  wire [7:0] _GEN_15 = subber2_io_out_c ? 8'h1 : subber2_io_out_s; // @[FloatingPointDesigns.scala 302:39 303:23 306:23]
  wire [53:0] _GEN_16 = subber2_io_out_c ? 54'h400000 : _new_out_frac_T_7; // @[FloatingPointDesigns.scala 302:39 304:24 307:24]
  wire [7:0] _GEN_17 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:0
    ]) ? 8'h0 : _GEN_15; // @[FloatingPointDesigns.scala 299:141 300:21]
  wire [53:0] _GEN_18 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:
    0]) ? 54'h0 : _GEN_16; // @[FloatingPointDesigns.scala 299:141 249:18]
  wire [7:0] _GEN_19 = D ? _GEN_17 : 8'h0; // @[FloatingPointDesigns.scala 250:17 298:26]
  wire [53:0] _GEN_20 = D ? _GEN_18 : 54'h0; // @[FloatingPointDesigns.scala 249:18 298:26]
  wire [8:0] _GEN_21 = ~D ? _GEN_13 : {{1'd0}, _GEN_19}; // @[FloatingPointDesigns.scala 290:26]
  wire [53:0] _GEN_22 = ~D ? {{30'd0}, _GEN_14} : _GEN_20; // @[FloatingPointDesigns.scala 290:26]
  wire [8:0] _GEN_23 = E ? {{1'd0}, out_exp} : _GEN_21; // @[FloatingPointDesigns.scala 287:26 288:19]
  wire [53:0] _GEN_24 = E ? {{31'd0}, adder_result[22:0]} : _GEN_22; // @[FloatingPointDesigns.scala 287:26 289:20]
  wire [53:0] _GEN_26 = sub_exp >= 8'h17 ? {{31'd0}, out_frac} : _GEN_24; // @[FloatingPointDesigns.scala 283:39 285:20]
  wire [8:0] _GEN_27 = sub_exp >= 8'h17 ? {{1'd0}, out_exp} : _GEN_23; // @[FloatingPointDesigns.scala 283:39 286:19]
  wire [8:0] _GEN_29 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 9'h0 : _GEN_27; // @[FloatingPointDesigns.scala 279:62 281:19]
  wire [53:0] _GEN_30 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 54'h0 : _GEN_26; // @[FloatingPointDesigns.scala 279:62 282:20]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 311:28]
  wire [7:0] new_out_exp = _GEN_29[7:0]; // @[FloatingPointDesigns.scala 247:27]
  wire [22:0] new_out_frac = _GEN_30[22:0]; // @[FloatingPointDesigns.scala 246:28]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_out_exp,new_out_frac}; // @[FloatingPointDesigns.scala 313:39]
  full_subber subber ( // @[FloatingPointDesigns.scala 186:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complement ( // @[FloatingPointDesigns.scala 192:28]
    .io_in(complement_io_in),
    .io_out(complement_io_out)
  );
  full_adder adder ( // @[FloatingPointDesigns.scala 196:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  twoscomplement_1 complementN_0 ( // @[FloatingPointDesigns.scala 202:31]
    .io_in(complementN_0_io_in),
    .io_out(complementN_0_io_out)
  );
  twoscomplement_1 complementN_1 ( // @[FloatingPointDesigns.scala 204:31]
    .io_in(complementN_1_io_in),
    .io_out(complementN_1_io_out)
  );
  shifter shifter ( // @[FloatingPointDesigns.scala 208:25]
    .io_in_a(shifter_io_in_a),
    .io_in_b(shifter_io_in_b),
    .io_out_s(shifter_io_out_s)
  );
  twoscomplement_1 complementN_2 ( // @[FloatingPointDesigns.scala 253:31]
    .io_in(complementN_2_io_in),
    .io_out(complementN_2_io_out)
  );
  leadingOneDetector leadingOneFinder ( // @[FloatingPointDesigns.scala 273:34]
    .io_in(leadingOneFinder_io_in),
    .io_out(leadingOneFinder_io_out)
  );
  full_subber subber2 ( // @[FloatingPointDesigns.scala 275:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 315:14]
  assign subber_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 152:19]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 152:19]
  assign complement_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 193:22]
  assign adder_io_in_a = sign_0 & ~sign_1 ? complementN_0_io_out : _GEN_8; // @[FloatingPointDesigns.scala 237:45 238:21]
  assign adder_io_in_b = sign_1 & ~sign_0 ? complementN_1_io_out : _GEN_9; // @[FloatingPointDesigns.scala 241:45 242:21]
  assign complementN_0_io_in = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 197:19 214:34 222:21]
  assign complementN_1_io_in = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 198:19 214:34 232:21]
  assign shifter_io_in_a = subber_io_out_c ? whole_frac_0 : whole_frac_1; // @[FloatingPointDesigns.scala 214:34 219:23 229:23]
  assign shifter_io_in_b = sub_exp[4:0];
  assign complementN_2_io_in = adder_io_out_s; // @[FloatingPointDesigns.scala 254:25]
  assign leadingOneFinder_io_in = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 267:18 268:47 269:20]
  assign subber2_io_in_a = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 214:34 215:15 225:15]
  assign subber2_io_in_b = {{3'd0}, _subber2_io_in_b_T_1}; // @[FloatingPointDesigns.scala 277:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 311:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 311:28]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 313:15]
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
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 327:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 327:26]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 327:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 327:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 327:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 330:23]
  FP_adder FP_adder ( // @[FloatingPointDesigns.scala 327:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 333:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 331:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 330:39]
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
  wire [23:0] multiplier_io_in_a; // @[FloatingPointDesigns.scala 397:28]
  wire [23:0] multiplier_io_in_b; // @[FloatingPointDesigns.scala 397:28]
  wire [47:0] multiplier_io_out_s; // @[FloatingPointDesigns.scala 397:28]
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 402:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 402:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 402:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 402:24]
  wire [7:0] complementN_io_in; // @[FloatingPointDesigns.scala 408:29]
  wire [7:0] complementN_io_out; // @[FloatingPointDesigns.scala 408:29]
  wire [7:0] adderN_io_in_a; // @[FloatingPointDesigns.scala 412:24]
  wire [7:0] adderN_io_in_b; // @[FloatingPointDesigns.scala 412:24]
  wire [7:0] adderN_io_out_s; // @[FloatingPointDesigns.scala 412:24]
  wire  s_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 362:20]
  wire  s_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 363:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 367:62]
  wire [8:0] _GEN_13 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 367:34]
  wire [8:0] _GEN_0 = _GEN_13 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 367:68 368:14 370:14]
  wire [8:0] _GEN_14 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 372:34]
  wire [8:0] _GEN_1 = _GEN_14 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 372:68 373:14 375:14]
  wire [22:0] exp_check_0 = {{15'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 378:25 379:18]
  wire [22:0] _cond_holder_T_1 = exp_check_0 + 23'h1; // @[FloatingPointDesigns.scala 383:34]
  wire [22:0] exp_check_1 = {{15'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 378:25 380:18]
  wire [22:0] _cond_holder_T_3 = 23'h7f - exp_check_1; // @[FloatingPointDesigns.scala 383:80]
  wire [22:0] _cond_holder_T_4 = ~_cond_holder_T_3; // @[FloatingPointDesigns.scala 383:42]
  wire [22:0] _cond_holder_T_6 = _cond_holder_T_1 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 383:40]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 387:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 388:23]
  wire  new_s = s_0 ^ s_1; // @[FloatingPointDesigns.scala 419:19]
  wire [7:0] _new_exp_T_1 = adderN_io_out_s + 8'h1; // @[FloatingPointDesigns.scala 430:34]
  wire [22:0] _cond_holder_T_8 = exp_check_0 + 23'h2; // @[FloatingPointDesigns.scala 432:36]
  wire [22:0] _cond_holder_T_13 = _cond_holder_T_8 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 432:42]
  wire [23:0] _new_mant_T_2 = {multiplier_io_out_s[46:24], 1'h0}; // @[FloatingPointDesigns.scala 438:73]
  wire [7:0] _GEN_2 = multiplier_io_out_s[47] ? _new_exp_T_1 : adderN_io_out_s; // @[FloatingPointDesigns.scala 429:60 430:15 435:15]
  wire [22:0] cond_holder = multiplier_io_out_s[47] ? _cond_holder_T_13 : _cond_holder_T_6; // @[FloatingPointDesigns.scala 429:60 432:19 437:19]
  wire [23:0] _GEN_5 = multiplier_io_out_s[47] ? {{1'd0}, multiplier_io_out_s[46:24]} : _new_mant_T_2; // @[FloatingPointDesigns.scala 429:60 433:16 438:16]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 440:28]
  wire [22:0] _T_12 = ~cond_holder; // @[FloatingPointDesigns.scala 442:51]
  wire [22:0] _T_14 = 23'h1 + _T_12; // @[FloatingPointDesigns.scala 442:49]
  wire [22:0] _GEN_15 = {{14'd0}, _T_2}; // @[FloatingPointDesigns.scala 442:42]
  wire [8:0] _GEN_6 = cond_holder > _GEN_15 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 447:63 448:17]
  wire [8:0] _GEN_9 = _GEN_15 >= _T_14 ? 9'h1 : _GEN_6; // @[FloatingPointDesigns.scala 442:67 443:15]
  wire [7:0] new_exp = _GEN_9[7:0]; // @[FloatingPointDesigns.scala 422:23]
  wire [23:0] _new_mant_T_4 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 449:47]
  wire [23:0] _GEN_7 = cond_holder > _GEN_15 ? _new_mant_T_4 : _GEN_5; // @[FloatingPointDesigns.scala 447:63 449:18]
  wire [23:0] _GEN_10 = _GEN_15 >= _T_14 ? 24'h400000 : _GEN_7; // @[FloatingPointDesigns.scala 442:67 444:16]
  wire [22:0] new_mant = _GEN_10[22:0]; // @[FloatingPointDesigns.scala 424:24]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_exp,new_mant}; // @[FloatingPointDesigns.scala 445:37]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 366:19]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 366:19]
  multiplier multiplier ( // @[FloatingPointDesigns.scala 397:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FloatingPointDesigns.scala 402:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complementN ( // @[FloatingPointDesigns.scala 408:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder_2 adderN ( // @[FloatingPointDesigns.scala 412:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 457:14]
  assign multiplier_io_in_a = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 392:24]
  assign multiplier_io_in_b = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 393:24]
  assign subber_io_in_a = 8'h7f; // @[FloatingPointDesigns.scala 403:20]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 366:19]
  assign complementN_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 409:23]
  assign adderN_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 366:19]
  assign adderN_io_in_b = complementN_io_out; // @[FloatingPointDesigns.scala 414:20]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 440:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 440:28]
    end else if (exp_0 == 8'h0 | exp_1 == 8'h0) begin // @[FloatingPointDesigns.scala 452:43]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 453:17]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 455:17]
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
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 521:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 521:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 521:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 521:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 521:29]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 531:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 531:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 531:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 531:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 531:29]
  wire  sub_clock; // @[FloatingPointDesigns.scala 542:21]
  wire  sub_reset; // @[FloatingPointDesigns.scala 542:21]
  wire [31:0] sub_io_in_a; // @[FloatingPointDesigns.scala 542:21]
  wire [31:0] sub_io_in_b; // @[FloatingPointDesigns.scala 542:21]
  wire [31:0] sub_io_out_s; // @[FloatingPointDesigns.scala 542:21]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 550:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 550:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 550:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 550:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 550:29]
  wire  multiplier5_clock; // @[FloatingPointDesigns.scala 561:29]
  wire  multiplier5_reset; // @[FloatingPointDesigns.scala 561:29]
  wire [31:0] multiplier5_io_in_a; // @[FloatingPointDesigns.scala 561:29]
  wire [31:0] multiplier5_io_in_b; // @[FloatingPointDesigns.scala 561:29]
  wire [31:0] multiplier5_io_out_s; // @[FloatingPointDesigns.scala 561:29]
  wire  multiplier6_clock; // @[FloatingPointDesigns.scala 570:29]
  wire  multiplier6_reset; // @[FloatingPointDesigns.scala 570:29]
  wire [31:0] multiplier6_io_in_a; // @[FloatingPointDesigns.scala 570:29]
  wire [31:0] multiplier6_io_in_b; // @[FloatingPointDesigns.scala 570:29]
  wire [31:0] multiplier6_io_out_s; // @[FloatingPointDesigns.scala 570:29]
  wire  sub2_clock; // @[FloatingPointDesigns.scala 579:22]
  wire  sub2_reset; // @[FloatingPointDesigns.scala 579:22]
  wire [31:0] sub2_io_in_a; // @[FloatingPointDesigns.scala 579:22]
  wire [31:0] sub2_io_in_b; // @[FloatingPointDesigns.scala 579:22]
  wire [31:0] sub2_io_out_s; // @[FloatingPointDesigns.scala 579:22]
  wire  multiplier7_clock; // @[FloatingPointDesigns.scala 588:29]
  wire  multiplier7_reset; // @[FloatingPointDesigns.scala 588:29]
  wire [31:0] multiplier7_io_in_a; // @[FloatingPointDesigns.scala 588:29]
  wire [31:0] multiplier7_io_in_b; // @[FloatingPointDesigns.scala 588:29]
  wire [31:0] multiplier7_io_out_s; // @[FloatingPointDesigns.scala 588:29]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 595:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 595:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 595:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 595:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 595:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 498:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 495:46 496:14 498:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 492:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 506:25]
  wire [7:0] exp = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 509:38]
  wire [31:0] half_input = {io_in_a[31],exp,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 512:42]
  reg [31:0] half_input_reg_1; // @[FloatingPointDesigns.scala 514:35]
  reg [31:0] result_reg_1; // @[FloatingPointDesigns.scala 516:31]
  reg [31:0] input_reg_1; // @[FloatingPointDesigns.scala 518:30]
  reg [31:0] half_input_reg_2; // @[FloatingPointDesigns.scala 525:35]
  reg [31:0] result_reg_2; // @[FloatingPointDesigns.scala 527:31]
  reg [31:0] input_reg_2; // @[FloatingPointDesigns.scala 529:30]
  reg [31:0] half_input_reg_3; // @[FloatingPointDesigns.scala 536:35]
  reg [31:0] result_reg_3; // @[FloatingPointDesigns.scala 538:31]
  reg [31:0] input_reg_3; // @[FloatingPointDesigns.scala 540:30]
  reg [31:0] half_input_reg_4; // @[FloatingPointDesigns.scala 546:35]
  reg [31:0] input_reg_4; // @[FloatingPointDesigns.scala 548:30]
  reg [31:0] mult3_reg_1; // @[FloatingPointDesigns.scala 555:30]
  reg [31:0] half_input_reg_5; // @[FloatingPointDesigns.scala 557:35]
  reg [31:0] input_reg_5; // @[FloatingPointDesigns.scala 559:30]
  reg [31:0] mult3_reg_2; // @[FloatingPointDesigns.scala 566:30]
  reg [31:0] input_reg_6; // @[FloatingPointDesigns.scala 568:30]
  reg [31:0] mult3_reg_3; // @[FloatingPointDesigns.scala 575:30]
  reg [31:0] input_reg_7; // @[FloatingPointDesigns.scala 577:30]
  reg [31:0] input_reg_8; // @[FloatingPointDesigns.scala 586:30]
  reg [31:0] input_reg_9; // @[FloatingPointDesigns.scala 592:30]
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 521:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 531:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_subber sub ( // @[FloatingPointDesigns.scala 542:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_in_a(sub_io_in_a),
    .io_in_b(sub_io_in_b),
    .io_out_s(sub_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 550:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_multiplier multiplier5 ( // @[FloatingPointDesigns.scala 561:29]
    .clock(multiplier5_clock),
    .reset(multiplier5_reset),
    .io_in_a(multiplier5_io_in_a),
    .io_in_b(multiplier5_io_in_b),
    .io_out_s(multiplier5_io_out_s)
  );
  FP_multiplier multiplier6 ( // @[FloatingPointDesigns.scala 570:29]
    .clock(multiplier6_clock),
    .reset(multiplier6_reset),
    .io_in_a(multiplier6_io_in_a),
    .io_in_b(multiplier6_io_in_b),
    .io_out_s(multiplier6_io_out_s)
  );
  FP_subber sub2 ( // @[FloatingPointDesigns.scala 579:22]
    .clock(sub2_clock),
    .reset(sub2_reset),
    .io_in_a(sub2_io_in_a),
    .io_in_b(sub2_io_in_b),
    .io_out_s(sub2_io_out_s)
  );
  FP_multiplier multiplier7 ( // @[FloatingPointDesigns.scala 588:29]
    .clock(multiplier7_clock),
    .reset(multiplier7_reset),
    .io_in_a(multiplier7_io_in_a),
    .io_in_b(multiplier7_io_in_b),
    .io_out_s(multiplier7_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 595:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {input_reg_9[31],multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 598:37]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 522:37]
  assign multiplier1_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 523:37]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 532:25]
  assign multiplier2_io_in_b = {1'h0,half_input_reg_1[30:0]}; // @[FloatingPointDesigns.scala 533:37]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 493:26 494:16]
  assign sub_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 544:17]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = sub_io_out_s; // @[FloatingPointDesigns.scala 551:25]
  assign multiplier3_io_in_b = {1'h0,result_reg_3[30:0]}; // @[FloatingPointDesigns.scala 552:37]
  assign multiplier5_clock = clock;
  assign multiplier5_reset = reset;
  assign multiplier5_io_in_a = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 562:37]
  assign multiplier5_io_in_b = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 563:37]
  assign multiplier6_clock = clock;
  assign multiplier6_reset = reset;
  assign multiplier6_io_in_a = multiplier5_io_out_s; // @[FloatingPointDesigns.scala 571:25]
  assign multiplier6_io_in_b = {1'h0,half_input_reg_5[30:0]}; // @[FloatingPointDesigns.scala 572:37]
  assign sub2_clock = clock;
  assign sub2_reset = reset;
  assign sub2_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 493:26 494:16]
  assign sub2_io_in_b = multiplier6_io_out_s; // @[FloatingPointDesigns.scala 581:18]
  assign multiplier7_clock = clock;
  assign multiplier7_reset = reset;
  assign multiplier7_io_in_a = sub2_io_out_s; // @[FloatingPointDesigns.scala 589:25]
  assign multiplier7_io_in_b = {1'h0,mult3_reg_3[30:0]}; // @[FloatingPointDesigns.scala 590:37]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 596:37]
  assign multiplier4_io_in_b = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 597:37]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 514:35]
      half_input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 514:35]
    end else begin
      half_input_reg_1 <= half_input; // @[FloatingPointDesigns.scala 515:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 516:31]
      result_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 516:31]
    end else begin
      result_reg_1 <= result; // @[FloatingPointDesigns.scala 517:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 518:30]
      input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 518:30]
    end else begin
      input_reg_1 <= io_in_a; // @[FloatingPointDesigns.scala 519:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 525:35]
      half_input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 525:35]
    end else begin
      half_input_reg_2 <= half_input_reg_1; // @[FloatingPointDesigns.scala 526:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 527:31]
      result_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 527:31]
    end else begin
      result_reg_2 <= result_reg_1; // @[FloatingPointDesigns.scala 528:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 529:30]
      input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 529:30]
    end else begin
      input_reg_2 <= input_reg_1; // @[FloatingPointDesigns.scala 530:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 536:35]
      half_input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 536:35]
    end else begin
      half_input_reg_3 <= half_input_reg_2; // @[FloatingPointDesigns.scala 537:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 538:31]
      result_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 538:31]
    end else begin
      result_reg_3 <= result_reg_2; // @[FloatingPointDesigns.scala 539:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 540:30]
      input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 540:30]
    end else begin
      input_reg_3 <= input_reg_2; // @[FloatingPointDesigns.scala 541:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 546:35]
      half_input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 546:35]
    end else begin
      half_input_reg_4 <= half_input_reg_3; // @[FloatingPointDesigns.scala 547:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 548:30]
      input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 548:30]
    end else begin
      input_reg_4 <= input_reg_3; // @[FloatingPointDesigns.scala 549:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 555:30]
      mult3_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 555:30]
    end else begin
      mult3_reg_1 <= multiplier3_io_out_s; // @[FloatingPointDesigns.scala 556:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 557:35]
      half_input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 557:35]
    end else begin
      half_input_reg_5 <= half_input_reg_4; // @[FloatingPointDesigns.scala 558:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 559:30]
      input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 559:30]
    end else begin
      input_reg_5 <= input_reg_4; // @[FloatingPointDesigns.scala 560:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 566:30]
      mult3_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 566:30]
    end else begin
      mult3_reg_2 <= mult3_reg_1; // @[FloatingPointDesigns.scala 567:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 568:30]
      input_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 568:30]
    end else begin
      input_reg_6 <= input_reg_5; // @[FloatingPointDesigns.scala 569:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 575:30]
      mult3_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 575:30]
    end else begin
      mult3_reg_3 <= mult3_reg_2; // @[FloatingPointDesigns.scala 576:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 577:30]
      input_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 577:30]
    end else begin
      input_reg_7 <= input_reg_6; // @[FloatingPointDesigns.scala 578:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 586:30]
      input_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 586:30]
    end else begin
      input_reg_8 <= input_reg_7; // @[FloatingPointDesigns.scala 587:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 592:30]
      input_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 592:30]
    end else begin
      input_reg_9 <= input_reg_8; // @[FloatingPointDesigns.scala 593:17]
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
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 608:28]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 608:28]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 608:28]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 608:28]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 609:28]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 609:28]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 609:28]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 609:28]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 609:28]
  reg [31:0] regs_0; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_1; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_2; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_3; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_4; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_5; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_6; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_7; // @[FloatingPointDesigns.scala 610:23]
  reg [31:0] regs_8; // @[FloatingPointDesigns.scala 610:23]
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 608:28]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 609:28]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  assign io_out_s = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 618:14]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = io_in_b; // @[FloatingPointDesigns.scala 615:21]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = regs_8; // @[FloatingPointDesigns.scala 616:21]
  assign FP_multiplier_io_in_b = FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 617:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_0 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_0 <= io_in_a; // @[FloatingPointDesigns.scala 611:13]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_1 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_1 <= regs_0; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_2 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_2 <= regs_1; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_3 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_3 <= regs_2; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_4 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_4 <= regs_3; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_5 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_5 <= regs_4; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_6 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_6 <= regs_5; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_7 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_7 <= regs_6; // @[FloatingPointDesigns.scala 613:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 610:23]
      regs_8 <= 32'h0; // @[FloatingPointDesigns.scala 610:23]
    end else begin
      regs_8 <= regs_7; // @[FloatingPointDesigns.scala 613:17]
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
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 679:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 679:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 679:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 679:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 679:29]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 689:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 689:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 689:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 689:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 689:29]
  wire  sub_clock; // @[FloatingPointDesigns.scala 700:21]
  wire  sub_reset; // @[FloatingPointDesigns.scala 700:21]
  wire [31:0] sub_io_in_a; // @[FloatingPointDesigns.scala 700:21]
  wire [31:0] sub_io_in_b; // @[FloatingPointDesigns.scala 700:21]
  wire [31:0] sub_io_out_s; // @[FloatingPointDesigns.scala 700:21]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 708:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 708:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 708:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 708:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 708:29]
  wire  multiplier5_clock; // @[FloatingPointDesigns.scala 719:29]
  wire  multiplier5_reset; // @[FloatingPointDesigns.scala 719:29]
  wire [31:0] multiplier5_io_in_a; // @[FloatingPointDesigns.scala 719:29]
  wire [31:0] multiplier5_io_in_b; // @[FloatingPointDesigns.scala 719:29]
  wire [31:0] multiplier5_io_out_s; // @[FloatingPointDesigns.scala 719:29]
  wire  multiplier6_clock; // @[FloatingPointDesigns.scala 728:29]
  wire  multiplier6_reset; // @[FloatingPointDesigns.scala 728:29]
  wire [31:0] multiplier6_io_in_a; // @[FloatingPointDesigns.scala 728:29]
  wire [31:0] multiplier6_io_in_b; // @[FloatingPointDesigns.scala 728:29]
  wire [31:0] multiplier6_io_out_s; // @[FloatingPointDesigns.scala 728:29]
  wire  sub2_clock; // @[FloatingPointDesigns.scala 737:22]
  wire  sub2_reset; // @[FloatingPointDesigns.scala 737:22]
  wire [31:0] sub2_io_in_a; // @[FloatingPointDesigns.scala 737:22]
  wire [31:0] sub2_io_in_b; // @[FloatingPointDesigns.scala 737:22]
  wire [31:0] sub2_io_out_s; // @[FloatingPointDesigns.scala 737:22]
  wire  multiplier7_clock; // @[FloatingPointDesigns.scala 746:29]
  wire  multiplier7_reset; // @[FloatingPointDesigns.scala 746:29]
  wire [31:0] multiplier7_io_in_a; // @[FloatingPointDesigns.scala 746:29]
  wire [31:0] multiplier7_io_in_b; // @[FloatingPointDesigns.scala 746:29]
  wire [31:0] multiplier7_io_out_s; // @[FloatingPointDesigns.scala 746:29]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 753:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 753:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 753:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 753:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 753:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 656:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 653:46 654:14 656:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 650:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 664:25]
  wire [7:0] exp = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 667:38]
  wire [31:0] half_input = {io_in_a[31],exp,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 670:42]
  reg [31:0] half_input_reg_1; // @[FloatingPointDesigns.scala 672:35]
  reg [31:0] result_reg_1; // @[FloatingPointDesigns.scala 674:31]
  reg [31:0] input_reg_1; // @[FloatingPointDesigns.scala 676:30]
  reg [31:0] half_input_reg_2; // @[FloatingPointDesigns.scala 683:35]
  reg [31:0] result_reg_2; // @[FloatingPointDesigns.scala 685:31]
  reg [31:0] input_reg_2; // @[FloatingPointDesigns.scala 687:30]
  reg [31:0] half_input_reg_3; // @[FloatingPointDesigns.scala 694:35]
  reg [31:0] result_reg_3; // @[FloatingPointDesigns.scala 696:31]
  reg [31:0] input_reg_3; // @[FloatingPointDesigns.scala 698:30]
  reg [31:0] half_input_reg_4; // @[FloatingPointDesigns.scala 704:35]
  reg [31:0] input_reg_4; // @[FloatingPointDesigns.scala 706:30]
  reg [31:0] mult3_reg_1; // @[FloatingPointDesigns.scala 713:30]
  reg [31:0] half_input_reg_5; // @[FloatingPointDesigns.scala 715:35]
  reg [31:0] input_reg_5; // @[FloatingPointDesigns.scala 717:30]
  reg [31:0] mult3_reg_2; // @[FloatingPointDesigns.scala 724:30]
  reg [31:0] input_reg_6; // @[FloatingPointDesigns.scala 726:30]
  reg [31:0] mult3_reg_3; // @[FloatingPointDesigns.scala 733:30]
  reg [31:0] input_reg_7; // @[FloatingPointDesigns.scala 735:30]
  reg [31:0] input_reg_8; // @[FloatingPointDesigns.scala 744:30]
  reg [31:0] input_reg_9; // @[FloatingPointDesigns.scala 750:30]
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 679:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 689:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_subber sub ( // @[FloatingPointDesigns.scala 700:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_in_a(sub_io_in_a),
    .io_in_b(sub_io_in_b),
    .io_out_s(sub_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 708:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_multiplier multiplier5 ( // @[FloatingPointDesigns.scala 719:29]
    .clock(multiplier5_clock),
    .reset(multiplier5_reset),
    .io_in_a(multiplier5_io_in_a),
    .io_in_b(multiplier5_io_in_b),
    .io_out_s(multiplier5_io_out_s)
  );
  FP_multiplier multiplier6 ( // @[FloatingPointDesigns.scala 728:29]
    .clock(multiplier6_clock),
    .reset(multiplier6_reset),
    .io_in_a(multiplier6_io_in_a),
    .io_in_b(multiplier6_io_in_b),
    .io_out_s(multiplier6_io_out_s)
  );
  FP_subber sub2 ( // @[FloatingPointDesigns.scala 737:22]
    .clock(sub2_clock),
    .reset(sub2_reset),
    .io_in_a(sub2_io_in_a),
    .io_in_b(sub2_io_in_b),
    .io_out_s(sub2_io_out_s)
  );
  FP_multiplier multiplier7 ( // @[FloatingPointDesigns.scala 746:29]
    .clock(multiplier7_clock),
    .reset(multiplier7_reset),
    .io_in_a(multiplier7_io_in_a),
    .io_in_b(multiplier7_io_in_b),
    .io_out_s(multiplier7_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 753:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {input_reg_9[31],multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 756:37]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 680:37]
  assign multiplier1_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 681:37]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 690:25]
  assign multiplier2_io_in_b = {1'h0,half_input_reg_1[30:0]}; // @[FloatingPointDesigns.scala 691:37]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 651:26 652:16]
  assign sub_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 702:17]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = sub_io_out_s; // @[FloatingPointDesigns.scala 709:25]
  assign multiplier3_io_in_b = {1'h0,result_reg_3[30:0]}; // @[FloatingPointDesigns.scala 710:37]
  assign multiplier5_clock = clock;
  assign multiplier5_reset = reset;
  assign multiplier5_io_in_a = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 720:37]
  assign multiplier5_io_in_b = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 721:37]
  assign multiplier6_clock = clock;
  assign multiplier6_reset = reset;
  assign multiplier6_io_in_a = multiplier5_io_out_s; // @[FloatingPointDesigns.scala 729:25]
  assign multiplier6_io_in_b = {1'h0,half_input_reg_5[30:0]}; // @[FloatingPointDesigns.scala 730:37]
  assign sub2_clock = clock;
  assign sub2_reset = reset;
  assign sub2_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 651:26 652:16]
  assign sub2_io_in_b = multiplier6_io_out_s; // @[FloatingPointDesigns.scala 739:18]
  assign multiplier7_clock = clock;
  assign multiplier7_reset = reset;
  assign multiplier7_io_in_a = sub2_io_out_s; // @[FloatingPointDesigns.scala 747:25]
  assign multiplier7_io_in_b = {1'h0,mult3_reg_3[30:0]}; // @[FloatingPointDesigns.scala 748:37]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {input_reg_8[31],multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 754:48]
  assign multiplier4_io_in_b = input_reg_8; // @[FloatingPointDesigns.scala 755:25]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 672:35]
      half_input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 672:35]
    end else begin
      half_input_reg_1 <= half_input; // @[FloatingPointDesigns.scala 673:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 674:31]
      result_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 674:31]
    end else begin
      result_reg_1 <= result; // @[FloatingPointDesigns.scala 675:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 676:30]
      input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 676:30]
    end else begin
      input_reg_1 <= io_in_a; // @[FloatingPointDesigns.scala 677:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 683:35]
      half_input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 683:35]
    end else begin
      half_input_reg_2 <= half_input_reg_1; // @[FloatingPointDesigns.scala 684:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 685:31]
      result_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 685:31]
    end else begin
      result_reg_2 <= result_reg_1; // @[FloatingPointDesigns.scala 686:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 687:30]
      input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 687:30]
    end else begin
      input_reg_2 <= input_reg_1; // @[FloatingPointDesigns.scala 688:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 694:35]
      half_input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 694:35]
    end else begin
      half_input_reg_3 <= half_input_reg_2; // @[FloatingPointDesigns.scala 695:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 696:31]
      result_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 696:31]
    end else begin
      result_reg_3 <= result_reg_2; // @[FloatingPointDesigns.scala 697:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 698:30]
      input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 698:30]
    end else begin
      input_reg_3 <= input_reg_2; // @[FloatingPointDesigns.scala 699:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 704:35]
      half_input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 704:35]
    end else begin
      half_input_reg_4 <= half_input_reg_3; // @[FloatingPointDesigns.scala 705:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 706:30]
      input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 706:30]
    end else begin
      input_reg_4 <= input_reg_3; // @[FloatingPointDesigns.scala 707:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 713:30]
      mult3_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 713:30]
    end else begin
      mult3_reg_1 <= multiplier3_io_out_s; // @[FloatingPointDesigns.scala 714:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 715:35]
      half_input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 715:35]
    end else begin
      half_input_reg_5 <= half_input_reg_4; // @[FloatingPointDesigns.scala 716:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 717:30]
      input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 717:30]
    end else begin
      input_reg_5 <= input_reg_4; // @[FloatingPointDesigns.scala 718:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 724:30]
      mult3_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 724:30]
    end else begin
      mult3_reg_2 <= mult3_reg_1; // @[FloatingPointDesigns.scala 725:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 726:30]
      input_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 726:30]
    end else begin
      input_reg_6 <= input_reg_5; // @[FloatingPointDesigns.scala 727:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 733:30]
      mult3_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 733:30]
    end else begin
      mult3_reg_3 <= mult3_reg_2; // @[FloatingPointDesigns.scala 734:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 735:30]
      input_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 735:30]
    end else begin
      input_reg_7 <= input_reg_6; // @[FloatingPointDesigns.scala 736:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 744:30]
      input_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 744:30]
    end else begin
      input_reg_8 <= input_reg_7; // @[FloatingPointDesigns.scala 745:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 750:30]
      input_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 750:30]
    end else begin
      input_reg_9 <= input_reg_8; // @[FloatingPointDesigns.scala 751:17]
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
  output [31:0] io_sqr_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 90:21]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 90:21]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 90:21]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 90:21]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 90:21]
  wire  FP_subber_clock; // @[FloatingPointDesigns.scala 91:21]
  wire  FP_subber_reset; // @[FloatingPointDesigns.scala 91:21]
  wire [31:0] FP_subber_io_in_a; // @[FloatingPointDesigns.scala 91:21]
  wire [31:0] FP_subber_io_in_b; // @[FloatingPointDesigns.scala 91:21]
  wire [31:0] FP_subber_io_out_s; // @[FloatingPointDesigns.scala 91:21]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 92:21]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 92:21]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 92:21]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 92:21]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 92:21]
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 93:21]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 93:21]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 93:21]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 93:21]
  wire  FP_divider_clock; // @[FloatingPointDesigns.scala 94:21]
  wire  FP_divider_reset; // @[FloatingPointDesigns.scala 94:21]
  wire [31:0] FP_divider_io_in_a; // @[FloatingPointDesigns.scala 94:21]
  wire [31:0] FP_divider_io_in_b; // @[FloatingPointDesigns.scala 94:21]
  wire [31:0] FP_divider_io_out_s; // @[FloatingPointDesigns.scala 94:21]
  wire  FP_square_root_clock; // @[FloatingPointDesigns.scala 95:21]
  wire  FP_square_root_reset; // @[FloatingPointDesigns.scala 95:21]
  wire [31:0] FP_square_root_io_in_a; // @[FloatingPointDesigns.scala 95:21]
  wire [31:0] FP_square_root_io_out_s; // @[FloatingPointDesigns.scala 95:21]
  FP_adder FP_adder ( // @[FloatingPointDesigns.scala 90:21]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  FP_subber FP_subber ( // @[FloatingPointDesigns.scala 91:21]
    .clock(FP_subber_clock),
    .reset(FP_subber_reset),
    .io_in_a(FP_subber_io_in_a),
    .io_in_b(FP_subber_io_in_b),
    .io_out_s(FP_subber_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 92:21]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 93:21]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  FP_divider FP_divider ( // @[FloatingPointDesigns.scala 94:21]
    .clock(FP_divider_clock),
    .reset(FP_divider_reset),
    .io_in_a(FP_divider_io_in_a),
    .io_in_b(FP_divider_io_in_b),
    .io_out_s(FP_divider_io_out_s)
  );
  FP_square_root FP_square_root ( // @[FloatingPointDesigns.scala 95:21]
    .clock(FP_square_root_clock),
    .reset(FP_square_root_reset),
    .io_in_a(FP_square_root_io_in_a),
    .io_out_s(FP_square_root_io_out_s)
  );
  assign io_add_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 99:14]
  assign io_sub_s = FP_subber_io_out_s; // @[FloatingPointDesigns.scala 102:14]
  assign io_mul_s = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 105:14]
  assign io_div_s = FP_divider_io_out_s; // @[FloatingPointDesigns.scala 108:14]
  assign io_rec_s = FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 110:14]
  assign io_sqr_s = FP_square_root_io_out_s; // @[FloatingPointDesigns.scala 112:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_add_a; // @[FloatingPointDesigns.scala 97:14]
  assign FP_adder_io_in_b = io_add_b; // @[FloatingPointDesigns.scala 98:14]
  assign FP_subber_clock = clock;
  assign FP_subber_reset = reset;
  assign FP_subber_io_in_a = io_sub_a; // @[FloatingPointDesigns.scala 100:14]
  assign FP_subber_io_in_b = io_sub_b; // @[FloatingPointDesigns.scala 101:14]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = io_mul_a; // @[FloatingPointDesigns.scala 103:14]
  assign FP_multiplier_io_in_b = io_mul_b; // @[FloatingPointDesigns.scala 104:14]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = io_rec_a; // @[FloatingPointDesigns.scala 109:14]
  assign FP_divider_clock = clock;
  assign FP_divider_reset = reset;
  assign FP_divider_io_in_a = io_div_a; // @[FloatingPointDesigns.scala 106:14]
  assign FP_divider_io_in_b = io_div_b; // @[FloatingPointDesigns.scala 107:14]
  assign FP_square_root_clock = clock;
  assign FP_square_root_reset = reset;
  assign FP_square_root_io_in_a = io_sqr_a; // @[FloatingPointDesigns.scala 111:14]
endmodule

