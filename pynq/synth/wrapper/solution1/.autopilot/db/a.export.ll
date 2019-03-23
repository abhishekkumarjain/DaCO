; ModuleID = '/home/sidmontu/Xilinx_Projects/daco_wrapper/wrapper/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@packet2daco_vld = internal unnamed_addr global i1 false, align 1
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@controller_str = internal unnamed_addr constant [11 x i8] c"controller\00"
@p_str4 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @controller(i2 %config_V, i28 %packet2controller_V, i32* %packet2host_V, i1* %controller2host_ack, i28 %daco2controller_V, i28* %packet2daco_V, i2* %config_out_V, i1 zeroext %daco2controller_ack) {
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %config_V), !map !53
  call void (...)* @_ssdm_op_SpecBitsMap(i28 %packet2controller_V), !map !59
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %packet2host_V), !map !63
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %controller2host_ack), !map !67
  call void (...)* @_ssdm_op_SpecBitsMap(i28 %daco2controller_V), !map !71
  call void (...)* @_ssdm_op_SpecBitsMap(i28* %packet2daco_V), !map !75
  call void (...)* @_ssdm_op_SpecBitsMap(i2* %config_out_V), !map !79
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %daco2controller_ack), !map !83
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @controller_str) nounwind
  %daco2controller_ack_s = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %daco2controller_ack)
  %daco2controller_V_re = call i28 @_ssdm_op_Read.ap_auto.i28(i28 %daco2controller_V)
  %packet2controller_V_s = call i28 @_ssdm_op_Read.s_axilite.i28(i28 %packet2controller_V)
  %config_V_read = call i2 @_ssdm_op_Read.s_axilite.i2(i2 %config_V)
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i2 %config_V, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i28 %packet2controller_V, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %packet2host_V, [5 x i8]* @p_str3, i32 1, i32 1, [5 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecInterface(i1* %controller2host_ack, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void @_ssdm_op_Write.ap_auto.i2P(i2* %config_out_V, i2 %config_V_read)
  %tmp_1 = icmp eq i2 %config_V_read, 1
  br i1 %tmp_1, label %1, label %._crit_edge

; <label>:1                                       ; preds = %0
  %tmp_2 = trunc i28 %packet2controller_V_s to i1
  br i1 %tmp_2, label %2, label %._crit_edge52

; <label>:2                                       ; preds = %1
  %packet2daco_vld_load = load i1* @packet2daco_vld, align 1
  %p_not = xor i1 %packet2daco_vld_load, true
  %or_cond = or i1 %daco2controller_ack_s, %p_not
  br i1 %or_cond, label %3, label %._crit_edge52

; <label>:3                                       ; preds = %2
  call void @_ssdm_op_Write.ap_auto.i28P(i28* %packet2daco_V, i28 %packet2controller_V_s)
  call void @_ssdm_op_Write.s_axilite.i1P(i1* %controller2host_ack, i1 true)
  store i1 true, i1* @packet2daco_vld, align 1
  br label %4

._crit_edge52:                                    ; preds = %2, %1
  call void @_ssdm_op_Write.s_axilite.i1P(i1* %controller2host_ack, i1 false)
  br label %4

; <label>:4                                       ; preds = %._crit_edge52, %3
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %0
  %tmp_3 = trunc i28 %daco2controller_V_re to i1
  br i1 %tmp_3, label %5, label %._crit_edge54

; <label>:5                                       ; preds = %._crit_edge
  %tmp = zext i28 %daco2controller_V_re to i32
  call void @_ssdm_op_Write.axis.i32P(i32* %packet2host_V, i32 %tmp)
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %5, %._crit_edge
  ret void
}

define weak void @_ssdm_op_Write.s_axilite.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

define weak void @_ssdm_op_Write.axis.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i2P(i2*, i2) {
entry:
  store i2 %1, i2* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i28P(i28*, i28) {
entry:
  store i28 %1, i28* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i28 @_ssdm_op_Read.s_axilite.i28(i28) {
entry:
  ret i28 %0
}

define weak i2 @_ssdm_op_Read.s_axilite.i2(i2) {
entry:
  ret i2 %0
}

define weak i28 @_ssdm_op_Read.ap_auto.i28(i28) {
entry:
  ret i28 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

declare i1 @_ssdm_op_PartSelect.i1.i28.i32.i32(i28, i32, i32) nounwind readnone

!opencl.kernels = !{!0, !7, !13, !19, !19, !22, !28, !30, !30, !22, !22, !22, !22, !33, !36, !36, !42, !28, !44}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!46}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"config_t", metadata !"packet_t", metadata !"packet_t &", metadata !"_Bool &", metadata !"packet_t", metadata !"packet_t &", metadata !"config_t &", metadata !"_Bool"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"config", metadata !"packet2controller", metadata !"packet2host", metadata !"controller2host_ack", metadata !"daco2controller", metadata !"packet2daco", metadata !"config_out", metadata !"daco2controller_ack"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<28> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<28, false> &", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!19 = metadata !{null, metadata !8, metadata !9, metadata !20, metadata !11, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space"}
!24 = metadata !{metadata !"kernel_arg_access_qual"}
!25 = metadata !{metadata !"kernel_arg_type"}
!26 = metadata !{metadata !"kernel_arg_type_qual"}
!27 = metadata !{metadata !"kernel_arg_name"}
!28 = metadata !{null, metadata !8, metadata !9, metadata !29, metadata !11, metadata !12, metadata !6}
!29 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!30 = metadata !{null, metadata !8, metadata !9, metadata !31, metadata !11, metadata !32, metadata !6}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<28, false> &"}
!32 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!33 = metadata !{null, metadata !14, metadata !15, metadata !34, metadata !17, metadata !35, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!36 = metadata !{null, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !6}
!37 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!38 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<28, false>*", metadata !"int", metadata !"int"}
!40 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!41 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!42 = metadata !{null, metadata !14, metadata !15, metadata !43, metadata !17, metadata !18, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!44 = metadata !{null, metadata !8, metadata !9, metadata !45, metadata !11, metadata !12, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!46 = metadata !{metadata !47, [0 x i32]* @llvm_global_ctors_0}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 31, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"llvm.global_ctors.0", metadata !51, metadata !"", i32 0, i32 31}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 0, i32 1}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 1, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"config.V", metadata !57, metadata !"uint2", i32 0, i32 1}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 0, i32 0}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 0, i32 27, metadata !61}
!61 = metadata !{metadata !62}
!62 = metadata !{metadata !"packet2controller.V", metadata !57, metadata !"uint28", i32 0, i32 27}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 27, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"packet2host.V", metadata !51, metadata !"uint28", i32 0, i32 27}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 0, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"controller2host_ack", metadata !51, metadata !"bool", i32 0, i32 0}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 0, i32 27, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"daco2controller.V", metadata !57, metadata !"uint28", i32 0, i32 27}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 0, i32 27, metadata !77}
!77 = metadata !{metadata !78}
!78 = metadata !{metadata !"packet2daco.V", metadata !51, metadata !"uint28", i32 0, i32 27}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 0, i32 1, metadata !81}
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !"config_out.V", metadata !51, metadata !"uint2", i32 0, i32 1}
!83 = metadata !{metadata !84}
!84 = metadata !{i32 0, i32 0, metadata !85}
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !"daco2controller_ack", metadata !57, metadata !"bool", i32 0, i32 0}
