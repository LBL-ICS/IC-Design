//`timescale 1ns/1ps
module tb_full_adder_latch ();
reg  [3:0] a  ;
reg  [3:0] b  ;
reg        en ;
reg        rst;
wire [3:0] c  ;

// instantiation of DUT
full_adder_latch u_full_adder_latch (.a  (a  ), 
                                     .b  (b  ),
                                     .en (en ),
                                     .rst(rst),
                                     .c  (c  ));

// bus functional model
initial begin
  rst=0; en=0; a=4'h0; b=4'h0;
  #10; rst=1;
  #10; en=1; a=4'h0; b=4'ha; 
  #10; en=1; a=4'h1; b=4'hb; 
  #10; en=1; a=4'h2; b=4'hc; 
  #10; en=1; a=4'h3; b=4'hd; 

  #10; en=0; a=4'h0; b=4'ha; 
  #10; en=0; a=4'h1; b=4'hb; 
  #10; en=0; a=4'h2; b=4'hc; 
  #10; en=0; a=4'h3; b=4'hd; 
end
endmodule
