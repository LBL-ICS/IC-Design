//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//            _____       _____       
//  clk _____|     |_____|     |_____
//            ___________
//  ce  _____|           |___________
//            ___________
//  wr  _____|           |___________
//           
//addr  -----|  tk_addr  |---8'h00---|
//
//wrdata-----| tk_wrdata |---8'h00---|
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
task task_cpu_write; // a task to mimic cpu write
input [7:0] tk_addr    ; 
input [7:0] tk_wrdata  ; 
begin 
  $display ("%d CPU Write address: %h, data: %h", 
            $time, tk_addr, tk_wrdata); 
  $display ("%d -> Driving ce, wr, wrdata, addr", $time); 
  @(posedge clk)       ; 
  ce       = 1         ; 
  wr       = 1         ; 
  addr     = tk_addr   ; 
  wrdata   = tk_wrdata ; 
  @(posedge clk)       ; 
  ce       = 0         ; 
  wr       = 0         ; 
  addr     = 0         ; 
  wrdata   = 0         ;
  $display ("======================"); 
end 
endtask 		

