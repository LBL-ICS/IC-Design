module tb_FPU_ls_lib();
  reg         clock   ;
  reg         reset   ;
  reg  [31:0] io_a;
  reg  [31:0] io_b;
  wire [31:0] io_s;

//FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 37:21]
//FP_square_root FP_square_root ( // @[FloatingPointDesigns.scala 39:21]
//FP_divider FP_divider ( // @[FloatingPointDesigns.scala 38:21]
//FP_subber FP_subber ( // @[FloatingPointDesigns.scala 35:21]
//FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 36:21]
  FP_exponential FP_exponential ( // @[FloatingPointDesigns.scala 40:21]
  .clock   (clock   ),
  .reset   (reset   ),
  .io_in_a (io_a),
  //.io_in_b (io_b),
  .io_out_s(io_s)
);

initial begin
  clock = 1'b0;
  reset = 1'b1;
  #100;
  reset = 1'b0;
  @(posedge clock);
  io_a = 32'h3f800000;
  io_b = 32'h40400000;
  @(posedge clock);
  io_a = 32'h40000000;
  io_b = 32'h3f800000;
  @(posedge clock);
  io_a = 32'h00000000;
end

always #5 clock=~clock;
endmodule
