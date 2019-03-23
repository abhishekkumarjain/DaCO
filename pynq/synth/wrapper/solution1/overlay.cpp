#include "ap_int.h"
#include "hls_stream.h"

#define BRAM_W 36
#define PACKET_W 28

typedef ap_uint<2> config_t;
typedef ap_uint<PACKET_W> packet_t;

using namespace hls;

void overlay(
	config_t cnfg,
	stream<packet_t> &packet_in,
	stream<packet_t> &packet_out
) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=cnfg
#pragma HLS INTERFACE axis port=packet_in
#pragma HLS INTERFACE axis port=packet_out


}
