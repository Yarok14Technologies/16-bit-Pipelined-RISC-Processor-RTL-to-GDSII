module clock_gating_cell (
    input  logic clk,
    input  logic enable,
    input  logic scan_enable,
    output logic gclk
);
    logic en_latch;

    always_latch begin
        if (!clk)
            en_latch <= enable | scan_enable;
    end

    assign gclk = clk & en_latch;
endmodule
