module edge_memory #(
    parameter ADDR_W = 10,
    parameter DATA_W = 36
) (
    input wire clk,
    input wire [ADDR_W-1:0] rdaddr,
    input wire [ADDR_W-1:0] wraddr,
    input wire wren,
    input wire [DATA_W-1:0] wrdata,
    output wire [DATA_W-1:0] q
);
    
    blk_mem_gen_0 #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W)
    ) MEM_EDGES (
        .clka(clk),
        .ena(1'b1),
        .wea(wren),
        .addra(wraddr),
        .dina(wrdata),
        .clkb(clk), // wtf?
        .enb(1'b1),
        .addrb(rdaddr),
        .doutb(q)
    );

endmodule

