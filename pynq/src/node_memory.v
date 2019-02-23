// NOTE: This module is multi-pumped with 2x clock.
module node_memory #(
    parameter ADDR_W = 10,
    parameter DATA_W = 36
) (
    input wire clk,
    input wire clk_2x,
    input wire [ADDR_W-1:0] rdaddr_a,
    input wire [ADDR_W-1:0] rdaddr_b,
    input wire [ADDR_W-1:0] wraddr_a,
    input wire [ADDR_W-1:0] wraddr_b,
    input wire wren_a,
    input wire wren_b,
    input wire [DATA_W-1:0] wrdata_a,
    input wire [DATA_W-1:0] wrdata_b,
    output reg [DATA_W-1:0] q_a,
    output reg [DATA_W-1:0] q_b
);

    reg state = 1'b0;
    reg [ADDR_W-1:0] rdaddr_save = 0;
    reg [ADDR_W-1:0] wraddr_save = 0;
    reg wren_save = 0;
    reg [DATA_W-1:0] q_save = 0;
    reg [DATA_W-1:0] wrdata_save = 0;

    wire [DATA_W-1:0] q_c;

    always @ (posedge clk_2x)
    begin
        state <= ~state;

        if (state)
        begin
            rdaddr_save <= rdaddr_b;
            wraddr_save <= wraddr_b;
            wrdata_save <= wrdata_b;
            wren_save <= wren_b;
            q_save <= q_c;
        end else begin
            rdaddr_save <= rdaddr_a;
            wraddr_save <= wraddr_a;
            wrdata_save <= wrdata_a;
            wren_save <= wren_a;
        end
    end

    always @ (posedge clk)
    begin
        q_a <= q_save;
        q_b <= q_c;
    end

    blk_mem_gen_0 #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W)
    ) MEM_MP (
        .clka(clk_2x),
        .ena(1'b1),
        .wea(wren_save),
        .addra(wraddr_save),
        .dina(wrdata_save),
        .clkb(clk_2x), // wtf?
        .enb(1'b1),
        .addrb(rdaddr_save),
        .doutb(q_c)
    );

endmodule

