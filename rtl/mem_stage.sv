module mem_stage (
    input  logic        clk,
    input  logic        memread,
    input  logic        memwrite,
    input  logic [15:0] addr,
    input  logic [15:0] wd,
    output logic [15:0] rd
);
    logic [15:0] dmem [0:255];

    always_ff @(posedge clk) begin
        if (memwrite)
            dmem[addr[9:2]] <= wd;
    end

    assign rd = memread ? dmem[addr[9:2]] : 16'h0;
endmodule
