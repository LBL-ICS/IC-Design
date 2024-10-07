//Logic Design with Verilog-2005
module full_adder (input  a    , 
                   input  b    , 
                   input  cin  , 
                   output sum  , 
                   output cout);
assign sum  = a ^ b ^ cin                    ;
assign cout = (a & b) | (a & cin) | (b & cin); 
endmodule

//An Example of Using Wire and Reg Date Types
module example_wire_reg (input      a , 
                         input      b , 
                         output     c , 
                         output reg d );
wire e; 
reg  f; 

assign e  = a & b ;  //e must be a wire
always @(a, b) begin 
  f <= a | b;        //f must be a reg
end 

assign c  = e & f ;  //c output is in a default wire
always @(e, f) begin 
  d <= e | f;        //d output must be a reg
end 
endmodule

module example_equ_inequ();
wire a, b, sel; 
reg  c, d     ;
always @(a, b, sel) begin
  if (sel) begin
    c <= a;
  end else begin
    c <= b;
  end
end

always @(a, b, sel) begin
  if (~sel) begin
    d <= a;
  end else begin
    d <= b;
  end
end
endmodule

module example_logic_op();
//--- Bit-Wise Logic Design Code---//
reg  [3:0] a,b;
wire [3:0] c = a & b   ; // AND
wire [3:0] d = a | b   ; // OR
wire [3:0] e = a ^ b   ; // XOR
wire [3:0] f = ~(a & b); // NAND
wire [3:0] g = ~(a | b); // NOR

//--- Testbench ---//
initial begin
  a = 4'b1010; 
  b = 4'b0101;
  #10;
  $display ("Outputs c=%b, d=%b, e=%b, f=%b, g=%b 
      with Inputs a=%b, b=%b", c, d, e, f, g, a, b);
/* Printed log: # Outputs c=0000, d=1111, e=1111, 
f=1111, g=0000 with Inputs a=1010, b=0101 */
  
  a = 4'b1100; 
  b = 4'b1101;
  #10;   
  $display ("Outputs c=%b, d=%b, e=%b, f=%b, g=%b 
      with Inputs a=%b, b=%b", c, d, e, f, g, a, b);   
/* Printed log: # Outputs c=1100, d=1101, e=0001, 
f=0011, g=0010 with Inputs a=1100, b=1101 */
end
endmodule

module example1_reduction ();
//--- Reduction on Multi-Bit Signals Design Code---//
reg [3:0] a;
wire b = &a ;   // Reduction AND
wire c = |a ;   // Reduction OR
wire d = ^a ;   // Reduction XOR
wire e = ~&a;   // NOT Reduction AND
wire f = ~|a;   // NOT Reduction OR

//--- Testbench ---//
initial begin
  a = 4'b1010; 
  #10;
  $display ("Outputs b=%b, c=%b, d=%b, e=%b, f=%b, 
             with Input a=%b", b, c, d, e, f, a);
/*Printed log: # Outputs b=0, c=1, d=0, e=1, f=0, 
with Input a=1010*/
  
  a = 4'b1100; 
  #10;
  $display ("Outputs b=%b, c=%b, d=%b, e=%b, f=%b, 
             with Input a=%b", b, c, d, e, f, a);
/*Printed log: # Outputs b=0, c=1, d=0, e=1, f=0, 
with Input a=1100*/

  a = 4'b1111; 
  #10;
  $display ("Outputs b=%b, c=%b, d=%b, e=%b, f=%b, 
             with Input a=%b", b, c, d, e, f, a);
/*Printed log: # Outputs b=1, c=1, d=0, e=0, f=0, 
with Input a=1111*/

  a = 4'b0000; 
  #10;
  $display ("Outputs b=%b, c=%b, d=%b, e=%b, f=%b, 
              with Input a=%b", b, c, d, e, f, a);
/*Printed log: # Outputs b=0, c=0, d=0, e=1, f=1, 
with Input a=0000*/
end
endmodule

module example2_reduction ();
//--- Reduction on Multi-Bit Signals Design Code---//
reg [31:0] a,b; 
reg        c,d; 
always @(a) begin
  if(~|a) begin // Will be true when all bits are zeros
    c <= 1'b1; 
  end else begin
    c <= 1'b0; 
  end
end

always @(b) begin
  if(&b) begin  // Will be true when all bits are ones
    d <= 1'b1; 
  end else begin
    d <= 1'b0;
  end
end

//--- Testbench ---//
initial begin
  a = 32'h0; 
  b = 32'hffff_ffff;
  #10;
  $display ("Outputs c=%b, d=%b, with Inputs a=%h, b=%h", 
             c, d, a, b);
/*Printed log: # Outputs c=1, d=1, 
with Inputs a=00000000, b=ffffffff*/

  a = 32'h0123_4567; 
  b = 32'h89ab_cdef;
  #10;
  $display ("Outputs c=%b, d=%b, with Inputs a=%h, b=%h", 
             c, d, a, b);
/*Printed log: # Outputs c=0, d=0, 
with Inputs a=01234567, b=89abcdef*/
end
endmodule

module gr_lt ();
wire a, b;
always @(*) begin
//Greater than 4'h0 AND less than 4'h8
if(a>4'h0 & a<4'h8 );

//Greater than or equal to 4'h0 AND 
//less than or equal to 4'h8 
if(a>=4'h0 & a<=4'h8 ); 

//Signal "a" less than 4'ha OR signal "b" less than 4'hb
if(a<4'ha | b<4'hb); 
end
endmodule

module example_concatenation ();
//--- Concatenation Design Code---//
reg  [7 :0] a ; 
reg  [15:0] b ;  
reg  [7 :0] c ;  
wire [31:0] vec1 = {a, b, c}        ;
wire [15:0] vec2 = {b[7:0], b[15:8]};
wire [15:0] vec3 = {2{a}}           ; 

wire [9:0]  vec4 = {{2{1'b0}}, a}   ;
wire [9:0]  vec5 = {a, {2{1'b0}}}   ;

//--- Testbench ---//
initial begin
  a = 8'h12   ; 
  b = 16'h3456;
  c = 8'h78   ; 
  #10;
  $display ("Outputs vec1=%h, vec2=%h, vec3=%h, vec4=%h,
            vec5=%h, with Inputs a=%h, b=%h, c=%h", 
            vec1, vec2, vec3, vec4, vec5, a, b, c);
/* Printed log: Outputs vec1=12345678, vec2=5634, vec3=1212, 
vec4=012, vec5=048 with Inputs a=12, b=3456, c=78 */
end
endmodule

module example_con_mul ();
//--- Concatenation Design Code---//
reg  [7 :0] r,g,b ; 
wire [15:0] rx32 = {3'b0, r, 5'b0};
wire [15:0] gx64 = {2'b0, g, 6'b0};
wire [15:0] bx8  = {5'b0, b, 3'b0}; 

//--- Testbench ---//
initial begin
  r = 8'h12; 
  g = 8'h34;
  b = 8'h56; 
  #10;
  $display ("Outputs rx32=%h, gx64=%h, bx8=%h with Inputs 
            r=%h, g=%h, b=%h", rx32, gx64, bx8, r, g, b);
/*Printed log: Outputs rx32=0240, gx64=0d00, bx8=02b0,  
with Inputs r=12, g=34, b=56 */
end
endmodule

module example_shift ();  
//--- Logical Shift Design Code---//
reg  [3:0] a;
wire [3:0] lls2 = a<<2;
wire [3:0] lrs2 = a>>2;

//--- Testbench ---//
initial begin
  a  = 4'h1; 
  #10;
  $display ("Outputs lls2=%b, lrs2=%b 
             with Input a=%b", lls2, lrs2, a);
/* Printed log: # Outputs lls2=0100, lrs2=0000 
                  with Input a=0001 */
end
endmodule

//a) A 2-to1 Multiplexer Using Conditional Assignment
module example_conditional_mux (input  sel, a, b,
                                output c        ); 
assign c = ~sel ? a: b;   
endmodule

//b) A Tri-State Buffer Using Conditional Assignment
module example_conditional_tri (input        en ,
                                input  [1:0] a  ,
                                output [1:0] b  );
assign b = en ? a : 2'bzz ;  
endmodule

//c) A Latch Using Conditional Assignment
module example_conditional_latch (input  en, d ,
                                  output q     );
assign q = en ? d : q ;  
endmodule

//d) A 2-Stage Multiplexer Using Conditional Assignment
module example_conditional_nested (input  sel0, sel1,
                                   input  a,  b,  c,
                                   output d        );
assign d = ~sel0 ? a : 
               ~sel1 ? b: c ;  
endmodule


