`define WIDTH 32
`define DEPTH 1024
`define ADDR_WIDTH 10
`define WEA_WIDTH 4
module simple_dual(input                        clka ,
                   input                        ena  ,
                   input      [`WEA_WIDTH-1:0]  wea  ,
                   input      [`ADDR_WIDTH-1:0] addra,
                   input      [`WIDTH-1:0]      dina ,
                   input                        clkb ,
                   input                        enb  ,              
                   input      [`ADDR_WIDTH-1:0] addrb,
                   output reg [`WIDTH-1:0]      doutb);
reg [`WIDTH-1:0] ram[0:`DEPTH-1]; 

always @(posedge clka) begin
  if (ena) begin
    if(wea[`WEA_WIDTH-1]) begin
      ram[addra][`WIDTH-1:`WIDTH-8*1]<=
              dina[`WIDTH-1:`WIDTH-8*1];
    end
    if (wea[`WEA_WIDTH-2]) begin
      ram[addra][`WIDTH-8*1-1:`WIDTH-8*2]<=
              dina[`WIDTH-8*1-1:`WIDTH-8*2];
    end
    if (wea[`WEA_WIDTH-3]) begin
      ram[addra][`WIDTH-8*2-1:`WIDTH-8*3]<=
              dina[`WIDTH-8*2-1:`WIDTH-8*3];
    end
    if (wea[`WEA_WIDTH-4]) begin
      ram[addra][`WIDTH-8*3-1:`WIDTH-8*4]<=
              dina[`WIDTH-8*3-1:`WIDTH-8*4];
    end
  end
end

always @(posedge clkb) begin
  if (enb) begin
      doutb <= ram[addrb];
  end
end
endmodule
