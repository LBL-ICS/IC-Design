module register_tb();

reg  [3:0] d  ;
reg        clk;
reg        rst;
wire [3:0] q  ;

register u_register (.d  (d  ),
                     .clk(clk),
                     .rst(rst),
                     .q  (q  ));
always #5 clk=~clk;

integer i;
initial begin
  rst=0;clk=0;d=4'h0;
  #15; rst=1;
  #1; 
  for (i=0; i<16; i=i+1) begin
    d=i;
    @(posedge clk);
  end
  d=4'h0;
end

integer j;
initial begin
  j=0;
  wait(rst);
  repeat(2 ) @(negedge clk);
  repeat (16) begin
    if(q==j) begin
      $display("Test case %d pass at %d ns", j, $time);
    end else begin
      $display("Test case %d FAIL at %d ns, expected: %d, dut:%d", j, $time, j, q);
    end
    @(negedge clk);
    j=j+1;
  end
end
endmodule
