module full_adder_tri (input  [3:0] a , 
                       input  [3:0] b ,
	               input        en,
	               output [3:0] c );
assign c = en ? a+b : 4'bzzzz;
endmodule
