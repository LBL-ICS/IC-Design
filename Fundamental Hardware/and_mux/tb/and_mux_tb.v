module and_mux_tb();
reg  sel; 
reg  a; 
reg  b;
reg  c;
reg  d;
wire e;

//********************************
//  DUT Instantiation
//********************************
and_mux u_and_mux (.a  (a   ), 
                   .b  (b   ),
                   .c  (c   ),
                   .d  (d   ),
		   .sel(sel ),
                   .e  (e   ));

//********************************
//  BFM 
//********************************
integer i;
initial begin
  sel=0;
  for (i=0; i<16; ) begin
    {a,b,c,d}=i;
    #10;
    i=i+1;
  end
  #10;
  sel=1;
  for (i=0; i<16; ) begin
    {a,b,c,d}=i;
    #10;
    i=i+1;
  end
end

endmodule
