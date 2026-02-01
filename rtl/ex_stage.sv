module ex_stage (
    input  logic [15:0] a, b, ex_mem_alu, mem_wb_data,
    input  logic [1:0]  fa, fb,
    input  logic        alusrc,
    input  logic [15:0] imm,
    input  logic [3:0]  alu_ctrl,
    output logic [15:0] alu_out,
    output logic        zero
);
    logic [15:0] op_a, op_b;

    always_comb begin
        op_a = (fa == 2'b10) ? ex_mem_alu :
               (fa == 2'b01) ? mem_wb_data : a;

        op_b = (fb == 2'b10) ? ex_mem_alu :
               (fb == 2'b01) ? mem_wb_data : b;
    end

    alu ALU (.a(op_a), .b(alusrc ? imm : op_b),
             .alu_ctrl(alu_ctrl), .result(alu_out), .zero(zero));
endmodule
