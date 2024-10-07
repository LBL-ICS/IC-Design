module FSM_template (input      rst   ,
                     input      clk   ,
                     input      x     ,
                     output reg y     );
parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3=2'b11;
		
reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM
		
//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin
  if (~rst) begin
    cur_state <= S0;
  end else begin
    cur_state <= nxt_state;
  end
end
		
//---- Combinational Circuit for the Next State ---
always @ (cur_state, x, rst) begin
  if (~rst) begin
    nxt_state <= S0;
  end else begin
    case(cur_state)
      S0     :; 
      S1     :; 
      S2     :; 
      S3     :;
      default: nxt_state <= S0;
    endcase
  end
end
		
//----------Output Combinational Circuit--------------
always @ (cur_state, x, rst) begin
  if (~rst) begin
    y <= 1'b0;
  end else begin
    case(cur_state)
      S0     :; 
      S1     :; 
      S2     :; 
      S3     :;
      default: y <= 1'b0;
    endcase
  end
end
endmodule


module mealy_fsm(input      rst    ,
                 input      clk    ,
                 input      x      ,
                 output     y     );
		
parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
		
reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM
		
//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin
  if (~rst) begin
    cur_state <= S0;
  end else begin
    cur_state <= nxt_state;
  end
end
		
//-------Next State Combinational Circuit-----------
always @ (cur_state, x, rst) begin
  if (~rst) begin
    nxt_state <= S0;
  end else begin
    case(cur_state)
      S0    : if(x)  nxt_state <= S1;
      S1    : if(~x) nxt_state <= S2;
      S2    : if(x)  nxt_state <= S1; else nxt_state <= S0;
      default: nxt_state <= S0;
    endcase
  end
end
		
//----------Output Combinational Circuit--------------
assign y = (cur_state==S2) & x;
endmodule


module moore_fsm(input      rst    ,
                 input      clk    ,
                 input      x      ,
                 output     y     );
		
parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM
		
//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin
  if (~rst) begin
    cur_state <= S0;
  end else begin
    cur_state <= nxt_state;
  end
end
		
//-------Next State Combinational Circuit-----------
always @ (cur_state, x, rst) begin
  if (~rst) begin
    nxt_state <= S0;
  end else begin
    case(cur_state)
      S0    : if(x)  nxt_state <= S1;
      S1    : if(~x) nxt_state <= S2;
      S2    : if(x)  nxt_state <= S3; else nxt_state <= S0;
      S3    : if(x)  nxt_state <= S1; else nxt_state <= S2;
      default: nxt_state <= S0;
    endcase
  end
end
		
//----------Output Combinational Circuit--------------
assign y = (cur_state==S3);		
endmodule


module seq_det_0101_mealy (input  rst,
                           input  clk,
                           input  x  ,
                           output y  );

parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM

//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin
  if (~rst) begin
    cur_state <= S0;
  end else begin
    cur_state <= nxt_state;
  end
end

//-------Next state combinational circuit-----------
always @ (cur_state, x, rst) begin
  if (~rst) begin
    nxt_state <= 2'b00;
  end else begin
    case(cur_state)
      S0:      if(~x) nxt_state <= S1;
      S1:      if(x)  nxt_state <= S2;
      S2:      if(~x) nxt_state <= S3; else nxt_state <= S0;
      S3:      if(~x) nxt_state <= S1; else nxt_state <= S2;
      default: nxt_state <= S0;
    endcase
  end
end

//----------Output combinational circuit--------------
assign y = (cur_state==S3) & x;
endmodule


module seq_det_0101_moore (input  rst,
                           input  clk,
                           input  x  ,
                           output y  );

parameter SIZE = 3;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, 
          S3 = 3'b011, S4 = 3'b100;

reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM

//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin 
  if (~rst) begin
    cur_state <= S0;
  end else begin
    cur_state <= nxt_state;
  end
end

//-------Next state combinational circuit-----------
always @ (cur_state, x, rst) begin
  if (~rst) begin
    nxt_state <= S0;
  end else begin
    case(cur_state)
      S0:      if(~x) nxt_state <= S1;
      S1:      if(x)  nxt_state <= S2;
      S2:      if(x)  nxt_state <= S0; else nxt_state <= S3;
      S3:      if(x)  nxt_state <= S4; else nxt_state <= S1;
      S4:      if(x)  nxt_state <= S0; else nxt_state <= S3;
      default: nxt_state <= S0;
    endcase
  end
end

//----------Output combinational circuit--------------
assign y = (cur_state==S4) ;
endmodule	


module odd_even_1s_checker(input  rst ,
                           input  clk ,
                           input  en  ,
                           input  x   ,
                           output y   );
parameter SIZE = 2;
parameter INI = 2'b00, ODD = 2'b01, EVEN = 2'b10;

reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM

//------------------State Register -----------------
always @ (posedge clk or negedge rst) begin 
  if (~rst) begin
    cur_state <= INI      ;
  end else begin
    cur_state <= nxt_state;
  end
end

//-------Next state combinational circuit-----------
always @ (cur_state, en, x, rst) begin
  if(~rst) begin
    nxt_state <= INI;
  end else begin
    case(cur_state)
      INI     : if(x&en) nxt_state <= ODD ;
      ODD     : if(x&en) nxt_state <= EVEN;
      EVEN    : if(x&en) nxt_state <= ODD ;
      default : nxt_state <= INI;
    endcase
  end
end

//----------Output combinational circuit--------------
assign y = (cur_state==ODD); 
endmodule 


module data_pack_rec(input            rst      ,
                     input            clk      ,
                     input            en       ,
                     input            data_in  ,
                     output           header   ,
                     output           cmd      ,
                     output reg [3:0] rev_data ,
                     output           tail     ); 
parameter SIZE = 4;
parameter H0 = 4'b0000;
parameter H1 = 4'b0001;
parameter H2 = 4'b0010;
parameter H3 = 4'b0011;
parameter CM = 4'b0100;
parameter RD = 4'b0101;
parameter T0 = 4'b0110;
parameter T1 = 4'b0111;
parameter T2 = 4'b1000;
parameter T3 = 4'b1001;

reg [SIZE-1:0] cur_state; // Sequential part of the FSM
reg [SIZE-1:0] nxt_state; // Combinational part of the FSM

//------------------State Register -----------------
always @ (posedge clk, negedge rst) begin
  if(~rst) begin
    cur_state <= H0      ;
  end else begin
    cur_state <= nxt_state;
  end
end

//-------Next state combinational circuit-----------
reg  [1:0] cnt;
wire [1:0] nxt_cnt = (cur_state==RD) ? cnt+2'h1 : 2'h0;
always @ (posedge clk, negedge rst) begin
  if(~rst) begin
    cnt <= 2'h0   ;
  end else begin
    cnt <= nxt_cnt;
  end
end

always @ (cur_state, en, data_in, rst, cnt) begin
  if(~rst) begin
    nxt_state <= H0;
  end else begin
    case(cur_state)
      H0    : if(~data_in & en) nxt_state <= H1; 
      H1    : if(data_in )      nxt_state <= H2; 
              else              nxt_state <= H0;
      H2    : if(~data_in)      nxt_state <= H3; 
              else              nxt_state <= H0; 
      H3    : if(data_in )      nxt_state <= CM; 
              else              nxt_state <= H0;
      CM    :                   nxt_state <= RD; 
      RD    : if(&cnt)          nxt_state <= T0;  
      T0    : if(data_in)       nxt_state <= T1; 
              else              nxt_state <= H0;
      T1    : if(~data_in)      nxt_state <= T2; 
              else              nxt_state <= H0;
      T2    : if(data_in)       nxt_state <= T3; 
              else              nxt_state <= H0;
      T3    :                   nxt_state <= H0;
      default : nxt_state <= H0;
     endcase
  end
end

//----------Output combinational circuit--------------
assign header = (cur_state==H3) & data_in ; 
assign cmd    = (cur_state==CM) & data_in ; 
assign tail   = (cur_state==T3) & ~data_in; 

wire [3:0] nxt_rev_data;
assign nxt_rev_data=(cur_state==RD)?{rev_data[2:0],data_in} 
                                   : rev_data;  
always @ (posedge clk, negedge rst) begin
  if(~rst) begin
    rev_data <= 4'h0        ;
  end else begin
    rev_data <= nxt_rev_data;
  end
end
endmodule 		
