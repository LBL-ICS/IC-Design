module and_mux (input  a  , 
                input  b  ,
                input  c  ,
                input  d  ,
		input  en ,
                output f );

assign f = en ? a&b | c&d : 1'bz;
endmodule
