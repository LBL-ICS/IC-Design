module shifter();
reg  [7:0] a; 
wire [9:0] b=a<<2;
wire [9:0] c=a>>2;

initial begin
  a=8'h17;
  #10;
  $display("b=%h, c=%h, when a=8'h17", b, c);
  #10;
  a=8'h28;
  #10;
  $display("b=%h, c=%h, when a=8'h28", b, c);
end
endmodule
