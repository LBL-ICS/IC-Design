module and_or_tri_tb();
reg  a ;
reg  b ;
reg  c ;
reg  d ;
reg  en;
wire f ;

and_or_tri u_and_or_tri (.a (a ),
                         .b (b ),
                         .c (c ),
                         .d (d ),
                         .en(en),
                         .f (f ));
integer i;
initial begin
  en=0;
  for (i=0;i<16;i=i+1) begin
    {a,b,c,d}=i;
    #10;
  end
  en=1;
  for (i=0;i<16;i=i+1) begin
    {a,b,c,d}=i;
    #10;
  end
end
endmodule
