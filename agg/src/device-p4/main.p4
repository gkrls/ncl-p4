#include <core.p4>
#include <tna.p4>

#include "config.p4"
#include "types.p4"
#include "parsers.p4"

control reducer(in bitmap_t bitmap_old, in bitmap_t bitmap_chk,
                in slot_idx_t idx, inout value_t v) {

  Register<value_t, slot_idx_t>(1024) R;

  RegisterAction<value_t, slot_idx_t, value_t>(R) add = {
    void apply(inout value_t reg, out value_t ret) {
      reg = reg + v;
      ret = reg;
    }
  };

  RegisterAction<value_t, slot_idx_t, value_t>(R) get = {
    void apply(inout value_t reg, out value_t ret) {
      ret = reg;
    }
  };

  RegisterAction<value_t, slot_idx_t, value_t>(R) set = {
    void apply(inout value_t reg, out value_t ret) {
      reg = v;
      ret = reg;
    }
  };

  action update_register() { v = add.execute(idx); }

  action read_register() { v = get.execute(idx); }

  action write_register() { v = get.execute(idx); }

  table reduce {
    key = {bitmap_old: ternary; bitmap_chk: ternary;}
    actions = {update_register; read_register; write_register; }
    const size = 32;
    const entries = {
      (0, _) : write_register();
      (_, 0) : update_register();
      (_, _) : read_register();
    }
  }

  apply { reduce.apply(); }
}

control allreduce ( inout headers_t H, inout ingress_metadata_t M,
                    in ingress_intrinsic_metadata_t IM,
                    in ingress_intrinsic_metadata_from_parser_t PIM,
                    inout ingress_intrinsic_metadata_for_deparser_t DIM,
                    inout ingress_intrinsic_metadata_for_tm_t TIM ) {

  bitmap_t bitmap_old;
  bitmap_t bitmap_chk;
  bit<32> count_old;

  Register<pair<bitmap_t>, slot_idx_t>(1024) Bitmap;
  RegisterAction<pair<bitmap_t>, slot_idx_t, bitmap_t>(Bitmap) bitmap_record_hi = {
    void apply(inout pair<bitmap_t> reg, out bitmap_t ret) {
      ret = reg.hi;
      reg.hi = reg.hi | H.agg.mask;    // set hi
      reg.lo = reg.lo & (~H.agg.mask); // clear lo
    }
  };
  RegisterAction<pair<bitmap_t>, slot_idx_t, bitmap_t>(Bitmap) bitmap_record_lo = {
    void apply(inout pair<bitmap_t> reg, out bitmap_t ret) {
      ret = reg.lo;
      reg.hi = reg.hi & (~H.agg.mask); // clear hi
      reg.lo = reg.lo | H.agg.mask;    // set lo
    }
  };

  action bitmap_0() { bitmap_old = bitmap_record_lo.execute(H.agg.bmp_idx); }
  action bitmap_1() { bitmap_old = bitmap_record_hi.execute(H.agg.bmp_idx); }

  table bitmap {
    key = { H.agg.ver: exact; }
    actions = { bitmap_0; bitmap_1; NoAction; }
    const size = 2;
    const default_action = NoAction;
    const entries = {
      0: bitmap_0();
      1: bitmap_1();
    }
  }

  Register<bit<32>, slot_idx_t>(1024) Count;

  RegisterAction<bit<32>, slot_idx_t, bit<32>>(Count) update_counter = {
    void apply(inout bit<32> reg, out bit<32> ret) {
      ret = reg;
      if (reg == 0) {
        reg = ALLREDUCE_NUM_WORKERS - 1;
      } else {
        reg = reg - 1;
      }
    }
  };

  RegisterAction<bit<32>, slot_idx_t, bit<32>>(Count) read_counter = {
    void apply(inout bit<32> reg, out bit<32> ret) {
      ret = reg;
    }
  };

  action count_contribution() { count_old = update_counter.execute(H.agg.agg_idx); }
  action count_retransmission() { count_old = read_counter.execute(H.agg.agg_idx); }

  table count {
    key = { bitmap_chk: ternary; }
    actions = { count_contribution; count_retransmission; }
    const size = 2;
    const entries = {
      0: count_contribution();
      _: count_retransmission();
    }
  }

  reducer() R00;
  reducer() R01;
  reducer() R02;
  reducer() R03;
  reducer() R04;
  reducer() R05;
  reducer() R06;
  reducer() R07;
  reducer() R08;
  reducer() R09;
  reducer() R10;
  reducer() R11;
  reducer() R12;
  reducer() R13;
  reducer() R14;
  reducer() R15;
  reducer() R16;
  reducer() R17;
  reducer() R18;
  reducer() R19;
  reducer() R20;
  reducer() R21;
  reducer() R22;
  reducer() R23;
  reducer() R24;
  reducer() R25;
  reducer() R26;
  reducer() R27;
  reducer() R28;
  reducer() R29;
  reducer() R30;
  reducer() R31;

  action next_reflect() {
    TIM.ucast_egress_port = IM.ingress_port;
    TIM.bypass_egress = 0;
    DIM.drop_ctl[0:0] = 0;
  }

  action next_multicast() {
    TIM.mcast_grp_a = ALLREDUCE_MULTICAST_GRPOUP_ID;
    TIM.bypass_egress = 0;
    DIM.drop_ctl[0:0] = 0;
  }

  action next_drop() { DIM.drop_ctl[0:0] = 1; }

  table next {
    key = {count_old: ternary;}
    actions = {next_reflect; next_multicast; next_drop; }
    const entries = {
      0: next_reflect();
      1: next_multicast();
      _: next_drop();
    }
  }

  apply {

    bitmap_old = 0;
    bitmap_chk = 0;
    count_old = 0;

    bitmap.apply();
    bitmap_chk = bitmap_old & H.agg.mask;

    count.apply();

    R00.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v00);
    R01.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v01);
    R02.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v02);
    R03.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v03);
    R04.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v04);
    R05.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v05);
    R06.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v06);
    R07.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v07);
    R08.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v08);
    R09.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v09);
    R10.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v10);
    R11.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v11);
    R12.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v12);
    R13.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v13);
    R14.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v14);
    R15.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v15);
    R16.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v16);
    R17.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v17);
    R18.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v18);
    R19.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v19);
    R20.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v20);
    R21.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v21);
    R22.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v22);
    R23.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v23);
    R24.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v24);
    R25.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v25);
    R26.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v26);
    R27.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v27);
    R28.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v28);
    R29.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v29);
    R30.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v30);
    R31.apply( bitmap_old, bitmap_chk, H.agg.agg_idx, H.agg_vals.v31);

    next.apply();
  }
}




control forwarding( inout headers_t H, inout ingress_metadata_t M,
                    in ingress_intrinsic_metadata_t IM,
                    in ingress_intrinsic_metadata_from_parser_t PIM,
                    inout ingress_intrinsic_metadata_for_deparser_t DIM,
                    inout ingress_intrinsic_metadata_for_tm_t TIM ) {

  action send_to_port(PortId_t port) {
    DIM.drop_ctl[0:0] = 0x0;
    TIM.ucast_egress_port = port;
  }
  action flood() {
    DIM.drop_ctl[0:0] = 0x0;
    TIM.mcast_grp_a = FLOOD_MULTICAST_GROUP_ID;
    TIM.level1_exclusion_id = (bit<16>) IM.ingress_port;
  }
  table forwarding_table {
    key = {H.eth.dst_addr: exact;}
    actions = { send_to_port; flood; }
    const default_action = flood;
    const size = FORWARDING_TABLE_CAPACITY;
  }
  apply {
    TIM.bypass_egress = 0;
    forwarding_table.apply();
  }
}

control ingress( inout headers_t H, inout ingress_metadata_t M,
                 in ingress_intrinsic_metadata_t IM,
                 in ingress_intrinsic_metadata_from_parser_t PIM,
                 inout ingress_intrinsic_metadata_for_deparser_t DIM,
                 inout ingress_intrinsic_metadata_for_tm_t TIM ) {

  allreduce() agg;
  forwarding() fwd;

  apply {
    if (H.agg.isValid())
      agg.apply(H, M, IM, PIM, DIM, TIM);
    else {
      fwd.apply(H, M, IM, PIM, DIM, TIM);
    }
  }
}

control egress( inout headers_t H, inout egress_metadata_t M,
                in egress_intrinsic_metadata_t IM,
                in egress_intrinsic_metadata_from_parser_t PIM,
                inout egress_intrinsic_metadata_for_deparser_t DIM,
                inout egress_intrinsic_metadata_for_output_port_t OPIM ) {

  action send(mac_addr_t mac, ip4_addr_t ip, udp_port_t port, bitmap_t mask) {
    H.eth.src_addr = H.eth.dst_addr;
    H.eth.dst_addr = mac;
    H.ip4.src_addr = H.ip4.dst_addr;
    H.ip4.dst_addr = ip;
    H.ip4.ttl = H.ip4.ttl |-| 1;
    H.udp.src_port = H.udp.dst_port;
    H.udp.dst_port = port;
    H.udp.checksum = 0;
    H.agg.mask = mask;
  }

  table allreduce_worker_sender {
    key = { IM.egress_port: exact; }
    actions = { send; NoAction;}
    size = ALLREDUCE_WORKER_TABLE_CAPACITY;
    const default_action = NoAction;
  }

  apply {
    if (H.agg.isValid())
      allreduce_worker_sender.apply();
  }
}

Pipeline( ingress_parser(), ingress(), ingress_deparser(),
          egress_parser(), egress(), egress_deparser()) pipe;

Switch(pipe) main;