// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

// AXILiteS
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of config_V
//        bit 1~0 - config_V[1:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of packet2controller_V
//        bit 27~0 - packet2controller_V[27:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of controller2host_ack
//        bit 0  - controller2host_ack[0] (Read)
//        others - reserved
// 0x24 : Control signal of controller2host_ack
//        bit 0  - controller2host_ack_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCONTROLLER_AXILITES_ADDR_CONFIG_V_DATA            0x10
#define XCONTROLLER_AXILITES_BITS_CONFIG_V_DATA            2
#define XCONTROLLER_AXILITES_ADDR_PACKET2CONTROLLER_V_DATA 0x18
#define XCONTROLLER_AXILITES_BITS_PACKET2CONTROLLER_V_DATA 28
#define XCONTROLLER_AXILITES_ADDR_CONTROLLER2HOST_ACK_DATA 0x20
#define XCONTROLLER_AXILITES_BITS_CONTROLLER2HOST_ACK_DATA 1
#define XCONTROLLER_AXILITES_ADDR_CONTROLLER2HOST_ACK_CTRL 0x24

