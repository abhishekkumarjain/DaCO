`include "config.vh"

module overlay(
    input wire clk,
    input wire clk_2x,

    // AXI-Stream slave port
    input wire s_axis_aclk,
    input wire s_axis_aresetn,
    output wire s_axis_tready,
    input wire `AXIPacketIn s_axis_tdata,
    input wire s_axis_tlast,
    input wire s_axis_tvalid,

    // AXI-Stream master port
    input wire m_axis_aclk,
    input wire m_axis_aresetn,
    output wire m_axis_tvalid,
    output wire `AxiPacketOut m_axis_tdata,
    output wire m_axis_tlast,
    input wire m_axis_tready
);
