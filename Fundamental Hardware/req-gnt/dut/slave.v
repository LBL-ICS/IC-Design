module slave (input      clk,
              input      rst,
              input      req,
              output reg gnt);

reg req_d;
wire nxt_gnt = req & ~req_d ;
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    gnt   <= 1'b0;
    req_d <= 1'b0;
  end else begin
    gnt   <= nxt_gnt;
    req_d <= req    ;
  end
end
endmodule
