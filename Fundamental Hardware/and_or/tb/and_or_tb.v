module and_or_tb();
reg  a; 
reg  b;
reg  c;
reg  d;
wire e;

//********************************
//  DUT Instantiation
//********************************
and_or u_and_or (.a(a), 
                 .b(b),
                 .c(c),
                 .d(d),
                 .e(e));

//********************************
//  BFM 
//********************************
integer i;
initial begin
  for (i=0; i<16; ) begin
    {a,b,c,d}=i;
    #10;
    i=i+1;
  end
end

endmodule
