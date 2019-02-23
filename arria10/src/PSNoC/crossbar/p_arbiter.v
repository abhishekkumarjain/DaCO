/***************************************************************************************
* Credit: Charles Eric LaForest (GateForge Consulting, fpgacpu.ca)
* Link:
    * https://github.com/laforest/Octavo/blob/master/Parts/Arbiters/Priority_Arbiter.v
****************************************************************************************/

module p_arbiter #(
    parameter WORD_WIDTH = 0
) (
    input wire [WORD_WIDTH-1:0] reqs,
    output reg [WORD_WIDTH-1:0] grants
);

    initial begin
        grants = 0;
    end

    always @ * begin
        grants = reqs & -reqs;
    end
endmodule
