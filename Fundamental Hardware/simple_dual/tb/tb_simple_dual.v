module tb_simple_dual ();

reg                    clka ;
reg                    ena  ;
reg  [`WEA_WIDTH-1:0]  wea  ;
reg  [`ADDR_WIDTH-1:0] addra;
reg  [`WIDTH-1:0]      dina ;
reg                    clkb ;
reg                    enb  ;              
reg  [`ADDR_WIDTH-1:0] addrb;
wire [`WIDTH-1:0]      doutb;

simple_dual u_simple_dual (.clka (clka ),
                           .ena  (ena  ),
                           .wea  (wea  ),
                           .addra(addra),
                           .dina (dina ),
                           .clkb (clkb ),
                           .enb  (enb  ),              
                           .addrb(addrb),
                           .doutb(doutb));

// bus functional model
always #5 clka=~clka;
always #5 clkb=~clkb;
initial begin
  clka = 1'b0; 
  ena  = 1'b0;
  wea  = `WEA_WIDTH'hf ; 
  addra= `ADDR_WIDTH'h0; 
  dina = `WIDTH'h0     ;

  // data write
  #6; 
  ena  = 1'b1; 
  addra= `ADDR_WIDTH'h0; 
  dina = `WIDTH'h01234567  ;
  #10;
  addra= `ADDR_WIDTH'h1; 
  dina = `WIDTH'h89abcdef  ;
  #10;
  addra= `ADDR_WIDTH'h2; 
  dina = `WIDTH'h10111213  ;
  #10;
  addra= `ADDR_WIDTH'h3; 
  dina = `WIDTH'h14151617  ;
  #10;
  ena  = 1'b0; 
end

initial begin
  clkb = 1'b0;
  enb  = 1'b0;              
  addrb= `ADDR_WIDTH'h0; 

  // data write
  #26; 
  enb  = 1'b1; 
  addrb= `ADDR_WIDTH'h0; 
  #10;
  addrb= `ADDR_WIDTH'h1; 
  #10;
  addrb= `ADDR_WIDTH'h2; 
  #10;
  addrb= `ADDR_WIDTH'h3; 
  #10;
  enb  = 1'b0; 
end
endmodule
