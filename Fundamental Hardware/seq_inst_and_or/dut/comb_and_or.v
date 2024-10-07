module comb_and_or(input   a  ,
	           input   b  ,
	           input   c  ,
	           input   d  ,
                   output  e );

//combiantional circuit
assign e=(a&b)|(c|d);

endmodule
