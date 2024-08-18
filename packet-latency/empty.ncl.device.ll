; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/p4-latency/empty.ncl.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/p4-latency/empty.ncl"
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
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_empty.ncl.device.rw, i8* null }]

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #0 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #0 !dbg !10 {
entry:
  ret void, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_min_u8(i8 zeroext %0, i8 zeroext %1) #0 !dbg !12 {
entry:
  ret i8 0, !dbg !13
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_min_u16(i16 zeroext %0, i16 zeroext %1) #0 !dbg !14 {
entry:
  ret i16 0, !dbg !15
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_min_u32(i32 %0, i32 %1) #0 !dbg !16 {
entry:
  ret i32 0, !dbg !17
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_min_u64(i64 %0, i64 %1) #0 !dbg !18 {
entry:
  ret i64 0, !dbg !19
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_bit_half_u16(i1 zeroext %0, i16 zeroext %1) #0 !dbg !20 {
entry:
  ret i16 0, !dbg !21
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_bit_half_u32(i1 zeroext %0, i32 %1) #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_bit_half_u64(i1 zeroext %0, i64 %1) #0 !dbg !24 {
entry:
  ret i64 0, !dbg !25
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #1 !dbg !26 {
entry:
  ret i8 0, !dbg !27
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #1 !dbg !28 {
entry:
  ret i16 0, !dbg !29
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #1 !dbg !30 {
entry:
  ret i32 0, !dbg !31
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #1 !dbg !32 {
entry:
  ret i64 0, !dbg !33
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #2 section ".text.startup" !dbg !34 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #5, !dbg !35
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #5, !dbg !38
  ret void, !dbg !35
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #3

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #4

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #5

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_empty.ncl.device.rw() #2 section ".text.startup" !dbg !39 {
entry:
  call void @__cxx_global_var_init(), !dbg !40
  ret void
}

attributes #0 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #2 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/p4-latency")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!6 = distinct !DISubprogram(name: "__ncvm_read_msg_src", scope: !7, file: !7, line: 11, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def", directory: "/home/gk")
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 11, column: 1, scope: !6)
!10 = distinct !DISubprogram(name: "__ncvm_action_send_to_host", scope: !7, file: !7, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DILocation(line: 69, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "__ncvm_min_u8", scope: !7, file: !7, line: 117, type: !8, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 117, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "__ncvm_min_u16", scope: !7, file: !7, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 118, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "__ncvm_min_u32", scope: !7, file: !7, line: 119, type: !8, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 119, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "__ncvm_min_u64", scope: !7, file: !7, line: 120, type: !8, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 120, column: 1, scope: !18)
!20 = distinct !DISubprogram(name: "__ncvm_bit_half_u16", scope: !7, file: !7, line: 161, type: !8, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 161, column: 1, scope: !20)
!22 = distinct !DISubprogram(name: "__ncvm_bit_half_u32", scope: !7, file: !7, line: 162, type: !8, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 162, column: 1, scope: !22)
!24 = distinct !DISubprogram(name: "__ncvm_bit_half_u64", scope: !7, file: !7, line: 163, type: !8, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 163, column: 1, scope: !24)
!26 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 245, type: !8, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 245, column: 1, scope: !26)
!28 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 246, type: !8, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 246, column: 1, scope: !28)
!30 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 247, type: !8, scopeLine: 247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 247, column: 1, scope: !30)
!32 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 248, type: !8, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 248, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 74, column: 25, scope: !36)
!36 = !DILexicalBlockFile(scope: !34, file: !37, discriminator: 0)
!37 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!38 = !DILocation(line: 0, scope: !34)
!39 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_empty.ncl.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 0, scope: !39)
