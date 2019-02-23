`ifndef _PE_VH_
`define _PE_VH_

`define X_W 4           // X-address width
`define Y_W 4           // Y-address width
`define C_W 4           // Cluster ID width
`define P_W 32          // Payload width

`define Packet_W (1+(`X_W)+(`Y_W)+(`C_W)+(`P_W))
`define Header_W (1+(`X_W)+(`Y_W)+(`C_W))

`define Payload [(`P_W)-1:0]
`define Packet [(`Packet_W)-1:0]
`define Header [(`Header_W)-1:0]

`define v [(`Packet_W)-1]
`define x [(`Packet_W)-1-1:(`Packet_W)-1-(`X_W)]
`define y [(`Packet_W)-1-(`X_W)-1:(`Packet_W)-1-(`X_W)-(`Y_W)]
`define c [(`Packet_W)-1-(`X_W)-(`Y_W)-1:(`Packet_W)-1-(`X_W)-(`Y_W)-(`C_W)]
`define p [(`P_W)-1:0]

`endif // _PE_VH_
