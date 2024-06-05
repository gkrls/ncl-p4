parser IngressParser(packet_in P, out headers_t H,
                     out ingress_metadata_t M,
                     out ingress_intrinsic_metadata_t IM) {
  Checksum() ip_checksum;

  state start {
    P.extract(IM);
    P.advance(PORT_METADATA_SIZE);
    transition parse_ethernet;
  }
  state parse_ethernet {
    P.extract(H.eth);
    transition select(H.eth.ether_type) {
        ETH_ARP  : parse_arp;
        ETH_IPV4 : parse_ip4;
         default : accept;
    }
  }
  state parse_arp {
    P.extract(H.arp);
    transition select(H.arp.hw_type, H.arp.proto_type) {
      (ARP_HTYPE_ETH, ARP_PTYPE_IP4) : parse_arp_ip4;
                             default : accept;
    }
  }

  state parse_arp_ip4 {
    P.extract(H.arp_ip4);
    transition accept;
  }

  state parse_ip4 {
    P.extract(H.ip4);
    ip_checksum.add(H.ip4);
    M.ip4_checksum_err = ip_checksum.verify();

    // parse IP packets with no options only
    // !! Currently we assume no fragmentation
    transition select(H.ip4.ihl, H.ip4.protocol) {
      (5, IP_UDP)  : parse_udp;
      (5, IP_ICMP) : parse_icmp;
           default : accept; }
  }

  state parse_icmp {
    P.extract(H.icmp);
    transition accept;
  }

  state parse_udp {
    P.extract(H.udp);
    transition select(H.udp.dst_port) {
      AGG_UDP_PORT : parse_agg;
           default : accept;
    }
  }

  state parse_agg {
    P.extract(H.agg);
    transition accept;
  }
}

control IngressDeparser(packet_out P, inout headers_t H,
                        in ingress_metadata_t M,
                        in ingress_intrinsic_metadata_for_deparser_t DIM) {
  apply { P.emit(H); }
}

parser EgressParser(packet_in P, out headers_t H,
                    out egress_metadata_t M,
                    out egress_intrinsic_metadata_t IM) {
  state start {
    P.extract(IM);
    P.extract(H.eth);
    P.extract(H.ip4);
    transition select(H.ip4.ihl, H.ip4.protocol) {
      (5, IP_UDP)  : parse_udp;
          default  : accept;
    }
  }
  state parse_udp {
    P.extract(H.udp);
    transition accept;
  }
  //   transition select(H.ip4.ihl, H.ip4.protocol) {
  //     (5, IP_UDP)  : parse_udp;
  //     (5, IP_ICMP) : parse_icmp;
  //          default : accept; }
  // }
  // state parse_icmp {
  //   P.extract(H.icmp);
  //   transition accept;
  // }
  // state parse_udp {
  //   P.extract(H.udp);
  //   transition select(H.udp.dst_port) {
  //     AGG_UDP_PORT : parse_agg;
  //          default : accept;
  //   }
  // }
  // state parse_agg {
  //   P.extract(H.agg);
  //   transition accept;
  // }
}

control EgressDeparser(packet_out P,
                       inout headers_t H,
                       in egress_metadata_t M,
                       in egress_intrinsic_metadata_for_deparser_t DIM) {
  Checksum() ip4_checksum;
  apply {
    H.ip4.hdr_checksum = ip4_checksum.update(
        { H.ip4.version,
          H.ip4.ihl,
          H.ip4.diffserv,
          H.ip4.total_len,
          H.ip4.identification,
          H.ip4.flags,
          H.ip4.frag_offset,
          H.ip4.ttl,
          H.ip4.protocol,
          H.ip4.src_addr,
          H.ip4.dst_addr } );
    P.emit(H); }
}
