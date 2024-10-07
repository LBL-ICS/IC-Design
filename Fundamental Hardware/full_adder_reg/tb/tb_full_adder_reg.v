module tb_full_adder_reg ();
reg        clk ;
reg        rst ;
reg  [3:0] a   ;
reg  [3:0] b   ;
wire [4:0] c   ;

// dut instantiation
full_adder_reg u_full_adder_reg (.clk (clk), 
                                 .rst (rst), 
	                         .a   (a  ), 
	                         .b   (b  ), 
	                         .c   (c  ));

// bus functional model
always #5 clk = ~clk; 

integer i,j;
initial begin
  rst=0; clk=0;
  a=4'h0; b=4'h0;
  #20; rst=1;
  for(i=0; i<16; i=i+1) begin
    for(j=0; j<16; j=j+1) begin
      @(negedge clk); a=i; b=j;
      @(posedge clk); #1; 
      if(c==i+j) begin
        $display("Test Pass (%d ns)! c=%h when a=%h and b=%h", $time, c, a, b);
      end else begin
        $display("Test FAIL (%d ns)! c=%h when a=%h and b=%h", $time, c, a, b);
      end
    end
  end
end 
endmodule
