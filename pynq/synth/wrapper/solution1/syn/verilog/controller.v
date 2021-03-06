// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="controller,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.959000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=154,HLS_SYN_LUT=253}" *)

module controller (
        ap_clk,
        ap_rst_n,
        packet2host_V_TDATA,
        packet2host_V_TVALID,
        packet2host_V_TREADY,
        daco2controller_V,
        packet2daco_V,
        packet2daco_V_ap_vld,
        config_out_V,
        config_out_V_ap_vld,
        daco2controller_ack,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output  [31:0] packet2host_V_TDATA;
output   packet2host_V_TVALID;
input   packet2host_V_TREADY;
input  [27:0] daco2controller_V;
output  [27:0] packet2daco_V;
output   packet2daco_V_ap_vld;
output  [1:0] config_out_V;
output   config_out_V_ap_vld;
input   daco2controller_ack;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1:0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;

reg packet2daco_V_ap_vld;
reg config_out_V_ap_vld;

reg    ap_rst_n_inv;
wire   [1:0] config_V;
wire   [27:0] packet2controller_V;
reg   [31:0] packet2host_V_1_data_out;
reg    packet2host_V_1_vld_in;
wire    packet2host_V_1_vld_out;
wire    packet2host_V_1_ack_in;
wire    packet2host_V_1_ack_out;
reg   [31:0] packet2host_V_1_payload_A;
reg   [31:0] packet2host_V_1_payload_B;
reg    packet2host_V_1_sel_rd;
reg    packet2host_V_1_sel_wr;
wire    packet2host_V_1_sel;
wire    packet2host_V_1_load_A;
wire    packet2host_V_1_load_B;
reg   [1:0] packet2host_V_1_state;
wire    packet2host_V_1_state_cmp_full;
reg    controller2host_ack;
reg    controller2host_ack_ap_vld;
reg   [0:0] packet2daco_vld;
reg    packet2host_V_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] tmp_3_fu_150_p1;
wire    ap_CS_fsm_state2;
reg   [0:0] tmp_3_reg_168;
reg    ap_block_state1_io;
wire   [31:0] tmp_fu_154_p1;
wire   [0:0] tmp_1_fu_118_p2;
wire   [0:0] tmp_2_fu_124_p1;
wire   [0:0] or_cond_fu_138_p2;
reg    ap_reg_ioackin_config_out_V_dummy_ack;
reg    ap_reg_ioackin_controller2host_ack_dummy_ack;
reg    ap_reg_ioackin_packet2daco_V_dummy_ack;
reg    ap_block_state2_io;
wire   [0:0] or_cond_fu_138_p0;
wire   [0:0] p_not_fu_132_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_condition_182;
reg    ap_condition_180;
reg    ap_condition_159;

// power-on initialization
initial begin
#0 packet2host_V_1_sel_rd = 1'b0;
#0 packet2host_V_1_sel_wr = 1'b0;
#0 packet2host_V_1_state = 2'd0;
#0 packet2daco_vld = 1'd0;
#0 ap_CS_fsm = 2'd1;
#0 ap_reg_ioackin_config_out_V_dummy_ack = 1'b0;
#0 ap_reg_ioackin_controller2host_ack_dummy_ack = 1'b0;
#0 ap_reg_ioackin_packet2daco_V_dummy_ack = 1'b0;
end

controller_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
controller_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .config_V(config_V),
    .packet2controller_V(packet2controller_V),
    .controller2host_ack(controller2host_ack),
    .controller2host_ack_ap_vld(controller2host_ack_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_config_out_V_dummy_ack <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((1'b0 == ap_block_state1_io)) begin
                ap_reg_ioackin_config_out_V_dummy_ack <= 1'b0;
            end else if ((1'b1 == 1'b1)) begin
                ap_reg_ioackin_config_out_V_dummy_ack <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_controller2host_ack_dummy_ack <= 1'b0;
    end else begin
        if ((((1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io) & (((tmp_1_fu_118_p2 == 1'd1) & (or_cond_fu_138_p2 == 1'd0)) | ((tmp_1_fu_118_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd0)))) | ((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io)))) begin
            ap_reg_ioackin_controller2host_ack_dummy_ack <= 1'b0;
        end else if ((((1'b1 == ap_CS_fsm_state1) & (1'b1 == 1'b1) & (((tmp_1_fu_118_p2 == 1'd1) & (or_cond_fu_138_p2 == 1'd0)) | ((tmp_1_fu_118_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd0)))) | ((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (1'b1 == 1'b1)))) begin
            ap_reg_ioackin_controller2host_ack_dummy_ack <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_packet2daco_V_dummy_ack <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_182)) begin
            if ((1'b0 == ap_block_state1_io)) begin
                ap_reg_ioackin_packet2daco_V_dummy_ack <= 1'b0;
            end else if ((1'b1 == 1'b1)) begin
                ap_reg_ioackin_packet2daco_V_dummy_ack <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        packet2host_V_1_sel_rd <= 1'b0;
    end else begin
        if (((packet2host_V_1_ack_out == 1'b1) & (packet2host_V_1_vld_out == 1'b1))) begin
            packet2host_V_1_sel_rd <= ~packet2host_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        packet2host_V_1_sel_wr <= 1'b0;
    end else begin
        if (((packet2host_V_1_ack_in == 1'b1) & (packet2host_V_1_vld_in == 1'b1))) begin
            packet2host_V_1_sel_wr <= ~packet2host_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        packet2host_V_1_state <= 2'd0;
    end else begin
        if ((((packet2host_V_1_vld_in == 1'b0) & (packet2host_V_1_state == 2'd2)) | ((packet2host_V_1_vld_in == 1'b0) & (packet2host_V_1_state == 2'd3) & (packet2host_V_1_ack_out == 1'b1)))) begin
            packet2host_V_1_state <= 2'd2;
        end else if ((((packet2host_V_1_ack_out == 1'b0) & (packet2host_V_1_state == 2'd1)) | ((packet2host_V_1_ack_out == 1'b0) & (packet2host_V_1_state == 2'd3) & (packet2host_V_1_vld_in == 1'b1)))) begin
            packet2host_V_1_state <= 2'd1;
        end else if (((~((packet2host_V_1_vld_in == 1'b0) & (packet2host_V_1_ack_out == 1'b1)) & ~((packet2host_V_1_ack_out == 1'b0) & (packet2host_V_1_vld_in == 1'b1)) & (packet2host_V_1_state == 2'd3)) | ((packet2host_V_1_state == 2'd1) & (packet2host_V_1_ack_out == 1'b1)) | ((packet2host_V_1_state == 2'd2) & (packet2host_V_1_vld_in == 1'b1)))) begin
            packet2host_V_1_state <= 2'd3;
        end else begin
            packet2host_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io))) begin
        packet2daco_vld <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((packet2host_V_1_load_A == 1'b1)) begin
        packet2host_V_1_payload_A <= tmp_fu_154_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((packet2host_V_1_load_B == 1'b1)) begin
        packet2host_V_1_payload_B <= tmp_fu_154_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io))) begin
        tmp_3_reg_168 <= tmp_3_fu_150_p1;
    end
end

always @ (*) begin
    if (((ap_reg_ioackin_config_out_V_dummy_ack == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        config_out_V_ap_vld = 1'b1;
    end else begin
        config_out_V_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((1'b1 == ap_condition_159)) begin
            controller2host_ack = 1'd1;
        end else if ((1'b1 == ap_condition_180)) begin
            controller2host_ack = 1'd0;
        end else begin
            controller2host_ack = 'bx;
        end
    end else begin
        controller2host_ack = 'bx;
    end
end

always @ (*) begin
    if ((((ap_reg_ioackin_controller2host_ack_dummy_ack == 1'b0) & (1'b1 == ap_CS_fsm_state1) & (((tmp_1_fu_118_p2 == 1'd1) & (or_cond_fu_138_p2 == 1'd0)) | ((tmp_1_fu_118_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd0)))) | ((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (ap_reg_ioackin_controller2host_ack_dummy_ack == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        controller2host_ack_ap_vld = 1'b1;
    end else begin
        controller2host_ack_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (ap_reg_ioackin_packet2daco_V_dummy_ack == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        packet2daco_V_ap_vld = 1'b1;
    end else begin
        packet2daco_V_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((packet2host_V_1_sel == 1'b1)) begin
        packet2host_V_1_data_out = packet2host_V_1_payload_B;
    end else begin
        packet2host_V_1_data_out = packet2host_V_1_payload_A;
    end
end

always @ (*) begin
    if (((tmp_3_fu_150_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io))) begin
        packet2host_V_1_vld_in = 1'b1;
    end else begin
        packet2host_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_3_fu_150_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((tmp_3_reg_168 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        packet2host_V_TDATA_blk_n = packet2host_V_1_state[1'd1];
    end else begin
        packet2host_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_io))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | (packet2host_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1_io = ((tmp_3_fu_150_p1 == 1'd1) & (packet2host_V_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_block_state2_io = ((tmp_3_reg_168 == 1'd1) & (packet2host_V_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_condition_159 = ((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_180 = (((tmp_1_fu_118_p2 == 1'd1) & (or_cond_fu_138_p2 == 1'd0)) | ((tmp_1_fu_118_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd0)));
end

always @ (*) begin
    ap_condition_182 = ((or_cond_fu_138_p2 == 1'd1) & (tmp_2_fu_124_p1 == 1'd1) & (tmp_1_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign config_out_V = config_V;

assign or_cond_fu_138_p0 = daco2controller_ack;

assign or_cond_fu_138_p2 = (p_not_fu_132_p2 | or_cond_fu_138_p0);

assign p_not_fu_132_p2 = (packet2daco_vld ^ 1'd1);

assign packet2daco_V = packet2controller_V;

assign packet2host_V_1_ack_in = packet2host_V_1_state[1'd1];

assign packet2host_V_1_ack_out = packet2host_V_TREADY;

assign packet2host_V_1_load_A = (packet2host_V_1_state_cmp_full & ~packet2host_V_1_sel_wr);

assign packet2host_V_1_load_B = (packet2host_V_1_state_cmp_full & packet2host_V_1_sel_wr);

assign packet2host_V_1_sel = packet2host_V_1_sel_rd;

assign packet2host_V_1_state_cmp_full = ((packet2host_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign packet2host_V_1_vld_out = packet2host_V_1_state[1'd0];

assign packet2host_V_TDATA = packet2host_V_1_data_out;

assign packet2host_V_TVALID = packet2host_V_1_state[1'd0];

assign tmp_1_fu_118_p2 = ((config_V == 2'd1) ? 1'b1 : 1'b0);

assign tmp_2_fu_124_p1 = packet2controller_V[0:0];

assign tmp_3_fu_150_p1 = daco2controller_V[0:0];

assign tmp_fu_154_p1 = daco2controller_V;

endmodule //controller
