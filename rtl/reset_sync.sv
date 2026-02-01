module reset_sync (
    input  logic clk,
    input  logic rst_n_async,
    output logic rst_n_sync
);
    logic ff1, ff2;

    always_ff @(posedge clk or negedge rst_n_async) begin
        if (!rst_n_async) begin
            ff1 <= 1'b0;
            ff2 <= 1'b0;
        end else begin
            ff1 <= 1'b1;
            ff2 <= ff1;
        end
    end

    assign rst_n_sync = ff2;
endmodule
