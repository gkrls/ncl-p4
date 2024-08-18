; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pldr-ncl/paxos-ldr.ncl.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pldr-ncl/paxos-ldr.ncl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }

@.str = private unnamed_addr constant [8 x i8] c"ncl:net\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [98 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [15 x i8] c"ncvm:intrinsic\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [11 x i8] c"ncl:atomic\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [16 x i8] c"ncvm:target:tna\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [9 x i8] c"ncl:ncrt\00", section "llvm.metadata"
@.str.6 = private unnamed_addr constant [83 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h\00", section "llvm.metadata"
@.str.7 = private unnamed_addr constant [80 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_algo.h\00", section "llvm.metadata"
@.str.8 = private unnamed_addr constant [84 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_builtins.h\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [94 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/intrinsics/../__ncl_device_math.h\00", section "llvm.metadata"
@.str.10 = private unnamed_addr constant [80 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_bits.h\00", section "llvm.metadata"
@.str.11 = private unnamed_addr constant [83 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h\00", section "llvm.metadata"
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZZ6leaderR8msg_typeRjtRtRhPjE8Instance = internal global i32 0, align 4 #0
@.str.12 = private unnamed_addr constant [11 x i8] c"ncvm:loc:4\00", section "llvm.metadata"
@.str.13 = private unnamed_addr constant [84 x i8] c"/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pldr-ncl/paxos-ldr.ncl\00", section "llvm.metadata"
@.str.14 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.15 = private unnamed_addr constant [22 x i8] c"ncvm:spec:1,1,1,1,1,8\00", section "llvm.metadata"
@.str.16 = private unnamed_addr constant [34 x i8] c"ncvm:slab:1,0,1,0,1,0,1,0,1,0,8,0\00", section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_paxos_ldr.ncl.device.rw, i8* null }]

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #1 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_drop() #1 !dbg !10 {
entry:
  ret void, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #1 !dbg !12 {
entry:
  ret void, !dbg !13
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_multicast(i16 zeroext %0) #1 !dbg !14 {
entry:
  ret void, !dbg !15
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_min_u8(i8 zeroext %0, i8 zeroext %1) #1 !dbg !16 {
entry:
  ret i8 0, !dbg !17
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_min_u16(i16 zeroext %0, i16 zeroext %1) #1 !dbg !18 {
entry:
  ret i16 0, !dbg !19
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_min_u32(i32 %0, i32 %1) #1 !dbg !20 {
entry:
  ret i32 0, !dbg !21
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_min_u64(i64 %0, i64 %1) #1 !dbg !22 {
entry:
  ret i64 0, !dbg !23
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_bit_half_u16(i1 zeroext %0, i16 zeroext %1) #1 !dbg !24 {
entry:
  ret i16 0, !dbg !25
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_bit_half_u32(i1 zeroext %0, i32 %1) #1 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_bit_half_u64(i1 zeroext %0, i64 %1) #1 !dbg !28 {
entry:
  ret i64 0, !dbg !29
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_write_u32(i32* %0, i32 %1) #2 !dbg !30 {
entry:
  ret i32 0, !dbg !31
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_add_u32(i32* %0, i32 %1) #2 !dbg !32 {
entry:
  ret i32 0, !dbg !33
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #2 !dbg !34 {
entry:
  ret i8 0, !dbg !35
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #2 !dbg !36 {
entry:
  ret i16 0, !dbg !37
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #2 !dbg !38 {
entry:
  ret i32 0, !dbg !39
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #2 !dbg !40 {
entry:
  ret i64 0, !dbg !41
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #3 section ".text.startup" !dbg !42 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #6, !dbg !43
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #6, !dbg !46
  ret void, !dbg !43
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #5

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #6

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z6leaderR8msg_typeRjtRtRhPj(i32* noalias nonnull align 4 dereferenceable(4) %type, i32* noalias nonnull align 4 dereferenceable(4) %instance, i16 zeroext %round, i16* noalias nonnull align 2 dereferenceable(2) %vround, i8* noalias nonnull align 1 dereferenceable(1) %vote, i32* noalias %val) #7 !dbg !47 {
entry:
  %0 = load i32, i32* %type, align 4, !dbg !49
  %ncvm.scf.pred.var.0 = alloca i8, align 1
  switch i32 %0, label %ncvm.scf.null.entry.0 [
    i32 16, label %if.then
    i32 32, label %if.then2
  ], !dbg !49

if.then:                                          ; preds = %entry
  store i32 4, i32* %type, align 4, !dbg !50
  %call.i = call i32 @__ncvm_atomic_add_u32(i32* nonnull @_ZZ6leaderR8msg_typeRjtRtRhPjE8Instance, i32 1) #6, !dbg !51
  store i32 %call.i, i32* %instance, align 4, !dbg !55
  call void @__ncvm_action_multicast(i16 zeroext 11) #6, !dbg !56
  br label %ncvm.scf.pred.def.bb.1, !dbg !60

if.then2:                                         ; preds = %entry
  %1 = call i32 @__ncvm_atomic_write_u32(i32* @_ZZ6leaderR8msg_typeRjtRtRhPjE8Instance, i32 0), !dbg !61
  br label %ncvm.scf.pred.def.bb.2, !dbg !62

if.end3:                                          ; preds = %ncvm.scf.pred.sink.bb.0
  call void @__ncvm_action_drop() #6, !dbg !63
  br label %return, !dbg !66

return:                                           ; preds = %ncvm.scf.null.entry.1, %if.end3
  ret void, !dbg !67

ncvm.scf.null.entry.0:                            ; preds = %entry
  br label %ncvm.scf.pred.def.bb.0

ncvm.scf.pred.sink.bb.0:                          ; preds = %ncvm.scf.pred.def.bb.2, %ncvm.scf.pred.def.bb.1, %ncvm.scf.pred.def.bb.0
  %ncvm.scf.pred.val.0 = load i8, i8* %ncvm.scf.pred.var.0, align 1
  %ncvm.scf.pred.cmp.0 = icmp eq i8 %ncvm.scf.pred.val.0, 1
  br i1 %ncvm.scf.pred.cmp.0, label %ncvm.scf.null.entry.1, label %if.end3

ncvm.scf.pred.def.bb.0:                           ; preds = %ncvm.scf.null.entry.0
  store i8 0, i8* %ncvm.scf.pred.var.0, align 1
  br label %ncvm.scf.pred.sink.bb.0

ncvm.scf.pred.def.bb.1:                           ; preds = %if.then
  store i8 1, i8* %ncvm.scf.pred.var.0, align 1
  br label %ncvm.scf.pred.sink.bb.0

ncvm.scf.pred.def.bb.2:                           ; preds = %if.then2
  store i8 0, i8* %ncvm.scf.pred.var.0, align 1
  br label %ncvm.scf.pred.sink.bb.0

ncvm.scf.null.entry.1:                            ; preds = %ncvm.scf.pred.sink.bb.0
  br label %return
}

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_paxos_ldr.ncl.device.rw() #3 section ".text.startup" !dbg !68 {
entry:
  call void @__cxx_global_var_init(), !dbg !69
  ret void
}

attributes #0 = { "ncvm-loc"="4" "ncvm-net" }
attributes #1 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #2 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #6 = { nounwind }
attributes #7 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-loc"="4" "ncvm-spec"="1,1,1,1,1,8" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pldr-ncl")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!6 = distinct !DISubprogram(name: "__ncvm_read_msg_src", scope: !7, file: !7, line: 11, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def", directory: "/home/gk")
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 11, column: 1, scope: !6)
!10 = distinct !DISubprogram(name: "__ncvm_action_drop", scope: !7, file: !7, line: 67, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DILocation(line: 67, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "__ncvm_action_send_to_host", scope: !7, file: !7, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 69, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "__ncvm_action_multicast", scope: !7, file: !7, line: 73, type: !8, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 73, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "__ncvm_min_u8", scope: !7, file: !7, line: 117, type: !8, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 117, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "__ncvm_min_u16", scope: !7, file: !7, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 118, column: 1, scope: !18)
!20 = distinct !DISubprogram(name: "__ncvm_min_u32", scope: !7, file: !7, line: 119, type: !8, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 119, column: 1, scope: !20)
!22 = distinct !DISubprogram(name: "__ncvm_min_u64", scope: !7, file: !7, line: 120, type: !8, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 120, column: 1, scope: !22)
!24 = distinct !DISubprogram(name: "__ncvm_bit_half_u16", scope: !7, file: !7, line: 161, type: !8, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 161, column: 1, scope: !24)
!26 = distinct !DISubprogram(name: "__ncvm_bit_half_u32", scope: !7, file: !7, line: 162, type: !8, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 162, column: 1, scope: !26)
!28 = distinct !DISubprogram(name: "__ncvm_bit_half_u64", scope: !7, file: !7, line: 163, type: !8, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 163, column: 1, scope: !28)
!30 = distinct !DISubprogram(name: "__ncvm_atomic_write_u32", scope: !7, file: !7, line: 210, type: !8, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 210, column: 1, scope: !30)
!32 = distinct !DISubprogram(name: "__ncvm_atomic_add_u32", scope: !7, file: !7, line: 241, type: !8, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 241, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 256, type: !8, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 256, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 257, type: !8, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 257, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 258, type: !8, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 258, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 259, type: !8, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 259, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 74, column: 25, scope: !44)
!44 = !DILexicalBlockFile(scope: !42, file: !45, discriminator: 0)
!45 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!46 = !DILocation(line: 0, scope: !42)
!47 = distinct !DISubprogram(name: "leader", scope: !48, file: !48, line: 20, type: !8, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DIFile(filename: "paxos-ldr.ncl", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pldr-ncl")
!49 = !DILocation(line: 24, column: 7, scope: !47)
!50 = !DILocation(line: 25, column: 10, scope: !47)
!51 = !DILocation(line: 133, column: 82, scope: !52, inlinedAt: !54)
!52 = distinct !DISubprogram(name: "atomic_add", scope: !53, file: !53, line: 133, type: !8, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!54 = distinct !DILocation(line: 27, column: 16, scope: !47)
!55 = !DILocation(line: 27, column: 14, scope: !47)
!56 = !DILocation(line: 109, column: 3, scope: !57, inlinedAt: !59)
!57 = distinct !DISubprogram(name: "_multicast", scope: !58, file: !58, line: 108, type: !8, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!59 = distinct !DILocation(line: 28, column: 12, scope: !47)
!60 = !DILocation(line: 28, column: 5, scope: !47)
!61 = !DILocation(line: 31, column: 14, scope: !47)
!62 = !DILocation(line: 31, column: 5, scope: !47)
!63 = !DILocation(line: 15, column: 3, scope: !64, inlinedAt: !65)
!64 = distinct !DISubprogram(name: "_drop", scope: !58, file: !58, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = distinct !DILocation(line: 32, column: 10, scope: !47)
!66 = !DILocation(line: 32, column: 3, scope: !47)
!67 = !DILocation(line: 33, column: 1, scope: !47)
!68 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_paxos_ldr.ncl.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 0, scope: !68)
