; ModuleID = '/home/gk/vbox-share/p4utils-lubuntu-20.04/ncl-p4/allreduce.ncl.device.rw'
source_filename = "/home/gk/vbox-share/p4utils-lubuntu-20.04/ncl-p4/agg/src/device/allreduce.ncl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
@.str.12 = private unnamed_addr constant [78 x i8] c"/home/gk/vbox-share/p4utils-lubuntu-20.04/ncl-p4/agg/src/device/allreduce.ncl\00", section "llvm.metadata"
@Count = global [8 x i32] zeroinitializer, align 16 #0
@Expo = global [8 x i32] zeroinitializer, align 16 #0
@.str.13 = private unnamed_addr constant [13 x i8] c"ncl:kernel:1\00", section "llvm.metadata"
@.str.14 = private unnamed_addr constant [25 x i8] c"ncvm:spec:1,1,1,1,1,1,32\00", section "llvm.metadata"
@.str.15 = private unnamed_addr constant [39 x i8] c"ncvm:slab:1,0,1,0,1,0,1,0,1,0,1,0,32,0\00", section "llvm.metadata"
@Bitmap_fragment_0_ = internal global [4 x i16] zeroinitializer #0
@Bitmap_fragment_1_ = internal global [4 x i16] zeroinitializer #0
@Agg_fragment_0_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_1_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_2_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_3_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_4_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_5_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_6_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_7_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_8_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_9_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_10_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_11_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_12_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_13_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_14_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_15_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_16_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_17_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_18_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_19_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_20_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_21_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_22_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_23_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_24_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_25_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_26_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_27_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_28_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_29_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_30_ = internal global [8 x i32] zeroinitializer #0
@Agg_fragment_31_ = internal global [8 x i32] zeroinitializer #0

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
define dso_local zeroext i16 @__ncvm_atomic_or_u16(i16* %0, i16 zeroext %1) #2 !dbg !46 {
entry:
  ret i16 0, !dbg !47
}

; Function Attrs: mustprogress nounwind
define dso_local zeroext i16 @__ncvm_atomic_and_u16(i16* %0, i16 zeroext %1) #2 !dbg !48 {
entry:
  ret i16 0, !dbg !49
}

; Function Attrs: mustprogress noinline nounwind
define dso_local zeroext i8 @_ZN3ncl4bits4lhlfEt(i16 zeroext %v) #3 !dbg !50 {
entry:
  %call = call zeroext i16 @__ncvm_bit_half_u16(i1 zeroext true, i16 zeroext %v), !dbg !52
  %conv = trunc i16 %call to i8, !dbg !52
  ret i8 %conv, !dbg !53
}

; Function Attrs: mustprogress noinline nounwind
define dso_local zeroext i16 @_ZN3ncl4bits4lhlfEj(i32 %v) #3 !dbg !54 {
entry:
  %call = call i32 @__ncvm_bit_half_u32(i1 zeroext true, i32 %v), !dbg !55
  %conv = trunc i32 %call to i16, !dbg !55
  ret i16 %conv, !dbg !56
}

; Function Attrs: mustprogress noinline nounwind
define dso_local i32 @_ZN3ncl4bits4lhlfEm(i64 %v) #3 !dbg !57 {
entry:
  %call = call i64 @__ncvm_bit_half_u64(i1 zeroext true, i64 %v), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !58
  ret i32 %conv, !dbg !59
}

; Function Attrs: mustprogress noinline nounwind
define dso_local zeroext i8 @_ZN3ncl4bits4hhlfEt(i16 zeroext %v) #3 !dbg !60 {
entry:
  %call = call zeroext i16 @__ncvm_bit_half_u16(i1 zeroext false, i16 zeroext %v), !dbg !61
  %conv = trunc i16 %call to i8, !dbg !61
  ret i8 %conv, !dbg !62
}

; Function Attrs: mustprogress noinline nounwind
define dso_local zeroext i16 @_ZN3ncl4bits4hhlfEj(i32 %v) #3 !dbg !63 {
entry:
  %call = call i32 @__ncvm_bit_half_u32(i1 zeroext false, i32 %v), !dbg !64
  %conv = trunc i32 %call to i16, !dbg !64
  ret i16 %conv, !dbg !65
}

; Function Attrs: mustprogress noinline nounwind
define dso_local i32 @_ZN3ncl4bits4hhlfEm(i64 %v) #3 !dbg !66 {
entry:
  %call = call i64 @__ncvm_bit_half_u64(i1 zeroext false, i64 %v), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !67
  ret i32 %conv, !dbg !68
}

; Function Attrs: mustprogress noinline nounwind
define dso_local void @_Z9allreducejhtttRjPj(i32 %offset, i8 zeroext %ver, i16 zeroext %bitmap_slot, i16 zeroext %slot, i16 zeroext %mask, i32* noalias nonnull align 4 dereferenceable(4) %expo, i32* noalias %values) #4 !dbg !69 {
entry:
  %bitmap.0.reg2mem = alloca i16, align 2
  %cmp = icmp eq i8 %ver, 0, !dbg !71
  %idxprom = zext i16 %bitmap_slot to i64, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  %0 = getelementptr [4 x i16], [4 x i16]* @Bitmap_fragment_0_, i64 0, i64 %idxprom
  %call.i85 = call zeroext i16 @__ncvm_atomic_or_u16(i16* nonnull %0, i16 zeroext %mask) #5, !dbg !74
  %1 = getelementptr [4 x i16], [4 x i16]* @Bitmap_fragment_1_, i64 0, i64 %idxprom
  %neg = xor i16 %mask, -1, !dbg !78
  %call.i91 = call zeroext i16 @__ncvm_atomic_and_u16(i16* nonnull %1, i16 zeroext %neg) #5, !dbg !79
  store i16 %call.i85, i16* %bitmap.0.reg2mem, align 2
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  %2 = getelementptr [4 x i16], [4 x i16]* @Bitmap_fragment_0_, i64 0, i64 %idxprom
  %neg9 = xor i16 %mask, -1, !dbg !83
  %call.i88 = call zeroext i16 @__ncvm_atomic_and_u16(i16* nonnull %2, i16 zeroext %neg9) #5, !dbg !84
  %3 = getelementptr [4 x i16], [4 x i16]* @Bitmap_fragment_1_, i64 0, i64 %idxprom
  %call.i82 = call zeroext i16 @__ncvm_atomic_or_u16(i16* nonnull %3, i16 zeroext %mask) #5, !dbg !86
  store i16 %call.i82, i16* %bitmap.0.reg2mem, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %bitmap.0.reload = load i16, i16* %bitmap.0.reg2mem, align 2
  %cmp16 = icmp eq i16 %bitmap.0.reload, 0, !dbg !88
  %idxprom18 = zext i16 %slot to i64, !dbg !89
  %4 = load i32, i32* %expo, align 4, !dbg !90
  br i1 %cmp16, label %if.then17, label %if.else29, !dbg !91

if.then17:                                        ; preds = %if.end
  %arrayidx19 = getelementptr inbounds [8 x i32], [8 x i32]* @Expo, i64 0, i64 %idxprom18, !dbg !89
  %5 = call i32 @__ncvm_atomic_write_u32(i32* %arrayidx19, i32 %4), !dbg !92
  %6 = load i32, i32* %values, align 4, !dbg !93
  %7 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_0_, i64 0, i64 %idxprom18
  %8 = call i32 @__ncvm_atomic_write_u32(i32* %7, i32 %6), !dbg !94
  %arrayidx22.1 = getelementptr inbounds i32, i32* %values, i64 1, !dbg !93
  %9 = load i32, i32* %arrayidx22.1, align 4, !dbg !93
  %10 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_1_, i64 0, i64 %idxprom18
  %11 = call i32 @__ncvm_atomic_write_u32(i32* %10, i32 %9), !dbg !94
  %arrayidx22.2 = getelementptr inbounds i32, i32* %values, i64 2, !dbg !93
  %12 = load i32, i32* %arrayidx22.2, align 4, !dbg !93
  %13 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_2_, i64 0, i64 %idxprom18
  %14 = call i32 @__ncvm_atomic_write_u32(i32* %13, i32 %12), !dbg !94
  %arrayidx22.3 = getelementptr inbounds i32, i32* %values, i64 3, !dbg !93
  %15 = load i32, i32* %arrayidx22.3, align 4, !dbg !93
  %16 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_3_, i64 0, i64 %idxprom18
  %17 = call i32 @__ncvm_atomic_write_u32(i32* %16, i32 %15), !dbg !94
  %arrayidx22.4 = getelementptr inbounds i32, i32* %values, i64 4, !dbg !93
  %18 = load i32, i32* %arrayidx22.4, align 4, !dbg !93
  %19 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_4_, i64 0, i64 %idxprom18
  %20 = call i32 @__ncvm_atomic_write_u32(i32* %19, i32 %18), !dbg !94
  %arrayidx22.5 = getelementptr inbounds i32, i32* %values, i64 5, !dbg !93
  %21 = load i32, i32* %arrayidx22.5, align 4, !dbg !93
  %22 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_5_, i64 0, i64 %idxprom18
  %23 = call i32 @__ncvm_atomic_write_u32(i32* %22, i32 %21), !dbg !94
  %arrayidx22.6 = getelementptr inbounds i32, i32* %values, i64 6, !dbg !93
  %24 = load i32, i32* %arrayidx22.6, align 4, !dbg !93
  %25 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_6_, i64 0, i64 %idxprom18
  %26 = call i32 @__ncvm_atomic_write_u32(i32* %25, i32 %24), !dbg !94
  %arrayidx22.7 = getelementptr inbounds i32, i32* %values, i64 7, !dbg !93
  %27 = load i32, i32* %arrayidx22.7, align 4, !dbg !93
  %28 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_7_, i64 0, i64 %idxprom18
  %29 = call i32 @__ncvm_atomic_write_u32(i32* %28, i32 %27), !dbg !94
  %arrayidx22.8 = getelementptr inbounds i32, i32* %values, i64 8, !dbg !93
  %30 = load i32, i32* %arrayidx22.8, align 4, !dbg !93
  %31 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_8_, i64 0, i64 %idxprom18
  %32 = call i32 @__ncvm_atomic_write_u32(i32* %31, i32 %30), !dbg !94
  %arrayidx22.9 = getelementptr inbounds i32, i32* %values, i64 9, !dbg !93
  %33 = load i32, i32* %arrayidx22.9, align 4, !dbg !93
  %34 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_9_, i64 0, i64 %idxprom18
  %35 = call i32 @__ncvm_atomic_write_u32(i32* %34, i32 %33), !dbg !94
  %arrayidx22.10 = getelementptr inbounds i32, i32* %values, i64 10, !dbg !93
  %36 = load i32, i32* %arrayidx22.10, align 4, !dbg !93
  %37 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_10_, i64 0, i64 %idxprom18
  %38 = call i32 @__ncvm_atomic_write_u32(i32* %37, i32 %36), !dbg !94
  %arrayidx22.11 = getelementptr inbounds i32, i32* %values, i64 11, !dbg !93
  %39 = load i32, i32* %arrayidx22.11, align 4, !dbg !93
  %40 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_11_, i64 0, i64 %idxprom18
  %41 = call i32 @__ncvm_atomic_write_u32(i32* %40, i32 %39), !dbg !94
  %arrayidx22.12 = getelementptr inbounds i32, i32* %values, i64 12, !dbg !93
  %42 = load i32, i32* %arrayidx22.12, align 4, !dbg !93
  %43 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_12_, i64 0, i64 %idxprom18
  %44 = call i32 @__ncvm_atomic_write_u32(i32* %43, i32 %42), !dbg !94
  %arrayidx22.13 = getelementptr inbounds i32, i32* %values, i64 13, !dbg !93
  %45 = load i32, i32* %arrayidx22.13, align 4, !dbg !93
  %46 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_13_, i64 0, i64 %idxprom18
  %47 = call i32 @__ncvm_atomic_write_u32(i32* %46, i32 %45), !dbg !94
  %arrayidx22.14 = getelementptr inbounds i32, i32* %values, i64 14, !dbg !93
  %48 = load i32, i32* %arrayidx22.14, align 4, !dbg !93
  %49 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_14_, i64 0, i64 %idxprom18
  %50 = call i32 @__ncvm_atomic_write_u32(i32* %49, i32 %48), !dbg !94
  %arrayidx22.15 = getelementptr inbounds i32, i32* %values, i64 15, !dbg !93
  %51 = load i32, i32* %arrayidx22.15, align 4, !dbg !93
  %52 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_15_, i64 0, i64 %idxprom18
  %53 = call i32 @__ncvm_atomic_write_u32(i32* %52, i32 %51), !dbg !94
  %arrayidx22.16 = getelementptr inbounds i32, i32* %values, i64 16, !dbg !93
  %54 = load i32, i32* %arrayidx22.16, align 4, !dbg !93
  %55 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_16_, i64 0, i64 %idxprom18
  %56 = call i32 @__ncvm_atomic_write_u32(i32* %55, i32 %54), !dbg !94
  %arrayidx22.17 = getelementptr inbounds i32, i32* %values, i64 17, !dbg !93
  %57 = load i32, i32* %arrayidx22.17, align 4, !dbg !93
  %58 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_17_, i64 0, i64 %idxprom18
  %59 = call i32 @__ncvm_atomic_write_u32(i32* %58, i32 %57), !dbg !94
  %arrayidx22.18 = getelementptr inbounds i32, i32* %values, i64 18, !dbg !93
  %60 = load i32, i32* %arrayidx22.18, align 4, !dbg !93
  %61 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_18_, i64 0, i64 %idxprom18
  %62 = call i32 @__ncvm_atomic_write_u32(i32* %61, i32 %60), !dbg !94
  %arrayidx22.19 = getelementptr inbounds i32, i32* %values, i64 19, !dbg !93
  %63 = load i32, i32* %arrayidx22.19, align 4, !dbg !93
  %64 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_19_, i64 0, i64 %idxprom18
  %65 = call i32 @__ncvm_atomic_write_u32(i32* %64, i32 %63), !dbg !94
  %arrayidx22.20 = getelementptr inbounds i32, i32* %values, i64 20, !dbg !93
  %66 = load i32, i32* %arrayidx22.20, align 4, !dbg !93
  %67 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_20_, i64 0, i64 %idxprom18
  %68 = call i32 @__ncvm_atomic_write_u32(i32* %67, i32 %66), !dbg !94
  %arrayidx22.21 = getelementptr inbounds i32, i32* %values, i64 21, !dbg !93
  %69 = load i32, i32* %arrayidx22.21, align 4, !dbg !93
  %70 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_21_, i64 0, i64 %idxprom18
  %71 = call i32 @__ncvm_atomic_write_u32(i32* %70, i32 %69), !dbg !94
  %arrayidx22.22 = getelementptr inbounds i32, i32* %values, i64 22, !dbg !93
  %72 = load i32, i32* %arrayidx22.22, align 4, !dbg !93
  %73 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_22_, i64 0, i64 %idxprom18
  %74 = call i32 @__ncvm_atomic_write_u32(i32* %73, i32 %72), !dbg !94
  %arrayidx22.23 = getelementptr inbounds i32, i32* %values, i64 23, !dbg !93
  %75 = load i32, i32* %arrayidx22.23, align 4, !dbg !93
  %76 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_23_, i64 0, i64 %idxprom18
  %77 = call i32 @__ncvm_atomic_write_u32(i32* %76, i32 %75), !dbg !94
  %arrayidx22.24 = getelementptr inbounds i32, i32* %values, i64 24, !dbg !93
  %78 = load i32, i32* %arrayidx22.24, align 4, !dbg !93
  %79 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_24_, i64 0, i64 %idxprom18
  %80 = call i32 @__ncvm_atomic_write_u32(i32* %79, i32 %78), !dbg !94
  %arrayidx22.25 = getelementptr inbounds i32, i32* %values, i64 25, !dbg !93
  %81 = load i32, i32* %arrayidx22.25, align 4, !dbg !93
  %82 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_25_, i64 0, i64 %idxprom18
  %83 = call i32 @__ncvm_atomic_write_u32(i32* %82, i32 %81), !dbg !94
  %arrayidx22.26 = getelementptr inbounds i32, i32* %values, i64 26, !dbg !93
  %84 = load i32, i32* %arrayidx22.26, align 4, !dbg !93
  %85 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_26_, i64 0, i64 %idxprom18
  %86 = call i32 @__ncvm_atomic_write_u32(i32* %85, i32 %84), !dbg !94
  %arrayidx22.27 = getelementptr inbounds i32, i32* %values, i64 27, !dbg !93
  %87 = load i32, i32* %arrayidx22.27, align 4, !dbg !93
  %88 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_27_, i64 0, i64 %idxprom18
  %89 = call i32 @__ncvm_atomic_write_u32(i32* %88, i32 %87), !dbg !94
  %arrayidx22.28 = getelementptr inbounds i32, i32* %values, i64 28, !dbg !93
  %90 = load i32, i32* %arrayidx22.28, align 4, !dbg !93
  %91 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_28_, i64 0, i64 %idxprom18
  %92 = call i32 @__ncvm_atomic_write_u32(i32* %91, i32 %90), !dbg !94
  %arrayidx22.29 = getelementptr inbounds i32, i32* %values, i64 29, !dbg !93
  %93 = load i32, i32* %arrayidx22.29, align 4, !dbg !93
  %94 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_29_, i64 0, i64 %idxprom18
  %95 = call i32 @__ncvm_atomic_write_u32(i32* %94, i32 %93), !dbg !94
  %arrayidx22.30 = getelementptr inbounds i32, i32* %values, i64 30, !dbg !93
  %96 = load i32, i32* %arrayidx22.30, align 4, !dbg !93
  %97 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_30_, i64 0, i64 %idxprom18
  %98 = call i32 @__ncvm_atomic_write_u32(i32* %97, i32 %96), !dbg !94
  %arrayidx22.31 = getelementptr inbounds i32, i32* %values, i64 31, !dbg !93
  %99 = load i32, i32* %arrayidx22.31, align 4, !dbg !93
  %100 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_31_, i64 0, i64 %idxprom18
  %101 = call i32 @__ncvm_atomic_write_u32(i32* %100, i32 %99), !dbg !94
  %arrayidx28 = getelementptr inbounds [8 x i32], [8 x i32]* @Count, i64 0, i64 %idxprom18, !dbg !95
  %102 = call i32 @__ncvm_atomic_write_u32(i32* %arrayidx28, i32 3), !dbg !96
  br label %if.end69, !dbg !97

if.else29:                                        ; preds = %if.end
  %and92 = and i16 %bitmap.0.reload, %mask, !dbg !98
  %arrayidx37 = getelementptr inbounds [8 x i32], [8 x i32]* @Expo, i64 0, i64 %idxprom18, !dbg !99
  %tobool.not = icmp eq i16 %and92, 0, !dbg !100
  %call.i79 = call i32 @__ncvm_atomic_cond_max_new_u32(i32* nonnull %arrayidx37, i1 zeroext %tobool.not, i32 %4) #5, !dbg !101
  store i32 %call.i79, i32* %expo, align 4, !dbg !104
  %103 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_0_, i64 0, i64 %idxprom18
  %104 = load i32, i32* %values, align 4, !dbg !105
  %call.i = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %103, i1 zeroext %tobool.not, i32 %104) #5, !dbg !106
  store i32 %call.i, i32* %values, align 4, !dbg !109
  %105 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_1_, i64 0, i64 %idxprom18
  %arrayidx50.1 = getelementptr inbounds i32, i32* %values, i64 1, !dbg !105
  %106 = load i32, i32* %arrayidx50.1, align 4, !dbg !105
  %call.i.1 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %105, i1 zeroext %tobool.not, i32 %106) #5, !dbg !106
  store i32 %call.i.1, i32* %arrayidx50.1, align 4, !dbg !109
  %107 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_2_, i64 0, i64 %idxprom18
  %arrayidx50.2 = getelementptr inbounds i32, i32* %values, i64 2, !dbg !105
  %108 = load i32, i32* %arrayidx50.2, align 4, !dbg !105
  %call.i.2 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %107, i1 zeroext %tobool.not, i32 %108) #5, !dbg !106
  store i32 %call.i.2, i32* %arrayidx50.2, align 4, !dbg !109
  %109 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_3_, i64 0, i64 %idxprom18
  %arrayidx50.3 = getelementptr inbounds i32, i32* %values, i64 3, !dbg !105
  %110 = load i32, i32* %arrayidx50.3, align 4, !dbg !105
  %call.i.3 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %109, i1 zeroext %tobool.not, i32 %110) #5, !dbg !106
  store i32 %call.i.3, i32* %arrayidx50.3, align 4, !dbg !109
  %111 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_4_, i64 0, i64 %idxprom18
  %arrayidx50.4 = getelementptr inbounds i32, i32* %values, i64 4, !dbg !105
  %112 = load i32, i32* %arrayidx50.4, align 4, !dbg !105
  %call.i.4 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %111, i1 zeroext %tobool.not, i32 %112) #5, !dbg !106
  store i32 %call.i.4, i32* %arrayidx50.4, align 4, !dbg !109
  %113 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_5_, i64 0, i64 %idxprom18
  %arrayidx50.5 = getelementptr inbounds i32, i32* %values, i64 5, !dbg !105
  %114 = load i32, i32* %arrayidx50.5, align 4, !dbg !105
  %call.i.5 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %113, i1 zeroext %tobool.not, i32 %114) #5, !dbg !106
  store i32 %call.i.5, i32* %arrayidx50.5, align 4, !dbg !109
  %115 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_6_, i64 0, i64 %idxprom18
  %arrayidx50.6 = getelementptr inbounds i32, i32* %values, i64 6, !dbg !105
  %116 = load i32, i32* %arrayidx50.6, align 4, !dbg !105
  %call.i.6 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %115, i1 zeroext %tobool.not, i32 %116) #5, !dbg !106
  store i32 %call.i.6, i32* %arrayidx50.6, align 4, !dbg !109
  %117 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_7_, i64 0, i64 %idxprom18
  %arrayidx50.7 = getelementptr inbounds i32, i32* %values, i64 7, !dbg !105
  %118 = load i32, i32* %arrayidx50.7, align 4, !dbg !105
  %call.i.7 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %117, i1 zeroext %tobool.not, i32 %118) #5, !dbg !106
  store i32 %call.i.7, i32* %arrayidx50.7, align 4, !dbg !109
  %119 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_8_, i64 0, i64 %idxprom18
  %arrayidx50.8 = getelementptr inbounds i32, i32* %values, i64 8, !dbg !105
  %120 = load i32, i32* %arrayidx50.8, align 4, !dbg !105
  %call.i.8 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %119, i1 zeroext %tobool.not, i32 %120) #5, !dbg !106
  store i32 %call.i.8, i32* %arrayidx50.8, align 4, !dbg !109
  %121 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_9_, i64 0, i64 %idxprom18
  %arrayidx50.9 = getelementptr inbounds i32, i32* %values, i64 9, !dbg !105
  %122 = load i32, i32* %arrayidx50.9, align 4, !dbg !105
  %call.i.9 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %121, i1 zeroext %tobool.not, i32 %122) #5, !dbg !106
  store i32 %call.i.9, i32* %arrayidx50.9, align 4, !dbg !109
  %123 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_10_, i64 0, i64 %idxprom18
  %arrayidx50.10 = getelementptr inbounds i32, i32* %values, i64 10, !dbg !105
  %124 = load i32, i32* %arrayidx50.10, align 4, !dbg !105
  %call.i.10 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %123, i1 zeroext %tobool.not, i32 %124) #5, !dbg !106
  store i32 %call.i.10, i32* %arrayidx50.10, align 4, !dbg !109
  %125 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_11_, i64 0, i64 %idxprom18
  %arrayidx50.11 = getelementptr inbounds i32, i32* %values, i64 11, !dbg !105
  %126 = load i32, i32* %arrayidx50.11, align 4, !dbg !105
  %call.i.11 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %125, i1 zeroext %tobool.not, i32 %126) #5, !dbg !106
  store i32 %call.i.11, i32* %arrayidx50.11, align 4, !dbg !109
  %127 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_12_, i64 0, i64 %idxprom18
  %arrayidx50.12 = getelementptr inbounds i32, i32* %values, i64 12, !dbg !105
  %128 = load i32, i32* %arrayidx50.12, align 4, !dbg !105
  %call.i.12 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %127, i1 zeroext %tobool.not, i32 %128) #5, !dbg !106
  store i32 %call.i.12, i32* %arrayidx50.12, align 4, !dbg !109
  %129 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_13_, i64 0, i64 %idxprom18
  %arrayidx50.13 = getelementptr inbounds i32, i32* %values, i64 13, !dbg !105
  %130 = load i32, i32* %arrayidx50.13, align 4, !dbg !105
  %call.i.13 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %129, i1 zeroext %tobool.not, i32 %130) #5, !dbg !106
  store i32 %call.i.13, i32* %arrayidx50.13, align 4, !dbg !109
  %131 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_14_, i64 0, i64 %idxprom18
  %arrayidx50.14 = getelementptr inbounds i32, i32* %values, i64 14, !dbg !105
  %132 = load i32, i32* %arrayidx50.14, align 4, !dbg !105
  %call.i.14 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %131, i1 zeroext %tobool.not, i32 %132) #5, !dbg !106
  store i32 %call.i.14, i32* %arrayidx50.14, align 4, !dbg !109
  %133 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_15_, i64 0, i64 %idxprom18
  %arrayidx50.15 = getelementptr inbounds i32, i32* %values, i64 15, !dbg !105
  %134 = load i32, i32* %arrayidx50.15, align 4, !dbg !105
  %call.i.15 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %133, i1 zeroext %tobool.not, i32 %134) #5, !dbg !106
  store i32 %call.i.15, i32* %arrayidx50.15, align 4, !dbg !109
  %135 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_16_, i64 0, i64 %idxprom18
  %arrayidx50.16 = getelementptr inbounds i32, i32* %values, i64 16, !dbg !105
  %136 = load i32, i32* %arrayidx50.16, align 4, !dbg !105
  %call.i.16 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %135, i1 zeroext %tobool.not, i32 %136) #5, !dbg !106
  store i32 %call.i.16, i32* %arrayidx50.16, align 4, !dbg !109
  %137 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_17_, i64 0, i64 %idxprom18
  %arrayidx50.17 = getelementptr inbounds i32, i32* %values, i64 17, !dbg !105
  %138 = load i32, i32* %arrayidx50.17, align 4, !dbg !105
  %call.i.17 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %137, i1 zeroext %tobool.not, i32 %138) #5, !dbg !106
  store i32 %call.i.17, i32* %arrayidx50.17, align 4, !dbg !109
  %139 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_18_, i64 0, i64 %idxprom18
  %arrayidx50.18 = getelementptr inbounds i32, i32* %values, i64 18, !dbg !105
  %140 = load i32, i32* %arrayidx50.18, align 4, !dbg !105
  %call.i.18 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %139, i1 zeroext %tobool.not, i32 %140) #5, !dbg !106
  store i32 %call.i.18, i32* %arrayidx50.18, align 4, !dbg !109
  %141 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_19_, i64 0, i64 %idxprom18
  %arrayidx50.19 = getelementptr inbounds i32, i32* %values, i64 19, !dbg !105
  %142 = load i32, i32* %arrayidx50.19, align 4, !dbg !105
  %call.i.19 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %141, i1 zeroext %tobool.not, i32 %142) #5, !dbg !106
  store i32 %call.i.19, i32* %arrayidx50.19, align 4, !dbg !109
  %143 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_20_, i64 0, i64 %idxprom18
  %arrayidx50.20 = getelementptr inbounds i32, i32* %values, i64 20, !dbg !105
  %144 = load i32, i32* %arrayidx50.20, align 4, !dbg !105
  %call.i.20 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %143, i1 zeroext %tobool.not, i32 %144) #5, !dbg !106
  store i32 %call.i.20, i32* %arrayidx50.20, align 4, !dbg !109
  %145 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_21_, i64 0, i64 %idxprom18
  %arrayidx50.21 = getelementptr inbounds i32, i32* %values, i64 21, !dbg !105
  %146 = load i32, i32* %arrayidx50.21, align 4, !dbg !105
  %call.i.21 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %145, i1 zeroext %tobool.not, i32 %146) #5, !dbg !106
  store i32 %call.i.21, i32* %arrayidx50.21, align 4, !dbg !109
  %147 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_22_, i64 0, i64 %idxprom18
  %arrayidx50.22 = getelementptr inbounds i32, i32* %values, i64 22, !dbg !105
  %148 = load i32, i32* %arrayidx50.22, align 4, !dbg !105
  %call.i.22 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %147, i1 zeroext %tobool.not, i32 %148) #5, !dbg !106
  store i32 %call.i.22, i32* %arrayidx50.22, align 4, !dbg !109
  %149 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_23_, i64 0, i64 %idxprom18
  %arrayidx50.23 = getelementptr inbounds i32, i32* %values, i64 23, !dbg !105
  %150 = load i32, i32* %arrayidx50.23, align 4, !dbg !105
  %call.i.23 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %149, i1 zeroext %tobool.not, i32 %150) #5, !dbg !106
  store i32 %call.i.23, i32* %arrayidx50.23, align 4, !dbg !109
  %151 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_24_, i64 0, i64 %idxprom18
  %arrayidx50.24 = getelementptr inbounds i32, i32* %values, i64 24, !dbg !105
  %152 = load i32, i32* %arrayidx50.24, align 4, !dbg !105
  %call.i.24 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %151, i1 zeroext %tobool.not, i32 %152) #5, !dbg !106
  store i32 %call.i.24, i32* %arrayidx50.24, align 4, !dbg !109
  %153 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_25_, i64 0, i64 %idxprom18
  %arrayidx50.25 = getelementptr inbounds i32, i32* %values, i64 25, !dbg !105
  %154 = load i32, i32* %arrayidx50.25, align 4, !dbg !105
  %call.i.25 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %153, i1 zeroext %tobool.not, i32 %154) #5, !dbg !106
  store i32 %call.i.25, i32* %arrayidx50.25, align 4, !dbg !109
  %155 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_26_, i64 0, i64 %idxprom18
  %arrayidx50.26 = getelementptr inbounds i32, i32* %values, i64 26, !dbg !105
  %156 = load i32, i32* %arrayidx50.26, align 4, !dbg !105
  %call.i.26 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %155, i1 zeroext %tobool.not, i32 %156) #5, !dbg !106
  store i32 %call.i.26, i32* %arrayidx50.26, align 4, !dbg !109
  %157 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_27_, i64 0, i64 %idxprom18
  %arrayidx50.27 = getelementptr inbounds i32, i32* %values, i64 27, !dbg !105
  %158 = load i32, i32* %arrayidx50.27, align 4, !dbg !105
  %call.i.27 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %157, i1 zeroext %tobool.not, i32 %158) #5, !dbg !106
  store i32 %call.i.27, i32* %arrayidx50.27, align 4, !dbg !109
  %159 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_28_, i64 0, i64 %idxprom18
  %arrayidx50.28 = getelementptr inbounds i32, i32* %values, i64 28, !dbg !105
  %160 = load i32, i32* %arrayidx50.28, align 4, !dbg !105
  %call.i.28 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %159, i1 zeroext %tobool.not, i32 %160) #5, !dbg !106
  store i32 %call.i.28, i32* %arrayidx50.28, align 4, !dbg !109
  %161 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_29_, i64 0, i64 %idxprom18
  %arrayidx50.29 = getelementptr inbounds i32, i32* %values, i64 29, !dbg !105
  %162 = load i32, i32* %arrayidx50.29, align 4, !dbg !105
  %call.i.29 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %161, i1 zeroext %tobool.not, i32 %162) #5, !dbg !106
  store i32 %call.i.29, i32* %arrayidx50.29, align 4, !dbg !109
  %163 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_30_, i64 0, i64 %idxprom18
  %arrayidx50.30 = getelementptr inbounds i32, i32* %values, i64 30, !dbg !105
  %164 = load i32, i32* %arrayidx50.30, align 4, !dbg !105
  %call.i.30 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %163, i1 zeroext %tobool.not, i32 %164) #5, !dbg !106
  store i32 %call.i.30, i32* %arrayidx50.30, align 4, !dbg !109
  %165 = getelementptr [8 x i32], [8 x i32]* @Agg_fragment_31_, i64 0, i64 %idxprom18
  %arrayidx50.31 = getelementptr inbounds i32, i32* %values, i64 31, !dbg !105
  %166 = load i32, i32* %arrayidx50.31, align 4, !dbg !105
  %call.i.31 = call i32 @__ncvm_atomic_cond_add_new_u32(i32* nonnull %165, i1 zeroext %tobool.not, i32 %166) #5, !dbg !106
  store i32 %call.i.31, i32* %arrayidx50.31, align 4, !dbg !109
  %arrayidx58 = getelementptr inbounds [8 x i32], [8 x i32]* @Count, i64 0, i64 %idxprom18, !dbg !110
  %call.i73 = call i32 @__ncvm_atomic_cond_dec_u32(i32* nonnull %arrayidx58, i1 zeroext %tobool.not) #5, !dbg !111
  %tobool62.not = icmp eq i32 %call.i73, 0, !dbg !114
  %or93 = or i16 %bitmap.0.reload, %mask, !dbg !115
  br i1 %tobool62.not, label %if.then63, label %if.end64, !dbg !116

if.then63:                                        ; preds = %if.else29
  call void @__ncvm_action_reflect() #5, !dbg !117
  br label %ncvm.scf.null.exit.0, !dbg !121

if.end64:                                         ; preds = %if.else29
  %cmp66 = icmp eq i16 %or93, 15, !dbg !122
  br i1 %cmp66, label %if.then67, label %ncvm.scf.null.entry.0, !dbg !123

if.then67:                                        ; preds = %if.end64
  call void @__ncvm_action_multicast(i16 zeroext 42) #5, !dbg !124
  br label %ncvm.scf.null.exit.1, !dbg !127

if.end69:                                         ; preds = %ncvm.scf.null.exit.0, %if.then17
  ret void, !dbg !128

ncvm.scf.null.exit.0:                             ; preds = %ncvm.scf.null.exit.1, %if.then63
  br label %if.end69

ncvm.scf.null.exit.1:                             ; preds = %ncvm.scf.null.entry.0, %if.then67
  br label %ncvm.scf.null.exit.0

ncvm.scf.null.entry.0:                            ; preds = %if.end64
  br label %ncvm.scf.null.exit.1
}

attributes #0 = { "ncvm-net" }
attributes #1 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #2 = { mustprogress nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-atomic" "ncvm-intrinsic" "ncvm-net" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #3 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #4 = { mustprogress noinline nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "ncvm-kernel"="1" "ncvm-spec"="1,1,1,1,1,1,32" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<stdin>", directory: "/home/gk/vbox-share/p4utils-lubuntu-20.04/ncl-p4")
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
!32 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u8", scope: !7, file: !7, line: 245, type: !8, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 245, column: 1, scope: !32)
!34 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u16", scope: !7, file: !7, line: 246, type: !8, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 246, column: 1, scope: !34)
!36 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u32", scope: !7, file: !7, line: 247, type: !8, scopeLine: 247, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 247, column: 1, scope: !36)
!38 = distinct !DISubprogram(name: "__ncvm_atomic_sadd_u64", scope: !7, file: !7, line: 248, type: !8, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 248, column: 1, scope: !38)
!40 = distinct !DISubprogram(name: "__ncvm_atomic_cond_add_new_u32", scope: !7, file: !7, line: 272, type: !8, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 272, column: 1, scope: !40)
!42 = distinct !DISubprogram(name: "__ncvm_atomic_cond_dec_u32", scope: !7, file: !7, line: 340, type: !8, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 340, column: 1, scope: !42)
!44 = distinct !DISubprogram(name: "__ncvm_atomic_cond_max_new_u32", scope: !7, file: !7, line: 376, type: !8, scopeLine: 376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 376, column: 1, scope: !44)
!46 = distinct !DISubprogram(name: "__ncvm_atomic_or_u16", scope: !7, file: !7, line: 438, type: !8, scopeLine: 438, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 438, column: 1, scope: !46)
!48 = distinct !DISubprogram(name: "__ncvm_atomic_and_u16", scope: !7, file: !7, line: 443, type: !8, scopeLine: 443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 443, column: 1, scope: !48)
!50 = distinct !DISubprogram(name: "lhlf", scope: !51, file: !51, line: 66, type: !8, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_bits.h", directory: "/home/gk")
!52 = !DILocation(line: 66, column: 36, scope: !50)
!53 = !DILocation(line: 66, column: 29, scope: !50)
!54 = distinct !DISubprogram(name: "lhlf", scope: !51, file: !51, line: 67, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 67, column: 36, scope: !54)
!56 = !DILocation(line: 67, column: 29, scope: !54)
!57 = distinct !DISubprogram(name: "lhlf", scope: !51, file: !51, line: 68, type: !8, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 68, column: 36, scope: !57)
!59 = !DILocation(line: 68, column: 29, scope: !57)
!60 = distinct !DISubprogram(name: "hhlf", scope: !51, file: !51, line: 69, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 69, column: 36, scope: !60)
!62 = !DILocation(line: 69, column: 29, scope: !60)
!63 = distinct !DISubprogram(name: "hhlf", scope: !51, file: !51, line: 70, type: !8, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 70, column: 36, scope: !63)
!65 = !DILocation(line: 70, column: 29, scope: !63)
!66 = distinct !DISubprogram(name: "hhlf", scope: !51, file: !51, line: 71, type: !8, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 71, column: 36, scope: !66)
!68 = !DILocation(line: 71, column: 29, scope: !66)
!69 = distinct !DISubprogram(name: "allreduce", scope: !70, file: !70, line: 15, type: !8, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DIFile(filename: "agg/src/device/allreduce.ncl", directory: "/home/gk/vbox-share/p4utils-lubuntu-20.04/ncl-p4")
!71 = !DILocation(line: 19, column: 11, scope: !69)
!72 = !DILocation(line: 20, column: 25, scope: !69)
!73 = !DILocation(line: 19, column: 7, scope: !69)
!74 = !DILocation(line: 288, column: 83, scope: !75, inlinedAt: !77)
!75 = distinct !DISubprogram(name: "atomic_or", scope: !76, file: !76, line: 288, type: !8, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_atomics.h", directory: "/home/gk")
!77 = distinct !DILocation(line: 20, column: 14, scope: !69)
!78 = !DILocation(line: 21, column: 41, scope: !69)
!79 = !DILocation(line: 292, column: 82, scope: !80, inlinedAt: !81)
!80 = distinct !DISubprogram(name: "atomic_and", scope: !76, file: !76, line: 292, type: !8, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = distinct !DILocation(line: 21, column: 5, scope: !69)
!82 = !DILocation(line: 22, column: 3, scope: !69)
!83 = !DILocation(line: 23, column: 41, scope: !69)
!84 = !DILocation(line: 292, column: 82, scope: !80, inlinedAt: !85)
!85 = distinct !DILocation(line: 23, column: 5, scope: !69)
!86 = !DILocation(line: 288, column: 83, scope: !75, inlinedAt: !87)
!87 = distinct !DILocation(line: 24, column: 14, scope: !69)
!88 = !DILocation(line: 27, column: 14, scope: !69)
!89 = !DILocation(line: 28, column: 5, scope: !69)
!90 = !DILocation(line: 28, column: 18, scope: !69)
!91 = !DILocation(line: 27, column: 7, scope: !69)
!92 = !DILocation(line: 28, column: 16, scope: !69)
!93 = !DILocation(line: 30, column: 22, scope: !69)
!94 = !DILocation(line: 30, column: 20, scope: !69)
!95 = !DILocation(line: 31, column: 5, scope: !69)
!96 = !DILocation(line: 31, column: 17, scope: !69)
!97 = !DILocation(line: 32, column: 3, scope: !69)
!98 = !DILocation(line: 33, column: 28, scope: !69)
!99 = !DILocation(line: 35, column: 33, scope: !69)
!100 = !DILocation(line: 35, column: 46, scope: !69)
!101 = !DILocation(line: 280, column: 102, scope: !102, inlinedAt: !103)
!102 = distinct !DISubprogram(name: "atomic_cond_max_new", scope: !76, file: !76, line: 280, type: !8, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = distinct !DILocation(line: 35, column: 12, scope: !69)
!104 = !DILocation(line: 35, column: 10, scope: !69)
!105 = !DILocation(line: 37, column: 61, scope: !69)
!106 = !DILocation(line: 150, column: 98, scope: !107, inlinedAt: !108)
!107 = distinct !DISubprogram(name: "atomic_cond_add_new", scope: !76, file: !76, line: 150, type: !8, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = distinct !DILocation(line: 37, column: 19, scope: !69)
!109 = !DILocation(line: 37, column: 17, scope: !69)
!110 = !DILocation(line: 39, column: 27, scope: !69)
!111 = !DILocation(line: 244, column: 84, scope: !112, inlinedAt: !113)
!112 = distinct !DISubprogram(name: "atomic_cond_dec", scope: !76, file: !76, line: 244, type: !8, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = distinct !DILocation(line: 39, column: 10, scope: !69)
!114 = !DILocation(line: 39, column: 10, scope: !69)
!115 = !DILocation(line: 34, column: 28, scope: !69)
!116 = !DILocation(line: 39, column: 9, scope: !69)
!117 = !DILocation(line: 65, column: 3, scope: !118, inlinedAt: !120)
!118 = distinct !DISubprogram(name: "_reflect", scope: !119, file: !119, line: 64, type: !8, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DIFile(filename: "ws/ncl-staging/build/resources/ncrt-headers/device/__ncl_device_actions.h", directory: "/home/gk")
!120 = distinct !DILocation(line: 40, column: 14, scope: !69)
!121 = !DILocation(line: 40, column: 7, scope: !69)
!122 = !DILocation(line: 41, column: 14, scope: !69)
!123 = !DILocation(line: 41, column: 9, scope: !69)
!124 = !DILocation(line: 109, column: 3, scope: !125, inlinedAt: !126)
!125 = distinct !DISubprogram(name: "_multicast", scope: !119, file: !119, line: 108, type: !8, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = distinct !DILocation(line: 42, column: 14, scope: !69)
!127 = !DILocation(line: 42, column: 7, scope: !69)
!128 = !DILocation(line: 44, column: 1, scope: !69)
