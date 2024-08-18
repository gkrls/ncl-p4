; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/cache-ncl/cache.ncl.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/cache-ncl/cache.ncl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"struct.ncl::ncl_kv" = type { i64, i16 }
%"struct.ncl::ncl_kv.0" = type { i64, i32 }

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
@.str.12 = private unnamed_addr constant [81 x i8] c"/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/cache-ncl/cache.ncl\00", section "llvm.metadata"
@Valid0 = global [4096 x i8] zeroinitializer, align 16 #0
@.str.13 = private unnamed_addr constant [10 x i8] c"ncvm:id:1\00", section "llvm.metadata"
@.str.14 = private unnamed_addr constant [12 x i8] c"ncl:managed\00", section "llvm.metadata"
@Valid1 = global [4096 x i8] zeroinitializer, align 16 #1
@.str.15 = private unnamed_addr constant [10 x i8] c"ncvm:id:2\00", section "llvm.metadata"
@Stats0 = global [4096 x i32] zeroinitializer, align 16 #2
@.str.16 = private unnamed_addr constant [10 x i8] c"ncvm:id:3\00", section "llvm.metadata"
@Stats1 = global [4096 x i32] zeroinitializer, align 16 #3
@.str.17 = private unnamed_addr constant [10 x i8] c"ncvm:id:4\00", section "llvm.metadata"
@Index = global [4096 x %"struct.ncl::ncl_kv"] zeroinitializer, align 16 #4
@.str.18 = private unnamed_addr constant [10 x i8] c"ncvm:id:5\00", section "llvm.metadata"
@.str.19 = private unnamed_addr constant [11 x i8] c"ncl:lookup\00", section "llvm.metadata"
@Bitmap = global [8192 x %"struct.ncl::ncl_kv.0"] zeroinitializer, align 16 #5
@.str.20 = private unnamed_addr constant [10 x i8] c"ncvm:id:6\00", section "llvm.metadata"
@c0 = global [16384 x i32] zeroinitializer, align 16 #6
@.str.21 = private unnamed_addr constant [10 x i8] c"ncvm:id:7\00", section "llvm.metadata"
@c1 = global [16384 x i32] zeroinitializer, align 16 #7
@.str.22 = private unnamed_addr constant [10 x i8] c"ncvm:id:8\00", section "llvm.metadata"
@c2 = global [16384 x i32] zeroinitializer, align 16 #8
@.str.23 = private unnamed_addr constant [10 x i8] c"ncvm:id:9\00", section "llvm.metadata"
@c3 = global [16384 x i32] zeroinitializer, align 16 #9
@.str.24 = private unnamed_addr constant [11 x i8] c"ncvm:id:10\00", section "llvm.metadata"
@b0 = global [32768 x i8] zeroinitializer, align 16 #10
@.str.25 = private unnamed_addr constant [11 x i8] c"ncvm:id:11\00", section "llvm.metadata"
@b1 = global [32768 x i8] zeroinitializer, align 16 #11
@.str.26 = private unnamed_addr constant [11 x i8] c"ncvm:id:12\00", section "llvm.metadata"
@b2 = global [32768 x i8] zeroinitializer, align 16 #12
@.str.27 = private unnamed_addr constant [11 x i8] c"ncvm:id:13\00", section "llvm.metadata"
@.str.28 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.29 = private unnamed_addr constant [20 x i8] c"ncvm:spec:1,4,1,1,1\00", section "llvm.metadata"
@.str.30 = private unnamed_addr constant [30 x i8] c"ncvm:slab:1,0,4,0,1,0,1,0,1,0\00", section "llvm.metadata"
@.str.31 = private unnamed_addr constant [77 x i8] c"/home/gk/ws/ncl-staging/build/resources/ncrt-headers/device/intrinsics/tna.h\00", section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_cache.ncl.device.rw, i8* null }]
@Cache_fragment_0_ = internal global [4096 x i32] zeroinitializer #13
@Cache_fragment_1_ = internal global [4096 x i32] zeroinitializer #13
@Cache_fragment_2_ = internal global [4096 x i32] zeroinitializer #13
@Cache_fragment_3_ = internal global [4096 x i32] zeroinitializer #13

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #14 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_lookup_u64_v(i8* %0, i64 %1, i8* %2) #14 !dbg !10 {
entry:
  ret i1 false, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_drop() #14 !dbg !12 {
entry:
  ret void, !dbg !13
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #14 !dbg !14 {
entry:
  ret void, !dbg !15
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_reflect() #14 !dbg !16 {
entry:
  ret void, !dbg !17
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_hash_crc16(i8 zeroext %0, ...) #14 !dbg !18 {
entry:
  ret i16 0, !dbg !19
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_hash_crc32(i8 zeroext %0, ...) #14 !dbg !20 {
entry:
  ret i32 0, !dbg !21
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_hash_crc64(i8 zeroext %0, ...) #14 !dbg !22 {
entry:
  ret i64 0, !dbg !23
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_hash_xor16(i8 zeroext %0, ...) #14 !dbg !24 {
entry:
  ret i16 0, !dbg !25
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_hash_xor32(i8 zeroext %0, ...) #14 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_min_u8(i8 zeroext %0, i8 zeroext %1) #14 !dbg !28 {
entry:
  ret i8 0, !dbg !29
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_min_u16(i16 zeroext %0, i16 zeroext %1) #14 !dbg !30 {
entry:
  ret i16 0, !dbg !31
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_min_u32(i32 %0, i32 %1) #14 !dbg !32 {
entry:
  ret i32 0, !dbg !33
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_min_u64(i64 %0, i64 %1) #14 !dbg !34 {
entry:
  ret i64 0, !dbg !35
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_bit_check_u32(i32 %0, i8 zeroext %1) #14 !dbg !36 {
entry:
  ret i1 false, !dbg !37
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_bit_half_u16(i1 zeroext %0, i16 zeroext %1) #14 !dbg !38 {
entry:
  ret i16 0, !dbg !39
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_bit_half_u32(i1 zeroext %0, i32 %1) #14 !dbg !40 {
entry:
  ret i32 0, !dbg !41
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_bit_half_u64(i1 zeroext %0, i64 %1) #14 !dbg !42 {
entry:
  ret i64 0, !dbg !43
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_read_or_u32(i32* %0, i1 zeroext %1, i32 %2) #15 !dbg !44 {
entry:
  ret i32 0, !dbg !45
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_atomic_write_bool(i8* %0, i1 zeroext %1) #15 !dbg !46 {
entry:
  ret i1 false, !dbg !47
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i1 @__ncvm_atomic_cond_write_bool(i8* %0, i1 zeroext %1, i1 zeroext %2) #15 !dbg !48 {
entry:
  ret i1 false, !dbg !49
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_write_u32(i32* %0, i1 zeroext %1, i32 %2) #15 !dbg !50 {
entry:
  ret i32 0, !dbg !51
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #15 !dbg !52 {
entry:
  ret i8 0, !dbg !53
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #15 !dbg !54 {
entry:
  ret i16 0, !dbg !55
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #15 !dbg !56 {
entry:
  ret i32 0, !dbg !57
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #15 !dbg !58 {
entry:
  ret i64 0, !dbg !59
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_new_u32(i32* %0, i32 %1) #15 !dbg !60 {
entry:
  ret i32 0, !dbg !61
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_sadd_u32(i32* %0, i1 zeroext %1, i32 %2) #15 !dbg !62 {
entry:
  ret i32 0, !dbg !63
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #16 section ".text.startup" !dbg !64 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #19, !dbg !65
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #19, !dbg !68
  ret void, !dbg !65
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #17

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #18

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #19

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z5querymPjR4op_tRjRb(i64 %key, i32* noalias %val, i8* noalias nonnull align 1 dereferenceable(1) %op, i32* noalias nonnull align 4 dereferenceable(4) %mask, i8* noalias nonnull align 1 dereferenceable(1) %hot) #20 !dbg !69 {
entry:
  %cms.i = alloca [4 x i32], align 16
  %cacheline = alloca i16, align 2
  %bitmap = alloca i32, align 4
  %0 = bitcast i16* %cacheline to i8*, !dbg !71
  %1 = bitcast [4096 x %"struct.ncl::ncl_kv"]* @Index to i8*
  %call.i = call zeroext i1 @__ncvm_lookup_u64_v(i8* %1, i64 %key, i8* nonnull %0) #19, !dbg !75
  %2 = bitcast i32* %bitmap to i8*, !dbg !76
  %3 = bitcast [8192 x %"struct.ncl::ncl_kv.0"]* @Bitmap to i8*
  %call.i21 = call zeroext i1 @__ncvm_lookup_u64_v(i8* %3, i64 %key, i8* nonnull %2) #19, !dbg !79
  %4 = load i8, i8* %op, align 1, !dbg !80
  br i1 %call.i21, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  switch i8 %4, label %sw.default [
    i8 3, label %sw.bb
    i8 5, label %sw.bb66
    i8 1, label %sw.bb3
    i8 7, label %sw.bb11
  ], !dbg !82

sw.default:                                       ; preds = %if.then
  call void @__ncvm_action_drop() #19, !dbg !83
  br label %ncvm.scf.null.exit.0, !dbg !87

sw.bb:                                            ; preds = %if.then
  %5 = load i16, i16* %cacheline, align 2, !dbg !88
  %6 = load i32, i32* %bitmap, align 4, !dbg !89
  %idxprom.i25 = zext i16 %5 to i64, !dbg !90
  %arrayidx.i26 = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid0, i64 0, i64 %idxprom.i25, !dbg !90
  %call.i9.i27 = call zeroext i1 @__ncvm_bit_check_u32(i32 %6, i8 zeroext 0) #19, !dbg !93
  %call.i18.i28 = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx.i26, i1 zeroext %call.i9.i27, i1 zeroext false) #19, !dbg !97
  %arrayidx3.i29 = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid1, i64 0, i64 %idxprom.i25, !dbg !101
  %call.i.i30 = call zeroext i1 @__ncvm_bit_check_u32(i32 %6, i8 zeroext 0) #19, !dbg !102
  %lnot.i31 = xor i1 %call.i.i30, true, !dbg !104
  %call.i10.i32 = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx3.i29, i1 zeroext %lnot.i31, i1 zeroext false) #19, !dbg !105
  br label %ncvm.scf.null.exit.0, !dbg !107

sw.bb3:                                           ; preds = %if.then
  %7 = load i32, i32* %bitmap, align 4, !dbg !108
  %call.i22 = call zeroext i1 @__ncvm_bit_check_u32(i32 %7, i8 zeroext 0) #19, !dbg !109
  %8 = load i16, i16* %cacheline, align 2, !dbg !112
  %idxprom = zext i16 %8 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid0, i64 0, i64 %idxprom, !dbg !114
  %arrayidx6 = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid1, i64 0, i64 %idxprom, !dbg !114
  %cond.in.in.in = select i1 %call.i22, i8* %arrayidx, i8* %arrayidx6, !dbg !114
  %cond.in.in = load i8, i8* %cond.in.in.in, align 1, !dbg !115
  %cond.in = and i8 %cond.in.in, 1, !dbg !115
  %cond.not = icmp eq i8 %cond.in, 0, !dbg !114
  br i1 %cond.not, label %ncvm.scf.null.entry.0, label %if.then8, !dbg !114

if.then8:                                         ; preds = %sw.bb3
  %9 = load i16, i16* %cacheline, align 2, !dbg !116
  %10 = load i32, i32* %bitmap, align 4, !dbg !117
  %idxprom1.i38 = zext i16 %9 to i64, !dbg !118
  %11 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_0_, i64 0, i64 %idxprom1.i38
  %call.i.i41 = call zeroext i1 @__ncvm_bit_check_u32(i32 %10, i8 zeroext 0) #19, !dbg !121
  %call.i6.i42 = call i32 @__ncvm_atomic_cond_read_or_u32(i32* nonnull %11, i1 zeroext %call.i.i41, i32 0) #19, !dbg !123
  store i32 %call.i6.i42, i32* %val, align 4, !dbg !126
  %12 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_1_, i64 0, i64 %idxprom1.i38
  %call.i.i41.1 = call zeroext i1 @__ncvm_bit_check_u32(i32 %10, i8 zeroext 1) #19, !dbg !121
  %call.i6.i42.1 = call i32 @__ncvm_atomic_cond_read_or_u32(i32* nonnull %12, i1 zeroext %call.i.i41.1, i32 0) #19, !dbg !123
  %arrayidx5.i.1 = getelementptr inbounds i32, i32* %val, i64 1, !dbg !127
  store i32 %call.i6.i42.1, i32* %arrayidx5.i.1, align 4, !dbg !126
  %13 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_2_, i64 0, i64 %idxprom1.i38
  %call.i.i41.2 = call zeroext i1 @__ncvm_bit_check_u32(i32 %10, i8 zeroext 2) #19, !dbg !121
  %call.i6.i42.2 = call i32 @__ncvm_atomic_cond_read_or_u32(i32* nonnull %13, i1 zeroext %call.i.i41.2, i32 0) #19, !dbg !123
  %arrayidx5.i.2 = getelementptr inbounds i32, i32* %val, i64 2, !dbg !127
  store i32 %call.i6.i42.2, i32* %arrayidx5.i.2, align 4, !dbg !126
  %14 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_3_, i64 0, i64 %idxprom1.i38
  %call.i.i41.3 = call zeroext i1 @__ncvm_bit_check_u32(i32 %10, i8 zeroext 3) #19, !dbg !121
  %call.i6.i42.3 = call i32 @__ncvm_atomic_cond_read_or_u32(i32* nonnull %14, i1 zeroext %call.i.i41.3, i32 0) #19, !dbg !123
  %arrayidx5.i.3 = getelementptr inbounds i32, i32* %val, i64 3, !dbg !127
  store i32 %call.i6.i42.3, i32* %arrayidx5.i.3, align 4, !dbg !126
  %15 = load i16, i16* %cacheline, align 2, !dbg !128
  %16 = load i32, i32* %bitmap, align 4, !dbg !129
  %idxprom.i45 = zext i16 %15 to i64, !dbg !130
  %arrayidx.i46 = getelementptr inbounds [4096 x i32], [4096 x i32]* @Stats0, i64 0, i64 %idxprom.i45, !dbg !130
  %call.i8.i = call zeroext i1 @__ncvm_bit_check_u32(i32 %16, i8 zeroext 0) #19, !dbg !133
  %call.i15.i = call i32 @__ncvm_atomic_cond_sadd_u32(i32* nonnull %arrayidx.i46, i1 zeroext %call.i8.i, i32 1) #19, !dbg !135
  %arrayidx3.i47 = getelementptr inbounds [4096 x i32], [4096 x i32]* @Stats1, i64 0, i64 %idxprom.i45, !dbg !138
  %call.i.i48 = call zeroext i1 @__ncvm_bit_check_u32(i32 %16, i8 zeroext 0) #19, !dbg !139
  %lnot.i49 = xor i1 %call.i.i48, true, !dbg !141
  %call.i9.i50 = call i32 @__ncvm_atomic_cond_sadd_u32(i32* nonnull %arrayidx3.i47, i1 zeroext %lnot.i49, i32 1) #19, !dbg !142
  store i8 2, i8* %op, align 1, !dbg !144
  %17 = load i32, i32* %bitmap, align 4, !dbg !145
  store i32 %17, i32* %mask, align 4, !dbg !146
  call void @__ncvm_action_reflect() #19, !dbg !147
  br label %ncvm.scf.null.exit.2, !dbg !150

sw.bb11:                                          ; preds = %if.then
  store i8 8, i8* %op, align 1, !dbg !151
  %18 = load i16, i16* %cacheline, align 2, !dbg !152
  %19 = load i32, i32* %bitmap, align 4, !dbg !153
  %idxprom.i = zext i16 %18 to i64, !dbg !154
  %arrayidx.i = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid0, i64 0, i64 %idxprom.i, !dbg !154
  %call.i9.i = call zeroext i1 @__ncvm_bit_check_u32(i32 %19, i8 zeroext 0) #19, !dbg !156
  %call.i18.i = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx.i, i1 zeroext %call.i9.i, i1 zeroext true) #19, !dbg !158
  %arrayidx3.i = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid1, i64 0, i64 %idxprom.i, !dbg !160
  %call.i.i = call zeroext i1 @__ncvm_bit_check_u32(i32 %19, i8 zeroext 0) #19, !dbg !161
  %lnot.i = xor i1 %call.i.i, true, !dbg !163
  %call.i10.i = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx3.i, i1 zeroext %lnot.i, i1 zeroext true) #19, !dbg !164
  %20 = load i16, i16* %cacheline, align 2, !dbg !166
  %21 = load i32, i32* %bitmap, align 4, !dbg !167
  %idxprom1.i = zext i16 %20 to i64, !dbg !168
  %22 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_0_, i64 0, i64 %idxprom1.i
  %call.i.i24 = call zeroext i1 @__ncvm_bit_check_u32(i32 %21, i8 zeroext 0) #19, !dbg !171
  %23 = load i32, i32* %val, align 4, !dbg !173
  %call.i6.i = call i32 @__ncvm_atomic_cond_write_u32(i32* nonnull %22, i1 zeroext %call.i.i24, i32 %23) #19, !dbg !174
  %24 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_1_, i64 0, i64 %idxprom1.i
  %call.i.i24.1 = call zeroext i1 @__ncvm_bit_check_u32(i32 %21, i8 zeroext 1) #19, !dbg !171
  %arrayidx4.i.1 = getelementptr inbounds i32, i32* %val, i64 1, !dbg !173
  %25 = load i32, i32* %arrayidx4.i.1, align 4, !dbg !173
  %call.i6.i.1 = call i32 @__ncvm_atomic_cond_write_u32(i32* nonnull %24, i1 zeroext %call.i.i24.1, i32 %25) #19, !dbg !174
  %26 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_2_, i64 0, i64 %idxprom1.i
  %call.i.i24.2 = call zeroext i1 @__ncvm_bit_check_u32(i32 %21, i8 zeroext 2) #19, !dbg !171
  %arrayidx4.i.2 = getelementptr inbounds i32, i32* %val, i64 2, !dbg !173
  %27 = load i32, i32* %arrayidx4.i.2, align 4, !dbg !173
  %call.i6.i.2 = call i32 @__ncvm_atomic_cond_write_u32(i32* nonnull %26, i1 zeroext %call.i.i24.2, i32 %27) #19, !dbg !174
  %28 = getelementptr [4096 x i32], [4096 x i32]* @Cache_fragment_3_, i64 0, i64 %idxprom1.i
  %call.i.i24.3 = call zeroext i1 @__ncvm_bit_check_u32(i32 %21, i8 zeroext 3) #19, !dbg !171
  %arrayidx4.i.3 = getelementptr inbounds i32, i32* %val, i64 3, !dbg !173
  %29 = load i32, i32* %arrayidx4.i.3, align 4, !dbg !173
  %call.i6.i.3 = call i32 @__ncvm_atomic_cond_write_u32(i32* nonnull %28, i1 zeroext %call.i.i24.3, i32 %29) #19, !dbg !174
  call void @__ncvm_action_reflect() #19, !dbg !177
  br label %ncvm.scf.null.exit.0, !dbg !179

if.else:                                          ; preds = %entry
  %cmp = icmp eq i8 %4, 1, !dbg !180
  br i1 %cmp, label %if.then15, label %ncvm.scf.null.entry.1, !dbg !181

if.then15:                                        ; preds = %if.else
  %30 = bitcast [4 x i32]* %cms.i to i8*, !dbg !182
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %30), !dbg !182
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %30, i8 0, i64 16, i1 false) #19, !dbg !182
  %call.i60.i = call zeroext i16 (i8, ...) @__ncvm_hash_crc16(i8 zeroext 14, i64 %key) #19, !dbg !182
  %idxprom.i52 = zext i16 %call.i60.i to i64, !dbg !188
  %arrayidx.i53 = getelementptr inbounds [16384 x i32], [16384 x i32]* @c0, i64 0, i64 %idxprom.i52, !dbg !188
  %call.i59.i = call i32 @__ncvm_atomic_sadd_new_u32(i32* nonnull %arrayidx.i53, i32 1) #19, !dbg !189
  %arrayidx2.i54 = getelementptr inbounds [4 x i32], [4 x i32]* %cms.i, i64 0, i64 0, !dbg !192
  store i32 %call.i59.i, i32* %arrayidx2.i54, align 16, !dbg !193
  %call.i62.i = call i32 (i8, ...) @__ncvm_hash_crc32(i8 zeroext 14, i64 %key) #19, !dbg !194
  %idxprom4.i = zext i32 %call.i62.i to i64, !dbg !197
  %arrayidx5.i55 = getelementptr inbounds [16384 x i32], [16384 x i32]* @c1, i64 0, i64 %idxprom4.i, !dbg !197
  %call.i56.i = call i32 @__ncvm_atomic_sadd_new_u32(i32* nonnull %arrayidx5.i55, i32 1) #19, !dbg !198
  %arrayidx7.i = getelementptr inbounds [4 x i32], [4 x i32]* %cms.i, i64 0, i64 1, !dbg !200
  store i32 %call.i56.i, i32* %arrayidx7.i, align 4, !dbg !201
  %call.i64.i = call i64 (i8, ...) @__ncvm_hash_crc64(i8 zeroext 14, i64 %key) #19, !dbg !202
  %arrayidx9.i = getelementptr inbounds [16384 x i32], [16384 x i32]* @c2, i64 0, i64 %call.i64.i, !dbg !205
  %call.i53.i = call i32 @__ncvm_atomic_sadd_new_u32(i32* nonnull %arrayidx9.i, i32 1) #19, !dbg !206
  %arrayidx11.i = getelementptr inbounds [4 x i32], [4 x i32]* %cms.i, i64 0, i64 2, !dbg !208
  store i32 %call.i53.i, i32* %arrayidx11.i, align 8, !dbg !209
  %call.i66.i = call zeroext i16 (i8, ...) @__ncvm_hash_xor16(i8 zeroext 14, i64 %key) #19, !dbg !210
  %idxprom13.i = zext i16 %call.i66.i to i64, !dbg !213
  %arrayidx14.i = getelementptr inbounds [16384 x i32], [16384 x i32]* @c3, i64 0, i64 %idxprom13.i, !dbg !213
  %call.i50.i = call i32 @__ncvm_atomic_sadd_new_u32(i32* nonnull %arrayidx14.i, i32 1) #19, !dbg !214
  %arrayidx16.i = getelementptr inbounds [4 x i32], [4 x i32]* %cms.i, i64 0, i64 3, !dbg !216
  store i32 %call.i50.i, i32* %arrayidx16.i, align 4, !dbg !217
  %31 = load i32, i32* %arrayidx2.i54, align 16, !dbg !218
  %32 = load i32, i32* %arrayidx7.i, align 4, !dbg !219
  %icmp_conv_0_sub = sub i32 %32, %31
  %icmp_conv_0 = call i1 @__ncvm_bit_check_u32(i32 %icmp_conv_0_sub, i8 31), !dbg !220
  %spec.select73.i.1 = select i1 %icmp_conv_0, i32 %32, i32 %31, !dbg !219
  %33 = load i32, i32* %arrayidx11.i, align 8, !dbg !219
  %icmp_conv_1_sub = sub i32 %33, %spec.select73.i.1
  %icmp_conv_1 = call i1 @__ncvm_bit_check_u32(i32 %icmp_conv_1_sub, i8 31), !dbg !220
  %spec.select73.i.2 = select i1 %icmp_conv_1, i32 %33, i32 %spec.select73.i.1, !dbg !219
  %icmp_conv_2_sub = sub i32 %call.i50.i, %spec.select73.i.2
  %icmp_conv_2 = call i1 @__ncvm_bit_check_u32(i32 %icmp_conv_2_sub, i8 31), !dbg !220
  %spec.select73.i.3 = select i1 %icmp_conv_2, i32 %call.i50.i, i32 %spec.select73.i.2, !dbg !219
  %icmp_conv_3_sub = sub i32 4096, %spec.select73.i.3
  %icmp_conv_3 = call i1 @__ncvm_bit_check_u32(i32 %icmp_conv_3_sub, i8 31), !dbg !221
  br i1 %icmp_conv_3, label %if.then.i, label %ncvm.scf.null.entry.2, !dbg !222

if.then.i:                                        ; preds = %if.then15
  %call.i68.i = call i32 (i8, ...) @__ncvm_hash_xor32(i8 zeroext 15, i64 %key) #19, !dbg !223
  %idxprom25.i = zext i32 %call.i68.i to i64, !dbg !226
  %arrayidx26.i = getelementptr inbounds [32768 x i8], [32768 x i8]* @b0, i64 0, i64 %idxprom25.i, !dbg !226
  %call.i47.i = call zeroext i1 @__ncvm_atomic_write_bool(i8* nonnull %arrayidx26.i, i1 zeroext true) #19, !dbg !227
  %call.i70.i = call i32 (i8, ...) @__ncvm_hash_crc32(i8 zeroext 15, i64 %key) #19, !dbg !230
  %idxprom29.i = zext i32 %call.i70.i to i64, !dbg !233
  %arrayidx30.i = getelementptr inbounds [32768 x i8], [32768 x i8]* @b1, i64 0, i64 %idxprom29.i, !dbg !233
  %call.i43.i = call zeroext i1 @__ncvm_atomic_write_bool(i8* nonnull %arrayidx30.i, i1 zeroext true) #19, !dbg !234
  %call.i72.i = call i64 (i8, ...) @__ncvm_hash_crc64(i8 zeroext 15, i64 %key) #19, !dbg !236
  %arrayidx34.i = getelementptr inbounds [32768 x i8], [32768 x i8]* @b2, i64 0, i64 %call.i72.i, !dbg !239
  %call.i.i61 = call zeroext i1 @__ncvm_atomic_write_bool(i8* nonnull %arrayidx34.i, i1 zeroext true) #19, !dbg !240
  %34 = select i1 %call.i47.i, i1 %call.i43.i, i1 false, !dbg !242
  %spec.select74.i = select i1 %34, i1 %call.i.i61, i1 false, !dbg !242
  %lnot.i62 = xor i1 %spec.select74.i, true, !dbg !243
  %frombool39.i = zext i1 %lnot.i62 to i8, !dbg !244
  store i8 %frombool39.i, i8* %hot, align 1, !dbg !244
  br label %_Z12heavy_hittermRb.exit, !dbg !245

_Z12heavy_hittermRb.exit:                         ; preds = %ncvm.scf.null.entry.2, %if.then.i
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %30), !dbg !246
  br label %ncvm.scf.null.exit.1, !dbg !247

if.end17:                                         ; preds = %ncvm.scf.null.exit.1, %ncvm.scf.null.exit.0
  ret void, !dbg !248

sw.bb66:                                          ; preds = %if.then
  %35 = load i16, i16* %cacheline, align 2, !dbg !88
  %36 = load i32, i32* %bitmap, align 4, !dbg !89
  %idxprom.i2567 = zext i16 %35 to i64, !dbg !90
  %arrayidx.i2668 = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid0, i64 0, i64 %idxprom.i2567, !dbg !90
  %call.i9.i2769 = call zeroext i1 @__ncvm_bit_check_u32(i32 %36, i8 zeroext 0) #19, !dbg !93
  %call.i18.i2870 = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx.i2668, i1 zeroext %call.i9.i2769, i1 zeroext false) #19, !dbg !97
  %arrayidx3.i2971 = getelementptr inbounds [4096 x i8], [4096 x i8]* @Valid1, i64 0, i64 %idxprom.i2567, !dbg !101
  %call.i.i3072 = call zeroext i1 @__ncvm_bit_check_u32(i32 %36, i8 zeroext 0) #19, !dbg !102
  %lnot.i3173 = xor i1 %call.i.i3072, true, !dbg !104
  %call.i10.i3274 = call zeroext i1 @__ncvm_atomic_cond_write_bool(i8* nonnull %arrayidx3.i2971, i1 zeroext %lnot.i3173, i1 zeroext false) #19, !dbg !105
  br label %ncvm.scf.null.exit.0, !dbg !107

ncvm.scf.null.exit.0:                             ; preds = %ncvm.scf.null.exit.2, %sw.bb11, %sw.bb, %sw.bb66, %sw.default
  br label %if.end17

ncvm.scf.null.exit.1:                             ; preds = %ncvm.scf.null.entry.1, %_Z12heavy_hittermRb.exit
  br label %if.end17

ncvm.scf.null.exit.2:                             ; preds = %ncvm.scf.null.entry.0, %if.then8
  br label %ncvm.scf.null.exit.0

ncvm.scf.null.entry.0:                            ; preds = %sw.bb3
  br label %ncvm.scf.null.exit.2

ncvm.scf.null.entry.1:                            ; preds = %if.else
  br label %ncvm.scf.null.exit.1

ncvm.scf.null.entry.2:                            ; preds = %if.then15
  br label %_Z12heavy_hittermRb.exit
}

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_cache.ncl.device.rw() #16 section ".text.startup" !dbg !249 {
entry:
  call void @__cxx_global_var_init(), !dbg !250
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #21

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #22

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #22

attributes #0 = { "ncvm-id"="1" "ncvm-managed" }
attributes #1 = { "ncvm-id"="2" "ncvm-managed" }
attributes #2 = { "ncvm-id"="3" "ncvm-managed" }
attributes #3 = { "ncvm-id"="4" "ncvm-managed" }
attributes #4 = { "ncvm-id"="5" "ncvm-lookup" "ncvm-managed" }
attributes #5 = { "ncvm-id"="6" "ncvm-lookup" "ncvm-managed" }
attributes #6 = { "ncvm-id"="7" "ncvm-managed" }
attributes #7 = { "ncvm-id"="8" "ncvm-managed" }
attributes #8 = { "ncvm-id"="9" "ncvm-managed" }
attributes #9 = { "ncvm-id"="10" "ncvm-managed" }
attributes #10 = { "ncvm-id"="11" "ncvm-managed" }
attributes #11 = { "ncvm-id"="12" "ncvm-managed" }
attributes #12 = { "ncvm-id"="13" "ncvm-managed" }
attributes #13 = { "ncvm-net" }
attributes #14 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #15 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #16 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #17 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #18 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #19 = { nounwind }
attributes #20 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-spec"="1,4,1,1,1" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #21 = { argmemonly nofree nounwind willreturn writeonly }
attributes #22 = { argmemonly nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/cache-ncl")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!6 = distinct !DISubprogram(name: "__ncvm_read_msg_src", scope: !7, file: !7, line: 11, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/common/__lang__/../../../ncvm/intrinsics.def", directory: "/home/gk")
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 11, column: 1, scope: !6)
!10 = distinct !DISubprogram(name: "__ncvm_lookup_u64_v", scope: !7, file: !7, line: 58, type: !8, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DILocation(line: 58, column: 1, scope: !10)
!12 = distinct !DISubprogram(name: "__ncvm_action_drop", scope: !7, file: !7, line: 67, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 67, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "__ncvm_action_send_to_host", scope: !7, file: !7, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 69, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "__ncvm_action_reflect", scope: !7, file: !7, line: 71, type: !8, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocation(line: 71, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "__ncvm_hash_crc16", scope: !7, file: !7, line: 90, type: !8, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 90, column: 1, scope: !18)
!20 = distinct !DISubprogram(name: "__ncvm_hash_crc32", scope: !7, file: !7, line: 91, type: !8, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 91, column: 1, scope: !20)
!22 = distinct !DISubprogram(name: "__ncvm_hash_crc64", scope: !7, file: !7, line: 92, type: !8, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 92, column: 1, scope: !22)
!24 = distinct !DISubprogram(name: "__ncvm_hash_xor16", scope: !7, file: !7, line: 94, type: !8, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 94, column: 1, scope: !24)
!26 = distinct !DISubprogram(name: "__ncvm_hash_xor32", scope: !7, file: !7, line: 95, type: !8, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 95, column: 1, scope: !26)
!28 = distinct !DISubprogram(name: "__ncvm_min_u8", scope: !7, file: !7, line: 117, type: !8, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 117, column: 1, scope: !28)
!30 = distinct !DISubprogram(name: "__ncvm_min_u16", scope: !7, file: !7, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 118, column: 1, scope: !30)
!32 = distinct !DISubprogram(name: "__ncvm_min_u32", scope: !7, file: !7, line: 119, type: !8, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 119, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_min_u64", scope: !7, file: !7, line: 120, type: !8, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 120, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_bit_check_u32", scope: !7, file: !7, line: 158, type: !8, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 158, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_bit_half_u16", scope: !7, file: !7, line: 161, type: !8, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 161, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_bit_half_u32", scope: !7, file: !7, line: 162, type: !8, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 162, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__ncvm_bit_half_u64", scope: !7, file: !7, line: 163, type: !8, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 163, column: 1, scope: !42)
!44 = distinct !DISubprogram(name: "__ncvm_atomic_cond_read_or_u32", scope: !7, file: !7, line: 199, type: !8, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 199, column: 1, scope: !44)
!46 = distinct !DISubprogram(name: "__ncvm_atomic_write_bool", scope: !7, file: !7, line: 206, type: !8, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 206, column: 1, scope: !46)
!48 = distinct !DISubprogram(name: "__ncvm_atomic_cond_write_bool", scope: !7, file: !7, line: 228, type: !8, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 228, column: 1, scope: !48)
!50 = distinct !DISubprogram(name: "__ncvm_atomic_cond_write_u32", scope: !7, file: !7, line: 232, type: !8, scopeLine: 232, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 232, column: 1, scope: !50)
!52 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 256, type: !8, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 256, column: 1, scope: !52)
!54 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 257, type: !8, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 257, column: 1, scope: !54)
!56 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 258, type: !8, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 258, column: 1, scope: !56)
!58 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 259, type: !8, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 259, column: 1, scope: !58)
!60 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_new_u32", scope: !7, file: !7, line: 266, type: !8, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 266, column: 1, scope: !60)
!62 = distinct !DISubprogram(name: "__ncvm_atomic_cond_sadd_u32", scope: !7, file: !7, line: 292, type: !8, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 292, column: 1, scope: !62)
!64 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 74, column: 25, scope: !66)
!66 = !DILexicalBlockFile(scope: !64, file: !67, discriminator: 0)
!67 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!68 = !DILocation(line: 0, scope: !64)
!69 = distinct !DISubprogram(name: "query", scope: !70, file: !70, line: 73, type: !8, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DIFile(filename: "cache.ncl", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/cache-ncl")
!71 = !DILocation(line: 183, column: 166, scope: !72, inlinedAt: !74)
!72 = distinct !DISubprogram(name: "lookup<unsigned short>", scope: !73, file: !73, line: 183, type: !8, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_builtins.h", directory: "/home/gk")
!74 = distinct !DILocation(line: 77, column: 3, scope: !69)
!75 = !DILocation(line: 183, column: 121, scope: !72, inlinedAt: !74)
!76 = !DILocation(line: 183, column: 166, scope: !77, inlinedAt: !78)
!77 = distinct !DISubprogram(name: "lookup<unsigned int>", scope: !73, file: !73, line: 183, type: !8, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = distinct !DILocation(line: 78, column: 7, scope: !69)
!79 = !DILocation(line: 183, column: 121, scope: !77, inlinedAt: !78)
!80 = !DILocation(line: 79, column: 13, scope: !69)
!81 = !DILocation(line: 78, column: 7, scope: !69)
!82 = !DILocation(line: 79, column: 5, scope: !69)
!83 = !DILocation(line: 15, column: 3, scope: !84, inlinedAt: !86)
!84 = distinct !DISubprogram(name: "_drop", scope: !85, file: !85, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!86 = distinct !DILocation(line: 81, column: 14, scope: !69)
!87 = !DILocation(line: 81, column: 7, scope: !69)
!88 = !DILocation(line: 84, column: 20, scope: !69)
!89 = !DILocation(line: 84, column: 31, scope: !69)
!90 = !DILocation(line: 44, column: 22, scope: !91, inlinedAt: !92)
!91 = distinct !DISubprogram(name: "set_validity", scope: !70, file: !70, line: 43, type: !8, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = distinct !DILocation(line: 84, column: 7, scope: !69)
!93 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !96)
!94 = distinct !DISubprogram(name: "bit_chk", scope: !95, file: !95, line: 35, type: !8, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_bits.h", directory: "/home/gk")
!96 = distinct !DILocation(line: 44, column: 41, scope: !91, inlinedAt: !92)
!97 = !DILocation(line: 65, column: 100, scope: !98, inlinedAt: !100)
!98 = distinct !DISubprogram(name: "atomic_cond_write", scope: !99, file: !99, line: 65, type: !8, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!100 = distinct !DILocation(line: 44, column: 3, scope: !91, inlinedAt: !92)
!101 = !DILocation(line: 45, column: 22, scope: !91, inlinedAt: !92)
!102 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !103)
!103 = distinct !DILocation(line: 45, column: 42, scope: !91, inlinedAt: !92)
!104 = !DILocation(line: 45, column: 41, scope: !91, inlinedAt: !92)
!105 = !DILocation(line: 65, column: 100, scope: !98, inlinedAt: !106)
!106 = distinct !DILocation(line: 45, column: 3, scope: !91, inlinedAt: !92)
!107 = !DILocation(line: 85, column: 7, scope: !69)
!108 = !DILocation(line: 87, column: 22, scope: !69)
!109 = !DILocation(line: 26, column: 10, scope: !110, inlinedAt: !111)
!110 = distinct !DISubprogram(name: "bit_chk<(unsigned char)'\\x00'>", scope: !95, file: !95, line: 24, type: !8, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = distinct !DILocation(line: 87, column: 11, scope: !69)
!112 = !DILocation(line: 87, column: 39, scope: !69)
!113 = !DILocation(line: 87, column: 32, scope: !69)
!114 = !DILocation(line: 87, column: 11, scope: !69)
!115 = !DILocation(line: 0, scope: !69)
!116 = !DILocation(line: 88, column: 20, scope: !69)
!117 = !DILocation(line: 88, column: 31, scope: !69)
!118 = !DILocation(line: 35, column: 35, scope: !119, inlinedAt: !120)
!119 = distinct !DISubprogram(name: "read_value", scope: !70, file: !70, line: 33, type: !8, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = distinct !DILocation(line: 88, column: 9, scope: !69)
!121 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !122)
!122 = distinct !DILocation(line: 35, column: 56, scope: !119, inlinedAt: !120)
!123 = !DILocation(line: 38, column: 110, scope: !124, inlinedAt: !125)
!124 = distinct !DISubprogram(name: "atomic_cond_read_or", scope: !99, file: !99, line: 38, type: !8, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = distinct !DILocation(line: 35, column: 14, scope: !119, inlinedAt: !120)
!126 = !DILocation(line: 35, column: 12, scope: !119, inlinedAt: !120)
!127 = !DILocation(line: 35, column: 5, scope: !119, inlinedAt: !120)
!128 = !DILocation(line: 89, column: 15, scope: !69)
!129 = !DILocation(line: 89, column: 26, scope: !69)
!130 = !DILocation(line: 49, column: 21, scope: !131, inlinedAt: !132)
!131 = distinct !DISubprogram(name: "stats", scope: !70, file: !70, line: 48, type: !8, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = distinct !DILocation(line: 89, column: 9, scope: !69)
!133 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !134)
!134 = distinct !DILocation(line: 49, column: 40, scope: !131, inlinedAt: !132)
!135 = !DILocation(line: 187, column: 95, scope: !136, inlinedAt: !137)
!136 = distinct !DISubprogram(name: "atomic_cond_sadd", scope: !99, file: !99, line: 187, type: !8, scopeLine: 187, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = distinct !DILocation(line: 49, column: 3, scope: !131, inlinedAt: !132)
!138 = !DILocation(line: 50, column: 21, scope: !131, inlinedAt: !132)
!139 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !140)
!140 = distinct !DILocation(line: 50, column: 41, scope: !131, inlinedAt: !132)
!141 = !DILocation(line: 50, column: 40, scope: !131, inlinedAt: !132)
!142 = !DILocation(line: 187, column: 95, scope: !136, inlinedAt: !143)
!143 = distinct !DILocation(line: 50, column: 3, scope: !131, inlinedAt: !132)
!144 = !DILocation(line: 90, column: 12, scope: !69)
!145 = !DILocation(line: 91, column: 16, scope: !69)
!146 = !DILocation(line: 91, column: 14, scope: !69)
!147 = !DILocation(line: 65, column: 3, scope: !148, inlinedAt: !149)
!148 = distinct !DISubprogram(name: "_reflect", scope: !85, file: !85, line: 64, type: !8, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = distinct !DILocation(line: 92, column: 16, scope: !69)
!150 = !DILocation(line: 92, column: 9, scope: !69)
!151 = !DILocation(line: 97, column: 10, scope: !69)
!152 = !DILocation(line: 98, column: 20, scope: !69)
!153 = !DILocation(line: 98, column: 31, scope: !69)
!154 = !DILocation(line: 44, column: 22, scope: !91, inlinedAt: !155)
!155 = distinct !DILocation(line: 98, column: 7, scope: !69)
!156 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !157)
!157 = distinct !DILocation(line: 44, column: 41, scope: !91, inlinedAt: !155)
!158 = !DILocation(line: 65, column: 100, scope: !98, inlinedAt: !159)
!159 = distinct !DILocation(line: 44, column: 3, scope: !91, inlinedAt: !155)
!160 = !DILocation(line: 45, column: 22, scope: !91, inlinedAt: !155)
!161 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !162)
!162 = distinct !DILocation(line: 45, column: 42, scope: !91, inlinedAt: !155)
!163 = !DILocation(line: 45, column: 41, scope: !91, inlinedAt: !155)
!164 = !DILocation(line: 65, column: 100, scope: !98, inlinedAt: !165)
!165 = distinct !DILocation(line: 45, column: 3, scope: !91, inlinedAt: !155)
!166 = !DILocation(line: 99, column: 19, scope: !69)
!167 = !DILocation(line: 99, column: 30, scope: !69)
!168 = !DILocation(line: 40, column: 24, scope: !169, inlinedAt: !170)
!169 = distinct !DISubprogram(name: "write_value", scope: !70, file: !70, line: 38, type: !8, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = distinct !DILocation(line: 99, column: 7, scope: !69)
!171 = !DILocation(line: 35, column: 93, scope: !94, inlinedAt: !172)
!172 = distinct !DILocation(line: 40, column: 45, scope: !169, inlinedAt: !170)
!173 = !DILocation(line: 40, column: 65, scope: !169, inlinedAt: !170)
!174 = !DILocation(line: 68, column: 100, scope: !175, inlinedAt: !176)
!175 = distinct !DISubprogram(name: "atomic_cond_write", scope: !99, file: !99, line: 68, type: !8, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = distinct !DILocation(line: 40, column: 5, scope: !169, inlinedAt: !170)
!177 = !DILocation(line: 65, column: 3, scope: !148, inlinedAt: !178)
!178 = distinct !DILocation(line: 100, column: 14, scope: !69)
!179 = !DILocation(line: 100, column: 7, scope: !69)
!180 = !DILocation(line: 103, column: 12, scope: !69)
!181 = !DILocation(line: 103, column: 9, scope: !69)
!182 = !DILocation(line: 28, column: 10, scope: !183, inlinedAt: !185)
!183 = distinct !DISubprogram(name: "crc16<(unsigned char)'\\x0e', unsigned long>", scope: !184, file: !184, line: 24, type: !8, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!184 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/intrinsics/tna.h", directory: "/home/gk")
!185 = distinct !DILocation(line: 55, column: 32, scope: !186, inlinedAt: !187)
!186 = distinct !DISubprogram(name: "heavy_hitter", scope: !70, file: !70, line: 53, type: !8, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!187 = distinct !DILocation(line: 104, column: 7, scope: !69)
!188 = !DILocation(line: 55, column: 29, scope: !186, inlinedAt: !187)
!189 = !DILocation(line: 178, column: 86, scope: !190, inlinedAt: !191)
!190 = distinct !DISubprogram(name: "atomic_sadd_new", scope: !99, file: !99, line: 178, type: !8, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!191 = distinct !DILocation(line: 55, column: 12, scope: !186, inlinedAt: !187)
!192 = !DILocation(line: 55, column: 3, scope: !186, inlinedAt: !187)
!193 = !DILocation(line: 55, column: 10, scope: !186, inlinedAt: !187)
!194 = !DILocation(line: 36, column: 10, scope: !195, inlinedAt: !196)
!195 = distinct !DISubprogram(name: "crc32<(unsigned char)'\\x0e', unsigned long>", scope: !184, file: !184, line: 32, type: !8, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!196 = distinct !DILocation(line: 56, column: 32, scope: !186, inlinedAt: !187)
!197 = !DILocation(line: 56, column: 29, scope: !186, inlinedAt: !187)
!198 = !DILocation(line: 178, column: 86, scope: !190, inlinedAt: !199)
!199 = distinct !DILocation(line: 56, column: 12, scope: !186, inlinedAt: !187)
!200 = !DILocation(line: 56, column: 3, scope: !186, inlinedAt: !187)
!201 = !DILocation(line: 56, column: 10, scope: !186, inlinedAt: !187)
!202 = !DILocation(line: 45, column: 10, scope: !203, inlinedAt: !204)
!203 = distinct !DISubprogram(name: "crc64<(unsigned char)'\\x0e', unsigned long>", scope: !184, file: !184, line: 41, type: !8, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = distinct !DILocation(line: 57, column: 32, scope: !186, inlinedAt: !187)
!205 = !DILocation(line: 57, column: 29, scope: !186, inlinedAt: !187)
!206 = !DILocation(line: 178, column: 86, scope: !190, inlinedAt: !207)
!207 = distinct !DILocation(line: 57, column: 12, scope: !186, inlinedAt: !187)
!208 = !DILocation(line: 57, column: 3, scope: !186, inlinedAt: !187)
!209 = !DILocation(line: 57, column: 10, scope: !186, inlinedAt: !187)
!210 = !DILocation(line: 63, column: 10, scope: !211, inlinedAt: !212)
!211 = distinct !DISubprogram(name: "xor16<(unsigned char)'\\x0e', unsigned long>", scope: !184, file: !184, line: 59, type: !8, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!212 = distinct !DILocation(line: 58, column: 32, scope: !186, inlinedAt: !187)
!213 = !DILocation(line: 58, column: 29, scope: !186, inlinedAt: !187)
!214 = !DILocation(line: 178, column: 86, scope: !190, inlinedAt: !215)
!215 = distinct !DILocation(line: 58, column: 12, scope: !186, inlinedAt: !187)
!216 = !DILocation(line: 58, column: 3, scope: !186, inlinedAt: !187)
!217 = !DILocation(line: 58, column: 10, scope: !186, inlinedAt: !187)
!218 = !DILocation(line: 60, column: 20, scope: !186, inlinedAt: !187)
!219 = !DILocation(line: 62, column: 17, scope: !186, inlinedAt: !187)
!220 = !DILocation(line: 62, column: 24, scope: !186, inlinedAt: !187)
!221 = !DILocation(line: 64, column: 17, scope: !186, inlinedAt: !187)
!222 = !DILocation(line: 64, column: 7, scope: !186, inlinedAt: !187)
!223 = !DILocation(line: 72, column: 10, scope: !224, inlinedAt: !225)
!224 = distinct !DISubprogram(name: "xor32<(unsigned char)'\\x0f', unsigned long>", scope: !184, file: !184, line: 68, type: !8, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!225 = distinct !DILocation(line: 65, column: 31, scope: !186, inlinedAt: !187)
!226 = !DILocation(line: 65, column: 28, scope: !186, inlinedAt: !187)
!227 = !DILocation(line: 45, column: 84, scope: !228, inlinedAt: !229)
!228 = distinct !DISubprogram(name: "atomic_write", scope: !99, file: !99, line: 45, type: !8, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!229 = distinct !DILocation(line: 65, column: 14, scope: !186, inlinedAt: !187)
!230 = !DILocation(line: 36, column: 10, scope: !231, inlinedAt: !232)
!231 = distinct !DISubprogram(name: "crc32<(unsigned char)'\\x0f', unsigned long>", scope: !184, file: !184, line: 32, type: !8, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!232 = distinct !DILocation(line: 66, column: 31, scope: !186, inlinedAt: !187)
!233 = !DILocation(line: 66, column: 28, scope: !186, inlinedAt: !187)
!234 = !DILocation(line: 45, column: 84, scope: !228, inlinedAt: !235)
!235 = distinct !DILocation(line: 66, column: 14, scope: !186, inlinedAt: !187)
!236 = !DILocation(line: 45, column: 10, scope: !237, inlinedAt: !238)
!237 = distinct !DISubprogram(name: "crc64<(unsigned char)'\\x0f', unsigned long>", scope: !184, file: !184, line: 41, type: !8, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!238 = distinct !DILocation(line: 67, column: 31, scope: !186, inlinedAt: !187)
!239 = !DILocation(line: 67, column: 28, scope: !186, inlinedAt: !187)
!240 = !DILocation(line: 45, column: 84, scope: !228, inlinedAt: !241)
!241 = distinct !DILocation(line: 67, column: 14, scope: !186, inlinedAt: !187)
!242 = !DILocation(line: 68, column: 15, scope: !186, inlinedAt: !187)
!243 = !DILocation(line: 68, column: 11, scope: !186, inlinedAt: !187)
!244 = !DILocation(line: 68, column: 9, scope: !186, inlinedAt: !187)
!245 = !DILocation(line: 69, column: 3, scope: !186, inlinedAt: !187)
!246 = !DILocation(line: 70, column: 1, scope: !186, inlinedAt: !187)
!247 = !DILocation(line: 104, column: 7, scope: !69)
!248 = !DILocation(line: 106, column: 1, scope: !69)
!249 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_cache.ncl.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!250 = !DILocation(line: 0, scope: !249)
