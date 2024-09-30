module full_adder (output sum   , 
                   output c_out , 
                   input  a     , 
                   input  b     , 
                   input  c_in  );
assign {c_out, sum} = a + b + c_in;
endmodule

`timescale 1ns/1ns //reference time/resolution
module tb_full_adder();
reg  a, b, c_in;  // LHS signals in an initial block
wire sum, c_out;  // wire connection between tb and dut

// --------  DUT Instantiation -------------
full_adder u_full_adder (.sum   (sum  ), 
                         .c_out (c_out), 
                         .a     (a    ), 
                         .b     (b    ), 
                         .c_in  (c_in));

// --------  Dump VCD Waveform -------------
initial begin  
  $dumpfile("full_adder.vcd");
  $dumpvars(0,tb_full_adder.u_full_adder);
end

// ------ Bus Function Model (BFM) ---------
initial begin 
  a=1'b0;  b=1'b0; c_in=1'b0;        // golden result: 00
  #10;  a=1'b0;  b=1'b0; c_in=1'b1;  // golden result: 01
  #10;  a=1'b0;  b=1'b1; c_in=1'b0;  // golden result: 01
  #10;  a=1'b0;  b=1'b1; c_in=1'b1;  // golden result: 10
  #10;  a=1'b1;  b=1'b0; c_in=1'b0;  // golden result: 01
  #10;  a=1'b1;  b=1'b0; c_in=1'b1;  // golden result: 10
  #10;  a=1'b1;  b=1'b1; c_in=1'b0;  // golden result: 10
  #10;  a=1'b1;  b=1'b1; c_in=1'b1;  // golden result: 11
end

// ------------  Monitor ------------------
reg [1:0] mem [0:7];
initial begin
  $readmemb("../monitor/GoldenModel.txt", mem);
end

integer i;
initial begin
  for (i=0; i<8; i=i+1) begin
    #5;
    if({c_out,sum}==mem[i]) begin
      $display ("Data Comparison Passes!");
    end else begin
      $display ("ERROR at: %d ns, golden c_out=%b, sum=%b, but DUT c_out=%b, sum=%b when a=%b, b=%b, c_in=%b.", $time, mem0[i][1], mem0[i][0], c_out, sum, a, b, c_in);
      $stop;
    end
    #5;
  end
end
endmodule

// An Example Using `define
`define WIDTH 8 
module adder (input  [`WIDTH-1:0] a,
              input  [`WIDTH-1:0] b, 
              output [`WIDTH-1:0] s);
assign s = a+b;
endmodule

// An Example Using parameter
module adder #(parameter WIDTH=8) (input  [WIDTH-1:0] a,
                                   input  [WIDTH-1:0] b, 
                                   output [WIDTH-1:0] s);
assign s = a+b;
endmodule

// An Example Using `ifdef-`elsif-`endif
`define PROJECT_32BIT
module FP_adder (input          clk      ,
                 input          rst      ,
`ifdef PROJECT_32BIT
                 input  [31:0]  i32_data ,
                 output [31:0]  o32_data 
`elsif PROJECT_64BIT
                 input  [63:0]  i64_data ,
                 output [63:0]  o64_data 
`elsif PROJECT_128BIT
                 input  [127:0] i128_data,
                 output [127:0] o128_data  
`endif
                                         );	
endmodule

module tb();
wire       data_check_en;
reg [31:0] golden_result, dut_result;
real       golden_real, dut_real, diff_real;
real       error_percent;
integer    log;

initial begin
  log=$fopen("./report.log", "w");
  wait(data_check_en);
  golden_real   = ieee754_to_fp(golden_result)      ;
  dut_real      = ieee754_to_fp(dut_result)         ;
  diff_real     = golden_real-dut_real;
  error_percent = diff_real/golden_real*100         ;
  if(error_percent<5) begin
    $fwrite (log, "Test Pass!");
    $fwrite (log, "Error percent: %f%%", error_percent);
  end else begin
    $fwrite (log, "Test FAIL!");
    $fwrite (log, "Error percent: %f%%", error_percent);
    $fwrite (log, "Golden real: %f", golden_real);
    $fwrite (log, "DUT real: %f\n", dut_real);
    $fwrite (log, "Golden Hex: %h", golden_result);
    $fwrite (log, "DUT Hex: %h\n", dut_result);
  end
  $fclose(report);
end
endmodule


// Call cpu_write and cpu_read tasks  
module task_cpu_wr_rd(); 
reg        clk, ce, rd, wr  ;
reg  [7:0] addr, wrdata;
wire [7:0] rddata      ;
`include "../dut/task_cpu_write.v"
`include "../dut/task_cpu_read.v"

initial clk = 0; 
always #5 clk = ~clk; 

initial begin 
  ce     = 1'b0; 
  wr     = 1'b0; 
  rd     = 1'b0;
  addr   = 8'h0; 
  wrdata = 8'h0; 
 
  task_cpu_write(8'h01, 8'h10    ); //Call the write task
  task_cpu_read (8'h01           ); //Call the read task
  #5 task_cpu_write(8'h00, 8'h85 ); 
     task_cpu_read (8'h00        ); 
end 
endmodule

/* --------------------------------------------------------
 * This source file contains a simulation testbench for a FP   
 * Adder generated by the Chisel HCL.
 * Design-under-test: FP_adder
 * Testbench        : tb_FP_adder
 * Design IOs       : inputs - clock, reset, 
 *                             io_in_a[31:0], io_in_b[31:0]
 *                    outputs- io_out_s[31:0]
 * Latency          : One cycle per FP addition
 * Precision        : Single precision
 * Resource Required: 16 Binary Adders (32 x 32 bits)
 *
 * Author           : Xiaokun Yang
 * Date             : June 2022
*///------------------------------------------------------
`timescale 1ns/1ns
module tb_FP_adder();
parameter TEST_SIZE = 1_000_000;
reg         clock    ;  
reg         reset    ;
reg  [31:0] io_in_a  ;
reg  [31:0] io_in_b  ;
wire [31:0] io_out_s ;

// -------------------------------
// Stimulus Files and Golden File
// -------------------------------
reg [31:0]  input_a[TEST_SIZE-1:0] ;
reg [31:0]  input_b[TEST_SIZE-1:0] ;
reg [31:0]  output_s[TEST_SIZE-1:0];

initial begin
   $readmemh("../golden/rtl-a-input.txt",input_a)  ;
   $readmemh("../golden/rtl-b-input.txt",input_b)  ;
   $readmemh("../golden/rtl-s-output.txt",output_s);
end

// -------------------------------
// --- DUT Instantiation ---------
// -------------------------------
FP_adder u_FP_adder (
                     .clock   (clock   ),
                     .reset   (reset   ),
                     .io_in_a (io_in_a ),
                     .io_in_b (io_in_b ),
                     .io_out_s(io_out_s));

// -------------------------------
// --- Bus Functional Models -----
// -------------------------------
integer i;
initial begin
   reset = 1'b0;
   clock = 1'b0;
   #100;
   reset = 1'b1;
   @(posedge clock);

  for (i=0; i < TEST_SIZE; i = i+1) begin
    io_in_a <= input_a[i];  
    io_in_b <= input_b[i];  
    @(posedge clock);
  end
end

always #10 clock = ~clock;

// -------------------------------
// ----------Monitor -------------
// -------------------------------
integer j, m, n, o, p, q, r, s; 
wire sign_check = (io_out_s[31]==output_s[j][31])      ;
wire exp_check  = (io_out_s[30:23]==output_s[j][30:23]);
wire mant_check = (io_out_s[22:0]==output_s[j][22:0])  ;
wire mant_22_4  = (io_out_s[22:4]==output_s[j][22:4])  ;
wire mant_22_8  = (io_out_s[22:8]==output_s[j][22:8])  ;
wire mant_22_16 = (io_out_s[22:16]==output_s[j][22:16]);
wire mant_3_0   = (io_out_s[3:0]==output_s[j][3:0])    ;
wire mant_7_0   = (io_out_s[7:0]==output_s[j][7:0])    ;
wire mant_15_0  = (io_out_s[15:0]==output_s[j][15:0])  ;

initial begin
  m = 0 ;
  n = 0 ;
  o = 0 ;
  p = 0 ;
  q = 0 ;
  r = 0 ;
  s = 0 ;
  wait (reset);
  repeat (2) @(negedge clock);
  for (j=0; j < TEST_SIZE; j = j+1) begin
    $display("%d ns, a=%h, b=%h, golden s=%h, dut s=%h", 
$time, input_a[i-1], input_b[i-1], output_s[j], io_out_s);
    case({sign_check, exp_check, mant_check})
    3'b111: begin 
              m=m+1; 
            end
    3'b110: begin
            if(mant_22_4 & ~mant_3_0) begin
              n=n+1;
            end else if(mant_22_8 & ~mant_7_0) begin
              o=o+1;
            end else if(mant_22_16 & ~mant_15_0) begin
              p=p+1;
            end
            end
  default: begin
           if(~sign_check) begin
             $display("Sign bit different!, j=%d", j);
             q=q+1;
           end else if(~exp_check) begin
             $display("Exponent are different!");
             r=r+1;
           end else if(~mant_22_16) begin
             $display("Matanssa[22:16] are different!");
             s=s+1;
           end
           end 
    endcase
    @(negedge clock);
  end
  
  $display("------FP adder simulation summary-------");
  $display("%d cases pass, %d fail!", m+n+o+p, q+r+s);
  $display("----FP adder simulation passed cases---");
  $display("%d cases exactly the same!", m);
  $display("%d cases: different mantissa[3:0]!", n);
  $display("%d cases: different mantissa[7:0]!", o);
  $display("%d cases: different mantissa[15:0]!", p);
  $display("----FP adder simulation failed cases---");
  $display("%d cases: different sign bit!", q);
  $display("%d cases: different exponent bits!", r);
  $display("%d cases: different mantissa[22:16]!", s);
  $display("------FP adder simulation summary-------");
end
endmodule
