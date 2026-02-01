module wb_stage (
    input  logic        memtoreg,
    input  logic [15:0] alu_out,
    input  logic [15:0] mem_data,
    output logic [15:0] wb_data
);
    assign wb_data = memtoreg ? mem_data : alu_out;
endmodule
