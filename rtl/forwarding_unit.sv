module forwarding_unit (
    input  logic       ex_mem_regwrite,
    input  logic       mem_wb_regwrite,
    input  logic [2:0] ex_mem_rd,
    input  logic [2:0] mem_wb_rd,
    input  logic [2:0] id_ex_rs1,
    input  logic [2:0] id_ex_rs2,
    output logic [1:0] forward_a,
    output logic [1:0] forward_b
);
    always_comb begin
        forward_a = 2'b00;
        forward_b = 2'b00;

        if (ex_mem_regwrite && ex_mem_rd && ex_mem_rd == id_ex_rs1)
            forward_a = 2'b10;
        else if (mem_wb_regwrite && mem_wb_rd && mem_wb_rd == id_ex_rs1)
            forward_a = 2'b01;

        if (ex_mem_regwrite && ex_mem_rd && ex_mem_rd == id_ex_rs2)
            forward_b = 2'b10;
        else if (mem_wb_regwrite && mem_wb_rd && mem_wb_rd == id_ex_rs2)
            forward_b = 2'b01;
    end
endmodule
