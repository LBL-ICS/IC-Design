module and_or_latch(input      a ,
                    input      b ,
                    input      c ,
                    input      d ,
                    input      en,
                    output     f );

assign f = en ? (a&b)|(c&d) : f;

//wire e = (a&b)|(c&d);
//always @(en, e) begin
//  if(en) begin
//    f<=e;
//  end
//end

endmodule
