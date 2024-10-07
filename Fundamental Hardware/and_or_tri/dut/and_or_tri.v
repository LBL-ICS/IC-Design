module and_or_tri(input  a ,
                  input  b ,
                  input  c ,
                  input  d ,
                  input  en,
                  output f );
//wire e;
//wire e = (a&b) | (c&d);
//assign f = en ? e : 1'bz;
assign f = en ? (a&b)|(c&d) : 1'bz;

endmodule
