module tb_simple_single ();

reg                    clk  ; 
reg                    en   ;
reg  [`WE_WIDTH-1:0]   we   ;
reg  [`ADDR_WIDTH-1:0] addr ;
reg  [`WIDTH-1:0]      din  ;
wire [`WIDTH-1:0]      dout ;

// dut instantiation
simple_single u_simple_single (.clk (clk ) , 
                               .en  (en  ) ,
                               .we  (we  ) ,
                               .addr(addr) ,
                               .din (din ) ,
                               .dout(dout));
// bus functional model
/*
always #5 clk=~clk;
initial begin
  clk = 1'b0; 
  en  = 1'b0; 
  we  = `WE_WIDTH'hf  ; 
  addr= `ADDR_WIDTH'h0; 
  din = `WIDTH'h0     ;

  // data write
  #6; 
  en  = 1'b1; 
  addr= `ADDR_WIDTH'h0; 
  din = `WIDTH'h01234567  ;
  #10;
  addr= `ADDR_WIDTH'h1; 
  din = `WIDTH'h89abcdef  ;
  #10;
  addr= `ADDR_WIDTH'h2; 
  din = `WIDTH'h10111213  ;
  #10;
  addr= `ADDR_WIDTH'h3; 
  din = `WIDTH'h14151617  ;

  // data read
  #10;
  en  = 1'b0; 
  addr= `ADDR_WIDTH'h0; 
  #10;
  addr= `ADDR_WIDTH'h1; 
  #10;
  addr= `ADDR_WIDTH'h2; 
  #10;
  addr= `ADDR_WIDTH'h3; 
end
*/

always #5 clk=~clk;
initial begin
  clk = 1'b0; 
  en  = 1'b0; 
  we  = `WE_WIDTH'hf  ; 
  addr= `ADDR_WIDTH'h0; 
  din = `WIDTH'h0     ;

  // data write
  #6; 
  en  = 1'b1; 
  addr= `ADDR_WIDTH'h0; 
  din = `WIDTH'h01234567  ;
  #10;
  addr= `ADDR_WIDTH'h1; 
  din = `WIDTH'h89abcdef  ;

  // data read
  #10;
  en  = 1'b0; 
  addr= `ADDR_WIDTH'h0; 
  #10;
  addr= `ADDR_WIDTH'h1; 

  #10; 
  en  = 1'b1; 
  we  = `WE_WIDTH'h3  ; 
  addr= `ADDR_WIDTH'h0; 
  din = `WIDTH'h10111213  ;
  #10;
  addr= `ADDR_WIDTH'h1; 
  din = `WIDTH'h14151617  ;

  // data read
  #10;
  en  = 1'b0; 
  addr= `ADDR_WIDTH'h0; 
  #10;
  addr= `ADDR_WIDTH'h1; 
end
endmodule
