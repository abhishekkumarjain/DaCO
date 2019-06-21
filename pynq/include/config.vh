`ifndef _CONFIG_VH_
`define _CONFIG_VH_

// macro-hyperparams
`define EN_DEBUG

`define DATA_W (16)                 // data-width of computation
`define ADDR_XW (3)                 // address bitwidth of overlay, x-dim
`define ADDR_YW (3)                 // address bitwidth of overlay, y-dim
`define CONFIG_W (2)                // bit-width for config modes
`define NODE_W (10)                 // addr bitwidth for nodes in PE
`define EDGE_W (11)                 // addr bitwidth for edges in PE 

// node state fields
`define TRIGGER_W (4)               // dataflow trigger bitwidth
`define OPCODE_W (3)                // node opcode bitwidth
`define ENUM_W (1)                  // edge-number bitwidth
`define NODE_STATE_FLAG_W (1)       // node state flag bitwidth

// edge state fields
`define EDGE_STATE_FLAG_W (1)       // edge state flag bitwidth

// computed bitwidths
`define NODE_STATE_W ((`DATA_W)+(`ENUM_W)+(`OPCODE_W)+(`TRIGGER_W)+(`NODE_STATE_FLAG_W))
`define EDGE_STATE_W ((`ADDR_XW)+(`ADDR_YW)+(`ENUM_W)+(`NODE_W)+(`EDGE_STATE_FLAG_W))
`define PACKET_HEADER_W ((`ADDR_XW)+(`ADDR_YW)+(`CONFIG_W)+(`ENUM_W)+(`NODE_W))
`define PACKET_W (1+(`PACKET_HEADER_W)+(`DATA_W))
`define SPACKET_W ((`CONFIG_W)+(`ENUM_W)+(`NODE_W)+(`DATA_W))

// config flag modes
`define CONFIG_OFF (2'b00)          // config mode off, execution phase
`define CONFIG_ON (2'b01)           // config mode active, all packets are config packets
`define CONFIG_RESET (2'b10)        // reset global configs in each PE
`define CONFIG_UNUSED (2'b11)       // currently not used

////////////////////////////////////////////////////////////////////////
///////////////////////// DO NOT CHANGE ////////////////////////////////

// typedef variables (verilog-style)
`define Config [(`CONFIG_W)-1:0]
`define SPacket [(`SPACKET_W)-1:0]
`define Packet [(`PACKET_W)-1:0]
`define PacketPayload [(`DATA_W)-1:0]

`define NodeAddr [(`NODE_W)-1:0]
`define NodeState [(`NODE_STATE_W)-1:0]
`define EdgeAddr [(`EDGE_W)-1:0]
`define EdgeState [(`EDGE_STATE_W)-1:0]

// splicers
`define NA_SP [(`NODE_W)+(`DATA_W)-1:(`DATA_W)] // NodeAddr from SPacket


////////////////////////////////////////////////////////////////////////

`endif // _CONFIG_VH_
