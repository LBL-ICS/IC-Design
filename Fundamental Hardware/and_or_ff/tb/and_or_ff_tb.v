module and_or_ff_tb();

reg  a  ;
reg  b  ;
reg  c  ;
reg  d  ;
reg  clk;
reg  rst;
wire f  ;

// dut instantiation
and_or_ff u_and_or_ff (.a  (a  ),
	               .b  (b  ),
	               .c  (c  ),
	               .d  (d  ),
                       .clk(clk),
                       .rst(rst),
                       .f  (f  ));

always #5 clk=~clk;

initial begin 
  rst=1'b0;clk=1'b0; 
  a=1'b0;b=1'b0;c=1'b0;d=1'b0;     //f=0
  #10 rst=1'b1; 

  #10;a=1'b1;b=1'b1;c=1'b0;d=1'b0; //f=1
  #10;a=1'b0;b=1'b1;c=1'b0;d=1'b1; //f=0
  #10;a=1'b0;b=1'b1;c=1'b1;d=1'b1; //f=1
  #10;a=1'b0;b=1'b1;c=1'b0;d=1'b1; //f=0
end 


endmodule
