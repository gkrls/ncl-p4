#include <algorithm>
#include <arpa/inet.h>
#include <asm-generic/socket.h>
#include <chrono>
#include <cstdint>
#include <cstring>
#include <endian.h>
#include <future>
#include <iomanip>
#include <iostream>
#include <istream>
#include <netinet/in.h>
#include <net/if.h>
#include <ostream>
#include <random>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <fcntl.h>


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
  uint64_t duration;
  std::ostream &print(std::ostream &o = std::cout) {
    o << "numqueries: " << queries << '\n';
    o << "  duration: " << duration << '\n';
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
  std::cout << '[' << "receiver." << tid << "] ";
  return o;
}

ssize_t recv_all_udp(int socket, void* buffer, size_t length) {
  // std::cout << "recv_all_udp: " << length << '\n';;
  size_t total_bytes_received = 0;
  char* buf_ptr = static_cast<char*>(buffer);

  while (total_bytes_received < length) {
      ssize_t bytes_received = recvfrom(socket, buf_ptr + total_bytes_received, length - total_bytes_received, 0, nullptr, nullptr);
      std::cout << "recvd: " << bytes_received << '\n';
      if (bytes_received < 0) {
          // An error occurred
          perror("recvfrom");
          return -1;
      } else if (bytes_received == 0) {
          // No data received
          return total_bytes_received;
      }

      total_bytes_received += bytes_received;
      // std::cout << "total: " << total_bytes_received << '\n';
  }

  return total_bytes_received;
}

ssize_t recv_all_udp_batch(int socket, void* buffer, size_t length, size_t packet_size, int batch_size) {
    ssize_t total_bytes_received = 0;
    size_t total_packets = length / packet_size;
    size_t batches = (total_packets + batch_size - 1) / batch_size; // Total number of batches needed

    static struct mmsghdr* msgs = new mmsghdr[batch_size];
    static struct iovec* iovecs = new iovec[batch_size];

    for (size_t batch = 0; batch < batches; ++batch) {
        // Number of packets to receive in this batch
        int packets_in_this_batch = std::min((unsigned long) batch_size, total_packets - batch * batch_size);

        // Prepare mmsghdr and iovec structures for this batch
        // for (int i = 0; i < packets_in_this_batch; ++i) {
        //     iovecs[i].iov_base = static_cast<char*>(buffer) + total_bytes_received;
        //     iovecs[i].iov_len = packet_size;

        //     msgs[i].msg_hdr.msg_iov = &iovecs[i];
        //     msgs[i].msg_hdr.msg_iovlen = 1;
        //     msgs[i].msg_hdr.msg_name = nullptr;
        //     msgs[i].msg_hdr.msg_namelen = 0;
        //     msgs[i].msg_hdr.msg_control = nullptr;
        //     msgs[i].msg_hdr.msg_controllen = 0;
        //     msgs[i].msg_hdr.msg_flags = 0;
        // }

        // Receive up to batch_size messages
        int num_received = recvmmsg(socket, msgs, packets_in_this_batch, 0, nullptr);
        if (num_received < 0) {
            std::cout << "RECD: " << num_received << '\n';
            std::cerr << "recvmmsg failed: " << strerror(errno) << std::endl;
            perror("recvmmsg");
            delete[] msgs;
            delete[] iovecs;
            return -1;
        }

        // Accumulate the total number of bytes received
        for (int i = 0; i < num_received; ++i) {
            total_bytes_received += msgs[i].msg_len;
        }
    }

    // delete[] msgs;
    // delete[] iovecs;
    return total_bytes_received;
}

void make_socket_non_blocking(int socket_fd) {
    int flags = fcntl(socket_fd, F_GETFL, 0);
    if (flags == -1) {
        perror("fcntl F_GETFL");
        exit(EXIT_FAILURE);
    }
    flags |= O_NONBLOCK;
    if (fcntl(socket_fd, F_SETFL, flags) == -1) {
        perror("fcntl F_SETFL");
        exit(EXIT_FAILURE);
    }
}

#define MAX_EVENTS 4

void listen_to_sockets(int* sockets, size_t socket_count, size_t packet_size, size_t total_length, int batch_size) {
    int epoll_fd = epoll_create1(0);
    if (epoll_fd == -1) {
        perror("epoll_create1");
        exit(EXIT_FAILURE);
    }

    struct epoll_event event;
    struct epoll_event events[MAX_EVENTS];

    for (size_t i = 0; i < socket_count; ++i) {
        make_socket_non_blocking(sockets[i]);
        event.data.fd = sockets[i];
        event.events = EPOLLIN;
        if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, sockets[i], &event) == -1) {
            perror("epoll_ctl");
            exit(EXIT_FAILURE);
        }
    }

    char* buffer = new char[total_length];

    while (true) { // Run indefinitely or until you have received enough data
        int n = epoll_wait(epoll_fd, events, MAX_EVENTS, -1);
        for (int i = 0; i < n; ++i) {
            if (events[i].events & EPOLLIN) {
                ssize_t bytes_received = recv_all_udp_batch(events[i].data.fd, buffer, total_length, packet_size, batch_size);
                // if (bytes_received < 0) {
                //     std::cerr << "Error receiving data on socket " << events[i].data.fd << std::endl;
                // } else {
                //     std::cout << "Thread " << std::this_thread::get_id() << " received " << bytes_received << " bytes on socket " << events[i].data.fd << std::endl;
                // }
            }
        }
    }

    delete[] buffer;
    close(epoll_fd);
}

void receiver(uint32_t tid, std::string serverAddr, uint16_t serverPort,
              uint32_t keys, statistics &stats,
              std::shared_future<void> sigstart) {
  sigstart.wait();
  // log(tid) << "receiver: " << opt.IP << "-" << opt.Port + tid << '\n';
  // log(tid) << "  server: " << serverAddr << "-" << serverPort << '\n';

  sockaddr_in server;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr(serverAddr.c_str());
  server.sin_port = htons(serverPort);

  sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = inet_addr(opt.IP.c_str());
  addr.sin_port = htons(opt.Port + tid);



  // int sockets[4];

  // for (int i = 0; i < 4; ++i) {
  //   sockets[i] = socket(AF_INET, SOCK_DGRAM, 0);
  //   if (sockets[i] < 0) {
  //       perror("socket");
  //       exit(EXIT_FAILURE);
  //   }

  //   sockaddr_in server_addr;
  //   memset(&server_addr, 0, sizeof(server_addr));
  //   server_addr.sin_family = AF_INET;
  //   server_addr.sin_addr.s_addr = INADDR_ANY;
  //   server_addr.sin_port = htons(opt.Port + tid * 4 + i); // Unique port per socket

  //   int reuse = 1;
  //   setsockopt(sockets[i], SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));
  //   setsockopt(sockets[i], SOL_SOCKET, SO_REUSEPORT, (void *)&reuse, sizeof(reuse));
  //   if (bind(sockets[i], (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
  //       perror("bind");
  //       close(sockets[i]);
  //       exit(EXIT_FAILURE);
  //   }
  // }
  // auto tStart = std::chrono::high_resolution_clock::now();
  // // packet_size, total_length, batch_size
  // // opt.Multiplier * keys * CACHE_HEADER_SIZE - recvd, CACHE_HEADER_SIZE, 16
  // listen_to_sockets(sockets, 4, CACHE_HEADER_SIZE, opt.Multiplier * keys * CACHE_HEADER_SIZE, 16);

  auto soc = socket(AF_INET, SOCK_DGRAM, 0);
  if (soc < 0) {
    std::cerr << "Socket creation failed: " << strerror(errno) << std::endl;
    return;
  }

  int reuse = 1;
  struct ifreq ifr;
  memset(&ifr, 0, sizeof(ifr));
  snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "ens4f0");
  setsockopt(soc, SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));
  setsockopt(soc, SOL_SOCKET, SO_REUSEPORT, (void *)&reuse, sizeof(reuse));
  if (setsockopt(soc, SOL_SOCKET, SO_BINDTODEVICE, (void *)&ifr, sizeof(ifr)) < 0) {
      std::cerr << "Binding to interface failed: " << strerror(errno) << std::endl;
      return;
  }
  if (bind(soc, (sockaddr *)&addr, sizeof(sockaddr)) < 0) {
    log(tid) << "error: bind socket to " << opt.IP << "." << opt.Port + tid
             << '\n';
    return;
  }

  sockaddr_in incaddrr;
  socklen_t inclen = sizeof(sockaddr_in);
  cache_h *q = (cache_h *) std::malloc((opt.Multiplier * keys) * sizeof(cache_h));

  // First packet indicates we not start receiving, start counting time
  // recvfrom(soc, q, CACHE_HEADER_SIZE, 0, (sockaddr *) &incaddrr, &inclen);
  // auto tStart = std::chrono::high_resolution_clock::now();
  // for (auto i = 1; i < opt.Multiplier * keys; ++i) {
  //   recvfrom(soc, &q, CACHE_HEADER_SIZE, 0, (sockaddr *)&incaddrr, &inclen);
  // }
  // auto tEnd = std::chrono::high_resolution_clock::now();

  int recvd = recvfrom(soc, q, CACHE_HEADER_SIZE, 0, (sockaddr *) &incaddrr, &inclen);
  auto tStart = std::chrono::high_resolution_clock::now();
  recv_all_udp_batch(soc, q, opt.Multiplier * keys * CACHE_HEADER_SIZE - recvd, CACHE_HEADER_SIZE, 16);
  auto tEnd = std::chrono::high_resolution_clock::now();
  stats.duration =
      std::chrono::duration_cast<std::chrono::microseconds>(tEnd - tStart)
          .count();
  stats.queries = opt.Multiplier * keys;
  // close(soc);
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

  std::vector<uint64_t> keys;
  std::string dataTxt = GetExecutableDir().append("/data.txt");
  loadKeys(dataTxt.c_str(), keys);


  std::cout << "info: " << keys.size() << " keys x" << opt.Multiplier << '\n';
  std::cout << "info: starting " << opt.Threads << " receiver threads\n";

  std::vector<std::thread> threads;
  std::vector<statistics> results(opt.Threads);

  std::promise<void> start;
  std::shared_future<void> sigstart = start.get_future().share();
  for (auto tid = 0; tid < opt.Threads; ++tid) {
    auto serverPort = opt.ServerPort + (tid % opt.ServerPorts);
    threads.emplace_back(receiver, tid, opt.ServerIp, serverPort, keys.size(),
                         std::ref(results.at(tid)), sigstart);
  }

  start.set_value();
  for (auto &t : threads)
    if (t.joinable())
      t.join();

  uint64_t totalQueries = 0;
  double totalThroughput = 0;
  double meanLatency = 0;

  for (auto i = 0; i < results.size(); ++i) {
    totalThroughput +=
        results.at(i).queries / ((double)(results.at(i).duration / 1000000.0));
    meanLatency += results.at(i).duration / ((double)results.at(i).queries);
  }
  std::cout << std::fixed << std::setprecision(3);
  std::cout << "Total throughput: " << totalThroughput << " queries/second\n";
  std::cout << "    Mean latency1: " << (meanLatency / results.size())
            << " us\n";
}