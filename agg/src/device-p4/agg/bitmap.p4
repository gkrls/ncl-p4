#ifndef BITMAP_P4
#define BITMAP_P4

typedef pair_t<bitmap_t> bitmap_pair_t;

control Bitmap(inout headers_t H, inout ingress_metadata_t M, in ingress_intrinsic_metadata_t IM)
               (bit<32> Size) {
  Register<bitmap_pair_t, slot_idx_t>(Size) R;
  RegisterAction<bitmap_pair_t, slot_idx_t, bitmap_t>(R) bitmap_hi = {
    void apply(inout bitmap_pair_t reg, out bitmap_t ret) {
      ret = reg.hi;
      reg.hi = reg.hi | H.agg.mask;
      reg.lo = reg.lo & ~H.agg.mask;
    }
  };
  RegisterAction<bitmap_pair_t, slot_idx_t, bitmap_t>(R) bitmap_lo = {
    void apply(inout bitmap_pair_t reg, out bitmap_t ret) {
      ret = reg.lo;
      reg.hi = reg.hi & ~H.agg.mask;
      reg.lo = reg.lo | H.agg.mask;
    }
  };

  action ver_0_bitmap() {
    M.bitmap_old = bitmap_lo.execute(H.agg.slot);
    M.bitmap_seen = M.bitmap_old & H.agg.mask;
  }

  action ver_1_bitmap() {
    M.bitmap_old = bitmap_hi.execute(H.agg.slot);
    M.bitmap_seen = M.bitmap_old & H.agg.mask;
  }

  table bitmap {
    key = {H.agg.ver: exact;}
    actions = {ver_0_bitmap; ver_1_bitmap; NoAction;}
    const size = 2;
    const default_action = NoAction;
    const entries = {
      0 : ver_0_bitmap();
      1 : ver_1_bitmap();
    }
  }

  apply { bitmap.apply(); }
}

#endif