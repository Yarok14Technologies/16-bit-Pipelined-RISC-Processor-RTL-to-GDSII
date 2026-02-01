module hazard_unit (
    input  logic       id_ex_memread,
    input  logic [2:0] id_ex_rd,
    input  logic [2:0] if_id_rs1,
    input  logic [2:0] if_id_rs2,
    output logic       stall
);
    assign stall = id_ex_memread &&
                  ((id_ex_rd == if_id_rs1) ||
                   (id_ex_rd == if_id_rs2)) &&
                   (id_ex_rd != 0);
endmodule
