#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("packet2host_V_TDATA", 32, hls_out, 2, "axis", "out_data", 1),
	Port_Property("packet2host_V_TVALID", 1, hls_out, 2, "axis", "out_vld", 1),
	Port_Property("packet2host_V_TREADY", 1, hls_in, 2, "axis", "out_acc", 1),
	Port_Property("daco2controller_V", 28, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("packet2daco_V", 28, hls_out, 5, "ap_vld", "out_data", 1),
	Port_Property("packet2daco_V_ap_vld", 1, hls_out, 5, "ap_vld", "out_vld", 1),
	Port_Property("config_out_V", 2, hls_out, 6, "ap_vld", "out_data", 1),
	Port_Property("config_out_V_ap_vld", 1, hls_out, 6, "ap_vld", "out_vld", 1),
	Port_Property("daco2controller_ack", 1, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("s_axi_AXILiteS_AWVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_AWREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_AWADDR", 6, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_WVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_WREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_WDATA", 32, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_WSTRB", 4, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_ARVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_ARREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_ARADDR", 6, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_RVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_RREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_RDATA", 32, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_RRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_BVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_BREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_AXILiteS_BRESP", 2, hls_out, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "controller";
