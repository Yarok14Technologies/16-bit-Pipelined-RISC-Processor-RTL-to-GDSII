module alu (
    input  logic [15:0] a, b,
    input  logic [3:0]  alu_ctrl,
    output logic [15:0] result,
    output logic        zero
);
    always_comb begin
        case (alu_ctrl)
            4'b0000: result = a + b;
            4'b0001: result = a - b;
            4'b0010: result = a & b;
            4'b0011: result = a | b;
            4'b0100: result = a ^ b;
            default: result = 16'h0;
        endcase
    end
    assign zero = (result == 16'h0);
endmodule
