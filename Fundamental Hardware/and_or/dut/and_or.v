module and_or (input  a, 
               input  b,
               input  c,
               input  d,
               output e);

assign e = a&b | c&d; 
endmodule
