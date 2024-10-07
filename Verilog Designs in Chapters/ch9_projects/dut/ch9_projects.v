`define WIDTH 32
`define DEPTH 1024
`define ADDR_WIDTH 10
`define WE_WIDTH 4
module simple_single(input                        clk  , 
                     input                        en   ,
                     input      [`WE_WIDTH-1:0]   we   ,
                     input      [`ADDR_WIDTH-1:0] addr ,
                     input      [`WIDTH-1:0]      din  ,
                     output reg [`WIDTH-1:0]      dout);
reg [`WIDTH-1:0] ram[0:`DEPTH-1]; 

always @(posedge clk) begin
  if (en) begin
    if(we[`WE_WIDTH-1]) begin
      ram[addr][`WIDTH-1:`WIDTH-8*1]<=
                               din[`WIDTH-1:`WIDTH-8*1];
    end
    if (we[`WE_WIDTH-2]) begin
      ram[addr][`WIDTH-8*1-1:`WIDTH-8*2]<=
                           din[`WIDTH-8*1-1:`WIDTH-8*2];
    end
    if (we[`WE_WIDTH-3]) begin
      ram[addr][`WIDTH-8*2-1:`WIDTH-8*3]<=
                           din[`WIDTH-8*2-1:`WIDTH-8*3];
    end
    if (we[`WE_WIDTH-4]) begin
      ram[addr][`WIDTH-8*3-1:`WIDTH-8*4]<=
                           din[`WIDTH-8*3-1:`WIDTH-8*4];
    end
  end else begin
    dout <= ram[addr];
  end
end
endmodule

`define WIDTH 32
`define DEPTH 1024
`define ADDR_WIDTH 10
`define WEA_WIDTH 4
module simple_dual(input                        clka ,
                   input                        ena  ,
                   input      [`WEA_WIDTH-1:0]  wea  ,
                   input      [`ADDR_WIDTH-1:0] addra,
                   input      [`WIDTH-1:0]      dina ,
                   input                        clkb ,
                   input                        enb  ,              
                   input      [`ADDR_WIDTH-1:0] addrb,
                   output reg [`WIDTH-1:0]      doutb);
reg [`WIDTH-1:0] ram[0:`DEPTH-1]; 

always @(posedge clka) begin
  if (ena) begin
    if(wea[`WEA_WIDTH-1]) begin
      ram[addra][`WIDTH-1:`WIDTH-8*1]<=
                             dina[`WIDTH-1:`WIDTH-8*1];
    end
    if (wea[`WEA_WIDTH-2]) begin
      ram[addra][`WIDTH-8*1-1:`WIDTH-8*2]<=
                         dina[`WIDTH-8*1-1:`WIDTH-8*2];
    end
    if (wea[`WEA_WIDTH-3]) begin
      ram[addra][`WIDTH-8*2-1:`WIDTH-8*3]<=
                         dina[`WIDTH-8*2-1:`WIDTH-8*3];
    end
    if (wea[`WEA_WIDTH-4]) begin
      ram[addra][`WIDTH-8*3-1:`WIDTH-8*4]<=
                         dina[`WIDTH-8*3-1:`WIDTH-8*4];
    end
  end
end

always @(posedge clkb) begin
  if (enb) begin
      doutb <= ram[addrb];
  end
end
endmodule

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
wire [`WIDTH-1:0]      din0 = u0_wr ? dina : `WIDTH'b0    ;    
wire [`WIDTH-1:0]      din1 = u1_wr ? dina : `WIDTH'b0    ; 

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

module fp_mx_mx_adder(input  clk      ,
                      input  rst      ,
                      input  mx_add_en,
                      output mx_add_fi);
//*********************************
//****    Datapath Design *********
//*********************************
wire [31:0] x0, x1, x2, x3; 
wire [31:0] y0, y1, y2, y3; 
wire [31:0] z0, z1, z2, z3; 

wire        wr2, rd0, rd1;
reg  [1:0]  wraddr2, rdaddr0, rdaddr1;

// FP adders instantiation 
FP_adder u0_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (x0   ),
                   .io_in_b (y0   ),
                   .io_out_s(z0   ));

FP_adder u1_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (x1   ),
                   .io_in_b (y1   ),
                   .io_out_s(z1   ));

FP_adder u2_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (x2   ),
                   .io_in_b (y2   ),
                   .io_out_s(z2   ));

FP_adder u3_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (x3   ),
                   .io_in_b (y3   ),
                   .io_out_s(z3   ));

// memory instantiation 
simple_single u0_mem(.clk  (clk          ) , 
                     .en   (rd0          ) ,
                     .we   (4'hf         ) ,
                     .addr (rdaddr0      ) ,
                     .di   (128'h0       ) ,
                     .dout ({x0,x1,x2,x3}));

simple_single u1_mem(.clk  (clk          ) , 
                     .en   (rd1          ) ,
                     .we   (4'hf         ) ,
                     .addr (rdaddr1      ) ,
                     .di   (128'h0       ) ,
                     .dout ({y0,y1,y2,y3}));

simple_single u2_mem(.clk  (clk          ) , 
                     .en   (wr2          ) ,
                     .we   (4'hf         ) ,
                     .addr (wraddr2      ) ,
                     .di   ({z0,z1,z2,z3}) ,
                     .dout (             ));

//***************************************
//****    FSM Controller Design *********
//***************************************
reg  [2:0]  cnt;
wire cnt_en = mx_add_en | |cnt;
wire [2:0] nxt_cnt=(cnt==3'd5) ? 3'd0 : 
                               cnt_en ? (cnt+3'd1) : cnt;
always @(posedge clk) begin
  if(rst) begin
    cnt<=3'd0    ;
  end else begin
    cnt<=nxt_cnt;
  end
end

assign rd0 = mx_add_en ;
assign rd1 = mx_add_en ;
wire [1:0] nxt_rdaddr0 = rd0 ? rdaddr0+2'h1 : rdaddr0;
wire [1:0] nxt_rdaddr1 = rd1 ? rdaddr1+2'h1 : rdaddr1;
always @(posedge clk) begin
  if(rst) begin
    rdaddr0<=2'h0    ;
    rdaddr1<=2'h0    ;
  end else begin
    rdaddr0<=nxt_rdaddr0 ;
    rdaddr1<=nxt_rdaddr1 ;
  end
end

assign wr2 = cnt>=3'd2 & cnt<=3'd5 ;
wire [1:0] nxt_wraddr2 = wr2 ? wraddr2+2'h1 : 2'h0;
always @(posedge clk) begin
  if(rst) begin
    wraddr2<=2'h0        ;
  end else begin
    wraddr2<=nxt_wraddr2 ;
  end
end

assign mx_add_fi = &wraddr2;
endmodule

module fp_axpy (input      clk      ,
                input      rst      ,
                input      axpy_en  ,
                output     axpy_fi  );
//*********************************
//****    Datapath Design *********
//*********************************
wire [31:0] a=32'h40000000; //FP 2.0
wire [31:0] x0, x1, x2, x3; 
wire [31:0] y0, y1, y2, y3; 
wire [31:0] z0, z1, z2, z3; 
wire [31:0] yp0, yp1, yp2, yp3; 

wire        wr1, rd0, rd1;
reg  [1:0]  wraddr1, rdaddr0, rdaddr1;

// FP multipliers instantiation 
FP_multiplier u0_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (a    ),
                        .io_in_b (x0   ),
                        .io_out_s(z0   ));

FP_multiplier u1_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (a    ),
                        .io_in_b (x1   ),
                        .io_out_s(z1   ));

FP_multiplier u2_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (a    ),
                        .io_in_b (x2   ),
                        .io_out_s(z2   ));

FP_multiplier u3_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (a    ),
                        .io_in_b (x3   ),
                        .io_out_s(z3   ));

// FP adders instantiation 
FP_adder u0_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (z0   ),
                   .io_in_b (y0   ),
                   .io_out_s(yp0  ));

FP_adder u1_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (z1   ),
                   .io_in_b (y1   ),
                   .io_out_s(yp1  ));

FP_adder u2_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (z2   ),
                   .io_in_b (y2   ),
                   .io_out_s(yp2  ));

FP_adder u3_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (z3   ),
                   .io_in_b (y3   ),
                   .io_out_s(yp3  ));

// memory instantiation 
simple_dual u0_mem(.clka (clk          ) , 
                   .ena  (1'b0         ) ,
                   .wea  (4'hf         ) ,
                   .addra(2'h0         ) ,
                   .dia  (128'h0       ) ,
                   .clkb (clk          ) ,
                   .enb  (rd0          ) ,
                   .addrb(rdaddr0      ) ,
                   .dob  ({x0,x1,x2,x3}));

simple_dual u1_mem(.clka (clk              ) , 
                   .ena  (wr1              ) ,
                   .wea  (4'hf             ) ,
                   .addra(wraddr1          ) ,
                   .dia  ({yp0,yp1,yp2,yp3}) ,
                   .clkb (clk              ) ,
                   .enb  (rd1              ) ,
                   .addrb(rdaddr1          ) ,
                   .dob  ({y0,y1,y2,y3}    ));

//***************************************
//****    FSM Controller Design *********
//***************************************
reg [2:0] cnt;
wire cnt_en = axpy_en | |cnt ;
wire [2:0] nxt_cnt = &cnt[2:1] ? 3'd0 : 
	                       cnt_en ? (cnt+3'd1) : cnt;
always @(posedge clk) begin
  if(rst) begin
    cnt<=3'd0    ;
  end else begin
    cnt<=nxt_cnt ;
  end
end

assign rd0 = axpy_en ;
assign rd1 = cnt>=3'd1 & cnt<=3'd4;
wire [1:0] nxt_rdaddr0 = rd0 ? rdaddr0+2'h1 : 2'h0;
wire [1:0] nxt_rdaddr1 = rd1 ? rdaddr1+2'h1 : 2'h0;
always @(posedge clk) begin
  if(rst) begin
    rdaddr0<=2'h0    ;
    rdaddr1<=2'h0    ;
  end else begin
    rdaddr0<=nxt_rdaddr0 ;
    rdaddr1<=nxt_rdaddr1 ;
  end
end

assign wr1 = cnt>=3'd3 & cnt<=3'd6;
wire [1:0] nxt_wraddr1 = wr1 ? wraddr1+2'h1 : 2'h0;
always @(posedge clk) begin
  if(rst) begin
    wraddr1<=2'h0        ;
  end else begin
    wraddr1<=nxt_wraddr1 ;
  end
end

assign axpy_fi = &wraddr1;
endmodule

module basic_ddot (input         clk  ,
                   input         rst  ,
                   input         ready,
                   input  [31:0] x0,x1,x2,x3,x4,x5,x6,x7,
                   input  [31:0] y0,y1,y2,y3,y4,y5,y6,y7,
                   output reg    vld  ,
                   output [31:0] z    );
//*********************************
//****    Datapath Design *********
//*********************************
wire [31:0] p0, p1, p2, p3, p4, p5, p6, p7; 
wire [31:0] s0, s1, s2, s3, s4, s5; 

// The first stage of multipliers
FP_multiplier u0_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x0   ),
                        .io_in_b (y0   ),
                        .io_out_s(p0   ));

FP_multiplier u1_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x1   ),
                        .io_in_b (y1   ),
                        .io_out_s(p1   ));

FP_multiplier u2_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x2   ),
                        .io_in_b (y2   ),
                        .io_out_s(p2   ));

FP_multiplier u3_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x3   ),
                        .io_in_b (y3   ),
                        .io_out_s(p3   ));

FP_multiplier u4_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x4   ),
                        .io_in_b (y4   ),
                        .io_out_s(p4   ));

FP_multiplier u5_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x5   ),
                        .io_in_b (y5   ),
                        .io_out_s(p5   ));

FP_multiplier u6_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x6   ),
                        .io_in_b (y6   ),
                        .io_out_s(p6   ));

FP_multiplier u7_fp_mul(.clock   (clk  ),
                        .reset   (rst  ),
                        .io_in_a (x7   ),
                        .io_in_b (y7   ),
                        .io_out_s(p7   ));

// The second stage of adders
FP_adder u0_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (p0   ),
                   .io_in_b (p1   ),
                   .io_out_s(s0   ));

FP_adder u1_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (p2   ),
                   .io_in_b (p3   ),
                   .io_out_s(s1   ));

FP_adder u2_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (p4   ),
                   .io_in_b (p5   ),
                   .io_out_s(s2   ));

FP_adder u3_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (p6   ),
                   .io_in_b (p7   ),
                   .io_out_s(s3   ));

// The third stage of adders
FP_adder u4_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s0   ),
                   .io_in_b (s1   ),
                   .io_out_s(s4   ));

FP_adder u5_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s2   ),
                   .io_in_b (s3   ),
                   .io_out_s(s5   ));

// The fourth stage of adders
FP_adder u6_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s4   ),
                   .io_in_b (s5   ),
                   .io_out_s(z    ));

//***************************************
//****    FSM Controller Design *********
//***************************************
parameter S0 = 2'h0 ;
parameter S1 = 2'h1 ;
parameter S2 = 2'h2 ;
parameter S3 = 2'h3 ;

reg [1:0] nxt_state; 
reg [1:0] cur_state; 
always @(cur_state,ready) begin
  case(cur_state) 
    S0: if(ready) nxt_state <= S1; 
    S1:           nxt_state <= S2;
    S2:           nxt_state <= S3;
    S3:           nxt_state <= S0;
    default:      nxt_state <= S0;
  endcase
end

always @(posedge clk) begin
  if(rst) begin
    cur_state <= S0       ;
  end else begin
    cur_state <= nxt_state;
  end
end

wire nxt_vld = cur_state==S3;
always @(posedge clk) begin
  if(rst) begin
    vld <= 1'b0   ;
  end else begin
    vld <= nxt_vld;
  end
end
endmodule



