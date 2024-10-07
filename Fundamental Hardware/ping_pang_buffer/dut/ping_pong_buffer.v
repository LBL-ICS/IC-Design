module ping_pong_buffer (input                    clk  , 
                         input                    u0_wr,
                         input                    u1_wr,
                         input                    u0_rd,
                         input                    u1_rd,
                         input                    ena  ,
                         input  [`WE_WIDTH-1:0]   wea  ,
                         input  [`ADDR_WIDTH-1:0] addra,
                         input  [`WIDTH-1:0]      dina ,
                         input                    enb  ,
                         input  [`ADDR_WIDTH-1:0] addrb,
                         output [`WIDTH-1:0]      doutb);
wire en0 = (u0_wr&ena) | ~(u0_rd&enb) ;
wire en1 = (u1_wr&ena) | ~(u1_rd&enb) ;
wire [`WE_WIDTH-1:0] we0 = u0_wr ? wea : `WE_WIDTH'hf;
wire [`WE_WIDTH-1:0] we1 = u1_wr ? wea : `WE_WIDTH'hf;

wire [`ADDR_WIDTH-1:0] addr0 = u0_wr ? addra :
                             u0_rd ? addrb : `ADDR_WIDTH'b0;
wire [`ADDR_WIDTH-1:0] addr1 = u1_wr ? addra :
                             u1_rd ? addrb : `ADDR_WIDTH'b0;
wire [`WIDTH-1:0]      din0 = u0_wr ? dina  : `WIDTH'b0    ;    
wire [`WIDTH-1:0]      din1 = u1_wr ? dina  : `WIDTH'b0    ; 

wire [`WIDTH-1:0]      dout0 ;
wire [`WIDTH-1:0]      dout1 ;
assign doutb = u0_rd ? dout0 : 
                       u1_rd ? dout1 : `ADDR_WIDTH'h0;

simple_single u0_mem (.clk (clk  ),
                      .en  (en0  ), 
                      .we  (we0  ), 
                      .addr(addr0), 
                      .din (din0 ), 
                      .dout(dout0));
simple_single u1_mem (.clk (clk  ),
                      .en  (en1  ), 
                      .we  (we1  ), 
                      .addr(addr1), 
                      .din (din1 ), 
                      .dout(dout1));
endmodule
