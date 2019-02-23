`include "daco.vh"
`include "pe.vh"
`include "router.vh"

module driver #(
	parameter RATE			= `Rate,            // 1-100 rate of injection
    parameter LIMIT         = `Limit,           // Number of packets sent/attempted by each PE
	parameter D_W			= `F_w,	            // Payload width
	parameter X_W			= `X_W,	            // X address width
	parameter Y_W			= `Y_W,	            // Y address width
	parameter C_W			= `C_W,	            // PE's cluster ID address width
	parameter X_MAX			= `Size_X,          // Size of overlay in X-direction
	parameter Y_MAX			= `Size_Y,          // Size of overlay in Y-direction
    parameter CLUSTER_SIZE  = `Cluster_Size     // Cluster Size
) (
	input wire clk,			// clock
	input wire rst,			// reset
	input wire ce,			// clock enable
	output wire done		// done flag wire
);

	// These parameters are kept fixed for all experiments in this study...
	parameter ROUTE = "DOR";        // routing policy; default: dimension ordered
	parameter LOWPOWER = 1;	        // optimize for low power
	parameter XBAR	= 1;	        // crossbar?

	wire `Msg i `XY;		// eastbound channels
	wire `Msg e `XY;		// eastbound channels
	wire `Msg o `XY;		// southbound/output channels
	wire `XY done_h;		// done array inside hoplite
	wire `XY i_ack;			// input messages accepted this cycle
	wire `XY o_v;			// output messages valid
	wire `XY done_c;

	reg [63:0] cycles;

	genvar x, y, c;
	generate for (y = 0; y < Y_MAX; y = y + 1) begin : ys
		for (x = 0; x < X_MAX; x = x + 1) begin : xs
            for (c = 0; c < CLUSTER_SIZE; c = c + 1) begin : cs

                pe # (
                    .RATE(RATE),
                    .LIMIT(LIMIT),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y),
                    .C(c),
                ) PE (
                    .cycle(cycles)
                    .clk(clk),
                    .rst(rst),
                    .pein_vld(o_v[`xy]),
                    .pein_payload(o[`xy]`Fm),
                    .ack(i_ack[`xy]),
                    .peout_packet(i[`xy]),
                    .done(done_c[`xy]),
                );
            end

            ps_router #(
                .ROUTE(ROUTE),
                .LOWPOWER(LOWPOWER),
                .XBAR(XBAR),
                .D_W(D_W),
                .X_W(X_W),
                .Y_W(Y_W),
                .X_MAX(X_MAX),
                .Y_MAX(Y_MAX),
                .X(x),
                .Y(y)
            ) ROUTER (
                .clk(clk),
                .rst(rst),
                .ce(ce),
                .n_in(o[`xy1]),
                .w_in(e[`xy2]),
                .i(i[`xy]),
                .i_ack(i_ack[`xy]),
                .o_v(o_v[`xy]),
                .s_out(o[`xy]),
                .e_out(e[`xy]),
                .done(done_h[`xy]),
                .cycle(cycles)
            );

		end
	end endgenerate

	assign done = &done_h && &done_c;

	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			cycles <= 'b0;
		end
		else begin
			cycles <= cycles + 'd1;
		end
	end

endmodule
    /* verilator lint_off LITENDIAN */
	wire `Packet i `XYC;		// Output packets from PE 
	wire `Packet e `XY;		    // Eastbound channels
	wire `Packet o `XY;		    // Southbound/output channels
	wire `Packet o_pe `XYC;	    // Crossbar to PE (cluster_size > 1), else PS-Router to PE
	wire `XYC done_pe;			// 'Done' flag array for PEs
	wire `XY done_c;		    // 'Done' flag array for cluster-crossbar 
	wire `XYC i_ack;		    // Ack to PEs
	wire `XYC o_v;			    // Output messages to PEs valid signal
	/* verilator lint_on LITENDIAN */

	reg [63:0] cycles; // large 64-bit register to keep track of number of cycles
	
	genvar x, y, c;
	generate for (y = 0; y < Y_MAX; y = y + 1) begin : ys
        for (x = 0; x < X_MAX; x = x + 1) begin : xs
            for (c = 0; c < CLUSTER_SIZE; c = c + 1) begin : cs

                pe # (
                    .RATE(RATE),
                    .LIMIT(LIMIT),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y),
                    .C(c),
                ) PE (
                    .cycle(cycles)
                    .clk(clk),
                    .rst(rst),
                    .pein_vld(o_v[`xyc]),
                    .pein_payload(o_pe[`xyc]`p),
                    .ack(i_ack[`xyc]),
                    .peout_packet(i[`xyc]),
                    .done(done_pe[`xyc]),
                );

            end

            if (CLUSTER_SIZE == 1) begin
                
                ps_router #(
                    .ROUTE(ROUTE),
                    .LOWPOWER(LOWPOWER),
                    .XBAR(XBAR),
                    .CRIT_THRESH(CRIT_THRESH),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y)
                ) PS_ROUTER (
                    .clk(clk),
                    .rst(rst),
                    .ce(ce),
                    .n_in(o_pe[`xy1]),
                    .w_in(e[`xy2]),
                    .i(i[`xy]),
                    .i_ack(i_ack[`xy]),
                    .o_v(o_v[`xy]),
                    .s_out(o_pe[`xy]),
                    .e_out(e[`xy]),
                    .done(done_c[`xy]),
                    .cycle(cycles)
                );

            end else if (CLUSTER_SIZE == 2) begin

                carbiter_c2 # (
                    .CLUSTER_SIZE(CLUSTER_SIZE),
                    .ROUTE(ROUTE),
                    .LOWPOWER(LOWPOWER),
                    .XBAR(XBAR),
                    .CRIT_THRESH(CRIT_THRESH),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y)
                ) cluster_arbiter_s2 (
                    .clk(clk),
                    .rst(rst),
                    .ce(ce),
                    .hop_n_in(o[`xy1]),
                    .hop_w_in(e[`xy2]),
                    .pe_out_msgs({i[`xyc1(1)],i[`xyc1(0)]}),
                    .pe_in_msgs({o_pe[`xyc1(1)],o_pe[`xyc1(0)]}),
                    .pe_in_vlds({o_v[`xyc1(1)],o_v[`xyc1(0)]}),
                    .acks({i_ack[`xyc1(1)],i_ack[`xyc1(0)]}),
                    .hop_s_out(o[`xy]),
                    .hop_e_out(e[`xy]),
                    .done_all(done_c[`xy]),
                    .cycle(cycles)
                );

            end else if (CLUSTER_SIZE == 4) begin
                
                carbiter_c4 # (
                    .CLUSTER_SIZE(CLUSTER_SIZE),
                    .ROUTE(ROUTE),
                    .LOWPOWER(LOWPOWER),
                    .XBAR(XBAR),
                    .CRIT_THRESH(CRIT_THRESH),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y)
                ) cluster_arbiter_s4 (
                    .clk(clk),
                    .rst(rst),
                    .ce(ce),
                    .hop_n_in(o[`xy1]),
                    .hop_w_in(e[`xy2]),
                    .pe_out_msgs({i[`xyc1(3)],i[`xyc1(2)],i[`xyc1(1)],i[`xyc1(0)]}),
                    .pe_in_msgs({o_pe[`xyc1(3)],o_pe[`xyc1(2)],o_pe[`xyc1(1)],o_pe[`xyc1(0)]}),
                    .pe_in_vlds({o_v[`xyc1(3)],o_v[`xyc1(2)],o_v[`xyc1(1)],o_v[`xyc1(0)]}),
                    .acks({i_ack[`xyc1(3)],i_ack[`xyc1(2)],i_ack[`xyc1(1)],i_ack[`xyc1(0)]}),
                    .hop_s_out(o[`xy]),
                    .hop_e_out(e[`xy]),
                    .done_all(done_c[`xy]),
                    .cycle(cycles)
                );

            end else if (CLUSTER_SIZE == 8) begin
                
                carbiter_c8 # (
                    .CLUSTER_SIZE(CLUSTER_SIZE),
                    .ROUTE(ROUTE),
                    .LOWPOWER(LOWPOWER),
                    .XBAR(XBAR),
                    .CRIT_THRESH(CRIT_THRESH),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y)
                ) cluster_arbiter_s8 (
                    .clk(clk),
                    .rst(rst),
                    .ce(ce),
                    .hop_n_in(o[`xy1]),
                    .hop_w_in(e[`xy2]),
                    .pe_out_msgs({i[`xyc1(7)],i[`xyc1(6)],i[`xyc1(5)],i[`xyc1(4)],i[`xyc1(3)],i[`xyc1(2)],i[`xyc1(1)],i[`xyc1(0)]}),
                    .pe_in_msgs({o_pe[`xyc1(7)],o_pe[`xyc1(6)],o_pe[`xyc1(5)],o_pe[`xyc1(4)],o_pe[`xyc1(3)],o_pe[`xyc1(2)],o_pe[`xyc1(1)],o_pe[`xyc1(0)]}),
                    .pe_in_vlds({o_v[`xyc1(7)],o_v[`xyc1(6)],o_v[`xyc1(5)],o_v[`xyc1(4)],o_v[`xyc1(3)],o_v[`xyc1(2)],o_v[`xyc1(1)],o_v[`xyc1(0)]}),
                    .acks({i_ack[`xyc1(7)],i_ack[`xyc1(6)],i_ack[`xyc1(5)],i_ack[`xyc1(4)],i_ack[`xyc1(3)],i_ack[`xyc1(2)],i_ack[`xyc1(1)],i_ack[`xyc1(0)]}),
                    .hop_s_out(o[`xy]),
                    .hop_e_out(e[`xy]),
                    .done_all(done_c[`xy]),
                    .cycle(cycles)
                );

            end else if (CLUSTER_SIZE == 16) begin
                
                carbiter_c16 # (
                    .CLUSTER_SIZE(CLUSTER_SIZE),
                    .ROUTE(ROUTE),
                    .LOWPOWER(LOWPOWER),
                    .XBAR(XBAR),
                    .CRIT_THRESH(CRIT_THRESH),
                    .D_W(D_W),
                    .X_W(X_W),
                    .Y_W(Y_W),
                    .X_MAX(X_MAX),
                    .Y_MAX(Y_MAX),
                    .X(x),
                    .Y(y)
                ) cluster_arbiter_s16 (
                    .clk(clk),
                    .rst(rst),
                    .ce(ce),
                    .hop_n_in(o[`xy1]),
                    .hop_w_in(e[`xy2]),
                    .pe_out_msgs({i[`xyc1(15)],i[`xyc1(14)],i[`xyc1(13)],i[`xyc1(12)],i[`xyc1(11)],i[`xyc1(10)],i[`xyc1(9)],i[`xyc1(8)],i[`xyc1(7)],i[`xyc1(6)],i[`xyc1(5)],i[`xyc1(4)],i[`xyc1(3)],i[`xyc1(2)],i[`xyc1(1)],i[`xyc1(0)]}),
                    .pe_in_msgs({o_pe[`xyc1(15)],o_pe[`xyc1(14)],o_pe[`xyc1(13)],o_pe[`xyc1(12)],o_pe[`xyc1(11)],o_pe[`xyc1(10)],o_pe[`xyc1(9)],o_pe[`xyc1(8)],o_pe[`xyc1(7)],o_pe[`xyc1(6)],o_pe[`xyc1(5)],o_pe[`xyc1(4)],o_pe[`xyc1(3)],o_pe[`xyc1(2)],o_pe[`xyc1(1)],o_pe[`xyc1(0)]}),
                    .pe_in_vlds({o_v[`xyc1(15)],o_v[`xyc1(14)],o_v[`xyc1(13)],o_v[`xyc1(12)],o_v[`xyc1(11)],o_v[`xyc1(10)],o_v[`xyc1(9)],o_v[`xyc1(8)],o_v[`xyc1(7)],o_v[`xyc1(6)],o_v[`xyc1(5)],o_v[`xyc1(4)],o_v[`xyc1(3)],o_v[`xyc1(2)],o_v[`xyc1(1)],o_v[`xyc1(0)]}),
                    .acks({i_ack[`xyc1(15)],i_ack[`xyc1(14)],i_ack[`xyc1(13)],i_ack[`xyc1(12)],i_ack[`xyc1(11)],i_ack[`xyc1(10)],i_ack[`xyc1(9)],i_ack[`xyc1(8)],i_ack[`xyc1(7)],i_ack[`xyc1(6)],i_ack[`xyc1(5)],i_ack[`xyc1(4)],i_ack[`xyc1(3)],i_ack[`xyc1(2)],i_ack[`xyc1(1)],i_ack[`xyc1(0)]}),
                    .hop_s_out(o[`xy]),
                    .hop_e_out(e[`xy]),
                    .done_all(done_c[`xy]),
                    .cycle(cycles)
                );
            end
            else begin
                // $display("UNKNOWN CLUSTER SIZE = %0d",CLUSTER_SIZE);
                // $finish;
            end
                // ERROR_CLUSTER_SIZE_NOT_SUPPORTED();
        end
    end endgenerate

	assign out_v = o_pe[0]`v;
	assign out = o_pe[0];
	wire done_all_pe = &done; // verilog supports reductions??!
	wire done_all_c = &done_c; // verilog supports reductions??!
	assign done_all = done_all_pe & done_all_c;

	integer a, b;
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			cycles <= 'b0;
		end
		else begin
			if (!(done_all_pe & done_all_c))
			begin
				cycles <= cycles + 'd1;
			end
		end
	end
	
endmodule


/*
if (cycles % 1000 == 0) begin
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,0,0,0,ys[0].xs[0].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,0,1,0,ys[1].xs[0].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,0,2,0,ys[2].xs[0].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,0,3,0,ys[3].xs[0].PE.LOD_MODULE.outer_lod_in);

	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,1,0,0,ys[0].xs[1].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,1,1,0,ys[1].xs[1].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,1,2,0,ys[2].xs[1].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,1,3,0,ys[3].xs[1].PE.LOD_MODULE.outer_lod_in);

	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,2,0,0,ys[0].xs[2].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,2,1,0,ys[1].xs[2].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,2,2,0,ys[2].xs[2].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,2,3,0,ys[3].xs[2].PE.LOD_MODULE.outer_lod_in);

	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,3,0,0,ys[0].xs[3].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,3,1,0,ys[1].xs[3].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,3,2,0,ys[2].xs[3].PE.LOD_MODULE.outer_lod_in);
	$display("Cycle %0d: [%0d,%0d,%0d] Outer_LOD = %x",cycles,3,3,0,ys[3].xs[3].PE.LOD_MODULE.outer_lod_in);

	$display("Hoplite Done = %b",done_all_h);
end
*/
