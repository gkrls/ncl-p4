#include "types.p4"

control ReducerImpl(in slot_idx_t idx,
                    in bitmap_t bitmap_old, in bitmap_t bitmap_seen,
                    in value_t v, out value_t res)(bit<32> Size) {
  Register<value_t, slot_idx_t>(Size) R;
  RegisterAction<value_t, slot_idx_t, value_t>(R) add = {
    void apply(inout value_t r, out value_t ret) {
      r = r + v;
      ret = r;
    }
  };
  RegisterAction<value_t, slot_idx_t, value_t>(R) set = {
    void apply(inout value_t r, out value_t ret) {
      r = v;
      ret = r;
    }
  };
  RegisterAction<value_t, slot_idx_t, value_t>(R) get = {
    void apply(inout value_t r, out value_t ret) {
      ret = r;
    }
  };

  action add_action() { res = add.execute(idx); }
  action set_action() { res = set.execute(idx); }
  action get_action() { res = get.execute(idx); }

  table reduce {
    key = {
      bitmap_old:  ternary;
      bitmap_seen: ternary; // old & mask
    }
    actions = { NoAction;
                add_action;
                set_action;
                get_action;}
    const size = 3;
    const default_action = NoAction;
    const entries = {
      // bitmap_old == 0 => this is the first packet
      (32w0,    _) : set_action();
      // bitmap_seen == 0 => intermediate packet
      (   _, 32w0) : add_action();
      // bitmap_seen != 0 => retransmission
      // Whether the packet is actually sent to the worker
      // depends on whether the slot was full or not.
      (   _,    _) : get_action();
    }
  }

  apply { reduce.apply(); }
}

control Reducer(inout headers_t H, in ingress_metadata_t M, in ingress_intrinsic_metadata_t IM)
               (bit<32> Size) {
  ReducerImpl(Size) r00; ReducerImpl(Size) r10; ReducerImpl(Size) r20; ReducerImpl(Size) r30;
  ReducerImpl(Size) r01; ReducerImpl(Size) r11; ReducerImpl(Size) r21; ReducerImpl(Size) r31;
  ReducerImpl(Size) r02; ReducerImpl(Size) r12; ReducerImpl(Size) r22;
  ReducerImpl(Size) r03; ReducerImpl(Size) r13; ReducerImpl(Size) r23;
  ReducerImpl(Size) r04; ReducerImpl(Size) r14; ReducerImpl(Size) r24;
  ReducerImpl(Size) r05; ReducerImpl(Size) r15; ReducerImpl(Size) r25;
  ReducerImpl(Size) r06; ReducerImpl(Size) r16; ReducerImpl(Size) r26;
  ReducerImpl(Size) r07; ReducerImpl(Size) r17; ReducerImpl(Size) r27;
  ReducerImpl(Size) r08; ReducerImpl(Size) r18; ReducerImpl(Size) r28;
  ReducerImpl(Size) r09; ReducerImpl(Size) r19; ReducerImpl(Size) r29;
  apply {
    r00.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v00, H.agg.v00);
    r01.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v01, H.agg.v01);
    r02.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v02, H.agg.v02);
    r03.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v03, H.agg.v03);
    r04.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v04, H.agg.v04);
    r05.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v05, H.agg.v05);
    r06.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v06, H.agg.v06);
    r07.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v07, H.agg.v07);
    r08.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v08, H.agg.v08);
    r09.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v09, H.agg.v09);
    r10.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v10, H.agg.v10);
    r11.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v11, H.agg.v11);
    r12.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v12, H.agg.v12);
    r13.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v13, H.agg.v13);
    r14.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v14, H.agg.v14);
    r15.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v15, H.agg.v15);
    r16.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v16, H.agg.v16);
    r17.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v17, H.agg.v17);
    r18.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v18, H.agg.v18);
    r19.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v19, H.agg.v19);
    r20.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v20, H.agg.v20);
    r21.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v21, H.agg.v21);
    r22.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v22, H.agg.v22);
    r23.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v23, H.agg.v23);
    r24.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v24, H.agg.v24);
    r25.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v25, H.agg.v25);
    r26.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v26, H.agg.v26);
    r27.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v27, H.agg.v27);
    r28.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v28, H.agg.v28);
    r29.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v29, H.agg.v29);
    r30.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v30, H.agg.v30);
    r31.apply(M.real_slot, M.bitmap_old, M.bitmap_seen, H.agg.v31, H.agg.v31);
  }
}