control ArpResolver(inout headers_t H, inout ingress_metadata_t M,
                    in ingress_intrinsic_metadata_t IM,
                    in ingress_intrinsic_metadata_from_parser_t PIM,
                    inout ingress_intrinsic_metadata_for_deparser_t DIM,
                    inout ingress_intrinsic_metadata_for_tm_t TIM) {

  action resolve(mac_addr_t mac) {
    H.arp.opcode = ARP_RES;

    H.arp_ip4.dst_hw_addr = H.arp_ip4.src_hw_addr;
    H.arp_ip4.src_hw_addr = mac;

    ip4_addr_t tmp1 = H.arp_ip4.dst_proto_addr;
    H.arp_ip4.dst_proto_addr = H.arp_ip4.src_proto_addr;
    H.arp_ip4.src_proto_addr = tmp1;

    H.eth.dst_addr = H.eth.src_addr;
    H.eth.src_addr = mac;

    // Send back out the ingress port
    TIM.ucast_egress_port = IM.ingress_port;
  }

  table arp_table {
    key = {H.arp_ip4.dst_proto_addr: exact;}
    actions = {resolve;NoAction;}
    const size = ARP_TABLE_CAPACITY;
    const default_action=NoAction;
  }

  apply {
    if (H.arp.isValid())
      arp_table.apply();
  }
}

control IcmpResponder(inout headers_t H, inout ingress_metadata_t M,
                      in ingress_intrinsic_metadata_t IM,
                      in ingress_intrinsic_metadata_from_parser_t PIM,
                      inout ingress_intrinsic_metadata_for_deparser_t DIM,
                      inout ingress_intrinsic_metadata_for_tm_t TIM) {
  action respond() {
    H.icmp.msg_type = ICMP_ECHO_RES;
    H.icmp.checksum = 0;
    // M.ip4_checksum_update = true;

    // swap ip addresses
    // ip4_addr_t tmp = H.ip4.src_addr;
    // H.ip4.src_addr = H.ip4.dst_addr;
    // H.ip4.dst_addr = tmp;

    // we modified IP so have Egress recompute checksum
    TIM.bypass_egress = 1w0;

    // swap mac addresses
    // mac_addr_t tmp2 = H.eth.src_addr;
    // H.eth.src_addr = H.eth.dst_addr;
    // H.eth.dst_addr = tmp2;

    // Send back out the ingress port
    TIM.ucast_egress_port = IM.ingress_port;
  }

  table icmp_table {
    key = {H.ip4.dst_addr: exact;}
    actions = {respond;NoAction;}
    const size = ICMP_TABLE_CAPACITY;
    const default_action=NoAction;
  }

  apply {
    if (H.icmp.isValid()) {
      // H.icmp.valid = 2;
      icmp_table.apply();
    }
  }
}

control Forwarder(inout headers_t H, inout ingress_metadata_t M,
                  in ingress_intrinsic_metadata_t IM,
                  in ingress_intrinsic_metadata_from_parser_t PIM,
                  inout ingress_intrinsic_metadata_for_deparser_t DIM,
                  inout ingress_intrinsic_metadata_for_tm_t TIM) {

  action forward(PortId_t port) {
    DIM.drop_ctl = 0x0;
    TIM.ucast_egress_port = port;
  }

  action drop() {
    DIM.drop_ctl[0:0] = 0x1;
  }

  table forwarding_table {
    key = {H.eth.dst_addr: exact;}
    actions = {forward;drop;}
    const default_action = drop;
    const size = FORWARDING_TABLE_CAPACITY;
  }

  apply { forwarding_table.apply(); }
}