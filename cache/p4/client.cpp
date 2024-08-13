#include <arpa/inet.h>
#include <cstdint>
#include <cstring>
#include <endian.h>
#include <future>
#include <iostream>
#include <istream>
#include <netinet/in.h>
#include <ostream>
#include <sys/socket.h>

#include "client_utils.h"

enum cache_op : uint8_t {
  GET_RQ = 1,
  GET_RS,
  PUT_RQ,
  PUT_RS,
  DEL_RQ,
  DEL_RS,
  UDP_RQ,
  UDP_RS
};

const unsigned CACHE_HEADER_SIZE = 30;
struct __attribute__((packed)) cache_h {
  uint64_t key;
  uint32_t v[4];
  uint8_t op;
  uint32_t mask;
  uint8_t hot;
  char _pad[34]; // align to cacheline
};

struct statistics {
  uint32_t numRequests;
  uint64_t totalTime;
  std::ostream &print(std::ostream &o = std::cout) {
    o << "numRequests: " << numRequests << '\n';
    o << "  totalTime: " << totalTime << '\n';
    return o;
  }
};

inline bool isset(uint32_t value, int i) { return (value & (1 << i)) != 0; }

void createCachePacket(cache_h &c, uint64_t key, uint32_t *val, cache_op op,
                       uint32_t mask = 0) {
  c.key = htobe64(key);
  if (val) {
    c.v[0] = val[0];
    c.v[1] = val[1];
    c.v[2] = val[2];
    c.v[3] = val[3];
  } else {
    c.v[0] = 0;
    c.v[1] = 0;
    c.v[2] = 0;
    c.v[3] = 0;
  }

  c.op = op;
  c.mask = mask;
  c.hot = 0;
}

void createGetRequest(cache_h &c, uint64_t key) {
  createCachePacket(c, key, nullptr, cache_op::GET_RQ);
}

static options opt;

std::ostream &log(uint32_t tid, std::ostream &o = std::cout) {
  std::cout << '[' << "client." << tid << "] ";
  return o;
}

void client(uint32_t tid, std::vector<uint64_t> const &keys, statistics &stats,
            std::shared_future<void> sigstart) {
  sigstart.wait();

  log(tid) << ' ' << opt.IP << '.' << opt.Port << " started... \n";

  sockaddr_in server;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr(opt.ServerIp.c_str());
  server.sin_port = htons(opt.ServerPort);

  sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = inet_addr(opt.IP.c_str());
  addr.sin_port = htons(opt.Port + tid);

  auto soc = socket(AF_INET, SOCK_DGRAM, 0);
  if (soc < 0) {
    std::cerr << "Socket creation failed: " << strerror(errno) << std::endl;
    return;
  }

  int reuse = 1;
  setsockopt(soc, SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));
  if (bind(soc, (sockaddr *)&addr, sizeof(sockaddr)) < 0) {
    log(tid) << "error: bind socket to " << opt.IP << "." << opt.Port + tid
             << '\n';
    return;
  }

  sockaddr_in incaddrr;
  socklen_t inclen = sizeof(sockaddr_in);
  cache_h p = {};
  cache_h q = {};
  for (auto &k : keys) {
    createGetRequest(p, k);
    sendto(soc, &p, CACHE_HEADER_SIZE, 0, (sockaddr *)&server, sizeof(server));
    int recvd =
        recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr *)&incaddrr, &inclen);
    log(tid) << "received: " << recvd << "bytes\n";
    q.v[0] = ntohl(q.v[0]);
    q.v[1] = ntohl(q.v[1]);
    q.v[2] = ntohl(q.v[2]);
    q.v[3] = ntohl(q.v[3]);
    log(tid) << "received op: " << (uint16_t) q.op << " - " << (char*) q.v << '\n';
    // log(tid) << "received op:" << (uint16_t) q.op << " - " << ntohl(q.v[0])
    //          << ", " << ntohl(q.v[1]) << "," << ntohl(q.v[2]) << ","
    //          << ntohl(q.v[3]) << '\n';
  }
}

int main(int argc, char **argv) {
  opt.parse(argc, argv);

  std::vector<std::thread> threads;
  std::vector<statistics> stats;
  std::promise<void> start;
  std::shared_future<void> sigstart = start.get_future().share();

  std::vector<uint64_t> keys(3, 0);
  strncpy((char *)&keys.data()[0], "hello", 5);
  strncpy((char *)&keys.data()[1], "netcl", 5);
  strncpy((char *)&keys.data()[2], "nope", 4);

  for (auto tid = 0; tid < opt.Threads; ++tid)
    threads.emplace_back(client, tid, keys, std::ref(stats[tid]), sigstart);

  std::cout << "info: starting " << opt.Threads << " client threads\n";
  start.set_value();
  for (auto &t : threads)
    if (t.joinable())
      t.join();

  for (auto i = 0; i < stats.size(); ++i) {
    std::cout << "Statistics for thread '" << i << "'\n";
    stats.at(i).print(std::cout) << '\n';
  }
  // We will just dispath -j client threads and wait them
}