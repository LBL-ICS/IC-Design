module master(input      clk,
              input      rst,
              input      en ,
              input      gnt,
              output reg req);

wire nxt_req = (~en & req & ~gnt) | (en & ~req & ~gnt);
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    req   <= 1'b0;
  end else begin
    req   <= nxt_req;
  end
end
endmodule
