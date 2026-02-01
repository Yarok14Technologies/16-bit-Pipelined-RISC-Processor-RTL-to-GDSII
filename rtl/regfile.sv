module regfile (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        we,
    input  logic [2:0]  rs1, rs2, rd,
    input  logic [15:0] wd,
    output logic [15:0] rd1, rd2
);
    logic [15:0] regs [7:0];

    assign rd1 = (rs1 == 0) ? 16'h0 : regs[rs1];
    assign rd2 = (rs2 == 0) ? 16'h0 : regs[rs2];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            regs <= '{default:'0};
        else if (we && rd != 0)
            regs[rd] <= wd;
    end
endmodule
