`include "config.vh"

module pe (
    input wire clk,
    input wire clk_2x,
    input wire `Config conf_mode,
    input wire packet_in_valid,
    input wire `SPacket packet_in,
    output reg `Packet packet_out,
    output reg pe_done
);

`ifdef EN_DEBUG
    initial begin
        $display("INFO:\tPacket_W = %0d,\n\tSPacket_W = %0d,\n\tNodeState_W = %0d,\n\tEdgeState_W = %0d,\n\tPacketHeader_W = %0d.", `PACKET_W,`SPACKET_W,`NODE_STATE_W,`EDGE_STATE_W,`PACKET_HEADER_W);
    end
`endif

    // create node memory
    wire `NodeAddr nmem_rdaddr_a, nmem_rdaddr_b; 
    wire `NodeAddr nmem_wraddr_a, nmem_wraddr_b; 
    wire nmem_wren_a, nmem_wren_b;
    wire `NodeState nmem_wrdata_a, nmem_wrdata_b;
    wire `NodeState nmem_out_a, nmem_out_b;

    assign nmem_rdaddr_a = packet_in`NA_SP; // read straight from network

    node_memory #(
        .ADDR_W(`NODE_W),
        .DATA_W(`NODE_STATE_W)
    ) NODE_MEM (
        .clk(clk),
        .clk_2x(clk_2x),
        .rdaddr_a(nmem_rdaddr_a),
        .rdaddr_b(nmem_rdaddr_b),
        .wraddr_a(nmem_wraddr_a),
        .wraddr_b(nmem_wraddr_b),
        .wren_a(nmem_wren_a),
        .wren_b(nmem_wren_b),
        .wrdata_a(nmem_wrdata_a),
        .wrdata_b(nmem_wrdata_b),
        .q_a(nmem_out_a),
        .q_b(nmem_out_b)
    );

    // create edge memory
    wire `EdgeAddr emem_rdaddr, emem_wraddr;
    wire emem_wren;
    wire `EdgeState emem_wrdata, emem_out;
    edge_memory #(
        .ADDR_W(`EDGE_W),
        .DATA_W(`EDGE_STATE_W)
    ) EDGE_MEM (
        .clk(clk),
        .rdaddr(emem_rdaddr),
        .wraddr(emem_wraddr),
        .wren(emem_wren),
        .wrdata(emem_wrdata),
        .q(emem_out)
    );

    // dummy logic for testing/verifying with interface
    assign nmem_rdaddr_b = (packet_in`NA_SP) + 1;
    always @ (posedge clk)
    begin
        // construct packet back
        if (nmem_rdaddr_a == 2)
        begin
            packet_out <= {1'b1,1'b0,32'hdeadbeef};
        end
    end


endmodule

