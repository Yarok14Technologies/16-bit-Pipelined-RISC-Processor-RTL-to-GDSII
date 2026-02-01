module control_unit (
    input  logic [3:0] opcode,
    output logic       regwrite,
    output logic       memread,
    output logic       memwrite,
    output logic       memtoreg,
    output logic       alusrc,
    output logic       branch,
    output logic       jump,
    output logic [3:0] alu_ctrl
);
    always_comb begin
        regwrite = 0; memread = 0; memwrite = 0;
        memtoreg = 0; alusrc = 0; branch = 0; jump = 0;
        alu_ctrl = 4'b0000;

        case (opcode)
            4'h0: begin regwrite = 1; alu_ctrl = 4'b0000; end // ADD
            4'h1: begin regwrite = 1; alu_ctrl = 4'b0001; end // SUB
            4'h2: begin regwrite = 1; alu_ctrl = 4'b0010; end // AND
            4'h3: begin regwrite = 1; alu_ctrl = 4'b0011; end // OR
            4'h4: begin regwrite = 1; memread = 1; memtoreg = 1; end // LOAD
            4'h5: begin memwrite = 1; alusrc = 1; end // STORE
            4'h6: begin branch = 1; alu_ctrl = 4'b0001; end // BEQ
            4'h7: begin jump = 1; end // JUMP
        endcase
    end
endmodule
