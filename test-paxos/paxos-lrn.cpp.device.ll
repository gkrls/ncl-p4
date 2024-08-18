; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/test-paxos/paxos-lrn.cpp.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/test-paxos/paxos-lrn.cpp"
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
@.str.12 = private unnamed_addr constant [71 x i8] c"/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/test-paxos/paxos-lrn.cpp\00", section "llvm.metadata"
@.str.13 = private unnamed_addr constant [11 x i8] c"ncvm:loc:5\00", section "llvm.metadata"
@Round = global [65536 x i16] zeroinitializer, align 16 #0
@_ZZ7learnerR8msg_typeRjtRtRhPjE11VoteHistory = internal global [65536 x i8] zeroinitializer, align 16 #0
@_ZZ7learnerR8msg_typeRjtRtRhPjE8Majority = internal constant [4 x i8] c"\03\05\06\07", align 1 #1
@.str.14 = private unnamed_addr constant [11 x i8] c"ncvm:const\00", section "llvm.metadata"
@.str.15 = private unnamed_addr constant [11 x i8] c"ncl:lookup\00", section "llvm.metadata"
@.str.16 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.17 = private unnamed_addr constant [22 x i8] c"ncvm:spec:1,1,1,1,1,8\00", section "llvm.metadata"
@.str.18 = private unnamed_addr constant [34 x i8] c"ncvm:slab:1,0,1,0,1,0,1,0,1,0,8,0\00", section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_paxos_lrn.cpp.device.rw, i8* null }]
@Value_fragment_0_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_1_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_2_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_3_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_4_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_5_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_6_ = internal global [65536 x i32] zeroinitializer #2
@Value_fragment_7_ = internal global [65536 x i32] zeroinitializer #2

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #3 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_lookup_u8(i8* %0, i8 zeroext %1) #3 !dbg !10 {
entry:
  ret i1 false, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_drop() #3 !dbg !12 {
entry:
  ret void, !dbg !13
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #3 !dbg !14 {
entry:
  ret void, !dbg !15
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_min_u8(i8 zeroext %0, i8 zeroext %1) #3 !dbg !16 {
entry:
  ret i8 0, !dbg !17
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_min_u16(i16 zeroext %0, i16 zeroext %1) #3 !dbg !18 {
entry:
  ret i16 0, !dbg !19
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_min_u32(i32 %0, i32 %1) #3 !dbg !20 {
entry:
  ret i32 0, !dbg !21
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_min_u64(i64 %0, i64 %1) #3 !dbg !22 {
entry:
  ret i64 0, !dbg !23
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_bit_check_u16(i16 zeroext %0, i8 zeroext %1) #3 !dbg !24 {
entry:
  ret i1 false, !dbg !25
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_bit_half_u16(i1 zeroext %0, i16 zeroext %1) #3 !dbg !26 {
entry:
  ret i16 0, !dbg !27
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_bit_half_u32(i1 zeroext %0, i32 %1) #3 !dbg !28 {
entry:
  ret i32 0, !dbg !29
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_bit_half_u64(i1 zeroext %0, i64 %1) #3 !dbg !30 {
entry:
  ret i64 0, !dbg !31
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_write_u8(i8* %0, i8 zeroext %1) #4 !dbg !32 {
entry:
  ret i8 0, !dbg !33
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_write_u32(i32* %0, i32 %1) #4 !dbg !34 {
entry:
  ret i32 0, !dbg !35
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #4 !dbg !36 {
entry:
  ret i8 0, !dbg !37
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #4 !dbg !38 {
entry:
  ret i16 0, !dbg !39
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #4 !dbg !40 {
entry:
  ret i32 0, !dbg !41
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #4 !dbg !42 {
entry:
  ret i64 0, !dbg !43
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_cmp_write_lte_u16(i16* %0, i16 zeroext %1, i16 zeroext %2) #4 !dbg !44 {
entry:
  ret i16 0, !dbg !45
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_or_u8(i8* %0, i8 zeroext %1) #4 !dbg !46 {
entry:
  ret i8 0, !dbg !47
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #5 section ".text.startup" !dbg !48 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #8, !dbg !49
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #8, !dbg !52
  ret void, !dbg !49
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #6

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #7

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #8

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z7learnerR8msg_typeRjtRtRhPj(i32* noalias nonnull align 4 dereferenceable(4) %type, i32* noalias nonnull align 4 dereferenceable(4) %instance, i16 zeroext %round, i16* noalias nonnull align 2 dereferenceable(2) %vote_round, i8* noalias nonnull align 1 dereferenceable(1) %vote, i32* noalias %val) #9 !dbg !53 {
entry:
  %votes.0.reg2mem = alloca i8, align 1
  %0 = load i32, i32* %type, align 4, !dbg !55
  %cmp = icmp eq i32 %0, 8, !dbg !56
  br i1 %cmp, label %if.then, label %ncvm.scf.null.entry.0, !dbg !55

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %instance, align 4, !dbg !57
  %idxprom = zext i32 %1 to i64, !dbg !58
  %arrayidx = getelementptr inbounds [65536 x i16], [65536 x i16]* @Round, i64 0, i64 %idxprom, !dbg !58
  %call.i36 = call zeroext i16 @__ncvm_atomic_cmp_write_lte_u16(i16* nonnull %arrayidx, i16 zeroext %round, i16 zeroext %round) #8, !dbg !59
  %icmp_conv_0_sub = sub i16 %round, %call.i36
  %icmp_conv_0 = call i1 @__ncvm_bit_check_u16(i16 %icmp_conv_0_sub, i8 15), !dbg !63
  br i1 %icmp_conv_0, label %if.then3, label %for.body, !dbg !64

if.then3:                                         ; preds = %if.then
  call void @__ncvm_action_drop() #8, !dbg !65
  br label %ncvm.scf.null.exit.0, !dbg !69

for.body:                                         ; preds = %if.then
  %2 = load i32, i32* %val, align 4, !dbg !70
  %3 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9 = zext i32 %3 to i64, !dbg !72
  %4 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_0_, i64 0, i64 %idxprom9
  %5 = call i32 @__ncvm_atomic_write_u32(i32* %4, i32 %2), !dbg !73
  %arrayidx6.1 = getelementptr inbounds i32, i32* %val, i64 1, !dbg !70
  %6 = load i32, i32* %arrayidx6.1, align 4, !dbg !70
  %7 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.1 = zext i32 %7 to i64, !dbg !72
  %8 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_1_, i64 0, i64 %idxprom9.1
  %9 = call i32 @__ncvm_atomic_write_u32(i32* %8, i32 %6), !dbg !73
  %arrayidx6.2 = getelementptr inbounds i32, i32* %val, i64 2, !dbg !70
  %10 = load i32, i32* %arrayidx6.2, align 4, !dbg !70
  %11 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.2 = zext i32 %11 to i64, !dbg !72
  %12 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_2_, i64 0, i64 %idxprom9.2
  %13 = call i32 @__ncvm_atomic_write_u32(i32* %12, i32 %10), !dbg !73
  %arrayidx6.3 = getelementptr inbounds i32, i32* %val, i64 3, !dbg !70
  %14 = load i32, i32* %arrayidx6.3, align 4, !dbg !70
  %15 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.3 = zext i32 %15 to i64, !dbg !72
  %16 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_3_, i64 0, i64 %idxprom9.3
  %17 = call i32 @__ncvm_atomic_write_u32(i32* %16, i32 %14), !dbg !73
  %arrayidx6.4 = getelementptr inbounds i32, i32* %val, i64 4, !dbg !70
  %18 = load i32, i32* %arrayidx6.4, align 4, !dbg !70
  %19 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.4 = zext i32 %19 to i64, !dbg !72
  %20 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_4_, i64 0, i64 %idxprom9.4
  %21 = call i32 @__ncvm_atomic_write_u32(i32* %20, i32 %18), !dbg !73
  %arrayidx6.5 = getelementptr inbounds i32, i32* %val, i64 5, !dbg !70
  %22 = load i32, i32* %arrayidx6.5, align 4, !dbg !70
  %23 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.5 = zext i32 %23 to i64, !dbg !72
  %24 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_5_, i64 0, i64 %idxprom9.5
  %25 = call i32 @__ncvm_atomic_write_u32(i32* %24, i32 %22), !dbg !73
  %arrayidx6.6 = getelementptr inbounds i32, i32* %val, i64 6, !dbg !70
  %26 = load i32, i32* %arrayidx6.6, align 4, !dbg !70
  %27 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.6 = zext i32 %27 to i64, !dbg !72
  %28 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_6_, i64 0, i64 %idxprom9.6
  %29 = call i32 @__ncvm_atomic_write_u32(i32* %28, i32 %26), !dbg !73
  %arrayidx6.7 = getelementptr inbounds i32, i32* %val, i64 7, !dbg !70
  %30 = load i32, i32* %arrayidx6.7, align 4, !dbg !70
  %31 = load i32, i32* %instance, align 4, !dbg !71
  %idxprom9.7 = zext i32 %31 to i64, !dbg !72
  %32 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_7_, i64 0, i64 %idxprom9.7
  %33 = call i32 @__ncvm_atomic_write_u32(i32* %32, i32 %30), !dbg !73
  %icmp_conv_1_sub = sub i16 %call.i36, %round
  %icmp_conv_1 = call i1 @__ncvm_bit_check_u16(i16 %icmp_conv_1_sub, i8 15), !dbg !74
  %34 = load i32, i32* %instance, align 4, !dbg !75
  %35 = load i8, i8* %vote, align 1, !dbg !76
  %idxprom15 = zext i32 %34 to i64, !dbg !77
  br i1 %icmp_conv_1, label %if.then14, label %if.else, !dbg !78

if.then14:                                        ; preds = %for.body
  %arrayidx16 = getelementptr inbounds [65536 x i8], [65536 x i8]* @_ZZ7learnerR8msg_typeRjtRtRhPjE11VoteHistory, i64 0, i64 %idxprom15, !dbg !77
  %call.i33 = call zeroext i8 @__ncvm_atomic_write_u8(i8* nonnull %arrayidx16, i8 zeroext %35) #8, !dbg !79
  store i8 %call.i33, i8* %votes.0.reg2mem, align 1
  br label %if.end21, !dbg !82

if.else:                                          ; preds = %for.body
  %arrayidx19 = getelementptr inbounds [65536 x i8], [65536 x i8]* @_ZZ7learnerR8msg_typeRjtRtRhPjE11VoteHistory, i64 0, i64 %idxprom15, !dbg !83
  %call.i39 = call zeroext i8 @__ncvm_atomic_or_u8(i8* nonnull %arrayidx19, i8 zeroext %35) #8, !dbg !84
  store i8 %call.i39, i8* %votes.0.reg2mem, align 1
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then14
  %votes.0.reload = load i8, i8* %votes.0.reg2mem, align 1
  %36 = load i8, i8* %vote, align 1, !dbg !87
  %and40 = and i8 %36, %votes.0.reload, !dbg !88
  %tobool.not = icmp eq i8 %and40, 0, !dbg !89
  br i1 %tobool.not, label %if.end25, label %if.then24, !dbg !89

if.then24:                                        ; preds = %if.end21
  call void @__ncvm_action_drop() #8, !dbg !90
  br label %ncvm.scf.null.exit.1, !dbg !92

if.end25:                                         ; preds = %if.end21
  %or41 = or i8 %36, %votes.0.reload, !dbg !93
  %37 = getelementptr inbounds [4 x i8], [4 x i8]* @_ZZ7learnerR8msg_typeRjtRtRhPjE8Majority, i64 0, i64 0
  %call.i = call zeroext i1 @__ncvm_lookup_u8(i8* %37, i8 zeroext %or41) #8, !dbg !94
  br i1 %call.i, label %ncvm.scf.null.entry.1, label %if.then30, !dbg !98

if.then30:                                        ; preds = %if.end25
  call void @__ncvm_action_drop() #8, !dbg !99
  br label %ncvm.scf.null.exit.2, !dbg !101

if.end32:                                         ; preds = %ncvm.scf.null.exit.0, %ncvm.scf.null.entry.0
  ret void, !dbg !102

ncvm.scf.null.entry.0:                            ; preds = %entry
  br label %if.end32

ncvm.scf.null.exit.0:                             ; preds = %ncvm.scf.null.exit.1, %if.then3
  br label %if.end32

ncvm.scf.null.exit.1:                             ; preds = %ncvm.scf.null.exit.2, %if.then24
  br label %ncvm.scf.null.exit.0

ncvm.scf.null.exit.2:                             ; preds = %ncvm.scf.null.entry.1, %if.then30
  br label %ncvm.scf.null.exit.1

ncvm.scf.null.entry.1:                            ; preds = %if.end25
  br label %ncvm.scf.null.exit.2
}

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_paxos_lrn.cpp.device.rw() #5 section ".text.startup" !dbg !103 {
entry:
  call void @__cxx_global_var_init(), !dbg !104
  ret void
}

attributes #0 = { "ncvm-loc"="5" "ncvm-net" }
attributes #1 = { "ncvm-const" "ncvm-loc"="5" "ncvm-lookup" "ncvm-net" }
attributes #2 = { "ncvm-net" }
attributes #3 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #6 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #7 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #8 = { nounwind }
attributes #9 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-loc"="5" "ncvm-spec"="1,1,1,1,1,8" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/test-paxos")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!6 = distinct !DISubprogram(name: "__ncvm_read_msg_src", scope: !7, file: !7, line: 11, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def", directory: "/home/gk")
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 11, column: 1, scope: !6)
!10 = distinct !DISubprogram(name: "__ncvm_lookup_u8", scope: !7, file: !7, line: 42, type: !8, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DILocation(line: 42, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "__ncvm_action_drop", scope: !7, file: !7, line: 67, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 67, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "__ncvm_action_send_to_host", scope: !7, file: !7, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 69, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "__ncvm_min_u8", scope: !7, file: !7, line: 117, type: !8, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 117, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "__ncvm_min_u16", scope: !7, file: !7, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 118, column: 1, scope: !18)
!20 = distinct !DISubprogram(name: "__ncvm_min_u32", scope: !7, file: !7, line: 119, type: !8, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 119, column: 1, scope: !20)
!22 = distinct !DISubprogram(name: "__ncvm_min_u64", scope: !7, file: !7, line: 120, type: !8, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 120, column: 1, scope: !22)
!24 = distinct !DISubprogram(name: "__ncvm_bit_check_u16", scope: !7, file: !7, line: 157, type: !8, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 157, column: 1, scope: !24)
!26 = distinct !DISubprogram(name: "__ncvm_bit_half_u16", scope: !7, file: !7, line: 161, type: !8, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 161, column: 1, scope: !26)
!28 = distinct !DISubprogram(name: "__ncvm_bit_half_u32", scope: !7, file: !7, line: 162, type: !8, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 162, column: 1, scope: !28)
!30 = distinct !DISubprogram(name: "__ncvm_bit_half_u64", scope: !7, file: !7, line: 163, type: !8, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 163, column: 1, scope: !30)
!32 = distinct !DISubprogram(name: "__ncvm_atomic_write_u8", scope: !7, file: !7, line: 208, type: !8, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 208, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_atomic_write_u32", scope: !7, file: !7, line: 210, type: !8, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 210, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 245, type: !8, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 245, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 246, type: !8, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 246, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 247, type: !8, scopeLine: 247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 247, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 248, type: !8, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 248, column: 1, scope: !42)
!44 = distinct !DISubprogram(name: "__ncvm_atomic_cmp_write_lte_u16", scope: !7, file: !7, line: 420, type: !8, scopeLine: 420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 420, column: 1, scope: !44)
!46 = distinct !DISubprogram(name: "__ncvm_atomic_or_u8", scope: !7, file: !7, line: 437, type: !8, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 437, column: 1, scope: !46)
!48 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 74, column: 25, scope: !50)
!50 = !DILexicalBlockFile(scope: !48, file: !51, discriminator: 0)
!51 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!52 = !DILocation(line: 0, scope: !48)
!53 = distinct !DISubprogram(name: "learner", scope: !54, file: !54, line: 20, type: !8, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DIFile(filename: "paxos-lrn.cpp", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/test-paxos")
!55 = !DILocation(line: 26, column: 7, scope: !53)
!56 = !DILocation(line: 26, column: 12, scope: !53)
!57 = !DILocation(line: 27, column: 51, scope: !53)
!58 = !DILocation(line: 27, column: 45, scope: !53)
!59 = !DILocation(line: 102, column: 110, scope: !60, inlinedAt: !62)
!60 = distinct !DISubprogram(name: "atomic_cmp_write_lte", scope: !61, file: !61, line: 102, type: !8, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!62 = distinct !DILocation(line: 27, column: 23, scope: !53)
!63 = !DILocation(line: 31, column: 15, scope: !53)
!64 = !DILocation(line: 31, column: 9, scope: !53)
!65 = !DILocation(line: 15, column: 3, scope: !66, inlinedAt: !68)
!66 = distinct !DISubprogram(name: "_drop", scope: !67, file: !67, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!68 = distinct !DILocation(line: 32, column: 14, scope: !53)
!69 = !DILocation(line: 32, column: 7, scope: !53)
!70 = !DILocation(line: 35, column: 28, scope: !53)
!71 = !DILocation(line: 35, column: 16, scope: !53)
!72 = !DILocation(line: 35, column: 7, scope: !53)
!73 = !DILocation(line: 35, column: 26, scope: !53)
!74 = !DILocation(line: 37, column: 15, scope: !53)
!75 = !DILocation(line: 38, column: 41, scope: !53)
!76 = !DILocation(line: 38, column: 52, scope: !53)
!77 = !DILocation(line: 38, column: 29, scope: !53)
!78 = !DILocation(line: 37, column: 9, scope: !53)
!79 = !DILocation(line: 46, column: 84, scope: !80, inlinedAt: !81)
!80 = distinct !DISubprogram(name: "atomic_write", scope: !61, file: !61, line: 46, type: !8, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = distinct !DILocation(line: 38, column: 15, scope: !53)
!82 = !DILocation(line: 38, column: 7, scope: !53)
!83 = !DILocation(line: 40, column: 26, scope: !53)
!84 = !DILocation(line: 287, column: 83, scope: !85, inlinedAt: !86)
!85 = distinct !DISubprogram(name: "atomic_or", scope: !61, file: !61, line: 287, type: !8, scopeLine: 287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = distinct !DILocation(line: 40, column: 15, scope: !53)
!87 = !DILocation(line: 42, column: 17, scope: !53)
!88 = !DILocation(line: 42, column: 15, scope: !53)
!89 = !DILocation(line: 42, column: 9, scope: !53)
!90 = !DILocation(line: 15, column: 3, scope: !66, inlinedAt: !91)
!91 = distinct !DILocation(line: 43, column: 14, scope: !53)
!92 = !DILocation(line: 43, column: 7, scope: !53)
!93 = !DILocation(line: 44, column: 33, scope: !53)
!94 = !DILocation(line: 144, column: 81, scope: !95, inlinedAt: !97)
!95 = distinct !DISubprogram(name: "lookup", scope: !96, file: !96, line: 144, type: !8, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_builtins.h", directory: "/home/gk")
!97 = distinct !DILocation(line: 44, column: 10, scope: !53)
!98 = !DILocation(line: 44, column: 9, scope: !53)
!99 = !DILocation(line: 15, column: 3, scope: !66, inlinedAt: !100)
!100 = distinct !DILocation(line: 45, column: 14, scope: !53)
!101 = !DILocation(line: 45, column: 7, scope: !53)
!102 = !DILocation(line: 47, column: 1, scope: !53)
!103 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_paxos_lrn.cpp.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocation(line: 0, scope: !103)
