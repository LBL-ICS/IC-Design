module and_or_ff(input      a  ,
	         input      b  ,
	         input      c  ,
	         input      d  ,
                 input      clk,
                 input      rst,
                 output reg f );

//combiantional circuit
wire e=(a&b)|(c&d);

//sequential register
always @(posedge clk, negedge rst)begin
  if(~rst) begin
    f<=1'b0;
  end else begin
    f<=e   ;
  end
end
endmodule
