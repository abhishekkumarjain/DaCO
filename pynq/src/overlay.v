`include "config.vh"

module overlay(
    input wire clk,
    input wire rst,
    // input wire clk_2x,

    // inputs from controller
    input wire `Packet controller2daco,
    output wire `Packet daco2controller,
    output wire ack2controller
);

    localparam X_MAX = 4;
    localparam Y_MAX = 4;

    genvar x, y;
    generate
        for (x = 0; x < X_MAX; x = x + 1) : xs
            for (y = 0; y < Y_MAX; y = y + 1) : ys
                if (x != 0 || y != 0)
                begin


                end else begin


                end
            end
        end
    endgenerate

endmodule

