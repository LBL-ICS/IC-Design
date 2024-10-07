module and_or_latch_tb();
reg  a ;
reg  b ;
reg  c ;
reg  d ;
reg  en;
wire f ;

and_or_latch u_and_or_latch (.a (a ),
                             .b (b ),
                             .c (c ),
                             .d (d ),
                             .en(en),
                             .f (f ));
integer i;
initial begin
  en=1;
  for (i=0;i<16;i++) begin
    {a,b,c,d}=i;
    #10;
  end
  en=0;
  for (i=0;i<16;i=i+1) begin
    {a,b,c,d}=i;
    #10;
  end
end
endmodule
