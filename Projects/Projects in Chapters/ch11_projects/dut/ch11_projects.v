module binary_counter (input            clk, 
                       input            rst, 
                       output reg [3:0] cnt);
wire [3:0] nxt_cnt = (cnt==4'h9) ? 4'h0 : cnt+4'h1;
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    cnt <= 4'h0   ;
  end else begin
    cnt <= nxt_cnt;  
  end
end
endmodule

module seq_circuit (input clk, rst, a, b, c, output reg h);
reg  a1,b1,c1,c2,d2,e2;
wire d1 = a1 & b1 ;
wire e1 = a1 | b1 ;
wire f2 = c2 ? e2 : d2 ;
wire g2 = f2 & c2 ;   

always @(posedge clk, negedge rst) begin
  if (~rst) begin
    a1<=1'b0; b1<=1'b0; c1<=1'b0; 
    c2<=1'b0; d2<=1'b0; e2<=1'b0; 
    h <=1'b0;
  end else begin
    a1 <= a ;
    b1 <= b ;
    c1 <= c ;
    c2 <= c1;
    d2 <= d1;
    e2 <= e1;
    h  <= g2;                       
  end
end
endmodule 

// master circuit for request
module master(input      clk,
              input      rst,
              input      en ,
              input      gnt,
              output reg req);
wire nxt_req = (~en & req & ~gnt) | (en & ~req & ~gnt);
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    req   <= 1'b0;
  end else begin
    req   <= nxt_req;
  end
end
endmodule

// slave circuit for response
module slave (input      clk,
              input      rst,
              input      req,
              output reg gnt);
reg req_d;
wire nxt_gnt = req & ~req_d ;
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    gnt   <= 1'b0;
    req_d <= 1'b0;
  end else begin
    gnt   <= nxt_gnt;
    req_d <= req    ;
  end
end
endmodule

module test();
wire clk, rst, req;
reg req_b_d1 ;
reg req_b_d2 ;
always @(posedge clk, negedge rst) begin
  if (~rst) begin
    req_b_d1 <= 1'b0;
    req_b_d2 <= 1'b0;
  end else begin
    req_b_d1 <= req     ;
    req_b_d2 <= req_b_d1;
  end 
end
endmodule

module seq_circuit(input      a, b, c, d, e, f, 
	           input      clk, rst, 
		   output reg j);
reg g, h, i;

always @(posedge clk, negedge rst) 
if (~rst) begin
    g<=0; h<=0; i<=0; j<=0;
end else begin
    g <= a & b                 ;
    h <= c | d                 ;
    i <= e ^ f                 ;
    j <= i ? ~|{g, h} : &{g, h};
end
endmodule 

`define DEPTH      64  // Depth of the FIFO
`define WIDTH      8   // Width of the FIFO
`define PTR_WIDTH  6   // DEPTH = 1<<PTR_WIDTH; 
module sync_fifo (input              clk      ,
                  input              rst      ,
                  input              write_en ,
                  input              read_en  , 
                  input  [`WIDTH-1:0] data_in  ,
                  output [`WIDTH-1:0] data_out ,
                  output             full     ,
                  output             empty    );

reg [`WIDTH-1:0]      mem [0:`DEPTH-1];
reg [`PTR_WIDTH-1:0]  write_ptr       ;
reg [`PTR_WIDTH-1:0]  read_ptr        ;
reg [`PTR_WIDTH-1:0]  cnt             ;

endmodule
