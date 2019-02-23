/***************************************************************************************
* Credit: Charles Eric LaForest (GateForge Consulting, fpgacpu.ca)
* Link:
    * https://github.com/laforest/Octavo/blob/master/Parts/Arbiters/Thermometer_Mask.v
****************************************************************************************/

module thermometer_masker #(
    parameter WORD_WIDTH = 1
) (
    input wire [WORD_WIDTH-1:0] bitvector,
    output reg [WORD_WIDTH-1:0] mask
);

    initial begin
        mask = 0;
    end

    localparam zero = {WORD_WIDTH{1'b0}};

    always @ * begin
        // outputs 1 at the first set bit and all less significant (leftmost)
        // bits. outputs 0 for all more significant (rightmost) bits. Outputs
        // all 1s if no bit set.
        
        mask = bitvector ^ (bitvector - 1);

        // invert mask to instead mask-off the set bit and the less
        // significant bits. Don't invert mask if no bit set (don't want an
        // all-zero mask)

        mask = (bitvector == zero) ? mask : ~mask;

        // re-add set bit, so it and the more significant (rightmost) bits
        // pass.

        mask = mask | bitvector;
    end

endmodule
