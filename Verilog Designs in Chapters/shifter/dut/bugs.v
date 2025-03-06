module design_bugs (input [ 7:0 ] a , b , c ,
                    input [ 1:0 ] sel ,
                    input         rst , clk ,
                    output reg    d );  //1. output wire d;
 assign d = a & b | c ; // 2. bit mismatch d; 

 wire [ 7:0 ] e ; //3. reg [7:0] e;
 always @ (a , b) begin //5. missing sel
 case ( sel )
   2'h0 : e <= a ;
   2'h1 : e <= b ; //6. defualt: e<=0;
 endcase
 end

 wire [ 7:0 ] f ; //4. reg [7:0] f;
 always @ ( posedge clk , negedge rst ) begin
   if (~rst ) begin
     f = 8'h0 ; //7. non-blocking f<=8'h0;
   end else begin
     f = e ; 
   end
// 8. missing end

wire [ 7:0 ] g ; //9. reg [7:0] g;
initial begin
g = 4’h0 ;
#10; g = f ;
end
// 10. endmodule

