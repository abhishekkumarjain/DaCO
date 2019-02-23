// Place-holder BRAM-36K memory block for simulation purposes outside of
// Xilinx tools during development.

module blk_mem_gen_0 #(
    parameter ADDR_W = 10,
    parameter DATA_W = 36,
    parameter DEPTH = 1 << ADDR_W
) (
    input wire clka,                    // active clock
    input wire ena,                     // always 1?
    input wire wea,                     // wren
    input wire [ADDR_W-1:0] addra,      // wraddr
    input wire [DATA_W-1:0] dina,       // wr_data
    input wire clkb,                    // redundant
    input wire enb,                     // read-enable port, always 1
    input wire [ADDR_W-1:0] addrb,      // rdaddr
    output reg [DATA_W-1:0] doutb       // rd_data_out
);

    reg [DATA_W-1:0] mem [0:DEPTH-1];

    always @ (posedge clka)
    begin
        if (wea) begin
            mem[addra] <= dina;
        end

        doutb <= mem[addrb];
    end

endmodule

