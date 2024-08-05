#ifndef TYPES_P4
#define TYPES_P4

const bit<16> LEN_ETH = 14 * 8;
const bit<16> LEN_IP4 = 20 * 8;
const bit<16> LEN_UDP =  8 * 8;

// -----------------------------------------
// ETH
// -----------------------------------------
typedef bit<48> mac_addr_t;
typedef bit<16> eth_type_t;

const eth_type_t ETH_IPV4   = 16w0x0800;
const eth_type_t ETH_ARP    = 16w0x0806;
const eth_type_t ETH_ROCEv1 = 16w0x8915;

header ethernet_h {
  mac_addr_t dst_addr;
  mac_addr_t src_addr;
  eth_type_t ether_type;
}

// -----------------------------------------
// ARP
// -----------------------------------------
typedef bit<16> arp_opcode_t;

const bit<16> ARP_HTYPE_ETH = 0x0001;
const bit<16> ARP_PTYPE_IP4 = ETH_IPV4;
const arp_opcode_t ARP_REQ = 1;
const arp_opcode_t ARP_RES = 2;
header arp_h {
  bit<16>      hw_type;
  eth_type_t   proto_type;
  bit<8>       hw_addr_len;
  bit<8>       proto_addr_len;
  arp_opcode_t opcode;
}

// -----------------------------------------
// IPv4
// -----------------------------------------
typedef bit<32> ip4_addr_t;
typedef bit<8>  ip4_proto_t;

header arp_ip4_h {
  mac_addr_t  src_hw_addr;
  ip4_addr_t  src_proto_addr;
  mac_addr_t  dst_hw_addr;
  ip4_addr_t  dst_proto_addr;
}

const ip4_proto_t IP_ICMP   = 1;
const ip4_proto_t IP_UDP    = 17;
header ip4_h {
  bit<4>       version;
  bit<4>       ihl;
  bit<8>       diffserv;
  bit<16>      total_len;
  bit<16>      identification;
  bit<3>       flags;
  bit<13>      frag_offset;
  bit<8>       ttl;
  ip4_proto_t  protocol;
  bit<16>      hdr_checksum;
  ip4_addr_t   src_addr;
  ip4_addr_t   dst_addr;
}

@flexible
header ip_metadata_h {
  bool checksum_err;
  bool checksum_update;
}

// -----------------------------------------
// ICMP
// -----------------------------------------
typedef bit<8>  icmp_type_t;

const icmp_type_t ICMP_ECHO_REQ = 8;
const icmp_type_t ICMP_ECHO_RES = 0;
header icmp_h {
  icmp_type_t msg_type;
  bit<8>      msg_code;
  bit<16>     checksum;
}

// -----------------------------------------
// UDP
// -----------------------------------------
typedef bit<16> udp_port_t;

const udp_port_t UDP_PORT_ROCEv2 = 4791;
const udp_port_t UDP_PORT_STRAGGLEML = (udp_port_t) AGG_UDP_PORT;

header udp_h {
  bit<16> src_port;
  bit<16> dst_port;
  bit<16> length;
  bit<16> checksum;
}

// -----------------------------------------
// Agg
// -----------------------------------------

struct pair_t<T> { T hi; T lo; }

typedef bit<16> slot_idx_t;
typedef bit<8>  slot_ver_t;
typedef bit<32> bitmap_t;
typedef bit<32> offset_t;
typedef bit<16> count_t;
typedef bit<(AGG_SLOT_BYTES * 8)> value_t;

enum bit<8> agg_action_t {
  NONE = 8w0,
  BROADCAST = 8w1,
  RETRANSMIT = 8w2,
  DROP = 8w3
}

header agg_h {
  slot_ver_t ver;
  slot_idx_t slot;
  bitmap_t mask;
  offset_t offset;
  value_t v00;
  value_t v01;
  value_t v02;
  value_t v03;
  value_t v04;
  value_t v05;
  value_t v06;
  value_t v07;
  value_t v08;
  value_t v09;
  value_t v10;
  value_t v11;
  value_t v12;
  value_t v13;
  value_t v14;
  value_t v15;
  value_t v16;
  value_t v17;
  value_t v18;
  value_t v19;
  value_t v20;
  value_t v21;
  value_t v22;
  value_t v23;
  value_t v24;
  value_t v25;
  value_t v26;
  value_t v27;
  value_t v28;
  value_t v29;
  value_t v30;
  value_t v31;
}

struct headers_t {
  ethernet_h eth;
  arp_h      arp;
  arp_ip4_h  arp_ip4;
  ip4_h      ip4;
  icmp_h     icmp;
  udp_h      udp;
  agg_h      agg;
}

struct ingress_metadata_t {
  slot_idx_t real_slot;
  bitmap_t bitmap_old;
  bitmap_t bitmap_seen;
  count_t count_old;
  agg_action_t agg_action;
  bitmap_t mask;
  bool ip4_checksum_err;
  bool ip4_checksum_update;
}

struct egress_metadata_t {
}

#endif