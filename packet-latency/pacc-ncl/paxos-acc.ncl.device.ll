; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pacc-ncl/paxos-acc.ncl.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pacc-ncl/paxos-acc.ncl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"struct.ncl::__ncl_builtin_device_t" = type { i8 }

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
@.str.12 = private unnamed_addr constant [84 x i8] c"/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pacc-ncl/paxos-acc.ncl\00", section "llvm.metadata"
@.str.13 = private unnamed_addr constant [15 x i8] c"ncvm:loc:1,2,3\00", section "llvm.metadata"
@Round = global [65536 x i16] zeroinitializer, align 16 #0
@_ZZ8acceptorR8msg_typeRjtRtRhPjE6VRound = internal global [65536 x i16] zeroinitializer, align 16 #0
@_ZN3ncl6deviceE = external global %"struct.ncl::__ncl_builtin_device_t", align 1
@.str.14 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.15 = private unnamed_addr constant [22 x i8] c"ncvm:spec:1,1,1,1,1,8\00", section "llvm.metadata"
@.str.16 = private unnamed_addr constant [34 x i8] c"ncvm:slab:1,0,1,0,1,0,1,0,1,0,8,0\00", section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_paxos_acc.ncl.device.rw, i8* null }]
@Value_fragment_0_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_1_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_2_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_3_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_4_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_5_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_6_ = internal global [65536 x i32] zeroinitializer #1
@Value_fragment_7_ = internal global [65536 x i32] zeroinitializer #1

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #2 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_device_id() #2 !dbg !10 {
entry:
  ret i8 0, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_drop() #2 !dbg !12 {
entry:
  ret void, !dbg !13
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #2 !dbg !14 {
entry:
  ret void, !dbg !15
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_device(i16 zeroext %0) #2 !dbg !16 {
entry:
  ret void, !dbg !17
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_multicast(i16 zeroext %0) #2 !dbg !18 {
entry:
  ret void, !dbg !19
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_min_u8(i8 zeroext %0, i8 zeroext %1) #2 !dbg !20 {
entry:
  ret i8 0, !dbg !21
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_min_u16(i16 zeroext %0, i16 zeroext %1) #2 !dbg !22 {
entry:
  ret i16 0, !dbg !23
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_min_u32(i32 %0, i32 %1) #2 !dbg !24 {
entry:
  ret i32 0, !dbg !25
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_min_u64(i64 %0, i64 %1) #2 !dbg !26 {
entry:
  ret i64 0, !dbg !27
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_bit_half_u16(i1 zeroext %0, i16 zeroext %1) #2 !dbg !28 {
entry:
  ret i16 0, !dbg !29
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_bit_half_u32(i1 zeroext %0, i32 %1) #2 !dbg !30 {
entry:
  ret i32 0, !dbg !31
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_bit_half_u64(i1 zeroext %0, i64 %1) #2 !dbg !32 {
entry:
  ret i64 0, !dbg !33
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_write_u16(i16* %0, i16 zeroext %1) #3 !dbg !34 {
entry:
  ret i16 0, !dbg !35
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_write_u32(i32* %0, i32 %1) #3 !dbg !36 {
entry:
  ret i32 0, !dbg !37
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #3 !dbg !38 {
entry:
  ret i8 0, !dbg !39
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #3 !dbg !40 {
entry:
  ret i16 0, !dbg !41
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #3 !dbg !42 {
entry:
  ret i32 0, !dbg !43
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #3 !dbg !44 {
entry:
  ret i64 0, !dbg !45
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_max_new_u16(i16* %0, i16 zeroext %1) #3 !dbg !46 {
entry:
  ret i16 0, !dbg !47
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #4 section ".text.startup" !dbg !48 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #7, !dbg !49
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #7, !dbg !52
  ret void, !dbg !49
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #6

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #7

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z8acceptorR8msg_typeRjtRtRhPj(i32* noalias nonnull align 4 dereferenceable(4) %type, i32* noalias nonnull align 4 dereferenceable(4) %instance, i16 zeroext %round, i16* noalias nonnull align 2 dereferenceable(2) %vround, i8* noalias nonnull align 1 dereferenceable(1) %vote, i32* noalias %val) #8 !dbg !53 {
entry:
  %0 = load i32, i32* %type, align 4, !dbg !55
  %and = and i32 %0, 5, !dbg !56
  %cmp = icmp eq i32 %and, 0, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  call void @__ncvm_action_drop() #7, !dbg !59
  br label %if.end33, !dbg !63

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %instance, align 4, !dbg !64
  %idxprom = zext i32 %1 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [65536 x i16], [65536 x i16]* @Round, i64 0, i64 %idxprom, !dbg !65
  %call.i = call zeroext i16 @__ncvm_atomic_max_new_u16(i16* nonnull %arrayidx, i16 zeroext %round) #7, !dbg !66
  %cmp2 = icmp eq i16 %call.i, %round, !dbg !70
  br i1 %cmp2, label %if.then3, label %ncvm.scf.null.entry.0, !dbg !71

if.then3:                                         ; preds = %if.end
  store i8 1, i8* %vote, align 1, !dbg !72
  %2 = load i32, i32* %type, align 4, !dbg !73
  %cmp7 = icmp eq i32 %2, 1, !dbg !74
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !73

if.then8:                                         ; preds = %if.then3
  store i32 2, i32* %type, align 4, !dbg !75
  %3 = load i32, i32* %instance, align 4, !dbg !76
  %idxprom9 = zext i32 %3 to i64, !dbg !77
  %arrayidx10 = getelementptr inbounds [65536 x i16], [65536 x i16]* @_ZZ8acceptorR8msg_typeRjtRtRhPjE6VRound, i64 0, i64 %idxprom9, !dbg !77
  %4 = load i16, i16* %arrayidx10, align 2, !dbg !77
  store i16 %4, i16* %vround, align 2, !dbg !78
  %5 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14 = zext i32 %5 to i64, !dbg !80
  %6 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_0_, i64 0, i64 %idxprom14
  %7 = load i32, i32* %6, align 4, !dbg !80
  store i32 %7, i32* %val, align 4, !dbg !81
  %8 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.1 = zext i32 %8 to i64, !dbg !80
  %9 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_1_, i64 0, i64 %idxprom14.1
  %10 = load i32, i32* %9, align 4, !dbg !80
  %arrayidx17.1 = getelementptr inbounds i32, i32* %val, i64 1, !dbg !82
  store i32 %10, i32* %arrayidx17.1, align 4, !dbg !81
  %11 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.2 = zext i32 %11 to i64, !dbg !80
  %12 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_2_, i64 0, i64 %idxprom14.2
  %13 = load i32, i32* %12, align 4, !dbg !80
  %arrayidx17.2 = getelementptr inbounds i32, i32* %val, i64 2, !dbg !82
  store i32 %13, i32* %arrayidx17.2, align 4, !dbg !81
  %14 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.3 = zext i32 %14 to i64, !dbg !80
  %15 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_3_, i64 0, i64 %idxprom14.3
  %16 = load i32, i32* %15, align 4, !dbg !80
  %arrayidx17.3 = getelementptr inbounds i32, i32* %val, i64 3, !dbg !82
  store i32 %16, i32* %arrayidx17.3, align 4, !dbg !81
  %17 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.4 = zext i32 %17 to i64, !dbg !80
  %18 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_4_, i64 0, i64 %idxprom14.4
  %19 = load i32, i32* %18, align 4, !dbg !80
  %arrayidx17.4 = getelementptr inbounds i32, i32* %val, i64 4, !dbg !82
  store i32 %19, i32* %arrayidx17.4, align 4, !dbg !81
  %20 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.5 = zext i32 %20 to i64, !dbg !80
  %21 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_5_, i64 0, i64 %idxprom14.5
  %22 = load i32, i32* %21, align 4, !dbg !80
  %arrayidx17.5 = getelementptr inbounds i32, i32* %val, i64 5, !dbg !82
  store i32 %22, i32* %arrayidx17.5, align 4, !dbg !81
  %23 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.6 = zext i32 %23 to i64, !dbg !80
  %24 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_6_, i64 0, i64 %idxprom14.6
  %25 = load i32, i32* %24, align 4, !dbg !80
  %arrayidx17.6 = getelementptr inbounds i32, i32* %val, i64 6, !dbg !82
  store i32 %25, i32* %arrayidx17.6, align 4, !dbg !81
  %26 = load i32, i32* %instance, align 4, !dbg !79
  %idxprom14.7 = zext i32 %26 to i64, !dbg !80
  %27 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_7_, i64 0, i64 %idxprom14.7
  %28 = load i32, i32* %27, align 4, !dbg !80
  %arrayidx17.7 = getelementptr inbounds i32, i32* %val, i64 7, !dbg !82
  store i32 %28, i32* %arrayidx17.7, align 4, !dbg !81
  call void @__ncvm_action_send_to_device(i16 zeroext 4) #7, !dbg !83
  br label %ncvm.scf.null.exit.1, !dbg !86

if.else:                                          ; preds = %if.then3
  store i32 8, i32* %type, align 4, !dbg !87
  %29 = load i32, i32* %instance, align 4, !dbg !88
  %idxprom18 = zext i32 %29 to i64, !dbg !89
  %arrayidx19 = getelementptr inbounds [65536 x i16], [65536 x i16]* @_ZZ8acceptorR8msg_typeRjtRtRhPjE6VRound, i64 0, i64 %idxprom18, !dbg !89
  %30 = call i16 @__ncvm_atomic_write_u16(i16* %arrayidx19, i16 %round), !dbg !90
  %31 = load i32, i32* %val, align 4, !dbg !91
  %32 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28 = zext i32 %32 to i64, !dbg !93
  %33 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_0_, i64 0, i64 %idxprom28
  %34 = call i32 @__ncvm_atomic_write_u32(i32* %33, i32 %31), !dbg !94
  %arrayidx25.1 = getelementptr inbounds i32, i32* %val, i64 1, !dbg !91
  %35 = load i32, i32* %arrayidx25.1, align 4, !dbg !91
  %36 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.1 = zext i32 %36 to i64, !dbg !93
  %37 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_1_, i64 0, i64 %idxprom28.1
  %38 = call i32 @__ncvm_atomic_write_u32(i32* %37, i32 %35), !dbg !94
  %arrayidx25.2 = getelementptr inbounds i32, i32* %val, i64 2, !dbg !91
  %39 = load i32, i32* %arrayidx25.2, align 4, !dbg !91
  %40 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.2 = zext i32 %40 to i64, !dbg !93
  %41 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_2_, i64 0, i64 %idxprom28.2
  %42 = call i32 @__ncvm_atomic_write_u32(i32* %41, i32 %39), !dbg !94
  %arrayidx25.3 = getelementptr inbounds i32, i32* %val, i64 3, !dbg !91
  %43 = load i32, i32* %arrayidx25.3, align 4, !dbg !91
  %44 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.3 = zext i32 %44 to i64, !dbg !93
  %45 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_3_, i64 0, i64 %idxprom28.3
  %46 = call i32 @__ncvm_atomic_write_u32(i32* %45, i32 %43), !dbg !94
  %arrayidx25.4 = getelementptr inbounds i32, i32* %val, i64 4, !dbg !91
  %47 = load i32, i32* %arrayidx25.4, align 4, !dbg !91
  %48 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.4 = zext i32 %48 to i64, !dbg !93
  %49 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_4_, i64 0, i64 %idxprom28.4
  %50 = call i32 @__ncvm_atomic_write_u32(i32* %49, i32 %47), !dbg !94
  %arrayidx25.5 = getelementptr inbounds i32, i32* %val, i64 5, !dbg !91
  %51 = load i32, i32* %arrayidx25.5, align 4, !dbg !91
  %52 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.5 = zext i32 %52 to i64, !dbg !93
  %53 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_5_, i64 0, i64 %idxprom28.5
  %54 = call i32 @__ncvm_atomic_write_u32(i32* %53, i32 %51), !dbg !94
  %arrayidx25.6 = getelementptr inbounds i32, i32* %val, i64 6, !dbg !91
  %55 = load i32, i32* %arrayidx25.6, align 4, !dbg !91
  %56 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.6 = zext i32 %56 to i64, !dbg !93
  %57 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_6_, i64 0, i64 %idxprom28.6
  %58 = call i32 @__ncvm_atomic_write_u32(i32* %57, i32 %55), !dbg !94
  %arrayidx25.7 = getelementptr inbounds i32, i32* %val, i64 7, !dbg !91
  %59 = load i32, i32* %arrayidx25.7, align 4, !dbg !91
  %60 = load i32, i32* %instance, align 4, !dbg !92
  %idxprom28.7 = zext i32 %60 to i64, !dbg !93
  %61 = getelementptr [65536 x i32], [65536 x i32]* @Value_fragment_7_, i64 0, i64 %idxprom28.7
  %62 = call i32 @__ncvm_atomic_write_u32(i32* %61, i32 %59), !dbg !94
  call void @__ncvm_action_multicast(i16 zeroext 12) #7, !dbg !95
  br label %ncvm.scf.null.exit.1, !dbg !98

if.end33:                                         ; preds = %ncvm.scf.null.exit.0, %if.then
  ret void, !dbg !99

ncvm.scf.null.exit.0:                             ; preds = %ncvm.scf.null.exit.1, %ncvm.scf.null.entry.0
  br label %if.end33

ncvm.scf.null.entry.0:                            ; preds = %if.end
  br label %ncvm.scf.null.exit.0

ncvm.scf.null.exit.1:                             ; preds = %if.else, %if.then8
  br label %ncvm.scf.null.exit.0
}

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_paxos_acc.ncl.device.rw() #4 section ".text.startup" !dbg !100 {
entry:
  call void @__cxx_global_var_init(), !dbg !101
  ret void
}

attributes #0 = { "ncvm-loc"="1,2,3" "ncvm-net" }
attributes #1 = { "ncvm-net" }
attributes #2 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #6 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #7 = { nounwind }
attributes #8 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-loc"="1,2,3" "ncvm-spec"="1,1,1,1,1,8" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pacc-ncl")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!6 = distinct !DISubprogram(name: "__ncvm_read_msg_src", scope: !7, file: !7, line: 11, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def", directory: "/home/gk")
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 11, column: 1, scope: !6)
!10 = distinct !DISubprogram(name: "__ncvm_read_device_id", scope: !7, file: !7, line: 25, type: !8, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DILocation(line: 25, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "__ncvm_action_drop", scope: !7, file: !7, line: 67, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 67, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "__ncvm_action_send_to_host", scope: !7, file: !7, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 69, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "__ncvm_action_send_to_device", scope: !7, file: !7, line: 70, type: !8, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 70, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "__ncvm_action_multicast", scope: !7, file: !7, line: 73, type: !8, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 73, column: 1, scope: !18)
!20 = distinct !DISubprogram(name: "__ncvm_min_u8", scope: !7, file: !7, line: 117, type: !8, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 117, column: 1, scope: !20)
!22 = distinct !DISubprogram(name: "__ncvm_min_u16", scope: !7, file: !7, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 118, column: 1, scope: !22)
!24 = distinct !DISubprogram(name: "__ncvm_min_u32", scope: !7, file: !7, line: 119, type: !8, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 119, column: 1, scope: !24)
!26 = distinct !DISubprogram(name: "__ncvm_min_u64", scope: !7, file: !7, line: 120, type: !8, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 120, column: 1, scope: !26)
!28 = distinct !DISubprogram(name: "__ncvm_bit_half_u16", scope: !7, file: !7, line: 161, type: !8, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 161, column: 1, scope: !28)
!30 = distinct !DISubprogram(name: "__ncvm_bit_half_u32", scope: !7, file: !7, line: 162, type: !8, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 162, column: 1, scope: !30)
!32 = distinct !DISubprogram(name: "__ncvm_bit_half_u64", scope: !7, file: !7, line: 163, type: !8, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 163, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_atomic_write_u16", scope: !7, file: !7, line: 209, type: !8, scopeLine: 209, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 209, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_atomic_write_u32", scope: !7, file: !7, line: 210, type: !8, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 210, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 256, type: !8, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 256, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 257, type: !8, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 257, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 258, type: !8, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 258, column: 1, scope: !42)
!44 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 259, type: !8, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 259, column: 1, scope: !44)
!46 = distinct !DISubprogram(name: "__ncvm_atomic_max_new_u16", scope: !7, file: !7, line: 377, type: !8, scopeLine: 377, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 377, column: 1, scope: !46)
!48 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 74, column: 25, scope: !50)
!50 = !DILexicalBlockFile(scope: !48, file: !51, discriminator: 0)
!51 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!52 = !DILocation(line: 0, scope: !48)
!53 = distinct !DISubprogram(name: "acceptor", scope: !54, file: !54, line: 22, type: !8, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DIFile(filename: "paxos-acc.ncl", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/pacc-ncl")
!55 = !DILocation(line: 30, column: 8, scope: !53)
!56 = !DILocation(line: 30, column: 13, scope: !53)
!57 = !DILocation(line: 30, column: 38, scope: !53)
!58 = !DILocation(line: 30, column: 7, scope: !53)
!59 = !DILocation(line: 15, column: 3, scope: !60, inlinedAt: !62)
!60 = distinct !DISubprogram(name: "_drop", scope: !61, file: !61, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!62 = distinct !DILocation(line: 31, column: 12, scope: !53)
!63 = !DILocation(line: 31, column: 5, scope: !53)
!64 = !DILocation(line: 34, column: 29, scope: !53)
!65 = !DILocation(line: 34, column: 23, scope: !53)
!66 = !DILocation(line: 280, column: 86, scope: !67, inlinedAt: !69)
!67 = distinct !DISubprogram(name: "atomic_max_new", scope: !68, file: !68, line: 280, type: !8, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!69 = distinct !DILocation(line: 34, column: 7, scope: !53)
!70 = !DILocation(line: 34, column: 47, scope: !53)
!71 = !DILocation(line: 34, column: 7, scope: !53)
!72 = !DILocation(line: 36, column: 10, scope: !53)
!73 = !DILocation(line: 38, column: 9, scope: !53)
!74 = !DILocation(line: 38, column: 14, scope: !53)
!75 = !DILocation(line: 39, column: 12, scope: !53)
!76 = !DILocation(line: 40, column: 23, scope: !53)
!77 = !DILocation(line: 40, column: 16, scope: !53)
!78 = !DILocation(line: 40, column: 14, scope: !53)
!79 = !DILocation(line: 42, column: 27, scope: !53)
!80 = !DILocation(line: 42, column: 18, scope: !53)
!81 = !DILocation(line: 42, column: 16, scope: !53)
!82 = !DILocation(line: 42, column: 9, scope: !53)
!83 = !DILocation(line: 56, column: 3, scope: !84, inlinedAt: !85)
!84 = distinct !DISubprogram(name: "_send_to_device", scope: !61, file: !61, line: 55, type: !8, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = distinct !DILocation(line: 43, column: 14, scope: !53)
!86 = !DILocation(line: 43, column: 7, scope: !53)
!87 = !DILocation(line: 47, column: 12, scope: !53)
!88 = !DILocation(line: 48, column: 14, scope: !53)
!89 = !DILocation(line: 48, column: 7, scope: !53)
!90 = !DILocation(line: 48, column: 24, scope: !53)
!91 = !DILocation(line: 50, column: 30, scope: !53)
!92 = !DILocation(line: 50, column: 18, scope: !53)
!93 = !DILocation(line: 50, column: 9, scope: !53)
!94 = !DILocation(line: 50, column: 28, scope: !53)
!95 = !DILocation(line: 109, column: 3, scope: !96, inlinedAt: !97)
!96 = distinct !DISubprogram(name: "_multicast", scope: !61, file: !61, line: 108, type: !8, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = distinct !DILocation(line: 51, column: 14, scope: !53)
!98 = !DILocation(line: 51, column: 7, scope: !53)
!99 = !DILocation(line: 54, column: 1, scope: !53)
!100 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_paxos_acc.ncl.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 0, scope: !100)
