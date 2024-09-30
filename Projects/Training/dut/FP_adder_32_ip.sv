
module FP_adder_32_ip(
  input         clock,
                reset,
                in_valid,
  input  [31:0] in_data_0,
                in_data_1,
  output [31:0] out_data,
  output        out_ready
);

floating_point_0 u_fp_adder(.s_axis_a_tdata      (in_data_0),
                            .s_axis_a_tvalid     (in_valid ),
                            .s_axis_b_tdata      (in_data_1),
                            .s_axis_b_tvalid     (in_valid ),
                            .m_axis_result_tdata (out_data ),
                            .m_axis_result_tvalid(out_ready),
                            .aclk                (clock    ));
endmodule

