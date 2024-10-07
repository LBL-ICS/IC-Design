// Example #1: Design AND-OR Using Concurrent Assign
module example1_and_or (output e          , 
                        input  a, b, c, d );
assign e = (a & b) | (c & d); 
endmodule 

// Example #2: Design AND-OR Using Level-Trigger Always
module example2_and_or (output reg e          , 
                        input      a, b, c, d );
always @ (a, b, c, d) begin
  e = (a & b) | (c & d);
end  
endmodule 

// Example #3: Design AND-OR with Tri-State Buffer 
// Using Conditional Assign
module example3_and_or_tri (output e              , 
                            input  a, b, c, d, en );
assign e = en ? (a & b) | (c & d) : 1'bz; 
endmodule 

// Example #1: Design Uni-Direction Bus
module uni_dir_bus (output [31:0] bus         , 
                    input  [31:0] a           ,
                    input         send_en     );
assign bus = send_en ? a : 32'bz; 
endmodule

// Example #2: Design Bi-Direction Bus
module bi_dir_bus (inout  [31:0] bus         , 
                   input  [31:0] a           , 
                   output [31:0] b           ,
                   input         send_en     , 
                   input         receive_en  );
assign b   = receive_en ? bus : 32'bz; 
assign bus = send_en    ? a   : 32'bz; 
endmodule

// Example #1: Multiplexer Design Using case-endcase
module example1_mux (output reg [31: 0] e         , 
                     input      [31: 0] a, b, c, d,
                     input      [1 : 0] sel       ); 
always @ (a, b, c, d, sel) begin
  case (sel) 
    2'h0   : e <= a ; 
    2'h1   : e <= b ; 
    2'h2   : e <= c ; 
    2'h3   : e <= d ; 
    default: e <= a ;  
  endcase
end 
endmodule 

// Example #2: Multiplexer Design Using if-else
module example2_mux (output reg [31: 0] e         , 
                     input      [31: 0] a, b, c, d,
                     input      [1 : 0] sel       ); 
always @ (a, b, c, d, sel) begin
  if (sel == 2'h0) begin
    e <= a;
  end else if (sel == 2'h1) begin
    e <= b;
  end else if (sel == 2'h2) begin
    e <= c;
  end else begin
    e <= d;
  end 
end
endmodule 

// Example #3: Multiplexer Design Using Conditional Assign
module example3_mux (output [31: 0] e         , 
                     input  [31: 0] a, b, c, d,
                     input  [1 : 0] sel       );  
assign e = (sel == 2'h0) ? a : 
               (sel == 2'h1) ? b :
                   (sel == 2'h2) ? c : d;
endmodule 

// Example #1: Design Latches Using Conditonal Assign
module example1_latch_conditonal (output [3:0] q    , 
                                  input  [3:0] d    , 
                                  input        en   ); 
assign q = en ? d : q;
endmodule 

// Example #2: Design Latches Using Omitted else
module example2_latch_always (output reg [3:0] q    , 
                              input      [3:0] d    , 
                              input            en   ); 
always @(en, d) begin
  if (en) q <= d;
end
endmodule

// Example #1: Design Combinational Logic and Latches 
module example1_comb_latch (input      a, b, c, sel, 
                            output reg d           );
reg r1, r2;
always @ (a, b, c, r1, r2, sel) begin 
  if (sel) begin
    r1 <= a & c  ;
    r2 <= r1 ^ b ;
    d  <= r1 & r2; 
  end
end
endmodule

// Example #2: An Alternative Way to the Design of 
// Combinational Logic and Latches 
module example2_comb_latch (input      a, b, c, sel, 
                            output reg d           );
wire w1 = a & c; 
wire w2 = w1 ^ b;
wire w3 = w1 & w2; 

always @(w3, sel) begin 
  if (sel) begin
    d  <= w3; 	
  end 
end
endmodule

// Example #1: Accidental Latches with Incomplete Case
module example1_acc_latch_co_case (input       a, b, c, 
                                   input [1:0] sel    , 
                                   output reg  d      );
always @ (a, b, c, sel) begin 
  case(sel)
    2'b00  : d <= a   ;
    2'b01  : d <= b   ;
    2'b10  : d <= c   ;
  endcase // Missing default
end
endmodule
		
// Example #2: Design with Complete Case
module example2_acc_latch_co_case (input       a, b, c, 
                                   input [1:0] sel    , 
                                   output reg  d      );
always @ (a, b, c, sel) begin 
  case(sel)
    2'b00  : d <= a   ;
    2'b01  : d <= b   ;
    2'b10  : d <= c   ;
    default: d <= 1'b0; // Complete case-endcase
  endcase 
end
endmodule

// Example #1: Accidental Latches with Incomplete List
module example1_acc_latch_inc_list (input       a, b, c, 
                                    input [1:0] sel    , 
                                    output reg  d      );
always @(a, b, sel) begin // Incomplete sensitivity list
  case(sel)
    2'b00  : d <= a;
    2'b01  : d <= b;
    2'b10  : d <= c;
    default: d <= 1'b0;
  endcase
end
endmodule

// Example #1: 8-bit Register with Asynchrnous Reset
module reg_async_rst (input            rst, clk, 
                      input      [7:0] d       , 
                      output reg [7:0] q       );
always @ (negedge rst, posedge clk) begin 
  if (~rst) begin
    q<=8'h0;
  end else begin
    q<=d   ;
  end
end
endmodule

// Example #2: 8-bit Register with Synchrnous Reset
module reg_sync_rst (input            rst, clk, 
                     input      [7:0] d       , 
                     output reg [7:0] q       );
always @ (posedge clk) begin 
  if (~rst) begin
    q<=8'h0;
  end else begin
    q<=d   ;
  end
end
endmodule

// Shift Register Design 
module shift_reg (input            rst     , 
                  input            clk     , 
                  input            data_in ,
                  output           data_out,
                  output reg [3:0] data_rev);  	

assign data_out = data_rev[0];
always @ (negedge rst, posedge clk) begin 
  if (~rst) begin
    data_rev <= 4'h0                    ;
  end else begin
    data_rev <= {data_in, data_rev[3:1]};
  end
end
endmodule

// 0-f Counter Design 
module cnt_0_f (input            rst, clk, en, 
                output reg [3:0] cnt        );

wire [3:0] nxt_cnt = en ? cnt+4'h1 : cnt;
always @ (negedge rst, posedge clk) begin 
  if (~rst) begin
    cnt <= 4'h0    ;
  end else begin
    cnt <= nxt_cnt ;
  end
end
endmodule

// Design on Timer 16x16-cycle
module timer_0_f_16_cycles (input    rst, clk, en, 
                            output reg [3:0] tim);
// The first level counter
reg  [3:0] cnt; 
wire [3:0] nxt_cnt = en ? cnt+4'h1 : cnt;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    cnt<=4'h0   ;
  end else begin
    cnt<=nxt_cnt;
  end
end

// The second level timer
wire [3:0] nxt_tim = (en & &cnt) ? tim+4'h1 : tim;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    tim<=4'h0   ;
  end else begin
    tim<=nxt_tim;
  end
end
endmodule	

module circuit1 (output f, 
                 input  a, b, c, d, e, en); 
assign f = en ? ~((a | b) | (c & d & e)) : 1'bz; 
endmodule 

module circuit2 (output reg c, 
                 input      a, b, en); 
wire nxt_c = a ^ b; 
always @ (en, nxt_c) begin 
  if (en) c <= nxt_c; 
end 
endmodule

module circuit3 (output reg e, 
                 input      a, b, c, d, 
                 input      clk, rst );
reg  r1, r2; 
wire nxt_r1 = a & b  ;
wire nxt_r2 = c ^ d  ;
wire nxt_e  = r1 | r2;

always @(posedge clk, negedge rst) begin 
  if (~rst) begin
    r1 <= 1'b0   ;
    r2 <= 1'b0   ;
    e  <= 1'b0   ;
  end else begin
    r1 <= nxt_r1 ;
    r2 <= nxt_r2 ;
    e  <= nxt_e  ; 	
  end
end
endmodule

module circuit4 (output       f, 
                 input        a, b, c, d, sel1,
                 input  [1:0] sel2            ); 
reg e;
assign f = sel1 ? e : 1'bz; 
always @ (a, b, c, d, sel2) begin
  case (sel2) 
    0:  e <= a; 
    1:  e <= b; 
    2:  e <= c; 
    3:  e <= d; 
    default: e <= a;  
  endcase 
end
endmodule 

module circuit5 (output reg [5:0] cnt, 
                 input            clk, rst, en); 
wire [5:0] nxt_cnt = en ? cnt+6'h1 : cnt; 
always @(posedge clk, negedge rst) begin 
  if (~rst) begin
    cnt<=6'h0   ;
  end else begin
    cnt<=nxt_cnt;
  end  
end
endmodule 

module circuit6 (input            rst     , 
                 input            clk     , 
                 input            data_in ,
                 output           data_out,
                 output reg [4:0] data_rev);  	

assign data_out = data_rev[4];
always @ (negedge rst, posedge clk) begin 
  if (~rst) begin
    data_rev <= 5'h0                    ;
  end else begin
    data_rev <= {data_rev[3:0], data_in};
  end
end
endmodule


