#include <algorithm>
#include <arpa/inet.h>
#include <chrono>
#include <cstdint>
#include <cstring>
#include <endian.h>
#include <future>
#include <iomanip>
#include <iostream>
#include <istream>
#include <netinet/in.h>
#include <ostream>
#include <random>
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
  uint32_t queries;
  uint64_t duration1;
  uint64_t duration2;
  std::ostream &print(std::ostream &o = std::cout) {
    o << "numqueries: " << queries << '\n';
    o << " duration1: " << duration1 << '\n';
    o << " duration2: " << duration2 << '\n';
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

void interactive_client(uint32_t tid, std::string serverAddr,
                        uint16_t serverPort) {
  sockaddr_in server;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr(serverAddr.c_str());
  server.sin_port = htons(serverPort);

  log(tid) << ' ' << opt.IP << '.' << opt.Port
           << " started in interactive mode\n";

  sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = inet_addr(opt.IP.c_str());
  addr.sin_port = htons(opt.Port + tid);

  auto soc = socket(AF_INET, SOCK_DGRAM, 0);
  if (soc < 0) {
    log(tid) << "error: ocket creation failed: " << strerror(errno)
             << std::endl;
    return;
  }
  int reuse = 1;
  setsockopt(soc, SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));
  if (bind(soc, (sockaddr *)&addr, sizeof(sockaddr)) < 0) {
    log(tid) << "error: bind socket to " << opt.IP << "." << opt.Port + tid
             << '\n';
    return;
  }

  std::string line;
  log(tid)
      << "Enter keys (look at data.txt for inspiration) or type 'q' to quit:"
      << std::endl;

  cache_h p = {}, q = {};

  sockaddr_in incaddrr;
  socklen_t inclen = sizeof(sockaddr_in);

  while (true) {
    // Read a line from standard input
    std::cout << "> ";
    std::getline(std::cin, line);

    // Check if the line is "q"
    if (line == "q") {
      break;
    }

    if (line.size() > 8) {
      std::cout << "err: input too long\n";
      continue;
    }

    uint64_t k = 0;
    strncpy((char *)&k, line.data(), line.size());

    createGetRequest(p, k);
    // sendto(soc, &p, CACHE_HEADER_SIZE, 0, (sockaddr *)&server,
    // sizeof(server)); recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr
    // *)&incaddrr, &inclen);

    sendto(soc, &p, CACHE_HEADER_SIZE, 0, (sockaddr *)&server, sizeof(server));
    auto tStart = std::chrono::high_resolution_clock::now();
    recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr *)&incaddrr, &inclen);
    auto tEnd = std::chrono::high_resolution_clock::now();
    auto duration =
        std::chrono::duration_cast<std::chrono::microseconds>(tEnd - tStart)
            .count();

    if (q.op == cache_op::GET_RQ)
      std::cout << "  key not found "
                << "(" << duration << "us)\n";
    else {
      q.v[0] = ntohl(q.v[0]);
      q.v[1] = ntohl(q.v[1]);
      q.v[2] = ntohl(q.v[2]);
      q.v[3] = ntohl(q.v[3]);
      char val[17] = {0};
      strncpy(val, (char *)&q.v, 16);
      std::cout << "  key found with value: " << val << "(" << duration
                << "us)\n";
    }
  }

  log(tid) << "finished\n";
}

void client(uint32_t tid, std::string serverAddr, uint16_t serverPort,
            std::vector<uint64_t> const &keys, statistics &stats,
            std::shared_future<void> sigstart) {
  log(tid) << "with server " << serverAddr << "-" << serverPort << '\n';
  sigstart.wait();

  sockaddr_in server;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr(serverAddr.c_str());
  server.sin_port = htons(serverPort);

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
  cache_h p;
  cache_h q;

  auto tStart1 = std::chrono::high_resolution_clock::now();

  // Create the packets
  std::vector<cache_h> ps(keys.size());
  for (auto i = 0; i < keys.size(); ++i) {
    createGetRequest(ps[i], keys[i]);
  }

  std::vector<uint64_t> times(keys.size());

  // Send the packets

  auto tStart2 = std::chrono::high_resolution_clock::now();

  for (auto m = 0; m < opt.Multiplier; ++m) {
    for (auto i = 0; i < keys.size(); ++i) {
      auto &k = keys[i];
      sendto(soc, &ps[i], CACHE_HEADER_SIZE, 0, (sockaddr *)&server,
             sizeof(server));
      recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr *)&incaddrr, &inclen);
    }
  }

  auto tEnd = std::chrono::high_resolution_clock::now();

  //   auto tStart = std::chrono::high_resolution_clock::now();
  //   for (auto &k : keys) {
  //     createGetRequest(p, k);

  //     auto tStart = std::chrono::high_resolution_clock::now();

  //     int sent = sendto(soc, &p, CACHE_HEADER_SIZE, 0, (sockaddr *)&server,
  //                       sizeof(server));
  // #ifdef DEBUG
  //     log(tid) << "query key: " << k << '\n';
  // #endif
  //     int recvd =
  //         recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr *)&incaddrr,
  //         &inclen);
  // #ifdef DEBUG
  //     log(tid) << "received: " << recvd << "bytes\n";
  // #endif
  //     q.v[0] = ntohl(q.v[0]);
  //     q.v[1] = ntohl(q.v[1]);
  //     q.v[2] = ntohl(q.v[2]);
  //     q.v[3] = ntohl(q.v[3]);

  // #ifdef DEBUG
  //     uint64_t keyin = q.key;
  //     char key[9];
  //     char val[17];
  //     memset(key, 0, 9);
  //     memset(val, 0, 17);
  //     strncpy(key, (char *)&keyin, 8);
  //     strncpy(val, (char *)&q.v, 16);
  //     log(tid) << "received(" << recvd << "B) op: " << (uint16_t)q.op
  //              << " - key: " << keyin << '/' << key << ", val: " << val <<
  //              '\n';
  // #endif
  //   }
  //   auto tEnd = std::chrono::high_resolution_clock::now();

  stats.duration1 =
      std::chrono::duration_cast<std::chrono::microseconds>(tEnd - tStart1)
          .count();
  stats.duration2 =
      std::chrono::duration_cast<std::chrono::microseconds>(tEnd - tStart2)
          .count();
  stats.queries = keys.size() * opt.Multiplier;
}

void loadKeys(const char *f, std::vector<uint64_t> &keys) {
  std::ifstream file(f);

  if (!file) {
    std::cerr << "Could not open the file!" << std::endl;
    return;
  }
  std::string line;
  while (std::getline(file, line)) {
    std::size_t pos = line.find_first_of('=');
    if (pos == std::string::npos)
      continue; // Skip lines without '='
    std::string keyStr = line.substr(0, pos);
    uint64_t key = 0;
    std::strncpy((char *)&key, keyStr.c_str(), keyStr.size());
    keys.push_back(key);
  }
  file.close();
}

int main(int argc, char **argv) {
  opt.parse(argc, argv);
  if (opt.Help)
    return opt.help(std::cout);

  if (opt.Interactive) {
    interactive_client(0, opt.ServerIp, opt.ServerPort);
  } else {

    std::vector<uint64_t> keys;
    std::string dataTxt = GetExecutableDir().append("/data.txt");
    loadKeys(dataTxt.c_str(), keys);

    std::vector<std::vector<uint64_t>> threadKeys(opt.Threads);

    for (size_t i = 0; i < opt.Threads; ++i) {
      threadKeys[i].reserve(keys.size() * opt.Multiplier);
      std::default_random_engine rng(opt.Seed + i);
      for (auto j = 0; j < opt.Multiplier; ++j) {
        std::shuffle(keys.begin(), keys.end(), rng);
        threadKeys[i].insert(threadKeys[i].end(), keys.begin(), keys.end());
      }
    }

    std::vector<std::thread> threads;
    std::vector<statistics> results(opt.Threads);

    std::promise<void> start;
    std::shared_future<void> sigstart = start.get_future().share();
    for (auto tid = 0; tid < opt.Threads; ++tid) {
      auto serverPort = opt.ServerPort + (tid % opt.ServerPorts);
      threads.emplace_back(client, tid, opt.ServerIp, serverPort,
                           threadKeys[tid], std::ref(results.at(tid)),
                           sigstart);
    }

    std::cout << "info: starting " << opt.Threads << " client threads\n";
    start.set_value();
    for (auto &t : threads)
      if (t.joinable())
        t.join();

    uint64_t totalQueries = 0;
    double totalThroughput1 = 0;
    double totalThroughput2 = 0;

    double meanLatency1 = 0;
    double meanLatency2 = 0;

    for (auto i = 0; i < results.size(); ++i) {
      totalThroughput1 += results.at(i).queries /
                          ((double)(results.at(i).duration1 / 1000000.0));
      totalThroughput1 += results.at(i).queries /
                          ((double)(results.at(i).duration2 / 1000000.0));
      // totalQueries += results.at(i).queries;
      meanLatency1 += results.at(i).duration1 / ((double)results.at(i).queries);
      meanLatency2 += results.at(i).duration2 / ((double)results.at(i).queries);
    }
    std::cout << std::fixed << std::setprecision(3);
    std::cout << "Total throughput1: " << totalThroughput1
              << " queries/second\n";
    std::cout << "Total throughput2: " << totalThroughput2
              << " queries/second\n";
    std::cout << "    Mean latency1: " << (meanLatency1 / results.size())
              << " us\n";
    std::cout << "    Mean latency2: " << (meanLatency2 / results.size())
              << " us\n";
  }
}