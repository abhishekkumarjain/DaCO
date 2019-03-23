#include "ap_int.h"

#define PACKET_W 28

typedef ap_uint<2> config_t;
typedef ap_uint<PACKET_W> packet_t;

void controller(
	config_t config,						// input from host
	packet_t packet2controller,				// input from host
	packet_t &packet2host,					// output to host
	bool &controller2host_ack,				// output to host (handshake)
	packet_t daco2controller,				// input from daco
	packet_t &packet2daco,					// output to daco
	config_t &config_out,					// output to daco
	bool daco2controller_ack				// input to controller (handshake)
) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=config
#pragma HLS INTERFACE s_axilite port=packet2controller
#pragma HLS INTERFACE axis port=packet2host
#pragma HLS INTERFACE s_axilite port=controller2host_ack

	config_out = config;

	static bool packet2daco_vld = false;

	// only "enable" controller if config is set to 1
	if (config == 1) {
		// check if packet coming in to controller is valid
		if (packet2controller( 0, 0 ) == 1 && (!packet2daco_vld || (packet2daco_vld && daco2controller_ack))) {
			packet2daco = packet2controller;
			controller2host_ack = true;
			packet2daco_vld = true;
		} else {
			controller2host_ack = false;
		}
	}

	// process packets being sent to host
	if (daco2controller( 0, 0 ) == 1) {
		packet2host = daco2controller;
	}

	return;
}
