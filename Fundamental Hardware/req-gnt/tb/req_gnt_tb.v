module req_gnt_tb();
reg        clk;
reg        rst;
reg        en ;
wire       req;
wire       gnt;

req_gnt u_req_gnt(.clk(clk),
                  .rst(rst),
                  .en (en ),
                  .gnt(gnt),
                  .req(req));

always #5 clk=~clk;

initial begin
  rst=0;clk=0;en=0;
  #10; rst=1;
  #16; rst=1;
  en=1;
  @(posedge clk);
  #1;
  en=0;
end

endmodule
