/*
 * This source file contains a Verilog description of an IP core
 * automatically generated by the Floating-Point Design Generator.
 *
 * Author: Xiaokun Yang and Maria Vega, University of Houston Clear Lake 
 * Date: June 2022
 *
 * For more information, see the project website at:
 * https://sceweb.sce.uhcl.edu/xiaokun/OpenIC/
 *
//   Latency: 1 cycle per addition
//   Precision: Single bit
//   Resources required: 16 adders (32 x 32 bit)
*/


module tb_FP_adder();
parameter TEST_SIZE = 10;
reg [31:0]  input_a[TEST_SIZE-1:0];
reg [31:0]  input_b[TEST_SIZE-1:0];
reg [31:0]  output_c[TEST_SIZE-1:0];

initial begin
   $readmemh("../golden/rtl-a-input.txt",input_a);
   $readmemh("../golden/rtl-b-input.txt",input_b);
   $readmemh("../golden/rtl-c-output.txt",output_c);
end

reg         clock     ;  
reg         reset     ;
reg         in_valid  ;
reg  [31:0] in_data_0 ;
reg  [31:0] in_data_1 ;
wire [31:0] out_data  ;
wire        out_ready ;

 always #10 clock = ~clock;

 FP_adder_32_1cc u_FP_adder (.clock     (clock    ),
                             .reset     (reset    ),
                             .in_valid  (in_valid ),
                             .in_data_0 (in_data_0),
                             .in_data_1 (in_data_1),
                             .out_data  (out_data ),
                             .out_ready (out_ready));
  
integer i,j; 
integer m,n,o,p,q,r,s,t;
initial begin
   reset = 1'b1;
   clock = 1'b0;
   m = 0 ;
   n = 0 ;
   o = 0 ;
   p = 0 ;
   q = 0 ;
   r = 0 ;
   s = 0 ;
   t = 0 ;
   in_valid  = 1'b0;
   in_data_0 = 32'h0;  
   in_data_1 = 32'h0;  
   #100;
   reset = 1'b0;
   @(posedge clock);

  for (i=0; i < TEST_SIZE; i = i+1) begin
    in_valid  = 1'b1;
    in_data_0 = input_a[i];  
    in_data_1 = input_b[i];  
    @(posedge clock);
  end
    in_valid  = 1'b0;
end

initial begin
  wait (~reset);
  wait (out_ready);
  @(negedge clock);
  for (j=0; j < TEST_SIZE; j = j+1) begin
    $display("At %dns, for the test case a=%h and b=%h: expected output is %h and the dut output is %h, i=%d, j=%d", $time, input_a[i-1], input_b[i-1], output_c[j], out_data,i,j);
    case({out_data[31]==output_c[j][31], out_data[30:23]==output_c[j][30:23], out_data[22:0]==output_c[j][22:0]})
    3'b111:  begin 
               m=m+1; 
             end
    3'b110:  begin
	       if((out_data[22:4]==output_c[j][22:4])&(out_data[3:0]!=output_c[j][3:0])) begin
                 n=n+1;
	       end else if ((out_data[22:7]==output_c[j][22:7])&(out_data[7:0]!=output_c[j][7:0])) begin
                 o=o+1;
	       end else if ((out_data[22:16]==output_c[j][22:16])&(out_data[15:0]!=output_c[j][15:0])) begin
                 p=p+1;
	       end
	     end
    default: begin
	       if(out_data[31]!=output_c[j][31]) begin
                 $display("FAIL! Sign bit different!, j=%d", j);
                 q=q+1;
	       end else if (out_data[30:23]!=output_c[j][30:23]) begin
                 $display("FAIL! Exponent are different!");
                 r=r+1;
	       end else if (out_data[22:16]!=output_c[j][22:16]) begin
                 $display("FAIL! Matanssa[22:16] are different!");
                 s=s+1;
	       end
	     end
    endcase
    @(negedge clock);
  end
  
  //$display("at %dns, i=%d, j=%d", $time, i,j);
  //$display("m=%d, n=%d, o=%d, p=%d, q=%d, r=%d, s=%d, t=%d", m, n, o, p, q, r, s, t);
  $display("----------------------------------- FP adder design simulation summary ------------------------------");
  $display("For all the 1,000,000 test cases, there are %d test cases pass, %d test cases fail!", m+n+o+p+t, q+r+s);
  $display("----------------------------------- FP adder design simulation passed cases -------------------------");
  $display("For all the 1,000,000 passed test cases, there are %d test cases exactly the same!", m);
  $display("For all the 1,000,000 passed test cases, there are %d test cases with different 3-0 mantissa bits!", n);
  $display("For all the 1,000,000 passed test cases, there are %d test cases with different 7-0 mantissa bits!", o);
  $display("For all the 1,000,000 passed test cases, there are %d test cases with different 15-0 mantissa bits!", p);
  $display("----------------------------------- FP adder design simulation fail cases ---------------------------");
  $display("For all the 1,000,000 failed test cases, there are %d test cases with different sign bit!", q);
  $display("For all the 1,000,000 failed test cases, there are %d test cases with different exponent bits!", r);
  $display("For all the 1,000,000 failed test cases, there are %d test cases with different 22-16 mantissa bits!", s);
  $display("------------------------------------- FP adder design simulation summary ------------------------------");
end
endmodule

