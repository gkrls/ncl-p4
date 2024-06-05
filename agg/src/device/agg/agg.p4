#ifndef AGG_P4
#define AGG_P4

control AggIngress(inout headers_t H,
                   inout ingress_metadata_t M,
                   in ingress_intrinsic_metadata_t IM,
                   in ingress_intrinsic_metadata_from_parser_t PIM,
                   inout ingress_intrinsic_metadata_for_deparser_t DIM,
                   inout ingress_intrinsic_metadata_for_tm_t TIM ) {
  Bitmap(AGG_SLOT_CNT) bitmap;
  Reducer(AGG_SLOT_ALLOC) reduce;
  ReduceCounter(AGG_SLOT_ALLOC) count;

  // 0: drops
  // 1: multicasts
  // 3: retransmissions
  Counter<count_t, bit<8>>(3, CounterType_t.PACKETS) stats;

  action even_slot() { M.real_slot = H.agg.slot;    }
  action odd_slot() { M.real_slot = H.agg.slot + AGG_SLOT_CNT; }

  table slot {
    key = { H.agg.ver : exact; }
    actions = {even_slot; odd_slot;}
    const size = 1;
    const default_action = even_slot;
    const entries = {
      1: odd_slot;
    }
  }

  action drop() {
    DIM.drop_ctl[0:0] = 1w0;
    stats.count(0);
  }

  action multicast() {
    TIM.mcast_grp_a = AGG_MULTICAST_GROUD_ID;
    TIM.level1_exclusion_id = 0xffff; // exclude no nodes
    TIM.bypass_egress = 1w0;          // do not bypass egress for multicast
    DIM.drop_ctl[0:0] = 1w0;
    stats.count(1);
  }

  action reflect() {
    // // Swap ETH
    // mac_addr_t tmp1 = H.eth.src_addr;
    // H.eth.src_addr = H.eth.dst_addr;
    // H.eth.dst_addr = tmp1;
    // // Swap IP
    // ip4_addr_t tmp2 = H.ip4.src_addr;
    // H.ip4.src_addr = H.ip4.dst_addr;
    // H.ip4.dst_addr = tmp2;
    TIM.ucast_egress_port = IM.ingress_port;
    TIM.bypass_egress = 1w0;
    DIM.drop_ctl[0:0] = 1w0;
    stats.count(2);
  }

  table next {
    key = { M.bitmap_seen: ternary;
            M.count_old: ternary; }
    actions = {drop; multicast; reflect;}
    const size = 4;
    const entries = {
      (32w0, 16w1) : multicast(); // last packet
      (32w0,    _) : drop();      // first/intermediate packet
      (   _, 16w1) : reflect();   // retransmission + slot complete
      (   _,    _) : drop();      // retransmission + slot incomplete
    }
  }

  apply {
    slot.apply();
    bitmap.apply(H, M, IM);
    reduce.apply(H, M, IM);
    count.apply(H, M, IM);
    next.apply();
  }
}

#endif