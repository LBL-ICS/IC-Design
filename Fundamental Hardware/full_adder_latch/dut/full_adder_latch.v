module full_adder_latch (input      [3:0] a  , 
                         input      [3:0] b  ,
	                 input            en ,
	                 input            rst,
	                 output reg [3:0] c );
wire [3:0] sum = a+b;
always @(rst, en, sum) begin
  if(~rst) begin
    c <= 4'h0;
  end else if (en) begin
    c <= sum ;
  end
end
endmodule
