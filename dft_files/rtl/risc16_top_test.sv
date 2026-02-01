// Top-level test wrapper (template)
// - Exposes test pins and shows pattern for passing scan_enable into the core.
// - You should modify your existing risc16_top to accept a scan_enable input (or
//   update actual instantiations to connect to this wrapper).
module risc16_top_test (
    input  logic clk,
    input  logic rst_n,

    // DFT/test pins (can be multiplexed via JTAG in silicon)
    input  logic scan_enable,    // global scan enable (shift vs capture handled by ATPG/scan controller)
    input  logic scan_clk,       // scan shift clock
    input  logic capture_clk,    // capture/functional clock (optionally same as clk)
    input  logic scan_in,
    output logic scan_out,

    // MBIST / BIST controls (optional)
    input  logic mbist_start,
    output logic mbist_done,
    output logic mbist_fail

    // Add JTAG pins if you implement TAP here
    // input logic jtag_tck, jtag_tms, jtag_tdi, output logic jtag_tdo
);

    // Instantiate the original core (assumes you will add scan_enable port to risc16_top)
    // If you prefer not to change the original file immediately, create a small glue module
    // that maps scan_enable to internal instantiations.
    logic core_scan_en = scan_enable;

    // Example instantiation -- adapt port names to your real risc16_top
    risc16_top core_inst (
        .clk(clk),
        .rst_n(rst_n)
        // Add .scan_enable(core_scan_en) if you update risc16_top
        // connect other ports as normal
    );

    // NOTE: scan_in/scan_out wiring and chain stitching are normally done by DFT insertion
    // tools (they will insert scan cells and wire chains in the netlist). Keep these pins
    // here for simulation and for a TAP/handshaking interface if you want to simulate scan.
endmodule