/***********************************************************************************
 * MIT License
 *
 * Copyright (c) [2018] [Siddhartha]
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
************************************************************************************/

`include "daco.vh"

module c_crossbar # (
	parameter CLUSTER_SIZE = 16,    // Cluster Size
	parameter D_W = `F_w,			// payload data width
	parameter X_W = 2,				// X address width
	parameter Y_W = 2,				// Y address width
	parameter X_MAX	= 1 << X_W,		// total clusters in X-dir
	parameter Y_MAX	= 1 << Y_W,		// total clusters in Y-dir
	parameter X	= 0,				// X address of this cluster node
	parameter Y	= 0					// Y address of this cluster node
) (
`ifdef EN_SIM
    input wire [63:0] cycle,
`endif
	input wire clk,
	input wire rst,
	input wire ce,
	input wire `Packet router_n_in,
	input wire `Packet router_w_in,
	input wire `ClusterPackets peout_packets,
	output reg `ClusterPackets pein_packets,
	output reg `Cluster pein_vlds,
	output wire `Cluster acks,
	output wire `Packet router_s_out,
	output wire `Packet router_e_out,
	output wire cluster_done 
);

    genvar i, j;

    // PS-router wires
	reg `Packet router_in;
	wire router_ack, router_ov, router_done;
	wire router_busy = router_in`v && !router_ack;

	// Wires for each packet from each PE in cluster
    wire `Packet peouts [CLUSTER_SIZE];
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign peouts[i] = peout_packets[(i+1)*(`Packet_W)-1:(i)*(`Packet_W)];
    end endgenerate

	// Determine where packet from PS-router wants to go
    wire [CLUSTER_SIZE-1:0] router_to_i;
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign router_to_i[i] = router_ov && (router_s_out`CLP == i);
    end endgenerate

	// Wires to determine if packet from PEs are local to the cluster
    wire [CLUSTER_SIZE-1:0] peouts_local;
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign peouts_local[i] = (peouts[i]`XP == X && peouts[i]`YP == Y);
    end endgenerate

	// Wires to determine where PEout packet from each PE in cluster wants to go
    // Note: j,i index lookup reversal, for simpler wiring
    wire [CLUSTER_SIZE-1:0] peouts_i_to_j [0:CLUSTER_SIZE-1];
    wire [CLUSTER_SIZE-1:0] peouts_to_router;
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        for (j = 0; j < CLUSTER_SIZE; j = j + 1) begin
            assign peouts_i_to_j[j][i] = peouts[i]`v && peouts_local[i] && (peouts[i]`CLP == j) && !router_to_i[j];
        end
    end endgenerate
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign peouts_to_router[i] = peouts[i]`v && !peouts_local[i];
    end endgenerate

    // Grant wires for each PE-to-PE (or router) requests
    wire [CLUSTER_SIZE-1:0] pein_i_to_j_gnts [0:CLUSTER_SIZE-1];
    wire [CLUSTER_SIZE-1:0] pein_i_to_router_gnts; 
    
    // Note: j,i index lookup reversal in the generate block above helps here
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        rr_arbiter #(
            .WORD_WIDTH(CLUSTER_SIZE)
        ) DIR_I (
            .clk(clk),
            .reqs(peouts_i_to_j[i]),
            .grants(pein_i_to_j_gnts[i])
        );
    end endgenerate
    
    rr_arbiter #(
        .WORD_WIDTH(CLUSTER_SIZE)
    ) DIR_ROUTER (
        .clk(clk),
        .reqs(peouts_to_router),
        .grants(pein_i_to_router_gnts),
    );

`include "ps_router_inst.v" // TODO: instance of PS-Router

    // For acks, we need to untangle the "grants" wires, so that we can do
    // a parametrized bitwise-OR reduction (Caveat: Not sure if synthesis
    // compiler can optimize this easily)
    wire [CLUSTER_SIZE-1:0] grants_untangler [0:CLUSTER_SIZE-1]
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        for (j = 0; j < CLUSTER_SIZE; j = j + 1) begin
            assign grants_untangler[j][i] = pein_i_to_j_gnts[i][j];
        end
    end endgenerate
    
    integer n, m;
	always @ (posedge clk or posedge rst)
    begin
		if (rst) begin
			pein_packets <= 'b0;
			router_in <= 'b0;
		end else begin
			if (ce) begin
				// Reset all inputs to PEs (PEs cannot backpressure)
				pein_packets <= 'b0;
				pein_vlds <= 'b0;

                // Clear buffered packet into router if ACK is received
				if (router_ack) begin
					router_in <= 'b0;
				end

                // Arbitrate PE-to-PE packets inside cluster
                for (n = 0; n < CLUSTER_SIZE; n = n + 1) begin
                    if (router_to_i[n]) begin
                        pein_packets[(n+1)*(`Packet_W)-1:n*(`Packet_W)] <= router_s_out;
                        pein_vlds[n] <= 1'b1;
                    end
                    for (m = 0; m < CLUSTER_SIZE; m = m + 1) begin
                        if (pein_i_to_j_gnts[n][m]) begin
                            pein_packets[(n+1)*(`Packet_W)-1:n*(`Packet_W)] <= peout_packets[(m+1)*(`Packet_W)-1:m*(`Packet_W)]
                            pein_vlds[n] <= 1'b1;
                        end
                    end
                end

				// Arbitrate packets going into PS-Router 
                for (n = 0; n < CLUSTER_SIZE; n = n + 1) begin
                    if (pein_i_to_router_gnts[i] && !router_busy) begin
                        router_in <= peout_packets[(n+1)*(`Packet_W)-1:n*(`Packet_W)]
                    end
                end
			end
        end
	end
    
    // Process combinational output signals
    
    // Now that we have untangled the "grants", we can do a bitwise-OR
    // reduction for each ack
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign acks[i] = (|grants_untangler[i]) || (pein_i_to_router_gnts[i] && !router_busy);
    end endgenerate

    // Evalute the cluster_done flag using reductions
    wire [CLUSTER_SIZE-1:0] peouts_vld;
    generate for (i = 0; i < CLUSTER_SIZE; i = i + 1) begin
        assign peouts_vld[i] = peouts[i]`v;
    end
    assign cluster_done = !(|peouts_vld) && router_done && !router_in`v;

endmodule
