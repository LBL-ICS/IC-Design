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
always @(cur_state,ready)begin
  case(cur_state) 
    S0: if(ready) nxt_state = S1; 
    S1:           nxt_state = S2;
    S2:           nxt_state = S3;
    S3:           nxt_state = S0;
    default:      nxt_state = S0;
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
