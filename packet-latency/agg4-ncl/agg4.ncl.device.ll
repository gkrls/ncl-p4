; ModuleID = '/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/agg4-ncl/agg4.ncl.device.rw'
source_filename = "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/agg4-ncl/agg4.ncl"
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
@Expo = global [1024 x i32] zeroinitializer, align 16 #0
@.str.12 = private unnamed_addr constant [79 x i8] c"/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/agg4-ncl/agg4.ncl\00", section "llvm.metadata"
@Count = global [1024 x i32] zeroinitializer, align 16 #0
@.str.13 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.14 = private unnamed_addr constant [25 x i8] c"ncvm:spec:1,1,1,1,1,1,32\00", section "llvm.metadata"
@.str.15 = private unnamed_addr constant [39 x i8] c"ncvm:slab:1,0,1,0,1,0,1,0,1,0,1,0,32,0\00", section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_agg4.ncl.device.rw, i8* null }]
@Bitmap_fragment_0_ = internal global [512 x i32] zeroinitializer #0
@Bitmap_fragment_1_ = internal global [512 x i32] zeroinitializer #0
@Agg_fragment_0_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_1_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_2_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_3_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_4_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_5_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_6_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_7_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_8_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_9_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_10_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_11_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_12_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_13_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_14_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_15_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_16_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_17_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_18_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_19_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_20_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_21_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_22_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_23_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_24_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_25_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_26_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_27_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_28_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_29_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_30_ = internal global [1024 x i32] zeroinitializer #0
@Agg_fragment_31_ = internal global [1024 x i32] zeroinitializer #0

; Function Attrs: mustprogress nounwind
define dso_local zeroext i8 @__ncvm_read_msg_src() #1 !dbg !6 {
entry:
  ret i8 0, !dbg !9
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_send_to_host(i16 zeroext %0) #1 !dbg !10 {
entry:
  ret void, !dbg !11
}

; Function Attrs: mustprogress nounwind
define dso_local void @__ncvm_action_reflect() #1 !dbg !12 {
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
define dso_local zeroext i8 @__ncvm_atomic_sadd_u8(i8* %0, i8 zeroext %1) #2 !dbg !32 {
entry:
  ret i8 0, !dbg !33
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_sadd_u16(i16* %0, i16 zeroext %1) #2 !dbg !34 {
entry:
  ret i16 0, !dbg !35
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_sadd_u32(i32* %0, i32 %1) #2 !dbg !36 {
entry:
  ret i32 0, !dbg !37
}

; Function Attrs: mustprogress nounwind
define dso_local i64 @__ncvm_atomic_sadd_u64(i64* %0, i64 %1) #2 !dbg !38 {
entry:
  ret i64 0, !dbg !39
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_add_new_u32(i32* %0, i1 zeroext %1, i32 %2) #2 !dbg !40 {
entry:
  ret i32 0, !dbg !41
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_dec_u32(i32* %0, i1 zeroext %c) #2 !dbg !42 {
entry:
  ret i32 0, !dbg !43
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_cond_max_new_u32(i32* %0, i1 zeroext %cond, i32 %1) #2 !dbg !44 {
entry:
  ret i32 0, !dbg !45
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_or_u32(i32* %0, i32 %1) #2 !dbg !46 {
entry:
  ret i32 0, !dbg !47
}

; Function Attrs: mustprogress nounwind
define dso_local i32 @__ncvm_atomic_and_u32(i32* %0, i32 %1) #2 !dbg !48 {
entry:
  ret i32 0, !dbg !49
}

; Function Attrs: noinline nounwind
define internal void @__cxx_global_var_init() #3 section ".text.startup" !dbg !50 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit) #6, !dbg !51
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #6, !dbg !54
  ret void, !dbg !51
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #5

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #6

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z9allreducehttjjRjPj(i8 zeroext %ver, i16 zeroext %bmp_idx, i16 zeroext %agg_idx, i32 %mask, i32 %offset, i32* noalias nonnull align 4 dereferenceable(4) %expo, i32* noalias %values) #7 !dbg !55 {
entry:
  %bitmap.0.reg2mem = alloca i32, align 4
  %cmp = icmp eq i8 %ver, 0, !dbg !57
  %idxprom = zext i16 %bmp_idx to i64, !dbg !58
  br i1 %cmp, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  %0 = getelementptr [512 x i32], [512 x i32]* @Bitmap_fragment_0_, i64 0, i64 %idxprom
  %call.i73 = call i32 @__ncvm_atomic_or_u32(i32* nonnull %0, i32 %mask) #6, !dbg !60
  %1 = getelementptr [512 x i32], [512 x i32]* @Bitmap_fragment_1_, i64 0, i64 %idxprom
  %neg = xor i32 %mask, -1, !dbg !64
  %call.i79 = call i32 @__ncvm_atomic_and_u32(i32* nonnull %1, i32 %neg) #6, !dbg !65
  store i32 %call.i73, i32* %bitmap.0.reg2mem, align 4
  br label %if.end, !dbg !68

if.else:                                          ; preds = %entry
  %2 = getelementptr [512 x i32], [512 x i32]* @Bitmap_fragment_0_, i64 0, i64 %idxprom
  %neg6 = xor i32 %mask, -1, !dbg !69
  %call.i76 = call i32 @__ncvm_atomic_and_u32(i32* nonnull %2, i32 %neg6) #6, !dbg !70
  %3 = getelementptr [512 x i32], [512 x i32]* @Bitmap_fragment_1_, i64 0, i64 %idxprom
  %call.i70 = call i32 @__ncvm_atomic_or_u32(i32* nonnull %3, i32 %mask) #6, !dbg !72
  store i32 %call.i70, i32* %bitmap.0.reg2mem, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %bitmap.0.reload = load i32, i32* %bitmap.0.reg2mem, align 4
  %cmp11 = icmp eq i32 %bitmap.0.reload, 0, !dbg !74
  %idxprom13 = zext i16 %agg_idx to i64, !dbg !75
  %4 = load i32, i32* %expo, align 4, !dbg !76
  br i1 %cmp11, label %if.then12, label %if.else24, !dbg !77

if.then12:                                        ; preds = %if.end
  %arrayidx14 = getelementptr inbounds [1024 x i32], [1024 x i32]* @Expo, i64 0, i64 %idxprom13, !dbg !75
  %5 = call i32 @__ncvm_atomic_write_u32(i32* %arrayidx14, i32 %4), !dbg !78
  %6 = load i32, i32* %values, align 4, !dbg !79
  %7 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_0_, i64 0, i64 %idxprom13
  %8 = call i32 @__ncvm_atomic_write_u32(i32* %7, i32 %6), !dbg !80
  %arrayidx17.1 = getelementptr inbounds i32, i32* %values, i64 1, !dbg !79
  %9 = load i32, i32* %arrayidx17.1, align 4, !dbg !79
  %10 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_1_, i64 0, i64 %idxprom13
  %11 = call i32 @__ncvm_atomic_write_u32(i32* %10, i32 %9), !dbg !80
  %arrayidx17.2 = getelementptr inbounds i32, i32* %values, i64 2, !dbg !79
  %12 = load i32, i32* %arrayidx17.2, align 4, !dbg !79
  %13 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_2_, i64 0, i64 %idxprom13
  %14 = call i32 @__ncvm_atomic_write_u32(i32* %13, i32 %12), !dbg !80
  %arrayidx17.3 = getelementptr inbounds i32, i32* %values, i64 3, !dbg !79
  %15 = load i32, i32* %arrayidx17.3, align 4, !dbg !79
  %16 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_3_, i64 0, i64 %idxprom13
  %17 = call i32 @__ncvm_atomic_write_u32(i32* %16, i32 %15), !dbg !80
  %arrayidx17.4 = getelementptr inbounds i32, i32* %values, i64 4, !dbg !79
  %18 = load i32, i32* %arrayidx17.4, align 4, !dbg !79
  %19 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_4_, i64 0, i64 %idxprom13
  %20 = call i32 @__ncvm_atomic_write_u32(i32* %19, i32 %18), !dbg !80
  %arrayidx17.5 = getelementptr inbounds i32, i32* %values, i64 5, !dbg !79
  %21 = load i32, i32* %arrayidx17.5, align 4, !dbg !79
  %22 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_5_, i64 0, i64 %idxprom13
  %23 = call i32 @__ncvm_atomic_write_u32(i32* %22, i32 %21), !dbg !80
  %arrayidx17.6 = getelementptr inbounds i32, i32* %values, i64 6, !dbg !79
  %24 = load i32, i32* %arrayidx17.6, align 4, !dbg !79
  %25 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_6_, i64 0, i64 %idxprom13
  %26 = call i32 @__ncvm_atomic_write_u32(i32* %25, i32 %24), !dbg !80
  %arrayidx17.7 = getelementptr inbounds i32, i32* %values, i64 7, !dbg !79
  %27 = load i32, i32* %arrayidx17.7, align 4, !dbg !79
  %28 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_7_, i64 0, i64 %idxprom13
  %29 = call i32 @__ncvm_atomic_write_u32(i32* %28, i32 %27), !dbg !80
  %arrayidx17.8 = getelementptr inbounds i32, i32* %values, i64 8, !dbg !79
  %30 = load i32, i32* %arrayidx17.8, align 4, !dbg !79
  %31 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_8_, i64 0, i64 %idxprom13
  %32 = call i32 @__ncvm_atomic_write_u32(i32* %31, i32 %30), !dbg !80
  %arrayidx17.9 = getelementptr inbounds i32, i32* %values, i64 9, !dbg !79
  %33 = load i32, i32* %arrayidx17.9, align 4, !dbg !79
  %34 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_9_, i64 0, i64 %idxprom13
  %35 = call i32 @__ncvm_atomic_write_u32(i32* %34, i32 %33), !dbg !80
  %arrayidx17.10 = getelementptr inbounds i32, i32* %values, i64 10, !dbg !79
  %36 = load i32, i32* %arrayidx17.10, align 4, !dbg !79
  %37 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_10_, i64 0, i64 %idxprom13
  %38 = call i32 @__ncvm_atomic_write_u32(i32* %37, i32 %36), !dbg !80
  %arrayidx17.11 = getelementptr inbounds i32, i32* %values, i64 11, !dbg !79
  %39 = load i32, i32* %arrayidx17.11, align 4, !dbg !79
  %40 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_11_, i64 0, i64 %idxprom13
  %41 = call i32 @__ncvm_atomic_write_u32(i32* %40, i32 %39), !dbg !80
  %arrayidx17.12 = getelementptr inbounds i32, i32* %values, i64 12, !dbg !79
  %42 = load i32, i32* %arrayidx17.12, align 4, !dbg !79
  %43 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_12_, i64 0, i64 %idxprom13
  %44 = call i32 @__ncvm_atomic_write_u32(i32* %43, i32 %42), !dbg !80
  %arrayidx17.13 = getelementptr inbounds i32, i32* %values, i64 13, !dbg !79
  %45 = load i32, i32* %arrayidx17.13, align 4, !dbg !79
  %46 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_13_, i64 0, i64 %idxprom13
  %47 = call i32 @__ncvm_atomic_write_u32(i32* %46, i32 %45), !dbg !80
  %arrayidx17.14 = getelementptr inbounds i32, i32* %values, i64 14, !dbg !79
  %48 = load i32, i32* %arrayidx17.14, align 4, !dbg !79
  %49 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_14_, i64 0, i64 %idxprom13
  %50 = call i32 @__ncvm_atomic_write_u32(i32* %49, i32 %48), !dbg !80
  %arrayidx17.15 = getelementptr inbounds i32, i32* %values, i64 15, !dbg !79
  %51 = load i32, i32* %arrayidx17.15, align 4, !dbg !79
  %52 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_15_, i64 0, i64 %idxprom13
  %53 = call i32 @__ncvm_atomic_write_u32(i32* %52, i32 %51), !dbg !80
  %arrayidx17.16 = getelementptr inbounds i32, i32* %values, i64 16, !dbg !79
  %54 = load i32, i32* %arrayidx17.16, align 4, !dbg !79
  %55 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_16_, i64 0, i64 %idxprom13
  %56 = call i32 @__ncvm_atomic_write_u32(i32* %55, i32 %54), !dbg !80
  %arrayidx17.17 = getelementptr inbounds i32, i32* %values, i64 17, !dbg !79
  %57 = load i32, i32* %arrayidx17.17, align 4, !dbg !79
  %58 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_17_, i64 0, i64 %idxprom13
  %59 = call i32 @__ncvm_atomic_write_u32(i32* %58, i32 %57), !dbg !80
  %arrayidx17.18 = getelementptr inbounds i32, i32* %values, i64 18, !dbg !79
  %60 = load i32, i32* %arrayidx17.18, align 4, !dbg !79
  %61 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_18_, i64 0, i64 %idxprom13
  %62 = call i32 @__ncvm_atomic_write_u32(i32* %61, i32 %60), !dbg !80
  %arrayidx17.19 = getelementptr inbounds i32, i32* %values, i64 19, !dbg !79
  %63 = load i32, i32* %arrayidx17.19, align 4, !dbg !79
  %64 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_19_, i64 0, i64 %idxprom13
  %65 = call i32 @__ncvm_atomic_write_u32(i32* %64, i32 %63), !dbg !80
  %arrayidx17.20 = getelementptr inbounds i32, i32* %values, i64 20, !dbg !79
  %66 = load i32, i32* %arrayidx17.20, align 4, !dbg !79
  %67 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_20_, i64 0, i64 %idxprom13
  %68 = call i32 @__ncvm_atomic_write_u32(i32* %67, i32 %66), !dbg !80
  %arrayidx17.21 = getelementptr inbounds i32, i32* %values, i64 21, !dbg !79
  %69 = load i32, i32* %arrayidx17.21, align 4, !dbg !79
  %70 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_21_, i64 0, i64 %idxprom13
  %71 = call i32 @__ncvm_atomic_write_u32(i32* %70, i32 %69), !dbg !80
  %arrayidx17.22 = getelementptr inbounds i32, i32* %values, i64 22, !dbg !79
  %72 = load i32, i32* %arrayidx17.22, align 4, !dbg !79
  %73 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_22_, i64 0, i64 %idxprom13
  %74 = call i32 @__ncvm_atomic_write_u32(i32* %73, i32 %72), !dbg !80
  %arrayidx17.23 = getelementptr inbounds i32, i32* %values, i64 23, !dbg !79
  %75 = load i32, i32* %arrayidx17.23, align 4, !dbg !79
  %76 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_23_, i64 0, i64 %idxprom13
  %77 = call i32 @__ncvm_atomic_write_u32(i32* %76, i32 %75), !dbg !80
  %arrayidx17.24 = getelementptr inbounds i32, i32* %values, i64 24, !dbg !79
  %78 = load i32, i32* %arrayidx17.24, align 4, !dbg !79
  %79 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_24_, i64 0, i64 %idxprom13
  %80 = call i32 @__ncvm_atomic_write_u32(i32* %79, i32 %78), !dbg !80
  %arrayidx17.25 = getelementptr inbounds i32, i32* %values, i64 25, !dbg !79
  %81 = load i32, i32* %arrayidx17.25, align 4, !dbg !79
  %82 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_25_, i64 0, i64 %idxprom13
  %83 = call i32 @__ncvm_atomic_write_u32(i32* %82, i32 %81), !dbg !80
  %arrayidx17.26 = getelementptr inbounds i32, i32* %values, i64 26, !dbg !79
  %84 = load i32, i32* %arrayidx17.26, align 4, !dbg !79
  %85 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_26_, i64 0, i64 %idxprom13
  %86 = call i32 @__ncvm_atomic_write_u32(i32* %85, i32 %84), !dbg !80
  %arrayidx17.27 = getelementptr inbounds i32, i32* %values, i64 27, !dbg !79
  %87 = load i32, i32* %arrayidx17.27, align 4, !dbg !79
  %88 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_27_, i64 0, i64 %idxprom13
  %89 = call i32 @__ncvm_atomic_write_u32(i32* %88, i32 %87), !dbg !80
  %arrayidx17.28 = getelementptr inbounds i32, i32* %values, i64 28, !dbg !79
  %90 = load i32, i32* %arrayidx17.28, align 4, !dbg !79
  %91 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_28_, i64 0, i64 %idxprom13
  %92 = call i32 @__ncvm_atomic_write_u32(i32* %91, i32 %90), !dbg !80
  %arrayidx17.29 = getelementptr inbounds i32, i32* %values, i64 29, !dbg !79
  %93 = load i32, i32* %arrayidx17.29, align 4, !dbg !79
  %94 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_29_, i64 0, i64 %idxprom13
  %95 = call i32 @__ncvm_atomic_write_u32(i32* %94, i32 %93), !dbg !80
  %arrayidx17.30 = getelementptr inbounds i32, i32* %values, i64 30, !dbg !79
  %96 = load i32, i32* %arrayidx17.30, align 4, !dbg !79
  %97 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_30_, i64 0, i64 %idxprom13
  %98 = call i32 @__ncvm_atomic_write_u32(i32* %97, i32 %96), !dbg !80
  %arrayidx17.31 = getelementptr inbounds i32, i32* %values, i64 31, !dbg !79
  %99 = load i32, i32* %arrayidx17.31, align 4, !dbg !79
  %100 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_31_, i64 0, i64 %idxprom13
  %101 = call i32 @__ncvm_atomic_write_u32(i32* %100, i32 %99), !dbg !80
  %arrayidx23 = getelementptr inbounds [1024 x i32], [1024 x i32]* @Count, i64 0, i64 %idxprom13, !dbg !81
  %102 = call i32 @__ncvm_atomic_write_u32(i32* %arrayidx23, i32 3), !dbg !82
  br label %if.end57, !dbg !83

if.else24:                                        ; preds = %if.end
  %and = and i32 %bitmap.0.reload, %mask, !dbg !84
  %arrayidx26 = getelementptr inbounds [1024 x i32], [1024 x i32]* @Expo, i64 0, i64 %idxprom13, !dbg !85
  %tobool.not = icmp eq i32 %and, 0, !dbg !86
  %call.i67 = call i32 @__ncvm_atomic_cond_max_new_u32(i32* nonnull %arrayidx26, i1 zeroext %tobool.not, i32 %4) #6, !dbg !87
  store i32 %call.i67, i32* %expo, align 4, !dbg !90
  %103 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_0_, i64 0, i64 %idxprom13
  %104 = load i32, i32* %values, align 4, !dbg !91
  %call.i = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %103, i1 zeroext %tobool.not, i32 %104) #6, !dbg !92
  store i32 %call.i, i32* %values, align 4, !dbg !95
  %105 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_1_, i64 0, i64 %idxprom13
  %arrayidx39.1 = getelementptr inbounds i32, i32* %values, i64 1, !dbg !91
  %106 = load i32, i32* %arrayidx39.1, align 4, !dbg !91
  %call.i.1 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %105, i1 zeroext %tobool.not, i32 %106) #6, !dbg !92
  store i32 %call.i.1, i32* %arrayidx39.1, align 4, !dbg !95
  %107 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_2_, i64 0, i64 %idxprom13
  %arrayidx39.2 = getelementptr inbounds i32, i32* %values, i64 2, !dbg !91
  %108 = load i32, i32* %arrayidx39.2, align 4, !dbg !91
  %call.i.2 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %107, i1 zeroext %tobool.not, i32 %108) #6, !dbg !92
  store i32 %call.i.2, i32* %arrayidx39.2, align 4, !dbg !95
  %109 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_3_, i64 0, i64 %idxprom13
  %arrayidx39.3 = getelementptr inbounds i32, i32* %values, i64 3, !dbg !91
  %110 = load i32, i32* %arrayidx39.3, align 4, !dbg !91
  %call.i.3 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %109, i1 zeroext %tobool.not, i32 %110) #6, !dbg !92
  store i32 %call.i.3, i32* %arrayidx39.3, align 4, !dbg !95
  %111 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_4_, i64 0, i64 %idxprom13
  %arrayidx39.4 = getelementptr inbounds i32, i32* %values, i64 4, !dbg !91
  %112 = load i32, i32* %arrayidx39.4, align 4, !dbg !91
  %call.i.4 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %111, i1 zeroext %tobool.not, i32 %112) #6, !dbg !92
  store i32 %call.i.4, i32* %arrayidx39.4, align 4, !dbg !95
  %113 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_5_, i64 0, i64 %idxprom13
  %arrayidx39.5 = getelementptr inbounds i32, i32* %values, i64 5, !dbg !91
  %114 = load i32, i32* %arrayidx39.5, align 4, !dbg !91
  %call.i.5 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %113, i1 zeroext %tobool.not, i32 %114) #6, !dbg !92
  store i32 %call.i.5, i32* %arrayidx39.5, align 4, !dbg !95
  %115 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_6_, i64 0, i64 %idxprom13
  %arrayidx39.6 = getelementptr inbounds i32, i32* %values, i64 6, !dbg !91
  %116 = load i32, i32* %arrayidx39.6, align 4, !dbg !91
  %call.i.6 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %115, i1 zeroext %tobool.not, i32 %116) #6, !dbg !92
  store i32 %call.i.6, i32* %arrayidx39.6, align 4, !dbg !95
  %117 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_7_, i64 0, i64 %idxprom13
  %arrayidx39.7 = getelementptr inbounds i32, i32* %values, i64 7, !dbg !91
  %118 = load i32, i32* %arrayidx39.7, align 4, !dbg !91
  %call.i.7 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %117, i1 zeroext %tobool.not, i32 %118) #6, !dbg !92
  store i32 %call.i.7, i32* %arrayidx39.7, align 4, !dbg !95
  %119 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_8_, i64 0, i64 %idxprom13
  %arrayidx39.8 = getelementptr inbounds i32, i32* %values, i64 8, !dbg !91
  %120 = load i32, i32* %arrayidx39.8, align 4, !dbg !91
  %call.i.8 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %119, i1 zeroext %tobool.not, i32 %120) #6, !dbg !92
  store i32 %call.i.8, i32* %arrayidx39.8, align 4, !dbg !95
  %121 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_9_, i64 0, i64 %idxprom13
  %arrayidx39.9 = getelementptr inbounds i32, i32* %values, i64 9, !dbg !91
  %122 = load i32, i32* %arrayidx39.9, align 4, !dbg !91
  %call.i.9 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %121, i1 zeroext %tobool.not, i32 %122) #6, !dbg !92
  store i32 %call.i.9, i32* %arrayidx39.9, align 4, !dbg !95
  %123 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_10_, i64 0, i64 %idxprom13
  %arrayidx39.10 = getelementptr inbounds i32, i32* %values, i64 10, !dbg !91
  %124 = load i32, i32* %arrayidx39.10, align 4, !dbg !91
  %call.i.10 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %123, i1 zeroext %tobool.not, i32 %124) #6, !dbg !92
  store i32 %call.i.10, i32* %arrayidx39.10, align 4, !dbg !95
  %125 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_11_, i64 0, i64 %idxprom13
  %arrayidx39.11 = getelementptr inbounds i32, i32* %values, i64 11, !dbg !91
  %126 = load i32, i32* %arrayidx39.11, align 4, !dbg !91
  %call.i.11 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %125, i1 zeroext %tobool.not, i32 %126) #6, !dbg !92
  store i32 %call.i.11, i32* %arrayidx39.11, align 4, !dbg !95
  %127 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_12_, i64 0, i64 %idxprom13
  %arrayidx39.12 = getelementptr inbounds i32, i32* %values, i64 12, !dbg !91
  %128 = load i32, i32* %arrayidx39.12, align 4, !dbg !91
  %call.i.12 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %127, i1 zeroext %tobool.not, i32 %128) #6, !dbg !92
  store i32 %call.i.12, i32* %arrayidx39.12, align 4, !dbg !95
  %129 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_13_, i64 0, i64 %idxprom13
  %arrayidx39.13 = getelementptr inbounds i32, i32* %values, i64 13, !dbg !91
  %130 = load i32, i32* %arrayidx39.13, align 4, !dbg !91
  %call.i.13 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %129, i1 zeroext %tobool.not, i32 %130) #6, !dbg !92
  store i32 %call.i.13, i32* %arrayidx39.13, align 4, !dbg !95
  %131 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_14_, i64 0, i64 %idxprom13
  %arrayidx39.14 = getelementptr inbounds i32, i32* %values, i64 14, !dbg !91
  %132 = load i32, i32* %arrayidx39.14, align 4, !dbg !91
  %call.i.14 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %131, i1 zeroext %tobool.not, i32 %132) #6, !dbg !92
  store i32 %call.i.14, i32* %arrayidx39.14, align 4, !dbg !95
  %133 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_15_, i64 0, i64 %idxprom13
  %arrayidx39.15 = getelementptr inbounds i32, i32* %values, i64 15, !dbg !91
  %134 = load i32, i32* %arrayidx39.15, align 4, !dbg !91
  %call.i.15 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %133, i1 zeroext %tobool.not, i32 %134) #6, !dbg !92
  store i32 %call.i.15, i32* %arrayidx39.15, align 4, !dbg !95
  %135 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_16_, i64 0, i64 %idxprom13
  %arrayidx39.16 = getelementptr inbounds i32, i32* %values, i64 16, !dbg !91
  %136 = load i32, i32* %arrayidx39.16, align 4, !dbg !91
  %call.i.16 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %135, i1 zeroext %tobool.not, i32 %136) #6, !dbg !92
  store i32 %call.i.16, i32* %arrayidx39.16, align 4, !dbg !95
  %137 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_17_, i64 0, i64 %idxprom13
  %arrayidx39.17 = getelementptr inbounds i32, i32* %values, i64 17, !dbg !91
  %138 = load i32, i32* %arrayidx39.17, align 4, !dbg !91
  %call.i.17 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %137, i1 zeroext %tobool.not, i32 %138) #6, !dbg !92
  store i32 %call.i.17, i32* %arrayidx39.17, align 4, !dbg !95
  %139 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_18_, i64 0, i64 %idxprom13
  %arrayidx39.18 = getelementptr inbounds i32, i32* %values, i64 18, !dbg !91
  %140 = load i32, i32* %arrayidx39.18, align 4, !dbg !91
  %call.i.18 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %139, i1 zeroext %tobool.not, i32 %140) #6, !dbg !92
  store i32 %call.i.18, i32* %arrayidx39.18, align 4, !dbg !95
  %141 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_19_, i64 0, i64 %idxprom13
  %arrayidx39.19 = getelementptr inbounds i32, i32* %values, i64 19, !dbg !91
  %142 = load i32, i32* %arrayidx39.19, align 4, !dbg !91
  %call.i.19 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %141, i1 zeroext %tobool.not, i32 %142) #6, !dbg !92
  store i32 %call.i.19, i32* %arrayidx39.19, align 4, !dbg !95
  %143 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_20_, i64 0, i64 %idxprom13
  %arrayidx39.20 = getelementptr inbounds i32, i32* %values, i64 20, !dbg !91
  %144 = load i32, i32* %arrayidx39.20, align 4, !dbg !91
  %call.i.20 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %143, i1 zeroext %tobool.not, i32 %144) #6, !dbg !92
  store i32 %call.i.20, i32* %arrayidx39.20, align 4, !dbg !95
  %145 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_21_, i64 0, i64 %idxprom13
  %arrayidx39.21 = getelementptr inbounds i32, i32* %values, i64 21, !dbg !91
  %146 = load i32, i32* %arrayidx39.21, align 4, !dbg !91
  %call.i.21 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %145, i1 zeroext %tobool.not, i32 %146) #6, !dbg !92
  store i32 %call.i.21, i32* %arrayidx39.21, align 4, !dbg !95
  %147 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_22_, i64 0, i64 %idxprom13
  %arrayidx39.22 = getelementptr inbounds i32, i32* %values, i64 22, !dbg !91
  %148 = load i32, i32* %arrayidx39.22, align 4, !dbg !91
  %call.i.22 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %147, i1 zeroext %tobool.not, i32 %148) #6, !dbg !92
  store i32 %call.i.22, i32* %arrayidx39.22, align 4, !dbg !95
  %149 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_23_, i64 0, i64 %idxprom13
  %arrayidx39.23 = getelementptr inbounds i32, i32* %values, i64 23, !dbg !91
  %150 = load i32, i32* %arrayidx39.23, align 4, !dbg !91
  %call.i.23 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %149, i1 zeroext %tobool.not, i32 %150) #6, !dbg !92
  store i32 %call.i.23, i32* %arrayidx39.23, align 4, !dbg !95
  %151 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_24_, i64 0, i64 %idxprom13
  %arrayidx39.24 = getelementptr inbounds i32, i32* %values, i64 24, !dbg !91
  %152 = load i32, i32* %arrayidx39.24, align 4, !dbg !91
  %call.i.24 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %151, i1 zeroext %tobool.not, i32 %152) #6, !dbg !92
  store i32 %call.i.24, i32* %arrayidx39.24, align 4, !dbg !95
  %153 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_25_, i64 0, i64 %idxprom13
  %arrayidx39.25 = getelementptr inbounds i32, i32* %values, i64 25, !dbg !91
  %154 = load i32, i32* %arrayidx39.25, align 4, !dbg !91
  %call.i.25 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %153, i1 zeroext %tobool.not, i32 %154) #6, !dbg !92
  store i32 %call.i.25, i32* %arrayidx39.25, align 4, !dbg !95
  %155 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_26_, i64 0, i64 %idxprom13
  %arrayidx39.26 = getelementptr inbounds i32, i32* %values, i64 26, !dbg !91
  %156 = load i32, i32* %arrayidx39.26, align 4, !dbg !91
  %call.i.26 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %155, i1 zeroext %tobool.not, i32 %156) #6, !dbg !92
  store i32 %call.i.26, i32* %arrayidx39.26, align 4, !dbg !95
  %157 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_27_, i64 0, i64 %idxprom13
  %arrayidx39.27 = getelementptr inbounds i32, i32* %values, i64 27, !dbg !91
  %158 = load i32, i32* %arrayidx39.27, align 4, !dbg !91
  %call.i.27 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %157, i1 zeroext %tobool.not, i32 %158) #6, !dbg !92
  store i32 %call.i.27, i32* %arrayidx39.27, align 4, !dbg !95
  %159 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_28_, i64 0, i64 %idxprom13
  %arrayidx39.28 = getelementptr inbounds i32, i32* %values, i64 28, !dbg !91
  %160 = load i32, i32* %arrayidx39.28, align 4, !dbg !91
  %call.i.28 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %159, i1 zeroext %tobool.not, i32 %160) #6, !dbg !92
  store i32 %call.i.28, i32* %arrayidx39.28, align 4, !dbg !95
  %161 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_29_, i64 0, i64 %idxprom13
  %arrayidx39.29 = getelementptr inbounds i32, i32* %values, i64 29, !dbg !91
  %162 = load i32, i32* %arrayidx39.29, align 4, !dbg !91
  %call.i.29 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %161, i1 zeroext %tobool.not, i32 %162) #6, !dbg !92
  store i32 %call.i.29, i32* %arrayidx39.29, align 4, !dbg !95
  %163 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_30_, i64 0, i64 %idxprom13
  %arrayidx39.30 = getelementptr inbounds i32, i32* %values, i64 30, !dbg !91
  %164 = load i32, i32* %arrayidx39.30, align 4, !dbg !91
  %call.i.30 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %163, i1 zeroext %tobool.not, i32 %164) #6, !dbg !92
  store i32 %call.i.30, i32* %arrayidx39.30, align 4, !dbg !95
  %165 = getelementptr [1024 x i32], [1024 x i32]* @Agg_fragment_31_, i64 0, i64 %idxprom13
  %arrayidx39.31 = getelementptr inbounds i32, i32* %values, i64 31, !dbg !91
  %166 = load i32, i32* %arrayidx39.31, align 4, !dbg !91
  %call.i.31 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %165, i1 zeroext %tobool.not, i32 %166) #6, !dbg !92
  store i32 %call.i.31, i32* %arrayidx39.31, align 4, !dbg !95
  %arrayidx47 = getelementptr inbounds [1024 x i32], [1024 x i32]* @Count, i64 0, i64 %idxprom13, !dbg !96
  %call.i61 = call i32 @__ncvm_atomic_cond_dec_u32(i32* nonnull %arrayidx47, i1 zeroext %tobool.not) #6, !dbg !97
  switch i32 %call.i61, label %ncvm.scf.null.entry.0 [
    i32 0, label %if.then52
    i32 1, label %if.then55
  ], !dbg !100

if.then52:                                        ; preds = %if.else24
  call void @__ncvm_action_reflect() #6, !dbg !101
  br label %ncvm.scf.null.exit.0, !dbg !105

if.then55:                                        ; preds = %if.else24
  call void @__ncvm_action_multicast(i16 zeroext 42) #6, !dbg !106
  br label %ncvm.scf.null.exit.0, !dbg !109

if.end57:                                         ; preds = %ncvm.scf.null.exit.0, %if.then12
  ret void, !dbg !110

ncvm.scf.null.exit.0:                             ; preds = %ncvm.scf.null.entry.0, %if.then55, %if.then52
  br label %if.end57

ncvm.scf.null.entry.0:                            ; preds = %if.else24
  br label %ncvm.scf.null.exit.0
}

; Function Attrs: noinline nounwind
define internal void @_GLOBAL__sub_I_agg4.ncl.device.rw() #3 section ".text.startup" !dbg !111 {
entry:
  call void @__cxx_global_var_init(), !dbg !112
  ret void
}

attributes #0 = { "ncvm-net" }
attributes #1 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #2 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #6 = { nounwind }
attributes #7 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-spec"="1,1,1,1,1,1,32" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/agg4-ncl")
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
!12 = distinct !DISubprogram(name: "__ncvm_action_reflect", scope: !7, file: !7, line: 71, type: !8, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 71, column: 1, scope: !12)
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
!32 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 256, type: !8, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 256, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 257, type: !8, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 257, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 258, type: !8, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 258, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 259, type: !8, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 259, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_atomic_cond_add_new_u32", scope: !7, file: !7, line: 283, type: !8, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 283, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__ncvm_atomic_cond_dec_u32", scope: !7, file: !7, line: 351, type: !8, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 351, column: 1, scope: !42)
!44 = distinct !DISubprogram(name: "__ncvm_atomic_cond_max_new_u32", scope: !7, file: !7, line: 387, type: !8, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 387, column: 1, scope: !44)
!46 = distinct !DISubprogram(name: "__ncvm_atomic_or_u32", scope: !7, file: !7, line: 450, type: !8, scopeLine: 450, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 450, column: 1, scope: !46)
!48 = distinct !DISubprogram(name: "__ncvm_atomic_and_u32", scope: !7, file: !7, line: 459, type: !8, scopeLine: 459, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 459, column: 1, scope: !48)
!50 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 74, column: 25, scope: !52)
!52 = !DILexicalBlockFile(scope: !50, file: !53, discriminator: 0)
!53 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/iostream", directory: "")
!54 = !DILocation(line: 0, scope: !50)
!55 = distinct !DISubprogram(name: "allreduce", scope: !56, file: !56, line: 15, type: !8, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DIFile(filename: "agg4.ncl", directory: "/home/gk/vbox-share/netcl-ubuntu-22.04/ncl-p4/packet-latency/agg4-ncl")
!57 = !DILocation(line: 20, column: 11, scope: !55)
!58 = !DILocation(line: 21, column: 25, scope: !55)
!59 = !DILocation(line: 20, column: 7, scope: !55)
!60 = !DILocation(line: 299, column: 83, scope: !61, inlinedAt: !63)
!61 = distinct !DISubprogram(name: "atomic_or", scope: !62, file: !62, line: 299, type: !8, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!63 = distinct !DILocation(line: 21, column: 14, scope: !55)
!64 = !DILocation(line: 22, column: 37, scope: !55)
!65 = !DILocation(line: 308, column: 82, scope: !66, inlinedAt: !67)
!66 = distinct !DISubprogram(name: "atomic_and", scope: !62, file: !62, line: 308, type: !8, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = distinct !DILocation(line: 22, column: 5, scope: !55)
!68 = !DILocation(line: 23, column: 3, scope: !55)
!69 = !DILocation(line: 24, column: 37, scope: !55)
!70 = !DILocation(line: 308, column: 82, scope: !66, inlinedAt: !71)
!71 = distinct !DILocation(line: 24, column: 5, scope: !55)
!72 = !DILocation(line: 299, column: 83, scope: !61, inlinedAt: !73)
!73 = distinct !DILocation(line: 25, column: 14, scope: !55)
!74 = !DILocation(line: 28, column: 14, scope: !55)
!75 = !DILocation(line: 29, column: 5, scope: !55)
!76 = !DILocation(line: 29, column: 21, scope: !55)
!77 = !DILocation(line: 28, column: 7, scope: !55)
!78 = !DILocation(line: 29, column: 19, scope: !55)
!79 = !DILocation(line: 31, column: 25, scope: !55)
!80 = !DILocation(line: 31, column: 23, scope: !55)
!81 = !DILocation(line: 32, column: 5, scope: !55)
!82 = !DILocation(line: 32, column: 20, scope: !55)
!83 = !DILocation(line: 33, column: 3, scope: !55)
!84 = !DILocation(line: 34, column: 28, scope: !55)
!85 = !DILocation(line: 36, column: 33, scope: !55)
!86 = !DILocation(line: 36, column: 49, scope: !55)
!87 = !DILocation(line: 290, column: 102, scope: !88, inlinedAt: !89)
!88 = distinct !DISubprogram(name: "atomic_cond_max_new", scope: !62, file: !62, line: 290, type: !8, scopeLine: 290, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = distinct !DILocation(line: 36, column: 12, scope: !55)
!90 = !DILocation(line: 36, column: 10, scope: !55)
!91 = !DILocation(line: 39, column: 64, scope: !55)
!92 = !DILocation(line: 160, column: 98, scope: !93, inlinedAt: !94)
!93 = distinct !DISubprogram(name: "atomic_cond_add_new", scope: !62, file: !62, line: 160, type: !8, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = distinct !DILocation(line: 39, column: 19, scope: !55)
!95 = !DILocation(line: 39, column: 17, scope: !55)
!96 = !DILocation(line: 41, column: 33, scope: !55)
!97 = !DILocation(line: 254, column: 84, scope: !98, inlinedAt: !99)
!98 = distinct !DISubprogram(name: "atomic_cond_dec", scope: !62, file: !62, line: 254, type: !8, scopeLine: 254, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = distinct !DILocation(line: 41, column: 16, scope: !55)
!100 = !DILocation(line: 42, column: 9, scope: !55)
!101 = !DILocation(line: 65, column: 3, scope: !102, inlinedAt: !104)
!102 = distinct !DISubprogram(name: "_reflect", scope: !103, file: !103, line: 64, type: !8, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!104 = distinct !DILocation(line: 43, column: 14, scope: !55)
!105 = !DILocation(line: 43, column: 7, scope: !55)
!106 = !DILocation(line: 109, column: 3, scope: !107, inlinedAt: !108)
!107 = distinct !DISubprogram(name: "_multicast", scope: !103, file: !103, line: 108, type: !8, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = distinct !DILocation(line: 45, column: 14, scope: !55)
!109 = !DILocation(line: 45, column: 7, scope: !55)
!110 = !DILocation(line: 47, column: 1, scope: !55)
!111 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_agg4.ncl.device.rw", scope: !1, file: !1, type: !8, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 0, scope: !111)
