module driver #(
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

    reg [ADDR_W-1:0] rdaddr_a1 = 0;
    reg [ADDR_W-1:0] rdaddr_b1 = 0;
    reg [ADDR_W-1:0] wraddr_a1 = 0;
    reg [ADDR_W-1:0] wraddr_b1 = 0;
    reg wren_a1 = 0;
    reg wren_b1 = 0;
    reg [DATA_W-1:0] wrdata_a1 = 0;
    reg [DATA_W-1:0] wrdata_b1 = 0;
    wire [DATA_W-1:0] q_a1, q_b1;


    node_memory #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W)
    ) DUT (
        .clk(clk),
        .clk_2x(clk_2x),
        .rdaddr_a(rdaddr_a1),
        .rdaddr_b(rdaddr_b1),
        .wraddr_a(wraddr_a1),
        .wraddr_b(wraddr_b1),
        .wren_a(wren_a1),
        .wren_b(wren_b1),
        .wrdata_a(wrdata_a1),
        .wrdata_b(wrdata_b1),
        .q_a(q_a1),
        .q_b(q_b1)
    );

    always @ (posedge clk)
    begin
        rdaddr_a1 <= rdaddr_a;
        rdaddr_b1 <= rdaddr_b;
        wraddr_a1 <= wraddr_a;
        wraddr_b1 <= wraddr_b;
        wren_a1 <= wren_a;
        wren_b1 <= wren_b;
        wrdata_a1 <= wrdata_a;
        wrdata_b1 <= wrdata_b;
        q_a <= q_a1;
        q_b <= q_b1;
    end

endmodule

module testbench();

    localparam ADDR_W = 10;
    localparam DATA_W = 36;

    reg clk, clk_2x;
    reg [ADDR_W-1:0] rdaddr_a, rdaddr_b, wraddr_a, wraddr_b;
    reg wren_a, wren_b;
    reg [DATA_W-1:0] wrdata_a, wrdata_b;
    wire [DATA_W-1:0] q_a, q_b;

    always #40 clk = ~clk;
    always #20 clk_2x = ~clk_2x;

    driver #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W)
    ) driver (
        .clk(clk),
        .clk_2x(clk_2x),
        .rdaddr_a(rdaddr_a),
        .rdaddr_b(rdaddr_b),
        .wraddr_a(wraddr_a),
        .wraddr_b(wraddr_b),
        .wren_a(wren_a),
        .wren_b(wren_b),
        .wrdata_a(wrdata_a),
        .wrdata_b(wrdata_b),
        .q_a(q_a),
        .q_b(q_b)
    );

    initial begin
        $dumpvars(0,testbench);

        clk = 1; clk_2x = 1;
        rdaddr_a = 0; rdaddr_b = 0;
        wraddr_a = 0; wraddr_b = 0;
        wren_a = 0; wren_b = 0;
        wrdata_a = 0; wrdata_b = 0;

        // initialize memory for testing
        testbench.driver.DUT.MEM_MP.mem[0] = 36'h0deadbeef;
        testbench.driver.DUT.MEM_MP.mem[1] = 36'h1deadbeef;
        testbench.driver.DUT.MEM_MP.mem[2] = 36'h2deadbeef;
        testbench.driver.DUT.MEM_MP.mem[3] = 36'h3deadbeef;
        testbench.driver.DUT.MEM_MP.mem[4] = 36'h4deadbeef;

        #40
        rdaddr_a = 1;
        rdaddr_b = 3;
        wren_a = 1;
        wren_b = 1;
        wraddr_a = 2;
        wrdata_a = 36'h5deadbeef;
        wraddr_b = 4;
        wrdata_b = 36'h6deadbeef;

        #80
        rdaddr_a = 2;
        rdaddr_b = 4;
        wren_a = 0;
        wren_b = 0;

        #400
        $display("q_a = 0x%x, q_b = 0x%x",q_a,q_b);

        #40
        $finish;
    end

endmodule

