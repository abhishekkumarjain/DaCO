/***************************************************************************************
* Credit: Charles Eric LaForest (GateForge Consulting, fpgacpu.ca)
* Link:
    * https://github.com/laforest/Octavo/blob/master/Parts/Arbiters/Priority_Arbiter.v
****************************************************************************************/

module rr_arbiter #(
    parameter WORD_WIDTH = 0
) (
    input wire clk,
    input wire [WORD_WIDTH-1:0] reqs,
    output wire [WORD_WIDTH-1:0] grants
);

    reg [WORD_WIDTH-1:0] grants1;
    initial begin
        grants = 0;
        grants1 = 0;
    end

    localparam zero = {WORD_WIDTH{1'b0}};

    // grant a request in priority order (LSB has highest priority)
    wire [WORD_WIDTH-1:0] grants_raw;

    p_arbiter #(
        .WORD_WIDTH(WORD_WIDTH)
    ) raw (
        .reqs(reqs),
        .grants(grants_raw)
    );

    // mask off all requests of higher priority than the request granted in
    // the previous cycle

    wire [WORD_WIDTH-1:0] mask;

    thermometer_masker #(
        .WORD_WIDTH(WORD_WIDTH)
    ) grant (
        .bitvector(grants1),
        .mask(mask)
    );

    reg [WORD_WIDTH-1:0] reqs_masked;

    always @ * begin
        reqs_masked = reqs & mask;
    end

    // grant a request in priority order, but from the masked requests
    // (equal or lower priority to the request granted last cycle)

    wire [WORD_WIDTH-1:0] grants_masked;

    p_arbiter #(
        .WORD_WIDTH(WORD_WIDTH)
    ) masked (
        .reqs(reqs_masked),
        .grants(grants_masked)
    );

    // if no granted requests remain after masking, then grant from the
    // unmasked requests, which starts over granting from the highest (LSB)
    // priority. This also resets the mask. And the process begins again.

    always @ (posedge clk) begin
        grants1 <= (grants_masked == zero) ? grants_raw : grants_masked;
    end

    assign grants = (grants_masked == zero) ? grants_raw : grants_masked;

endmodule
