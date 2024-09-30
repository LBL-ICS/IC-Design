module i2c_master  (input       clk      , 
                    input       rst      ,
                    input       i2c_en   , 
                    input [7:0] id       ,
                    input [7:0] addr     , 
                    input [7:0] data     , 
                    inout       sda      , 
                    output reg  scl      ); 
reg [5:0] cnt       ;
reg [6:0] tim       ;
reg [2:0] nxt_state ;
reg [2:0] cur_state ;

//---------------------------------------------------//
// cnt: 0~64, timer unit - 64x50MHz clock is 1.28 us //
// tim: timing control for scl and sda               //
//---------------------------------------------------//
wire [5:0]  nxt_cnt = i2c_en ? cnt+6'd1 : cnt;  
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    cnt <= 6'd0   ;
  end else begin
    cnt <= nxt_cnt;
  end
end

wire [6:0] nxt_tim = tim==7'd69 & &cnt ? 7'd0 :
                             i2c_en & &cnt ? tim+7'd1 : tim;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    tim <= 7'd0   ;
  end else begin
    tim <= nxt_tim;
  end
end

//---------------------------------------------------//
//-----------   finite state machine      -----------//
//---------------------------------------------------//
parameter INI  =3'h0; 
parameter START=3'h1; 
parameter ID   =3'h2; 
parameter ADDR =3'h3; 
parameter DATA =3'h4; 
parameter STOP =3'h5; 

always @(posedge clk, negedge rst) begin
  if(~rst) begin
    cur_state <= INI      ;
  end else begin
    cur_state <= nxt_state;
  end
end

always @(rst, cur_state, i2c_en, cnt, tim) begin
  if (~rst) begin
    nxt_state <= INI;
  end else begin
    case (cur_state) 
      INI  : if(i2c_en)              nxt_state <= START;
      START: if(tim==7'd7  & (&cnt)) nxt_state <= ID   ;
      ID   : if(tim==7'd25 & (&cnt)) nxt_state <= ADDR ;
      ADDR : if(tim==7'd43 & (&cnt)) nxt_state <= DATA ;
      DATA : if(tim==7'd61 & (&cnt)) nxt_state <= STOP ;
      STOP : if(tim==7'd69 & (&cnt)) begin
               if(i2c_en) begin
                 nxt_state <= START ;
               end else begin
                 nxt_state <= INI   ;
               end
             end
    endcase
  end
end

//---------------------------------------------------//
//-------------------   scl   -----------------------//
//---------------------------------------------------//
always @(rst, cur_state, tim) begin
  if (~rst) begin
    scl <= 1'b1;
  end else begin
    case (cur_state) 
      INI           : scl<=1'b1      ; 
      START         : scl<=1'b1      ;
      ID, ADDR, DATA: scl<=tim[0]    ;  
      STOP          : scl<=1'b1      ;
      default       : scl<=1'b1      ;
    endcase
  end
end

//---------------------------------------------------//
//-------------------   sda   -----------------------//
//---------------------------------------------------//
reg sda_reg;
assign sda=(tim>=7'd24 & tim<=7'd25) | 
           (tim>=7'd42 & tim<=7'd43) | 
           (tim>=7'd60 & tim<=7'd61) ? 1'bz : sda_reg;

always @(rst, cur_state, tim, id, addr, data) begin
  if (~rst) begin
    sda_reg <= 1'b1;
  end else begin
    case (cur_state) 
      INI  :   sda_reg <= 1'b1; 
      START:   sda_reg <= (tim>=7'd0 & tim<=7'd3); 
      ID   : case (tim) 
               8, 9  : sda_reg<=id[7];
               10,11 : sda_reg<=id[6];
               12,13 : sda_reg<=id[5];
               14,15 : sda_reg<=id[4];
               16,17 : sda_reg<=id[3];
               18,19 : sda_reg<=id[2];
               20,21 : sda_reg<=id[1];
               22,23 : sda_reg<=id[0];
             endcase 
      ADDR : case (tim) 
               26,27 : sda_reg<=addr[7];
               28,29 : sda_reg<=addr[6];
               30,31 : sda_reg<=addr[5];
               32,33 : sda_reg<=addr[4];
               34,35 : sda_reg<=addr[3];
               36,37 : sda_reg<=addr[2];
               38,39 : sda_reg<=addr[1];
               40,41 : sda_reg<=addr[0];
             endcase 
      DATA : case (tim) 
               44,45 : sda_reg<=data[7];
               46,47 : sda_reg<=data[6];
               48,49 : sda_reg<=data[5];
               50,51 : sda_reg<=data[4];
               52,53 : sda_reg<=data[3];
               54,55 : sda_reg<=data[2];
               56,57 : sda_reg<=data[1];
               58,59 : sda_reg<=data[0];
             endcase 
      STOP :   sda_reg <= (tim>=7'd66 & tim<=7'd69); 
      default: sda_reg <= 1'b1;
    endcase
  end
end
endmodule


`define CMD_1C  32'h1c
`define CMD_18  32'h18
`define CMD_14  32'h14
`define CMD_10  32'h10
`define CMD_0C  32'hc
`define CMD_08  32'h8
`define CMD_04  32'h4
`define CMD_00  32'h0

`define WD_1C  32'hf7
`define WD_18  32'hf6
`define WD_14  32'hf5
`define WD_10  32'hf4
`define WD_0C  32'hf3
`define WD_08  32'hf2
`define WD_04  32'hf1
`define WD_00  32'hf0

module msbus_master (input             clk          ,       
                     input             rst          ,
                     input             cmd_en       ,
                     input      [2:0]  cmd_cnt      , 
                     output            m_ce         ,
                     output            m_wr         ,
                     output reg [31:0] m_addr_wdata ,
                     input      [31:0] s_rdata      ,
                     input             s_vld        );
parameter INI = 3'h0  ;
parameter WC  = 3'h1  ;
parameter WD  = 3'h2  ;
parameter RC  = 3'h3  ;
parameter RD  = 3'h4  ; 

//---------------------------------------
//------- current state--------------
//--------------------------------------
reg [2:0] cur_state, nxt_state;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    cur_state <= INI      ;
  end else begin
    cur_state <= nxt_state;
  end
end

//--------------------------------------
//------- next state-----------------
//--------------------------------------
always @(rst, cur_state, cmd_en, s_vld) begin
  if(~rst) begin
    nxt_state <= INI;
  end else begin
    case (cur_state) 
      INI: if(cmd_en) nxt_state <= WC;
      WC:             nxt_state <= WD;
      WD:  if (s_vld) nxt_state <= RC;
      RC:             nxt_state <= RD;
      RD:  if (s_vld) begin
             if (cmd_en) nxt_state <= WC ;
             else        nxt_state <= INI;
           end 
      default:        nxt_state <= INI;
    endcase
  end
end

//-----------------------------------
//------- output logic------------
//-----------------------------------
wire mwc_f = cur_state==WC;
wire mrc_f = cur_state==RC;
wire mwd_f = cur_state==WD;

//---------------------------------------------
//------- master data path---------------
//---------------------------------------------
always @(rst, mwc_f, mrc_f, cmd_cnt, mwd_f) begin
  if(~rst) begin
    m_addr_wdata <= 32'h0;
  end if (mwc_f | mrc_f)  begin
    case (cmd_cnt)
      3'd7 : m_addr_wdata <= `CMD_1C;
      3'd6 : m_addr_wdata <= `CMD_18;
      3'd5 : m_addr_wdata <= `CMD_14;
      3'd4 : m_addr_wdata <= `CMD_10;
      3'd3 : m_addr_wdata <= `CMD_0C;
      3'd2 : m_addr_wdata <= `CMD_08;
      3'd1 : m_addr_wdata <= `CMD_04;
      3'd0 : m_addr_wdata <= `CMD_00;
      default: m_addr_wdata <= `CMD_00;
    endcase
  end else if (mwd_f) begin
    case (cmd_cnt)
      3'd7 : m_addr_wdata <= `WD_1C;
      3'd6 : m_addr_wdata <= `WD_18;
      3'd5 : m_addr_wdata <= `WD_14;
      3'd4 : m_addr_wdata <= `WD_10;
      3'd3 : m_addr_wdata <= `WD_0C;
      3'd2 : m_addr_wdata <= `WD_08;
      3'd1 : m_addr_wdata <= `WD_04;
      3'd0 : m_addr_wdata <= `WD_00;
      default: m_addr_wdata <= `WD_00;
    endcase 
  end
end

assign m_ce = mwc_f |  mrc_f;
assign m_wr = mwc_f | ~mrc_f;
endmodule


module msbus_slave (input          clk           ,
                    input          rst           ,
                    input          cmd_en        ,
                    input  [7:0]   cmd_cnt       ,
                    input          m_ce          ,
                    input          m_wr          ,
                    input  [31:0]  m_addr_wdata  ,
                    output [31:0]  s_rdata       ,
                    output         s_vld         );  
reg [7:0] func_reg[0:31] ;

parameter INI = 3'h0;
parameter WC  = 3'h1;
parameter WD  = 3'h2;
parameter RC  = 3'h3;
parameter RD  = 3'h4;

//--------------------------------------
//------- current state--------------
//--------------------------------------
reg [2:0] cur_state, nxt_state;
always @(posedge clk, negedge rst) begin
  if(~rst) begin
    cur_state <= INI      ;
  end else begin
    cur_state <= nxt_state;
  end
end

//-----------------------------------
//------- next state-----------------
//-----------------------------------
always @(rst, cur_state, cmd_en, m_ce) begin
  if(~rst) begin
    nxt_state <= INI;
  end else begin
    case (cur_state) 
      INI: if (cmd_en) begin
             nxt_state <= WC;
           end else begin
             nxt_state <= INI;
           end
      WC:  if(m_ce)   nxt_state <= WD ;
      WD:             nxt_state <= RC ;
      RC:  if(m_ce)   nxt_state <= RD ;
      RD:  if(cmd_en) nxt_state <= WC ;
           else       nxt_state <= INI;
    endcase
  end
end

//--------------------------------------
//------- output logic---------------
//--------------------------------------
wire swd_f = cur_state==WD;
wire srd_f = cur_state==RD;

//---------------------------------------
//------- slave data path- --------------
//---------------------------------------
integer i;
always @(rst, swd_f, m_addr_wdata) begin
  if(~rst) begin
    for (i=0; i<32; i=i+1) begin
      func_reg[i] <= 8'h0;
    end
  end else if (swd_f) begin
`ifdef BIG_ENDIAN
    func_reg[4*cmd_cnt+3]  <= m_addr_wdata[7 : 0]; 
    func_reg[4*cmd_cnt+2]  <= m_addr_wdata[15: 8];
    func_reg[4*cmd_cnt+1]  <= m_addr_wdata[23:16];
    func_reg[4*cmd_cnt  ]  <= m_addr_wdata[31:24];
`elsif LITTLE_ENDIAN
    func_reg[4*cmd_cnt+3]  <= m_addr_wdata[31:24]; 
    func_reg[4*cmd_cnt+2]  <= m_addr_wdata[23:16];
    func_reg[4*cmd_cnt+1]  <= m_addr_wdata[15: 8];
    func_reg[4*cmd_cnt  ]  <= m_addr_wdata[7 : 0];
`endif
  end 
end

`ifdef BIG_ENDIAN
assign s_rdata = srd_f ? {func_reg[4*cmd_cnt]  , 
                          func_reg[4*cmd_cnt+1], 
                          func_reg[4*cmd_cnt+2], 
                          func_reg[4*cmd_cnt+3]} : 32'h0 ;
`elsif LITTLE_ENDIAN
assign s_rdata = srd_f ? {func_reg[4*cmd_cnt+3], 
                          func_reg[4*cmd_cnt+2], 
                          func_reg[4*cmd_cnt+1], 
                          func_reg[4*cmd_cnt  ]} : 32'h0 ;
`endif

assign s_vld   = swd_f | srd_f ;
endmodule
