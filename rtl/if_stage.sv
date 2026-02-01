module if_stage (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        pc_en,
    input  logic [15:0] next_pc,
    output logic [15:0] pc,
    output logic [15:0] instr
);
    logic [15:0] imem [0:255];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pc <= 16'h0;
        else if (pc_en)
            pc <= next_pc;
    end

    assign instr = imem[pc[9:2]];
endmodule
