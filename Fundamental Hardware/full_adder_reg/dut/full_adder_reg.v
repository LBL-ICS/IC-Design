module full_adder_reg (input            clk , 
                       input            rst , 
	               input      [3:0] a   , 
	               input      [3:0] b   , 
	               output reg [4:0] c   );
wire [4:0] sum=a+b;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    c <= 5'h0;
  end else begin
    c <= sum ;
  end
end
endmodule
