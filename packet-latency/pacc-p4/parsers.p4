#ifndef _PARSER_P4_
#define _PARSER_P4_

#define ETHERTYPE_IPV4 16w0x0800
#define UDP_PROTOCOL 8w0x11
#define PAXOS_PROTOCOL 16w0x8888

#include "headers.p4"

parser ingress_parser(packet_in b,
                      out headers p,
                      out metadata meta,
                      out ingress_intrinsic_metadata_t im) {
  Checksum() ipv4_checksum;

  state start {
    b.extract(im);
    b.advance(PORT_METADATA_SIZE);
    transition parse_ethernet;
  }

  state parse_ethernet {
    b.extract(p.ethernet);
    transition select(p.ethernet.etherType) {
      ETHERTYPE_IPV4 : parse_ipv4;
    }
  }

  state parse_ipv4 {
    b.extract(p.ipv4);
    ipv4_checksum.add(p.ipv4);
    meta.ipv4_checksum_error = ipv4_checksum.verify();

    transition select(p.ipv4.protocol) {
      UDP_PROTOCOL : parse_udp;
           default : accept;
    }
  }

  state parse_udp {
    b.extract(p.udp);
    transition select(p.udp.dstPort) {
      PAXOS_PROTOCOL : parse_paxos;
      default : accept;
    }
  }

  state parse_paxos {
    b.extract(p.paxos);
    transition accept;
  }
}

control ingress_deparser( packet_out packet,
                          inout headers hdr,
                          in metadata m,
                          in ingress_intrinsic_metadata_for_deparser_t dim) {
  apply {
    packet.emit(hdr.ethernet);
    packet.emit(hdr.ipv4);
    packet.emit(hdr.udp);
    packet.emit(hdr.paxos);
  }
}

parser egress_parser(packet_in b, out headers p,
                      out metadata meta,
                      out egress_intrinsic_metadata_t im) {
  state start {
    b.extract(im);
    transition parse_ethernet;
  }

  state parse_ethernet {
    b.extract(p.ethernet);
    transition select(p.ethernet.etherType) {
      ETHERTYPE_IPV4 : parse_ipv4;
    }
  }

  state parse_ipv4 {
    b.extract(p.ipv4);

    transition select(p.ipv4.protocol) {
      UDP_PROTOCOL : parse_udp;
           default : accept;
    }
  }

  state parse_udp {
    b.extract(p.udp);
    transition select(p.udp.dstPort) {
      PAXOS_PROTOCOL : parse_paxos;
      default : accept;
    }
  }

  state parse_paxos {
    b.extract(p.paxos);
    transition accept;
  }
}

control egress_deparser (packet_out packet,
                         inout headers hdr,
                         in metadata meta,
                         in egress_intrinsic_metadata_for_deparser_t dim) {

  Checksum() ipv4_checksum;

  apply {
    if (hdr.ipv4.isValid()) {
      hdr.ipv4.hdrChecksum = ipv4_checksum.update({
        hdr.ipv4.version,
        hdr.ipv4.ihl,
        hdr.ipv4.diffserv,
        hdr.ipv4.totalLen,
        hdr.ipv4.identification,
        hdr.ipv4.flags,
        hdr.ipv4.fragOffset,
        hdr.ipv4.ttl,
        hdr.ipv4.protocol,
        hdr.ipv4.srcAddr,
        hdr.ipv4.dstAddr
      });
    }
    packet.emit(hdr.ethernet);
    packet.emit(hdr.ipv4);
    packet.emit(hdr.udp);
    packet.emit(hdr.paxos);
  }
}

// control verifyChecksum(in headers hdr, inout metadata meta) {
//     Checksum16() ipv4_checksum;
//     apply {
//         if (hdr.ipv4.hdrChecksum == ipv4_checksum.get({
//                                         hdr.ipv4.version,
//                                         hdr.ipv4.ihl,
//                                         hdr.ipv4.diffserv,
//                                         hdr.ipv4.totalLen,
//                                         hdr.ipv4.identification,
//                                         hdr.ipv4.flags,
//                                         hdr.ipv4.fragOffset,
//                                         hdr.ipv4.ttl,
//                                         hdr.ipv4.protocol,
//                                         hdr.ipv4.srcAddr,
//                                         hdr.ipv4.dstAddr
//                                     }))
//             mark_to_drop();
//     }
// }

// control computeChecksum(inout headers hdr, inout metadata meta) {
//     Checksum16() ipv4_checksum;
//     apply {
//         hdr.ipv4.hdrChecksum = ipv4_checksum.get({
//                                         hdr.ipv4.version,
//                                         hdr.ipv4.ihl,
//                                         hdr.ipv4.diffserv,
//                                         hdr.ipv4.totalLen,
//                                         hdr.ipv4.identification,
//                                         hdr.ipv4.flags,
//                                         hdr.ipv4.fragOffset,
//                                         hdr.ipv4.ttl,
//                                         hdr.ipv4.protocol,
//                                         hdr.ipv4.srcAddr,
//                                         hdr.ipv4.dstAddr
//                                     });
//     }
// }

#endif