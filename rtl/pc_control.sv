module pc_control (
    input  logic        branch,
    input  logic        jump,
    input  logic        zero,
    input  logic [15:0] pc_plus2,
    input  logic [15:0] branch_target,
    input  logic [15:0] jump_target,
    output logic [15:0] next_pc,
    output logic        flush
);
    always_comb begin
        flush = 0;
        if (jump) begin
            next_pc = jump_target;
            flush = 1;
        end else if (branch && zero) begin
            next_pc = branch_target;
            flush = 1;
        end else
            next_pc = pc_plus2;
    end
endmodule
