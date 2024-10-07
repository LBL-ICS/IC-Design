module seq_inst_and_or(input      clk,
	               input      rst,
		       input      a  ,
		       input      b  ,
		       input      c  ,
		       input      d  ,
		       input      e  ,
		       input      f  ,
		       input      g  ,
		       output reg n  ); 

wire h, l;
reg  k, j;
comb_and_or u1_comb_and_or (.a (a) ,
	                    .b (b) ,
	                    .c (c) ,
	                    .d (d) ,
                            .e (h));
	       
comb_and_or u2_comb_and_or (.a (k) ,
	                    .b (e) ,
	                    .c (f) ,
	                    .d (g) ,
                            .e (l));
wire i=c&d;
wire m=j+l;

always @(posedge clk, negedge rst) begin
  if(~rst) begin
    j<=1'b0;
    k<=1'b0;
    n<=1'b0;
  end else begin
    j<=h   ;
    k<=i   ;
    n<=m   ;
  end
end
endmodule
