module pipeline_reg_cg #(
    parameter WIDTH = 16
)(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             enable,
    input  logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);
    logic gclk;

    clock_gating_cell CG (
        .clk(clk),
        .enable(enable),
        .scan_enable(1'b0),
        .gclk(gclk)
    );

    always_ff @(posedge gclk or negedge rst_n) begin
        if (!rst_n)
            q <= '0;
        else
            q <= d;
    end
endmodule
