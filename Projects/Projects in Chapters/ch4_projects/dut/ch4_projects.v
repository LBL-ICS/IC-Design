//Ex 1: A Latch Design Using if-else Statement
module example_latch (input      rst, en, a, b, 
                      output reg q            );
always @(rst, en, a, b) begin 
  if(~rst) begin
    q <= 1'b0 ;
  end else if(en) begin
    q <= a&b  ;
  end else begin
    q <= q    ; 
  end  
end
endmodule 

//Recommended Design for a Latch
module example_rec_latch (input      rst, en, a, b, 
                          output reg q            );
wire nxt_q = a&b; //combinational AND gate
always @(rst, en, nxt_q) begin 
  if(~rst) begin
    q <= 1'b0 ;
  end else if(en) begin
    q <= nxt_q; 
  end //last else (q<=q;) is omitted
end
endmodule

//Ex 2: A Register Design Using if-else Statement
module example_reg (input      rst, clk, en, a, b,
                    output reg q                 ); 
always @(negedge rst, posedge clk) begin
  if(~rst) begin       
    q <= 1'b0 ;
  end else if(en) begin 
    q <= a&b  ;
  end else begin
    q <= q    ;	
  end
end
endmodule

//Recommended Design for a Register
module example_rec_reg (input      rst, clk, en, a, b,
                        output reg q                 ); 
wire nxt_q = a&b; //combinational AND gate
always @(negedge rst, posedge clk) begin
  if(~rst) begin       
    q <= 1'b0 ;
  end else if(en) begin 
    q <= nxt_q;	
  end //last else (q<=q;) is omitted
end
endmodule

//Ex 3: Using Logic Operators in if-else Statement
module example_logic_op_ifelse (input [31:0] a,
                                output reg   b); 
always @(a) begin
  if(~|a) begin         // if(a==32'h0)
    b <= 1'b0;
  end else if(&a) begin // if(a==32'hffff_ffff)
    b <= 1'b1;	
  end
end
endmodule

//Recommended Design for EX3
module example_rec_ex3 (input [31:0] a,
                        output       b);  
assign b = ~|a ? 1'b0 : 
                   &a ? 1'b1 : b ; 
endmodule

//Ex 4: Nested if-else Statement  
module example_nested_ifelse (input      a, b,
                              output reg c   ); 
always @(a,b) begin
  if(a) begin
    if(b) begin
      c <= 1'b1;
    end else begin
      c <= 1'b0;
    end 
  end else begin
    c <= 1'b0;	
  end
end
endmodule 

//Recommended Design for EX4
module example_rec_ex4 (input  a, b,
                        output c   ); 
assign c = a&b ;
endmodule

// Ex1: A Design Example Using case-endcase Statement
module example_case1 (input      [1:0] a, b, c, sel,
                      output reg [1:0] d); 
always @ (a, b, c, sel) begin
  case (sel) 
    2'h0    : d <= a; 
    2'h1    : d <= b; 
    2'h2    : d <= c; 
    default : begin
                d <= 2'b0;
                $display("Mismatch: sel = 2'h3, X, or Z"); 
              end
  endcase 
end
endmodule 

// An Equivalent Design to Ex1
module example_case2 (input   [1:0] a, b, c, sel,
                      output  [1:0] d); 
assign d = (sel==2'h0) ? a : 
               (sel==2'h1) ? b : 
                   (sel==2'h2) ? c : 2'h0;
endmodule 

//Ex 2: Missing default Causes Unwanted Latch!
module example_case_missing_item (input      [1:0] a, b, c, 
                                  input      [1:0] sel,
                                  output reg [1:0] d);
always @ (a, b, c, sel) begin
  case (sel) 
    2'h0 : d <= a; 
    2'h1 : d <= b; 
    2'h2 : d <= c; 
  endcase 
end
endmodule 

//Ex 3: An Example Using X and Z in case-endcase Statement
module example_case1_x_z ();
reg [3:0]  sel;
//--- Design Code---//
always @(sel) begin
  case (sel)
    4'b0000 :   $display ("item0 matches");
    4'b0zzz :   $display ("item1 matches");
    4'b0xxx :   $display ("item2 matches");
    4'b1010 :   $display ("item3 matches");
    default :   $display ("nothing matches");
  endcase
end

//--- Testbench ---//
initial begin
  sel = 4'b0000;        // Printed log: # item0 matches
  #100 sel = 4'b0xxx;   // Printed log: # item2 matches
  #100 sel = 4'b0zzz;   // Printed log: # item1 matches
  #100 sel = 4'b1111;   // Printed log: # nothing matches
end	
endmodule

//Ex 4: An Example Using X and Z in case-endcase Statement
module example_case2_x_z ();
reg [1:0] sel;
//--- Design Code---//
always @(sel) begin
 case (sel)
   2'b00: $display("%d ns, sel=%b, 2'b00 sel", $time,sel);
   2'b01: $display("%d ns, sel=%b, 2'b01 sel", $time,sel);
   2'b1x: $display("%d ns, sel=%b, 2'b1x sel", $time,sel);
   2'b1z: $display("%d ns, sel=%b, 2'b1z sel", $time,sel);
   default: $display("%d ns, sel=%b, def sel", $time,sel);
 endcase
end

//--- Testbench ---//
initial begin
  sel = 2'b00;     //Printed log: # 0 ns, sel=00, 2'b00 sel
  #10 sel = 2'b01; //Printed log: # 10 ns, sel=01, 2'b01 sel
  #10 sel = 2'b10; //Printed log: # 20 ns, sel=10, def sel
  #10 sel = 2'b1x; //Printed log: # 30 ns, sel=1x, 2'b1x sel
  #10 sel = 2'b1z; //Printed log: # 40 ns, sel=1z, 2'b1z sel
end	
endmodule

// An Example of Blocking Design #1
module example_blk1 (input      e, clk, rst,  
                     output reg a          ); 
reg b, c, d; 
always @ (posedge clk, negedge rst) begin 
  if (~rst) begin 
    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; 
  end else begin 
    a = b; 
    b = c; 
    c = d; 
    d = e; 
  end 
end 
endmodule 

// Another Example of Blocking Design #2
module example_blk2 (input      e, clk, rst, 
                     output reg a          ); 
reg b, c, d; 
always @ (posedge clk, negedge rst) begin 
  if (~rst) begin 
    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
  end else begin 
    d = e; 
    c = d; 
    b = c; 
    a = b; 
  end 
end 
endmodule 

// Non-Blocking Design on a 4-Stage Shift Register
module example_nonblk1 (input      e, clk, rst, 
                        output reg a          ); 
reg b, c, d; 
always @ (posedge clk, negedge rst) begin 
  if (~rst) begin 
    a <= 1'b0; b <= 1'b0; c <= 1'b0; d <= 1'b0; 
  end else begin 
    a <= b;  
    b <= c;  
    c <= d;  
    d <= e;  
  end 
end 
endmodule 

// Non-Blocking Design on a Register
module example_nonblk2 (input      e, clk, rst, 
                        output reg a          ); 
always @ (posedge clk, negedge rst) begin 
  if (~rst) begin 
    a <= 1'b0;
  end else begin 
    a <= e   ;   
  end 
end 
endmodule 

// A Design Example of Asynchronous Reset
module example_async_reset (input      d, clk, rst, 
                            output reg q          ); 
always @ (posedge clk, negedge rst) begin
  if (~rst) begin
    q <= 1'b0; 
  end else begin
    q <= d   ;
  end 
end 
endmodule

// A Design Example of Synchronous Reset
module example_sync_reset (input      d, clk, rst, 
                           output reg q          );
always @ (posedge clk) begin
  if (~rst) begin
    q <= 1'b0; 
  end else begin
    q <= d   ;
  end 
end 
endmodule

module half_adder (output sum, c_out, 
                   input  a, b      ); 
// Behavioral model level design:
// assign {c_out,sum} = a + b; 
assign sum   = a ^ b;
assign c_out = a & b;
endmodule

// Behavioral model level design:
// assign {c_out,sum} = a + b + c_in; 
module full_adder (output sum, c_out, 
                   input  a, b, c_in); 
wire w1, w2, w3;

half_adder u1_half_adder (.sum  (w1), 
                          .c_out(w2),
                          .a    (a ), 
                          .b    (b ));

half_adder u2_half_adder (.sum  (sum ), 
                          .c_out(w3  ),
                          .a    (w1  ), 
                          .b    (c_in));

assign c_out = w2 | w3;
endmodule

module tb_full_adder (); 
reg  a, b, c_in;
wire sum, c_out;
// Design-Under-Test Instantiation
full_adder u_full_adder (.sum  (sum  ), 
                         .c_out(c_out), 
                         .a    (a    ), 
                         .b    (b    ), 
                         .c_in (c_in )); 
endmodule
