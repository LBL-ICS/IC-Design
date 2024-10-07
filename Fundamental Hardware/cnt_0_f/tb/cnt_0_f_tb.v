module cnt_0_f_tb();

reg        rst;
reg        clk;
reg        en ;
wire [3:0] cnt;

cnt_0_f u_cnt_0_f (.rst(rst),
                   .clk(clk),
                   .en (en ),
                   .cnt(cnt));
always #5 clk=~clk;

initial begin
  rst=0;clk=0;en=0;
  repeat(1) @(negedge clk);
  rst=1;
  repeat(1) @(negedge clk);
  en=1;
  repeat(10) @(negedge clk);
  en=0;
  repeat(5)  @(negedge clk);
  en=1;
  repeat(10) @(negedge clk);
  rst=0;
  repeat(5)  @(negedge clk);
  rst=1;
end

endmodule
