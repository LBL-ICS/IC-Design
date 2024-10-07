//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//            _____       _____       
//  clk _____|     |_____|     |_____
//            ___________
//  ce  _____|           |___________
//            ___________
//  rd  _____|           |___________
//
//addr  -----|  tk_addr  |---8'h00---|
//                             
//rddata-----------------------|  rddata  |
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
task task_cpu_read; 
input  [7:0] tk_addr  ; 
//output [7:0] tk_rddata; 
begin 
  $display ("%d CPU Read address: %h!", $time, tk_addr);
  $display ("%d -> Driving ce, rd, addr", $time); 
  @(posedge clk)      ; 
  ce        = 1       ; 
  rd        = 1       ; 
  addr      = tk_addr ; 
  @(posedge clk)      ; 
  ce        = 0       ; 
  rd        = 0       ; 
  addr      = 0       ; 
  @(negedge clk)      ;
//  tk_rddata = rddata  ; 
  $display ("%g CPU Read data : %h", $time, rddata); 
  $display ("======================"); 
end 
endtask

