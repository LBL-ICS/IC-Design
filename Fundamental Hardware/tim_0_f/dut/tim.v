module tim (rst, clk, en, tim);
input        rst, clk, en;
output [3:0] tim; 
reg    [3:0] tim; 

/////////////////////////
/// counter circuit /////
/////////////////////////
wire [3:0] nxt_cnt; 
reg  [3:0] cnt; 
assign nxt_cnt = en ? cnt+4'h1 : cnt;

always @(posedge clk or negedge rst) begin
  if(~rst) begin
    cnt<=4'h0;
  end else begin
    cnt<=nxt_cnt;
  end
end

/////////////////////////
/// timer circuit --/////
/////////////////////////
wire [3:0] nxt_tim; 
assign nxt_tim = (en & &cnt) ? tim+4'h1 : tim;

always @(posedge clk or negedge rst) begin
  if(~rst) begin
    tim<=4'h0;
  end else begin
    tim<=nxt_tim;
  end
end
endmodule
