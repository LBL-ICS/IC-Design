module req_gnt(input      clk,
               input      rst,
               input      en ,
               output     gnt,
               output     req);
master u_master (.clk(clk),
                 .rst(rst),
                 .en (en ),
                 .gnt(gnt),
                 .req(req));
slave u_slave (.clk(clk),
               .rst(rst),
               .req(req),
               .gnt(gnt));
endmodule

