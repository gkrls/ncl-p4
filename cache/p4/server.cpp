#include <algorithm>
#include <arpa/inet.h>
#include <array>
#include <cstdint>
#include <cstring>
#include <endian.h>
#include <future>
#include <iomanip>
#include <iostream>
#include <istream>
#include <netinet/in.h>
#include <ostream>
#include <sys/socket.h>

#include "server_utils.h"
#include <unordered_map>

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
  c.key = key;

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
  std::cout << '[' << "server." << tid << "] ";
  return o;
}

uint64_t stringToUInt64(const std::string &str) {
  uint64_t result = 0;
  for (size_t i = 0; i < str.size(); ++i) {
    result |= static_cast<uint64_t>(str[i]) << (i * 8);
  }
  return result;
}

void server(uint32_t tid,
            std::unordered_map<uint64_t, std::array<uint32_t, 4>> const &kvs,
            statistics &stats, std::shared_future<void> sigstart) {
  sigstart.wait();

  log(tid) << "Started...\n";

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
    log(tid) << "error: bind socket to " << opt.IP << "." << opt.Port << '\n';
    return;
  }

  log(tid) << "Listening on " << opt.IP << '.' << opt.Port << '\n';

  cache_h p;

  while (true) {
    int recvd = recv(soc, &p, CACHE_HEADER_SIZE, 0);
    if (recvd < 0) {
      log(tid) << "recv error\n";
    }
    p.key = be64toh(p.key);

    log(tid) << "received op:" << (uint16_t)p.op << " key: " << p.key << " : "
             << (char *)&p.key << '\n';
  }
}

void loadData(const char *f,
              std::unordered_map<uint64_t, std::array<uint32_t, 4>> &kvs) {
  std::ifstream file(f);

  if (!file) {
    std::cerr << "Could not open the file!" << std::endl;
    return;
  }

  std::string line;
  while (std::getline(file, line)) {
    // Find the first occurrence of '='
    std::size_t pos = line.find_first_of('=');
    if (pos == std::string::npos)
      continue; // Skip lines without '='

    // Extract the key and value strings
    std::string keyStr = line.substr(0, pos);
    std::string valueStr = line.substr(pos + 1);
    std::cout << keyStr << " : " << valueStr << " " << keyStr.size() << "/"
              << valueStr.size() << '\n';

    // Create and initialize the key and value arrays
    // uint64_t key = 0;

    uint64_t key = 0;
    std::array<uint32_t, 4> value = {0, 0, 0, 0};


    std::strncpy((char *) &key, keyStr.c_str(), keyStr.size());
    std::strncpy((char *)value.data(), valueStr.c_str(), valueStr.size());

    kvs[key] = std::move(value);
  }

  file.close();
}

int main(int argc, char **argv) {
  opt.parse(argc, argv);

  std::unordered_map<uint64_t, std::array<uint32_t, 4>> kvs;
  loadData("data.txt", kvs);

  std::cout << "### kv-store ###\n";
  uint32_t i = 0;
  for (auto const &e : kvs) {
    char key[9] = {0};
    memccpy(&key, (char *)&e.first, 1, 8);
    std::cout << std::setw(8) << key  << " :";
    std::cout << " " << std::string((char *)&e.second) << '\n';
  }

  std::vector<std::thread> threads;
  std::vector<statistics> stats;
  std::promise<void> start;
  std::shared_future<void> sigstart = start.get_future().share();

  for (auto tid = 0; tid < opt.Threads; ++tid)
    threads.emplace_back(server, tid, kvs, std::ref(stats[tid]), sigstart);

  std::cout << "info: starting " << opt.Threads << " server threads\n";
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