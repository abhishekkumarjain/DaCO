// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "controller.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic controller::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic controller::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<2> controller::ap_ST_fsm_state1 = "1";
const sc_lv<2> controller::ap_ST_fsm_state2 = "10";
const bool controller::ap_const_boolean_1 = true;
const sc_lv<1> controller::ap_const_lv1_0 = "0";
const sc_lv<1> controller::ap_const_lv1_1 = "1";
const sc_lv<2> controller::ap_const_lv2_0 = "00";
const sc_lv<2> controller::ap_const_lv2_2 = "10";
const sc_lv<2> controller::ap_const_lv2_3 = "11";
const sc_lv<2> controller::ap_const_lv2_1 = "1";
const sc_lv<32> controller::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> controller::ap_const_lv32_1 = "1";
const int controller::C_S_AXI_DATA_WIDTH = "100000";
const bool controller::ap_const_boolean_0 = false;

controller::controller(sc_module_name name) : sc_module(name), mVcdFile(0) {
    controller_AXILiteS_s_axi_U = new controller_AXILiteS_s_axi<C_S_AXI_AXILITES_ADDR_WIDTH,C_S_AXI_AXILITES_DATA_WIDTH>("controller_AXILiteS_s_axi_U");
    controller_AXILiteS_s_axi_U->AWVALID(s_axi_AXILiteS_AWVALID);
    controller_AXILiteS_s_axi_U->AWREADY(s_axi_AXILiteS_AWREADY);
    controller_AXILiteS_s_axi_U->AWADDR(s_axi_AXILiteS_AWADDR);
    controller_AXILiteS_s_axi_U->WVALID(s_axi_AXILiteS_WVALID);
    controller_AXILiteS_s_axi_U->WREADY(s_axi_AXILiteS_WREADY);
    controller_AXILiteS_s_axi_U->WDATA(s_axi_AXILiteS_WDATA);
    controller_AXILiteS_s_axi_U->WSTRB(s_axi_AXILiteS_WSTRB);
    controller_AXILiteS_s_axi_U->ARVALID(s_axi_AXILiteS_ARVALID);
    controller_AXILiteS_s_axi_U->ARREADY(s_axi_AXILiteS_ARREADY);
    controller_AXILiteS_s_axi_U->ARADDR(s_axi_AXILiteS_ARADDR);
    controller_AXILiteS_s_axi_U->RVALID(s_axi_AXILiteS_RVALID);
    controller_AXILiteS_s_axi_U->RREADY(s_axi_AXILiteS_RREADY);
    controller_AXILiteS_s_axi_U->RDATA(s_axi_AXILiteS_RDATA);
    controller_AXILiteS_s_axi_U->RRESP(s_axi_AXILiteS_RRESP);
    controller_AXILiteS_s_axi_U->BVALID(s_axi_AXILiteS_BVALID);
    controller_AXILiteS_s_axi_U->BREADY(s_axi_AXILiteS_BREADY);
    controller_AXILiteS_s_axi_U->BRESP(s_axi_AXILiteS_BRESP);
    controller_AXILiteS_s_axi_U->ACLK(ap_clk);
    controller_AXILiteS_s_axi_U->ARESET(ap_rst_n_inv);
    controller_AXILiteS_s_axi_U->ACLK_EN(ap_var_for_const0);
    controller_AXILiteS_s_axi_U->config_V(config_V);
    controller_AXILiteS_s_axi_U->packet2controller_V(packet2controller_V);
    controller_AXILiteS_s_axi_U->controller2host_ack(controller2host_ack);
    controller_AXILiteS_s_axi_U->controller2host_ack_ap_vld(controller2host_ack_ap_vld);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_state1_io);
    sensitive << ( packet2host_V_1_ack_in );
    sensitive << ( tmp_3_fu_150_p1 );

    SC_METHOD(thread_ap_block_state2_io);
    sensitive << ( packet2host_V_1_ack_in );
    sensitive << ( tmp_3_reg_168 );

    SC_METHOD(thread_ap_condition_159);
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );

    SC_METHOD(thread_ap_condition_180);
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );

    SC_METHOD(thread_ap_condition_182);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );

    SC_METHOD(thread_ap_rst_n_inv);
    sensitive << ( ap_rst_n );

    SC_METHOD(thread_config_out_V);
    sensitive << ( config_V );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_config_out_V_ap_vld);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_reg_ioackin_config_out_V_dummy_ack );

    SC_METHOD(thread_controller2host_ack);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_condition_180 );
    sensitive << ( ap_condition_159 );

    SC_METHOD(thread_controller2host_ack_ap_vld);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );
    sensitive << ( ap_reg_ioackin_controller2host_ack_dummy_ack );

    SC_METHOD(thread_or_cond_fu_138_p0);
    sensitive << ( daco2controller_ack );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_or_cond_fu_138_p2);
    sensitive << ( or_cond_fu_138_p0 );
    sensitive << ( p_not_fu_132_p2 );

    SC_METHOD(thread_p_not_fu_132_p2);
    sensitive << ( packet2daco_vld );

    SC_METHOD(thread_packet2daco_V);
    sensitive << ( packet2controller_V );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );

    SC_METHOD(thread_packet2daco_V_ap_vld);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_1_fu_118_p2 );
    sensitive << ( tmp_2_fu_124_p1 );
    sensitive << ( or_cond_fu_138_p2 );
    sensitive << ( ap_reg_ioackin_packet2daco_V_dummy_ack );

    SC_METHOD(thread_packet2host_V_1_ack_in);
    sensitive << ( packet2host_V_1_state );

    SC_METHOD(thread_packet2host_V_1_ack_out);
    sensitive << ( packet2host_V_TREADY );

    SC_METHOD(thread_packet2host_V_1_data_out);
    sensitive << ( packet2host_V_1_payload_A );
    sensitive << ( packet2host_V_1_payload_B );
    sensitive << ( packet2host_V_1_sel );

    SC_METHOD(thread_packet2host_V_1_load_A);
    sensitive << ( packet2host_V_1_sel_wr );
    sensitive << ( packet2host_V_1_state_cmp_full );

    SC_METHOD(thread_packet2host_V_1_load_B);
    sensitive << ( packet2host_V_1_sel_wr );
    sensitive << ( packet2host_V_1_state_cmp_full );

    SC_METHOD(thread_packet2host_V_1_sel);
    sensitive << ( packet2host_V_1_sel_rd );

    SC_METHOD(thread_packet2host_V_1_state_cmp_full);
    sensitive << ( packet2host_V_1_state );

    SC_METHOD(thread_packet2host_V_1_vld_in);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_3_fu_150_p1 );
    sensitive << ( ap_block_state1_io );

    SC_METHOD(thread_packet2host_V_1_vld_out);
    sensitive << ( packet2host_V_1_state );

    SC_METHOD(thread_packet2host_V_TDATA);
    sensitive << ( packet2host_V_1_data_out );

    SC_METHOD(thread_packet2host_V_TDATA_blk_n);
    sensitive << ( packet2host_V_1_state );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_3_fu_150_p1 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( tmp_3_reg_168 );

    SC_METHOD(thread_packet2host_V_TVALID);
    sensitive << ( packet2host_V_1_state );

    SC_METHOD(thread_tmp_1_fu_118_p2);
    sensitive << ( config_V );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_block_state1_io );

    SC_METHOD(thread_tmp_2_fu_124_p1);
    sensitive << ( packet2controller_V );

    SC_METHOD(thread_tmp_3_fu_150_p1);
    sensitive << ( daco2controller_V );

    SC_METHOD(thread_tmp_fu_154_p1);
    sensitive << ( daco2controller_V );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( packet2host_V_1_ack_in );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_block_state1_io );
    sensitive << ( ap_block_state2_io );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    SC_THREAD(thread_ap_var_for_const0);

    packet2host_V_1_sel_rd = SC_LOGIC_0;
    packet2host_V_1_sel_wr = SC_LOGIC_0;
    packet2host_V_1_state = "00";
    packet2daco_vld = "0";
    ap_CS_fsm = "01";
    ap_reg_ioackin_config_out_V_dummy_ack = SC_LOGIC_0;
    ap_reg_ioackin_controller2host_ack_dummy_ack = SC_LOGIC_0;
    ap_reg_ioackin_packet2daco_V_dummy_ack = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "controller_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst_n, "(port)ap_rst_n");
    sc_trace(mVcdFile, packet2host_V_TDATA, "(port)packet2host_V_TDATA");
    sc_trace(mVcdFile, packet2host_V_TVALID, "(port)packet2host_V_TVALID");
    sc_trace(mVcdFile, packet2host_V_TREADY, "(port)packet2host_V_TREADY");
    sc_trace(mVcdFile, daco2controller_V, "(port)daco2controller_V");
    sc_trace(mVcdFile, packet2daco_V, "(port)packet2daco_V");
    sc_trace(mVcdFile, packet2daco_V_ap_vld, "(port)packet2daco_V_ap_vld");
    sc_trace(mVcdFile, config_out_V, "(port)config_out_V");
    sc_trace(mVcdFile, config_out_V_ap_vld, "(port)config_out_V_ap_vld");
    sc_trace(mVcdFile, daco2controller_ack, "(port)daco2controller_ack");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWVALID, "(port)s_axi_AXILiteS_AWVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWREADY, "(port)s_axi_AXILiteS_AWREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWADDR, "(port)s_axi_AXILiteS_AWADDR");
    sc_trace(mVcdFile, s_axi_AXILiteS_WVALID, "(port)s_axi_AXILiteS_WVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_WREADY, "(port)s_axi_AXILiteS_WREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_WDATA, "(port)s_axi_AXILiteS_WDATA");
    sc_trace(mVcdFile, s_axi_AXILiteS_WSTRB, "(port)s_axi_AXILiteS_WSTRB");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARVALID, "(port)s_axi_AXILiteS_ARVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARREADY, "(port)s_axi_AXILiteS_ARREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARADDR, "(port)s_axi_AXILiteS_ARADDR");
    sc_trace(mVcdFile, s_axi_AXILiteS_RVALID, "(port)s_axi_AXILiteS_RVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_RREADY, "(port)s_axi_AXILiteS_RREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_RDATA, "(port)s_axi_AXILiteS_RDATA");
    sc_trace(mVcdFile, s_axi_AXILiteS_RRESP, "(port)s_axi_AXILiteS_RRESP");
    sc_trace(mVcdFile, s_axi_AXILiteS_BVALID, "(port)s_axi_AXILiteS_BVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_BREADY, "(port)s_axi_AXILiteS_BREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_BRESP, "(port)s_axi_AXILiteS_BRESP");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_rst_n_inv, "ap_rst_n_inv");
    sc_trace(mVcdFile, config_V, "config_V");
    sc_trace(mVcdFile, packet2controller_V, "packet2controller_V");
    sc_trace(mVcdFile, packet2host_V_1_data_out, "packet2host_V_1_data_out");
    sc_trace(mVcdFile, packet2host_V_1_vld_in, "packet2host_V_1_vld_in");
    sc_trace(mVcdFile, packet2host_V_1_vld_out, "packet2host_V_1_vld_out");
    sc_trace(mVcdFile, packet2host_V_1_ack_in, "packet2host_V_1_ack_in");
    sc_trace(mVcdFile, packet2host_V_1_ack_out, "packet2host_V_1_ack_out");
    sc_trace(mVcdFile, packet2host_V_1_payload_A, "packet2host_V_1_payload_A");
    sc_trace(mVcdFile, packet2host_V_1_payload_B, "packet2host_V_1_payload_B");
    sc_trace(mVcdFile, packet2host_V_1_sel_rd, "packet2host_V_1_sel_rd");
    sc_trace(mVcdFile, packet2host_V_1_sel_wr, "packet2host_V_1_sel_wr");
    sc_trace(mVcdFile, packet2host_V_1_sel, "packet2host_V_1_sel");
    sc_trace(mVcdFile, packet2host_V_1_load_A, "packet2host_V_1_load_A");
    sc_trace(mVcdFile, packet2host_V_1_load_B, "packet2host_V_1_load_B");
    sc_trace(mVcdFile, packet2host_V_1_state, "packet2host_V_1_state");
    sc_trace(mVcdFile, packet2host_V_1_state_cmp_full, "packet2host_V_1_state_cmp_full");
    sc_trace(mVcdFile, controller2host_ack, "controller2host_ack");
    sc_trace(mVcdFile, controller2host_ack_ap_vld, "controller2host_ack_ap_vld");
    sc_trace(mVcdFile, packet2daco_vld, "packet2daco_vld");
    sc_trace(mVcdFile, packet2host_V_TDATA_blk_n, "packet2host_V_TDATA_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, tmp_3_fu_150_p1, "tmp_3_fu_150_p1");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, tmp_3_reg_168, "tmp_3_reg_168");
    sc_trace(mVcdFile, ap_block_state1_io, "ap_block_state1_io");
    sc_trace(mVcdFile, tmp_fu_154_p1, "tmp_fu_154_p1");
    sc_trace(mVcdFile, tmp_1_fu_118_p2, "tmp_1_fu_118_p2");
    sc_trace(mVcdFile, tmp_2_fu_124_p1, "tmp_2_fu_124_p1");
    sc_trace(mVcdFile, or_cond_fu_138_p2, "or_cond_fu_138_p2");
    sc_trace(mVcdFile, ap_reg_ioackin_config_out_V_dummy_ack, "ap_reg_ioackin_config_out_V_dummy_ack");
    sc_trace(mVcdFile, ap_reg_ioackin_controller2host_ack_dummy_ack, "ap_reg_ioackin_controller2host_ack_dummy_ack");
    sc_trace(mVcdFile, ap_reg_ioackin_packet2daco_V_dummy_ack, "ap_reg_ioackin_packet2daco_V_dummy_ack");
    sc_trace(mVcdFile, ap_block_state2_io, "ap_block_state2_io");
    sc_trace(mVcdFile, or_cond_fu_138_p0, "or_cond_fu_138_p0");
    sc_trace(mVcdFile, p_not_fu_132_p2, "p_not_fu_132_p2");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
    sc_trace(mVcdFile, ap_condition_182, "ap_condition_182");
    sc_trace(mVcdFile, ap_condition_180, "ap_condition_180");
    sc_trace(mVcdFile, ap_condition_159, "ap_condition_159");
#endif

    }
    mHdltvinHandle.open("controller.hdltvin.dat");
    mHdltvoutHandle.open("controller.hdltvout.dat");
}

controller::~controller() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
    delete controller_AXILiteS_s_axi_U;
}

void controller::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void controller::thread_ap_clk_no_reset_() {
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        ap_reg_ioackin_config_out_V_dummy_ack = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) {
            if (esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0)) {
                ap_reg_ioackin_config_out_V_dummy_ack = ap_const_logic_0;
            } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_const_logic_1)) {
                ap_reg_ioackin_config_out_V_dummy_ack = ap_const_logic_1;
            }
        }
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        ap_reg_ioackin_controller2host_ack_dummy_ack = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
              esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0) && 
              esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && 
              esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read())) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
              esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0) && 
              ((esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_124_p1.read())) || 
               (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, or_cond_fu_138_p2.read())))))) {
            ap_reg_ioackin_controller2host_ack_dummy_ack = ap_const_logic_0;
        } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                     ((esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
                       esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_124_p1.read())) || 
                      (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
                       esl_seteq<1,1,1>(ap_const_lv1_0, or_cond_fu_138_p2.read()))) && 
                     esl_seteq<1,1,1>(ap_const_logic_1, ap_const_logic_1)) || 
                    (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                     esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
                     esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && 
                     esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()) && 
                     esl_seteq<1,1,1>(ap_const_logic_1, ap_const_logic_1)))) {
            ap_reg_ioackin_controller2host_ack_dummy_ack = ap_const_logic_1;
        }
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        ap_reg_ioackin_packet2daco_V_dummy_ack = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_condition_182.read(), ap_const_boolean_1)) {
            if (esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0)) {
                ap_reg_ioackin_packet2daco_V_dummy_ack = ap_const_logic_0;
            } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_const_logic_1)) {
                ap_reg_ioackin_packet2daco_V_dummy_ack = ap_const_logic_1;
            }
        }
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        packet2host_V_1_sel_rd = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_ack_out.read()) && 
             esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_vld_out.read()))) {
            packet2host_V_1_sel_rd =  (sc_logic) (~packet2host_V_1_sel_rd.read());
        }
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        packet2host_V_1_sel_wr = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_vld_in.read()) && 
             esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_ack_in.read()))) {
            packet2host_V_1_sel_wr =  (sc_logic) (~packet2host_V_1_sel_wr.read());
        }
    }
    if ( ap_rst_n_inv.read() == ap_const_logic_1) {
        packet2host_V_1_state = ap_const_lv2_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_vld_in.read()) && 
              esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_ack_out.read()) && 
              esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_3)) || 
             (esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_vld_in.read()) && 
              esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_2)))) {
            packet2host_V_1_state = ap_const_lv2_2;
        } else if (((esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_vld_in.read()) && 
                     esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_out.read()) && 
                     esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_3)) || 
                    (esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_out.read()) && 
                     esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_1)))) {
            packet2host_V_1_state = ap_const_lv2_1;
        } else if (((esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_vld_in.read()) && 
                     esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_2)) || 
                    (esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_ack_out.read()) && 
                     esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_1)) || 
                    (esl_seteq<1,2,2>(packet2host_V_1_state.read(), ap_const_lv2_3) && 
                     !(esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_vld_in.read()) && esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_out.read())) && 
                     !(esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_vld_in.read()) && esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_ack_out.read()))))) {
            packet2host_V_1_state = ap_const_lv2_3;
        } else {
            packet2host_V_1_state = ap_const_lv2_2;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()))) {
        packet2daco_vld = ap_const_lv1_1;
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_load_A.read())) {
        packet2host_V_1_payload_A = tmp_fu_154_p1.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_load_B.read())) {
        packet2host_V_1_payload_B = tmp_fu_154_p1.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0))) {
        tmp_3_reg_168 = tmp_3_fu_150_p1.read();
    }
}

void controller::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void controller::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void controller::thread_ap_block_state1_io() {
    ap_block_state1_io = (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_3_fu_150_p1.read()) && esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_in.read()));
}

void controller::thread_ap_block_state2_io() {
    ap_block_state2_io = (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_3_reg_168.read()) && esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_in.read()));
}

void controller::thread_ap_condition_159() {
    ap_condition_159 = (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()));
}

void controller::thread_ap_condition_180() {
    ap_condition_180 = ((esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_124_p1.read())) || (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_0, or_cond_fu_138_p2.read())));
}

void controller::thread_ap_condition_182() {
    ap_condition_182 = (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()));
}

void controller::thread_ap_rst_n_inv() {
    ap_rst_n_inv =  (sc_logic) (~ap_rst_n.read());
}

void controller::thread_config_out_V() {
    config_out_V = config_V.read();
}

void controller::thread_config_out_V_ap_vld() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_config_out_V_dummy_ack.read()))) {
        config_out_V_ap_vld = ap_const_logic_1;
    } else {
        config_out_V_ap_vld = ap_const_logic_0;
    }
}

void controller::thread_controller2host_ack() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) {
        if (esl_seteq<1,1,1>(ap_condition_159.read(), ap_const_boolean_1)) {
            controller2host_ack =  (sc_logic) (ap_const_lv1_1[0]);
        } else if (esl_seteq<1,1,1>(ap_condition_180.read(), ap_const_boolean_1)) {
            controller2host_ack =  (sc_logic) (ap_const_lv1_0[0]);
        } else {
            controller2host_ack = sc_logic('X');
        }
    } else {
        controller2host_ack = sc_logic('X');
    }
}

void controller::thread_controller2host_ack_ap_vld() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
          ((esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
            esl_seteq<1,1,1>(ap_const_lv1_0, tmp_2_fu_124_p1.read())) || 
           (esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
            esl_seteq<1,1,1>(ap_const_lv1_0, or_cond_fu_138_p2.read()))) && 
          esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_controller2host_ack_dummy_ack.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_controller2host_ack_dummy_ack.read())))) {
        controller2host_ack_ap_vld = ap_const_logic_1;
    } else {
        controller2host_ack_ap_vld = ap_const_logic_0;
    }
}

void controller::thread_or_cond_fu_138_p0() {
    or_cond_fu_138_p0 =  (sc_lv<1>) (daco2controller_ack.read());
}

void controller::thread_or_cond_fu_138_p2() {
    or_cond_fu_138_p2 = (or_cond_fu_138_p0.read() | p_not_fu_132_p2.read());
}

void controller::thread_p_not_fu_132_p2() {
    p_not_fu_132_p2 = (packet2daco_vld.read() ^ ap_const_lv1_1);
}

void controller::thread_packet2daco_V() {
    packet2daco_V = packet2controller_V.read();
}

void controller::thread_packet2daco_V_ap_vld() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_118_p2.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, tmp_2_fu_124_p1.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_138_p2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_packet2daco_V_dummy_ack.read()))) {
        packet2daco_V_ap_vld = ap_const_logic_1;
    } else {
        packet2daco_V_ap_vld = ap_const_logic_0;
    }
}

void controller::thread_packet2host_V_1_ack_in() {
    packet2host_V_1_ack_in = packet2host_V_1_state.read()[1];
}

void controller::thread_packet2host_V_1_ack_out() {
    packet2host_V_1_ack_out = packet2host_V_TREADY.read();
}

void controller::thread_packet2host_V_1_data_out() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, packet2host_V_1_sel.read())) {
        packet2host_V_1_data_out = packet2host_V_1_payload_B.read();
    } else {
        packet2host_V_1_data_out = packet2host_V_1_payload_A.read();
    }
}

void controller::thread_packet2host_V_1_load_A() {
    packet2host_V_1_load_A = (packet2host_V_1_state_cmp_full.read() & ~packet2host_V_1_sel_wr.read());
}

void controller::thread_packet2host_V_1_load_B() {
    packet2host_V_1_load_B = (packet2host_V_1_sel_wr.read() & packet2host_V_1_state_cmp_full.read());
}

void controller::thread_packet2host_V_1_sel() {
    packet2host_V_1_sel = packet2host_V_1_sel_rd.read();
}

void controller::thread_packet2host_V_1_state_cmp_full() {
    packet2host_V_1_state_cmp_full =  (sc_logic) ((!packet2host_V_1_state.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<1>(): sc_lv<1>(packet2host_V_1_state.read() != ap_const_lv2_1))[0];
}

void controller::thread_packet2host_V_1_vld_in() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, tmp_3_fu_150_p1.read()) && 
         esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0))) {
        packet2host_V_1_vld_in = ap_const_logic_1;
    } else {
        packet2host_V_1_vld_in = ap_const_logic_0;
    }
}

void controller::thread_packet2host_V_1_vld_out() {
    packet2host_V_1_vld_out = packet2host_V_1_state.read()[0];
}

void controller::thread_packet2host_V_TDATA() {
    packet2host_V_TDATA = packet2host_V_1_data_out.read();
}

void controller::thread_packet2host_V_TDATA_blk_n() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_3_fu_150_p1.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_3_reg_168.read())))) {
        packet2host_V_TDATA_blk_n = packet2host_V_1_state.read()[1];
    } else {
        packet2host_V_TDATA_blk_n = ap_const_logic_1;
    }
}

void controller::thread_packet2host_V_TVALID() {
    packet2host_V_TVALID = packet2host_V_1_state.read()[0];
}

void controller::thread_tmp_1_fu_118_p2() {
    tmp_1_fu_118_p2 = (!config_V.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<1>(): sc_lv<1>(config_V.read() == ap_const_lv2_1);
}

void controller::thread_tmp_2_fu_124_p1() {
    tmp_2_fu_124_p1 = packet2controller_V.read().range(1-1, 0);
}

void controller::thread_tmp_3_fu_150_p1() {
    tmp_3_fu_150_p1 = daco2controller_V.read().range(1-1, 0);
}

void controller::thread_tmp_fu_154_p1() {
    tmp_fu_154_p1 = esl_zext<32,28>(daco2controller_V.read());
}

void controller::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_block_state1_io.read(), ap_const_boolean_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, packet2host_V_1_ack_in.read()) || esl_seteq<1,1,1>(ap_const_boolean_1, ap_block_state2_io.read())))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_state2;
            }
            break;
        default : 
            ap_NS_fsm = "XX";
            break;
    }
}

void controller::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst_n\" :  \"" << ap_rst_n.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"packet2host_V_TDATA\" :  \"" << packet2host_V_TDATA.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"packet2host_V_TVALID\" :  \"" << packet2host_V_TVALID.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"packet2host_V_TREADY\" :  \"" << packet2host_V_TREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"daco2controller_V\" :  \"" << daco2controller_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"packet2daco_V\" :  \"" << packet2daco_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"packet2daco_V_ap_vld\" :  \"" << packet2daco_V_ap_vld.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"config_out_V\" :  \"" << config_out_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"config_out_V_ap_vld\" :  \"" << config_out_V_ap_vld.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"daco2controller_ack\" :  \"" << daco2controller_ack.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_AWVALID\" :  \"" << s_axi_AXILiteS_AWVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_AWREADY\" :  \"" << s_axi_AXILiteS_AWREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_AWADDR\" :  \"" << s_axi_AXILiteS_AWADDR.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WVALID\" :  \"" << s_axi_AXILiteS_WVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_WREADY\" :  \"" << s_axi_AXILiteS_WREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WDATA\" :  \"" << s_axi_AXILiteS_WDATA.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WSTRB\" :  \"" << s_axi_AXILiteS_WSTRB.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_ARVALID\" :  \"" << s_axi_AXILiteS_ARVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_ARREADY\" :  \"" << s_axi_AXILiteS_ARREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_ARADDR\" :  \"" << s_axi_AXILiteS_ARADDR.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RVALID\" :  \"" << s_axi_AXILiteS_RVALID.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_RREADY\" :  \"" << s_axi_AXILiteS_RREADY.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RDATA\" :  \"" << s_axi_AXILiteS_RDATA.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RRESP\" :  \"" << s_axi_AXILiteS_RRESP.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_BVALID\" :  \"" << s_axi_AXILiteS_BVALID.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_BREADY\" :  \"" << s_axi_AXILiteS_BREADY.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_BRESP\" :  \"" << s_axi_AXILiteS_BRESP.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}
