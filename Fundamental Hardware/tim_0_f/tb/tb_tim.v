module tb_tim ();
reg        reg_rst, reg_clk, reg_en;
wire [3:0] wire_tim;

////////////////////////////////
////////   BFM     /////////////
////////////////////////////////
always #5 reg_clk = ~reg_clk;

initial begin
  reg_rst=0; 
  reg_clk=0; 
  reg_en =0; 
  #100; reg_rst=1;
  #100; reg_en=1;
end

tim u_tim (.rst(reg_rst ),
	   .clk(reg_clk ), 
	   .en (reg_en  ), 
	   .tim(wire_tim));
endmodule
