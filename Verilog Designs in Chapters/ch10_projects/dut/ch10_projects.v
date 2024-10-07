module tim_ctr();
//***************************************
//**** Timing Controller Design *********
//***************************************
wire clk, rst, ready;
reg  vld;
reg  [1:0] cnt0, cnt1, cnt2, cnt3;
wire st0_rdy = ready & ~|cnt0 ; 
wire st1_rdy = ready & ~|cnt1 & |cnt0 ;
wire st2_rdy = ready & ~|cnt2 & |cnt0 & |cnt1 ;
wire st3_rdy = ready & ~|cnt3 & |cnt0 & |cnt1 & cnt2 ;

wire cnt0_en = st0_rdy | |cnt0 ;
wire cnt1_en = st1_rdy | |cnt1 ;
wire cnt2_en = st2_rdy | |cnt2 ;
wire cnt3_en = st3_rdy | |cnt3 ;

wire [1:0] nxt_cnt0 = cnt0_en ? (cnt0+2'd1) : cnt0;
wire [1:0] nxt_cnt1 = cnt1_en ? (cnt1+2'd1) : cnt1;
wire [1:0] nxt_cnt2 = cnt2_en ? (cnt2+2'd1) : cnt2;
wire [1:0] nxt_cnt3 = cnt3_en ? (cnt3+2'd1) : cnt3;

always @(posedge clk) begin
  if(rst) begin
    cnt0<=2'd0    ;
    cnt1<=2'd0    ;
    cnt2<=2'd0    ;
    cnt3<=2'd0    ;
  end else begin
    cnt0<=nxt_cnt0;
    cnt1<=nxt_cnt1;
    cnt2<=nxt_cnt2;
    cnt3<=nxt_cnt3;
  end
end

wire nxt_vld = &cnt0 | &cnt1 | &cnt2 | &cnt3;
always @(posedge clk) begin
  if(rst) begin
    vld <=1'b0    ;
  end else begin
    vld <=nxt_vld ;
  end
end

endmodule

module iterative_stw4_ddot (input             clk  ,
                            input             rst  ,
                            input             ready,
                            input      [31:0] x0,x1,x2,x3,
                            input      [31:0] y0,y1,y2,y3,
                            output reg        vld  ,
                            output     [31:0] z    );
//*********************************
//****    Datapath Design *********
//*********************************
reg  [2:0]  cnt0, cnt1, cnt2;
wire [31:0] p0, p1, p2, p3; 
wire [31:0] s0, s1, s2, s3; 
wire        nxt_vld;

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

// The third stage of adders
FP_adder u2_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s0   ),
                   .io_in_b (s1   ),
                   .io_out_s(s2   ));

wire s2_d_flag = &cnt0[1:0] | &cnt1[1:0] | &cnt2[1:0];
wire [31:0] nxt_s2_d = s2_d_flag ? s2 : 32'h0;
reg  [31:0] s2_d;
always @(posedge clk) begin
  if(rst) begin
    s2_d <= 32'h0   ;
  end else begin
    s2_d <= nxt_s2_d;
  end
end

assign s3 = cnt0[2]|cnt1[2]|cnt2[2] ? s2 : 32'h0;

// The fourth stage of adders
FP_adder u3_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s2_d ),
                   .io_in_b (s3   ),
                   .io_out_s(z    ));

//***************************************
//****    FSM Controller Design *********
//***************************************
reg  st_cnt;
wire nxt_st_cnt = ready ? st_cnt+1'b1 : st_cnt;
always @(posedge clk) begin
  if(rst) begin
    st_cnt<=1'd0      ;
  end else begin
    st_cnt<=nxt_st_cnt;
  end
end

wire st0_rdy = ready & ~st_cnt & ~|cnt0 ;
wire st1_rdy = ready & ~st_cnt & ~|cnt1 & |cnt0;
wire st2_rdy = ready & ~st_cnt & ~|cnt2 & |cnt0 & |cnt1; 

wire cnt0_en = st0_rdy | |cnt0 ;
wire cnt1_en = st1_rdy | |cnt1 ;
wire cnt2_en = st2_rdy | |cnt2 ;

wire [2:0] nxt_cnt0 = cnt0[2] ? 3'd0 : 
	                     cnt0_en ? (cnt0+3'd1) : cnt0;
wire [2:0] nxt_cnt1 = cnt1[2] ? 3'd0 : 
	                     cnt1_en ? (cnt1+3'd1) : cnt1;
wire [2:0] nxt_cnt2 = cnt2[2] ? 3'd0 : 
	                     cnt2_en ? (cnt2+3'd1) : cnt2;
always @(posedge clk) begin
  if(rst) begin
    cnt0<=3'd0    ;
    cnt1<=3'd0    ;
    cnt2<=3'd0    ;
  end else begin
    cnt0<=nxt_cnt0;
    cnt1<=nxt_cnt1;
    cnt2<=nxt_cnt2;
  end
end

assign nxt_vld = cnt0[2] | cnt1[2] | cnt2[2];
always @(posedge clk) begin
  if(rst) begin
    vld <=1'b0    ;
  end else begin
    vld <=nxt_vld ;
  end
end
endmodule

module iterative_st2_ddot (input             clk  ,
                           input             rst  ,
                           input             ready,
                           input      [31:0] x0,x1,
                           input      [31:0] y0,y1,
                           output reg        vld  ,
                           output     [31:0] z    );
//*********************************
//****    Datapath Design *********
//*********************************
reg  [2:0]  cnt0, cnt1;
wire [31:0] p0, p1; 
wire [31:0] s0, s1, s2, s3, s4, s5; 
wire        nxt_vld;

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

// The second stage of adder
FP_adder u0_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (p0   ),
                   .io_in_b (p1   ),
                   .io_out_s(s0   ));

wire s0_d_flag = cnt0==3'd2|cnt1==3'd2;
wire [31:0] nxt_s0_d = s0_d_flag ? s0 : 32'h0;
reg  [31:0] s0_d;
always @(posedge clk) begin
  if(rst) begin
    s0_d<=32'h0    ;
  end else begin
    s0_d<=nxt_s0_d ;
  end
end

assign s1 = (cnt0==3'd3|cnt1==3'd3) ? s0 : 31'h0;
assign s2 = (cnt0==3'd4|cnt1==3'd4) ? s0 : 31'h0;
assign s3 = (cnt0==3'd5|cnt1==3'd5) ? s0 : 31'h0;

// The third stage of adder
FP_adder u1_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s0_d ),
                   .io_in_b (s1   ),
                   .io_out_s(s4   ));

// The fourth stage of adder
FP_adder u2_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s4   ),
                   .io_in_b (s2   ),
                   .io_out_s(s5   ));

// The fifth stage of adder
FP_adder u3_fp_add(.clock   (clk  ),
                   .reset   (rst  ),
                   .io_in_a (s5   ),
                   .io_in_b (s3   ),
                   .io_out_s(z    ));

//***************************************
//****    FSM Controller Design *********
//***************************************
reg  [1:0] st_cnt;
wire [1:0] nxt_st_cnt = ready ? st_cnt+2'd1 : st_cnt;
always @(posedge clk) begin
  if(rst) begin
    st_cnt<=2'd0      ;
  end else begin
    st_cnt<=nxt_st_cnt;
  end
end

wire st0_rdy = ready & ~|st_cnt & ~|cnt0; 
wire st1_rdy = ready & ~|st_cnt & ~|cnt1 & |cnt0 ;

wire cnt0_en = st0_rdy | |cnt0 ;
wire cnt1_en = st1_rdy | |cnt1 ;

wire [2:0] nxt_cnt0 = cnt0==3'd5 ? 3'd0 : 
                               cnt0_en ? cnt0+3'd1 : cnt0;
wire [2:0] nxt_cnt1 = cnt1==3'd5 ? 3'd0 : 
                               cnt1_en ? cnt1+3'd1 : cnt1;
always @(posedge clk) begin
  if(rst) begin
    cnt0<=3'd0    ;
    cnt1<=3'd0    ;
  end else begin
    cnt0<=nxt_cnt0;
    cnt1<=nxt_cnt1;
  end
end

assign nxt_vld = cnt0==3'd5|cnt1==3'd5;
always @(posedge clk) begin
  if(rst) begin
    vld <=1'b0    ;
  end else begin
    vld <=nxt_vld ;
  end
end
endmodule


