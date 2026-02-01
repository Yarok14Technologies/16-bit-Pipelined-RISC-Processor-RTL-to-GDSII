module pipeline_reg_cg #(
    parameter WIDTH = 16
)(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             enable,
    input  logic             scan_enable,    // NEW: pass-through scan enable
    input  logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);
    logic gclk;

    // Pass scan_enable to clock gating cell so test mode can force clocks on for scan shifting
    clock_gating_cell CG (
        .clk(clk),
        .enable(enable),
        .scan_enable(scan_enable),
        .gclk(gclk)
    );

    always_ff @(posedge gclk or negedge rst_n) begin
        if (!rst_n)
            q <= '0;
        else
            q <= d;
    end
endmodule