`define WIDTH 32
`define DEPTH 1024
`define ADDR_WIDTH 10
`define WE_WIDTH 4
module simple_single(input                        clk  , 
                     input                        en   ,
                     input      [`WE_WIDTH-1:0]   we   ,
                     input      [`ADDR_WIDTH-1:0] addr ,
                     input      [`WIDTH-1:0]      din  ,
                     output reg [`WIDTH-1:0]      dout);
reg [`WIDTH-1:0] ram[0:`DEPTH-1]; 

always @(posedge clk) begin
  if (en) begin
    if(we[`WE_WIDTH-1]) begin
      ram[addr][`WIDTH-1:`WIDTH-8*1]<=
              din[`WIDTH-1:`WIDTH-8*1];
    end
    if (we[`WE_WIDTH-2]) begin
      ram[addr][`WIDTH-8*1-1:`WIDTH-8*2]<=
              din[`WIDTH-8*1-1:`WIDTH-8*2];
    end
    if (we[`WE_WIDTH-3]) begin
      ram[addr][`WIDTH-8*2-1:`WIDTH-8*3]<=
              din[`WIDTH-8*2-1:`WIDTH-8*3];
    end
    if (we[`WE_WIDTH-4]) begin
      ram[addr][`WIDTH-8*3-1:`WIDTH-8*4]<=
              din[`WIDTH-8*3-1:`WIDTH-8*4];
    end  
  end else begin
    dout <= ram[addr];
  end
end
endmodule
