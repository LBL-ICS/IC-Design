//A 4-bit Counter Design with Verilog HDL
module counter_4b (input            rst, 
                   input            clk, 
                   input      [3:0] ini, 
                   output reg [3:0] cnt);
always @ (negedge rst, posedge clk) begin
  if (~rst) begin
    cnt <= ini       ;
  end else begin
    cnt <= cnt + 4'h1;
  end
end
endmodule

module counter_4b (input rst,clk,ini_3,ini_2,ini_1,ini_0, 
                   output cnt_3,cnt_2,cnt_1,cnt_0);

wire n96, n97, n98, n99, n100, n101, n102, 
n103, n104, n105, n106, n107, n108, n109, 
n110, n111, n112, n113, n114, n115, n116, 
n117, n118, n119, net5, n120, n121, n122;
	
INV0 U21 ( .I(ini_3), .ZN(n108) );
INV0 U22 ( .I(ini_2), .ZN(n109) );
INV0 U23 ( .I(ini_1), .ZN(n110) );
INV0 U24 ( .I(ini_0), .ZN(n111) );
XNR2D1 U25 ( .A1(n106), .A2(net5), .ZN(n120) );
NR2D0 U26 ( .A1(n107), .A2(n97), .ZN(n106) );
ND2D0 U27 ( .A1(cnt_1), .A2(cnt_0), .ZN(n107) );
INV1 U28 ( .I(n98), .ZN(n119) );
INV1 U29 ( .I(n99), .ZN(n118) );
INV1 U30 ( .I(n100), .ZN(n117) );
INV1 U31 ( .I(n101), .ZN(n116) );
INV1 U32 ( .I(n102), .ZN(n115) );
INV1 U33 ( .I(n103), .ZN(n114) );
INV1 U34 ( .I(n104), .ZN(n113) );
INV1 U35 ( .I(n105), .ZN(n112) );
NR2D1H U36 ( .A1(rst), .A2(n108), .ZN(n105) );
NR2D1H U37 ( .A1(ini_3), .A2(rst), .ZN(n104) );
NR2D1H U38 ( .A1(rst), .A2(n109), .ZN(n103) );
NR2D1H U39 ( .A1(ini_2), .A2(rst), .ZN(n102) );
NR2D1H U40 ( .A1(rst), .A2(n110), .ZN(n101) );
NR2D1H U41 ( .A1(ini_1), .A2(rst), .ZN(n100) );
NR2D1H U42 ( .A1(rst), .A2(n111), .ZN(n99) );
NR2D1H U43 ( .A1(ini_0), .A2(rst), .ZN(n98) );
XOR2D1 U44 ( .A1(n107), .A2(n97), .Z(n121) );
XOR2D1 U45 ( .A1(cnt_0), .A2(cnt_1), .Z(n122) );
DFCSN1 cnt_reg_3 ( .D(n120), .CP(clk), .SDN(n112), .
CDN(n113), .Q(cnt_3), .QN(net5) );
DFCSN1 cnt_reg_2 ( .D(n121), .CP(clk), .SDN(n114), 
.CDN(n115),	.Q(cnt_2), .QN(n97) );
DFCSN1 cnt_reg_1 ( .D(n122), .CP(clk), .SDN(n116), 
.CDN(n117),	.Q(cnt_1) );
DFCSN1 cnt_reg_0 ( .D(n96), .CP(clk), .SDN(n118), 
.CDN(n119), .Q(cnt_0), .QN(n96) );
endmodule


