# run_dft_flow.tcl -- DFT/ATPG wrapper (tool-agnostic template)
# Integrate this into your build: call after synthesis (netlist produced) and before signoff.
#
# Usage (example):
#   run_dft_flow tcl -netlist netlist/risc16_top_synth.v -outdir reports/dft

proc run_dft_flow {netlist outdir {tool "tessent"}} {
    if {![file exists $netlist]} {
        puts stderr "Netlist $netlist not found"
        return -1
    }
    file mkdir -p $outdir

    # 1) Read netlist (tool-specific)
    puts "Reading netlist: $netlist"
    # Example (Tessent pseudo):
    # pragma: tessent read_design $netlist

    # 2) Insert/verify scan (if needed)
    puts "Inserting/Verifying scan (tool-specific)"
    # Tessent: set_dft_scan_style multiplexed_flip_flop; insert_scan
    # TetraMAX: set_scan_style; insert_scan

    # 3) Generate ATPG patterns (stuck-at then transition)
    puts "Running ATPG (stuck-at)"
    # tessent atpg -type stuck_at -outdir $outdir
    puts "Running ATPG (transition / at-speed)"
    # tessent atpg -type transition -outdir $outdir

    # 4) Pattern compaction / compression
    puts "Compacting patterns & enabling compression (if available)"
    # tessent compress -enable -outdir $outdir

    # 5) Export vectors for ATE and generate coverage reports
    puts "Exporting vector sets and coverage reports"
    # tessent export_vectors -format <ATE format> -out $outdir
    # tessent report -coverage > $outdir/coverage.rpt

    # 6) Save chain mapping and scan chain report (useful for post-silicon debug)
    puts "Writing chain mapping and scan reports to $outdir"
    # tessent write_chain_map -out $outdir/chain_map.txt

    return 0
}

# Example CLI wrapper
if {![info exists ::argv0]} {
    # Called interactively / sourced from other Tcl: do nothing
} else {
    # Minimal run example when invoked as a Tcl script with args
    if {$::argc >= 2} {
        set netlist [lindex $::argv 0]
        set outdir  [lindex $::argv 1]
        run_dft_flow $netlist $outdir
    } else {
        puts "Usage: tclsh run_dft_flow.tcl <netlist> <outdir>"
    }
}