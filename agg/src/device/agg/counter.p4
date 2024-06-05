control ReduceCounter(inout headers_t H, inout ingress_metadata_t M, in ingress_intrinsic_metadata_t IM)
                     (bit<32> Size) {
  Register<count_t, slot_idx_t>(Size) R;
  RegisterAction<count_t, slot_idx_t, count_t>(R) dec = {
    void apply(inout count_t r, out count_t ret) {
      ret = r;
      if (r == 0) {
        r = AGG_WORKERS - 1;
      } else {
        r = r - 1;
      }
    }
  };
  RegisterAction<count_t, slot_idx_t, count_t>(R) get = {
    void apply(inout count_t r, out count_t ret) { ret = r; }
  };

  action dec_action() { M.count_old = dec.execute(M.real_slot); }
  action get_action() { M.count_old = get.execute(M.real_slot); }

  table count {
    key = {
      M.bitmap_seen: ternary; // old & mask
    }
    actions = { NoAction;
                dec_action;
                get_action;}
    const size = 3;
    const default_action = NoAction;
    const entries = {
      // worker not seen, so count
      32w0 : dec_action();
         _ : get_action();
      // 32w0, 32w0 : rst_action();
      //    _, 32w0 : dec_action();
      //    _,    _ : get_action();
    }
  }

  apply { count.apply(); }
}