module risc16_top (
    input logic clk,
    input logic rst_n
);
    logic rst_n_sync;

    reset_sync RS (.clk(clk), .rst_n_async(rst_n), .rst_n_sync(rst_n_sync));

    /* === Datapath + control wiring omitted for brevity ===
       Integrate modules exactly as discussed:
       - IF/ID, ID/EX, EX/MEM, MEM/WB using pipeline_reg_cg
       - hazard_unit controls pc_en & IF/ID enable
       - forwarding_unit feeds ex_stage
       - pc_control drives next_pc & flush
    */
endmodule
