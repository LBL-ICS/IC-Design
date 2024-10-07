module register(input      [3:0] d  ,
                input            clk,
                input            rst,
                output reg [3:0] q );

always @(posedge clk, negedge rst)begin
  if(~rst) begin
    q<=4'h0;
  end else begin
    q<=d   ;
  end
end
endmodule
