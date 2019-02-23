// Testbench PE -- inject various test traffic patterns into the NoC

`include "pe.vh"

module pe #(
	parameter RATE		= 5,				// attempt rate, between 1-100
    parameter LIMIT     = 1024,             // number of packets to attempt
	parameter D_W		= 32,				// data width
	parameter X_W		= 2,				// x-addr bitwidth
	parameter Y_W		= 2,				// y-addr bitwidth
	parameter X_MAX		= 1,				// number of PEs in X-direction
	parameter Y_MAX		= 1,				// number of PEs in Y-direction
	parameter C_MAX     = 1,				// number of PEs in each cluster 
	parameter X		    = 0,				// X address of this PE in overlay
	parameter Y		    = 0,				// Y address of this PE in overlay
	parameter C		    = 0				    // ID of this PE in cluster
) (
	input wire [63:0] cycle,			    // current cycle
	input wire clk,						    // clock
	input wire rst,						    // reset
	input wire pein_vld,			        // packet from router valid
	input wire `Payload pein_payload,	    // payload from router (stripped of header)
	input wire ack,				            // ack from router
	output reg `Packet peout_packet, 	    // packet out from PE 
	output reg done						    // done flag
);

    integer r;
    reg `Packet next;
	reg next_v;
	reg `Payload send_ctr, attempt_ctr;

	always @ (posedge clk or posedge rst) // only trigger this if new flit arrives
	begin : RECEIVE_LOGIC
		if (!rst) begin
			if (pein_vld)
			begin
				$display("[R]%0d,%0d,%0d,%0d,%0d",cycle,X,Y,C,pein_payload`p);
			end
		end
	end

    always @ (posedge clk or posedge rst)
    begin : ATTEMPT_LOGIC
        if (rst) begin
            attempt_ctr <= 'b0;
        end else begin
            r <= $random;
            next_v <= 1'b0;
            if ({r} % 100 <= RATE && attempt_ctr < LIMIT)
            begin
                attempt_ctr <= attempt_ctr + 'd1;
                next_v <= 1'b1;
            	$display("[A]%0d,%0d,%0d,%0d,%0d",cycle,X,Y,C,attempt_ctr);
            end
        end
    end

    always @ (posedge clk or posedge rst)
    begin : PACKET_CREATOR
        if (rst)
        begin
            next <= 'b0;
        end else begin
            next`x <= $random % X_MAX;
            next`y <= $random % Y_MAX;
            next`c <= $random % C_MAX;
            next[31:16] <= X*Y*C;
            next[15:0] <= send_ctr[15:0];
        end
    end

    always @ (posedge clk or posedge rst)
    begin : SEND_LOGIC
    	if (rst)
    	begin
    		peout_packet <= 'b0;
    		done <= 1'b0;
            send_ctr <= 'b0;
    	end else begin
			if (ack) begin
				$display("[S]%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d",cycle,X,Y,C,peout_packet`x,peout_packet`y,peout_packet`c,peout_packet`p);
				send_ctr <= send_ctr + 'd1;
				peout_packet <= 'b0;
			end

			if ((ack || !peout_packet`v) && (send_ctr < LIMIT))
			begin
				if (next_v || (send_ctr < attempt_ctr)) begin
					peout_packet <= next;
                    peout_packet`v <= 1'b1;
				end
			end else begin
				if (!(send_ctr < attempt_ctr)) begin
					peout_packet <= 'b0;
				end
			end

			if ((send_ctr == LIMIT) && (send_ctr == attempt_ctr))
			begin
				done <= 1;
			end
    	end
    end
endmodule
