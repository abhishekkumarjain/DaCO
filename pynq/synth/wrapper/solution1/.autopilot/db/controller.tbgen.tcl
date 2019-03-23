set C_TypeInfoList {{ 
"controller" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"config": [[],"0"] }, {"packet2controller": [[],"1"] }, {"packet2host": [[], {"reference": "1"}] }, {"controller2host_ack": [[], {"reference":  {"scalar": "bool"}}] }, {"daco2controller": [[],"1"] }, {"packet2daco": [[], {"reference": "1"}] }, {"config_out": [[], {"reference": "0"}] }, {"daco2controller_ack": [[], {"scalar": "bool"}] }],[],""], 
"0": [ "config_t", {"typedef": [[[],"2"],""]}], 
"1": [ "packet_t", {"typedef": [[[],"3"],""]}], 
"3": [ "ap_uint<28>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 28}}]],""]}}], 
"2": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}]
}}
set moduleName controller
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {controller}
set C_modelType { void 0 }
set C_modelArgList {
	{ config_V int 2 regular {axi_slave 0}  }
	{ packet2controller_V int 28 regular {axi_slave 0}  }
	{ packet2host_V int 32 regular {axi_s 1 ""  { packet2host_V Data } }  }
	{ controller2host_ack int 1 regular {axi_slave 1}  }
	{ daco2controller_V int 28 regular  }
	{ packet2daco_V int 28 regular {pointer 1}  }
	{ config_out_V int 2 regular {pointer 1}  }
	{ daco2controller_ack uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "config_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "config.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "packet2controller_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 28, "direction" : "READONLY", "bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "packet2controller.V","cData": "uint28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "packet2host_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "packet2host.V","cData": "uint28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "controller2host_ack", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "controller2host_ack","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "daco2controller_V", "interface" : "wire", "bitwidth" : 28, "direction" : "READONLY", "bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "daco2controller.V","cData": "uint28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "packet2daco_V", "interface" : "wire", "bitwidth" : 28, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "packet2daco.V","cData": "uint28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "config_out_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "config_out.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "daco2controller_ack", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "daco2controller_ack","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ packet2host_V_TDATA sc_out sc_lv 32 signal 2 } 
	{ packet2host_V_TVALID sc_out sc_logic 1 outvld 2 } 
	{ packet2host_V_TREADY sc_in sc_logic 1 outacc 2 } 
	{ daco2controller_V sc_in sc_lv 28 signal 4 } 
	{ packet2daco_V sc_out sc_lv 28 signal 5 } 
	{ packet2daco_V_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ config_out_V sc_out sc_lv 2 signal 6 } 
	{ config_out_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ daco2controller_ack sc_in sc_logic 1 signal 7 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"config_V","role":"data","value":"16"},{"name":"packet2controller_V","role":"data","value":"24"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"controller2host_ack","role":"data","value":"32"}, {"name":"controller2host_ack","role":"valid","value":"36","valid_bit":"0"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "packet2host_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "packet2host_V", "role": "TDATA" }} , 
 	{ "name": "packet2host_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "packet2host_V", "role": "TVALID" }} , 
 	{ "name": "packet2host_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "packet2host_V", "role": "TREADY" }} , 
 	{ "name": "daco2controller_V", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "daco2controller_V", "role": "default" }} , 
 	{ "name": "packet2daco_V", "direction": "out", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "packet2daco_V", "role": "default" }} , 
 	{ "name": "packet2daco_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "packet2daco_V", "role": "ap_vld" }} , 
 	{ "name": "config_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "config_out_V", "role": "default" }} , 
 	{ "name": "config_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "config_out_V", "role": "ap_vld" }} , 
 	{ "name": "daco2controller_ack", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "daco2controller_ack", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "controller",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"FunctionPipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "config_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet2controller_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet2host_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "packet2host_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller2host_ack", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "daco2controller_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet2daco_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "config_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "daco2controller_ack", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet2daco_vld", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.controller_AXILiteS_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	controller {
		config_V {Type I LastRead 0 FirstWrite -1}
		packet2controller_V {Type I LastRead 0 FirstWrite -1}
		packet2host_V {Type O LastRead -1 FirstWrite 0}
		controller2host_ack {Type O LastRead -1 FirstWrite 0}
		daco2controller_V {Type I LastRead 0 FirstWrite -1}
		packet2daco_V {Type O LastRead -1 FirstWrite 0}
		config_out_V {Type O LastRead -1 FirstWrite 0}
		daco2controller_ack {Type I LastRead 0 FirstWrite -1}
		packet2daco_vld {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	packet2host_V { axis {  { packet2host_V_TDATA out_data 1 32 }  { packet2host_V_TVALID out_vld 1 1 }  { packet2host_V_TREADY out_acc 0 1 } } }
	daco2controller_V { ap_none {  { daco2controller_V in_data 0 28 } } }
	packet2daco_V { ap_vld {  { packet2daco_V out_data 1 28 }  { packet2daco_V_ap_vld out_vld 1 1 } } }
	config_out_V { ap_vld {  { config_out_V out_data 1 2 }  { config_out_V_ap_vld out_vld 1 1 } } }
	daco2controller_ack { ap_none {  { daco2controller_ack in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
