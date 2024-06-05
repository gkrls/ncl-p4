#include "types.p4"
#include "bitmap.p4"
#include "parsers.p4"
#include "reducer.p4"
#include "counter.p4"
#include "networking.p4"
#include "agg.p4"

control Ingress(
    inout headers_t H,
    inout ingress_metadata_t M,
    in ingress_intrinsic_metadata_t IM,
    in ingress_intrinsic_metadata_from_parser_t PIM,
    inout ingress_intrinsic_metadata_for_deparser_t DIM,
    inout ingress_intrinsic_metadata_for_tm_t TIM ) {

  AggIngress() agg;
  Forwarder() forward;
  ArpResolver() arp;
  IcmpResponder() icmp;

  apply {
    // By default, bypass the Egress
    //
    // There are 2 cases that we do not bypass the Egress:
    //   1. Responding to ICMP
    //   2. Result broadcast or retransmission of Agg packets
    //
    // In both cases we modify IP so we need to recompute checksum
    TIM.bypass_egress = 1w1;
    if (H.agg.isValid())
      agg.apply(H, M, IM, PIM, DIM, TIM);
    else {
      arp.apply(H, M, IM, PIM, DIM, TIM);
      icmp.apply(H, M, IM, PIM, DIM, TIM);
      forward.apply(H, M, IM, PIM, DIM, TIM);
    }
  }
}

control Egress(
    inout headers_t H,
    inout egress_metadata_t M,
    in egress_intrinsic_metadata_t IM,
    in egress_intrinsic_metadata_from_parser_t PIM,
    inout egress_intrinsic_metadata_for_deparser_t DIM,
    inout egress_intrinsic_metadata_for_output_port_t OPIM ) {

  action worker_port(mac_addr_t mac, ip4_addr_t ip) {
    H.eth.src_addr = H.eth.dst_addr;
    H.eth.dst_addr = mac;
    H.ip4.src_addr = H.ip4.dst_addr;
    H.ip4.dst_addr = ip;
  }

  table port_table {
    key = {IM.egress_port: exact;}
    actions = {worker_port; NoAction;}
    size = 512;
    const default_action = NoAction;
  }
  apply {
    port_table.apply();
    if (H.udp.isValid())
      H.udp.checksum = 0;
  }
}

Pipeline(IngressParser(), Ingress(), IngressDeparser(),
          EgressParser(), Egress(),   EgressDeparser()) pipe;

Switch(pipe) main;