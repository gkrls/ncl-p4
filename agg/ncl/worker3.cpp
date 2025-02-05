#include <algorithm>
#include <arpa/inet.h> // For inet_addr
#include <asm-generic/socket.h>
#include <bits/types/struct_iovec.h>
#include <bits/types/struct_timespec.h>
#include <chrono>
#include <cpuid.h>
#include <cstdlib>
#include <cstring>
#include <future>
#include <immintrin.h> // For AVX2
#include <iomanip>
#include <iostream>
#include <istream>
#include <iterator>
#include <memory>
#include <mutex>
#include <net/if.h>
#include <netinet/in.h> // For sockaddr_in
#include <ostream>
#include <sstream>
#include <string>
#include <sys/socket.h> // For socket functions
#include <sys/types.h>  // For socket types
#include <sys/uio.h>
#include <thread>
#include <tuple>
#include <unistd.h> // for close()
#include <linux/errqueue.h>

#include "worker_utils.h"

static options opt;

namespace ncrt {
// This stuff is generally handled by the compiler,
// but not all of it is implemented yet so we will
// do it manually

struct __attribute__((packed)) ncp_h {
  uint8_t h_src;
  uint8_t h_dst;
  uint8_t d_src;
  uint8_t d_dst;
  uint8_t cid;
  uint8_t act;
  uint16_t act_arg;
};

struct __attribute__((packed)) agg_h {
  uint8_t ver;
  uint16_t bmp_idx;
  uint16_t agg_idx;
  uint32_t mask;
  uint32_t offset;
  uint32_t expo;
};

struct __attribute__((packed)) ncl_h {
  struct ncp_h ncp;
  struct agg_h agg;
};

std::ostream &printNclPacket(ncl_h &h, uint32_t *data,
                             std::ostream &o = std::cout) {
  o << "[hs: " << ((unsigned)h.ncp.h_src) << " | hd:" << ((unsigned)h.ncp.h_dst)
    << " | ds:" << ((unsigned)h.ncp.d_src)
    << " | dd:" << ((unsigned)h.ncp.d_dst) << "] ";
  o << " ver: " << ((unsigned)h.agg.ver) << " | bidx:" << h.agg.bmp_idx
    << " | aidx:" << h.agg.agg_idx << " | mask:" << h.agg.mask
    << " | offset:" << h.agg.offset;
  o << " | data:" << vec2str(data, opt.ValuesPerPacket, 6) << '\n';
  return o;
}

size_t NCL_PACKET_SIZE = sizeof(ncl_h) + (32 * sizeof(uint32_t));

} // namespace ncrt

inline std::ostream &worker(std::ostream &os = std::cout) {
  os << "[worker." << opt.Rank << "] ";
  return os;
}

inline std::ostream &thread(unsigned tid, std::ostream &os = std::cout) {
  os << "[worker." << opt.Rank << "." << tid << "] ";
  return os;
}

void PrintWorkerInfo(std::ostream &O = std::cout) {
  worker(O) << "World: " << opt.World << " | Threads: " << opt.Threads
            << " | IP: " << opt.IP << " | Ports: " << opt.Port << '-'
            << (opt.Port + opt.Threads - 1);
  if (opt.AVX2Available || opt.AVX512Available) {
    O << " | ";
    if (opt.AVX2Available)
      O << "avx2 ";
    if (opt.AVX512Available)
      O << "avx512";
    O << '\n';
  }
  worker(O) << "Device: " << opt.DeviceMac << '/' << opt.DeviceIp << ':'
            << opt.DevicePort << " | Reducers: " << opt.Reducers
            << " | Slots: " << opt.Slots << '\n';
  worker(O) << "Values: " << opt.Size << " (x" << opt.Multiplier << ")"
            << ", PerPacket: " << opt.ValuesPerPacket
            << ", PerThread: " << opt.ValuesPerThread
            << ", Size: " << (opt.Size * 4) << "B\n";
  worker(O) << "Packets: " << (opt.PacketsPerThread * opt.Threads)
            << ", PerThread: " << opt.PacketsPerThread
            << ", Size: " << (sizeof(ncrt::ncl_h) + opt.ValuesPerPacket * 4)
            << "B (" << sizeof(ncrt::ncl_h) << " + "
            << (opt.ValuesPerPacket * 4) << ")"
            << ", Burst: " << opt.Window << ", rx: " << opt.Rx
            << ", connect: " << opt.Connect << ", " << opt.Bind << '\n';
}

void PrintData(uint32_t expo, uint32_t *v, size_t size, size_t n = 8,
               bool printSize = true, std::ostream &O = std::cout) {
  if ((size > 0) && (n > 0))
    O << *v;
  for (auto i = 1; i < n; ++i) {
    if (i == size)
      break;
    O << ',' << v[i];
  }
  O << "...";
  if (printSize)
    O << " (" << size << '/' << (size * sizeof(uint32_t)) << "B)";
  O << " | expo: " << expo << '\n';
}

bool GenerateVector(uint32_t **p, size_t size, uint32_t value) {
  if (!size)
    return false;

  *p = (uint32_t *)malloc(size * sizeof(uint32_t));

  if (value) {
    if ((value & 0xFF) == ((value >> 8) & 0xFF) &&
        (value & 0xFF) == ((value >> 16) & 0xFF) &&
        (value & 0xFF) == ((value >> 24) & 0xFF)) {
      memset(*p, value & 0xFF, size * sizeof(uint32_t));

    } else {
      for (auto i = 0; i < size; ++i)
        *(*p + i) = value;
    }
  } else {
    for (auto i = 0; i < size; ++i)
      *(*p + i) = xorshift32();
  }

  return true;
}

void getIndexRangeForThread(uint32_t tid, uint32_t &lo, uint32_t &hi) {
  lo = tid * opt.ValuesPerThread;
  hi = std::min(lo + opt.ValuesPerThread, opt.Size);
}

void pinWorkerThread(uint32_t tid) {
  auto cores = static_cast<int>(std::thread::hardware_concurrency());
  cpu_set_t cpuset;
  CPU_ZERO(&cpuset);
  CPU_SET(tid % cores, &cpuset);
  pthread_t this_thread = pthread_self();
  if (pthread_setaffinity_np(this_thread, sizeof(cpu_set_t), &cpuset) != 0) {
    std::cerr << "Error setting thread affinity." << std::endl;
    return;
  }
}

void pin_thread_to_core(int core_id) {
  cpu_set_t cpuset;
  CPU_ZERO(&cpuset);
  CPU_SET(core_id, &cpuset);
  pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
}


void Worker2(uint16_t tid, int soc, ncrt::ncl_h *wnd, uint8_t *startingVersion,
            uint32_t *expo, uint32_t *data, size_t size,
            std::shared_future<void> sigstart) {
  sigstart.wait();

  sockaddr_in device;
  device.sin_family = AF_INET;
  device.sin_addr.s_addr = inet_addr(opt.DeviceIp.c_str());
  device.sin_port = htons(opt.DevicePort);

  if (opt.Pin)
    pin_thread_to_core(tid);

  uint32_t start, end;
  getIndexRangeForThread(tid, start, end);

  uint32_t mask = 1 << (opt.Rank - 1);
  uint16_t baseSlot = tid * opt.Window;
  uint8_t version = *startingVersion;
  uint8_t startingAggIdxOffset = version * opt.Slots;

  auto *ncl = (ncrt::ncl_h *)malloc(opt.Window * sizeof(ncrt::ncl_h));
  auto *iov = (iovec *)malloc(2 * opt.Window * sizeof(iovec));
  auto *msg = (mmsghdr *)malloc(opt.Window * sizeof(mmsghdr));
  memset(ncl, 0, sizeof(ncrt::ncl_h) * opt.Window);
  memset(iov, 0, 2 * opt.Window * sizeof(iovec));
  memset(msg, 0, opt.Window * sizeof(mmsghdr));

  uint32_t offset = start;
  auto dataLen = opt.ValuesPerPacket * sizeof(uint32_t);
  for (auto i = 0, v = 0; i < opt.Window; ++i, v += 2) {
    // Create the NetCL messages
    ncl[i].ncp.h_src = opt.Rank;
    ncl[i].ncp.d_dst = 1;
    ncl[i].ncp.cid = 1;
    // do not need to bswap all these but lets just do it for now
    ncl[i].agg.ver = version;
    ncl[i].agg.bmp_idx = htons(baseSlot + i);
    ncl[i].agg.agg_idx = htons(baseSlot + i + startingAggIdxOffset);
    ncl[i].agg.mask = htonl(mask);
    ncl[i].agg.offset = htonl(offset);
    ncl[i].agg.expo = htonl(*expo);
    // Pack the NetCL messages
    iov[v].iov_base = &ncl[i];
    iov[v].iov_len = sizeof(ncrt::ncl_h);
    iov[v + 1].iov_base = &data[offset];
    iov[v + 1].iov_len = dataLen;

    msg[i].msg_hdr.msg_name = &device;
    msg[i].msg_hdr.msg_namelen = sizeof(sockaddr_in);
    msg[i].msg_hdr.msg_iov = &iov[v];
    msg[i].msg_hdr.msg_iovlen = 2;
    msg[i].msg_hdr.msg_control = nullptr;
    msg[i].msg_hdr.msg_controllen = 0;
    msg[i].msg_hdr.msg_flags = 0;
    msg[i].msg_len = 0;

    offset += opt.ValuesPerPacket;
  }

  // Burst tx opt.Window message
  // std::cout << "sending...\n";
  sendmmsg(soc, msg, opt.Window, MSG_ZEROCOPY);

  size_t totalReceived = 0;

  uint32_t offsetBy = opt.Window * opt.ValuesPerPacket;

  while (true) {
    // receive burst of opt.Rx messages
    // std::cout << "receiving...\n";

    int received = recvmmsg(soc, msg, opt.Window, 0, nullptr);
    if (received == 0)
      continue;

    totalReceived += received;
    if (totalReceived >= opt.PacketsPerThread) {
      *startingVersion = 1 - version;
      break;
    }

    for (auto i = 0; i < received; ++i) {
      auto *ih = (ncrt::ncl_h *)iov[i * 2].iov_base;
      auto *id = (uint32_t *)iov[i * 2 + 1].iov_base;

      ih->ncp.h_src = opt.Rank;
      ih->ncp.h_dst = 0;
      ih->ncp.d_src = 0;
      ih->ncp.d_dst = 1;

      version = 1 - ih->agg.ver;
      offset = ntohl(ih->agg.offset) + offsetBy;

      ih->agg.ver = version;
      ih->agg.agg_idx = htons(version ? ntohs(ih->agg.agg_idx) + opt.Slots
                                      : ntohs(ih->agg.agg_idx) - opt.Slots);
      ih->agg.mask = htonl(mask);
      ih->agg.offset = htonl(offset);
      ih->agg.expo = htonl(*expo);

      // next 32 values
      iov[i * 2 + 1].iov_base = &data[offset];

#ifndef RX_BURST
      sendmsg(soc, &msg[i].msg_hdr, MSG_ZEROCOPY); // one by one
#endif
    }
#ifdef RX_BURST
    sendmmsg(soc, msg, received, MSG_ZEROCOPY); // burst //MSG_ZEROCOPY
#endif
  }
}



void Worker(uint16_t tid, int soc, ncrt::ncl_h *wnd, uint8_t *startingVersion,
            uint32_t *expo, uint32_t *data, size_t size,
            std::shared_future<void> sigstart) {
  sigstart.wait();

  sockaddr_in device;
  device.sin_family = AF_INET;
  device.sin_addr.s_addr = inet_addr(opt.DeviceIp.c_str());
  device.sin_port = htons(opt.DevicePort);

  if (opt.Pin)
      pin_thread_to_core(tid % 16);

  uint32_t start, end;
  getIndexRangeForThread(tid, start, end);

  uint32_t mask = 1 << (opt.Rank - 1);
  uint16_t baseSlot = tid * opt.Window;
  uint8_t version = *startingVersion;
  uint8_t startingAggIdxOffset = version * opt.Slots;

  auto *ncl = static_cast<ncrt::ncl_h *>(malloc(opt.Window * sizeof(ncrt::ncl_h)));
  auto *iov = static_cast<iovec *>(malloc(2 * opt.Window * sizeof(iovec)));
  auto *msg = static_cast<mmsghdr *>(malloc(opt.Window * sizeof(mmsghdr)));
  memset(ncl, 0, sizeof(ncrt::ncl_h) * opt.Window);
  memset(iov, 0, 2 * opt.Window * sizeof(iovec));
  memset(msg, 0, opt.Window * sizeof(mmsghdr));

  uint32_t offset = start;
  auto dataLen = opt.ValuesPerPacket * sizeof(uint32_t);

  for (auto i = 0, v = 0; i < opt.Window; ++i, v += 2) {
    ncl[i].ncp.h_src = opt.Rank;
    ncl[i].ncp.d_dst = 1;
    ncl[i].ncp.cid = 1;

    ncl[i].agg.ver = version;
    ncl[i].agg.bmp_idx = htons(baseSlot + i);
    ncl[i].agg.agg_idx = htons(baseSlot + i + startingAggIdxOffset);
    ncl[i].agg.mask = htonl(mask);
    ncl[i].agg.offset = htonl(offset);
    ncl[i].agg.expo = htonl(*expo);

    iov[v].iov_base = &ncl[i];
    iov[v].iov_len = sizeof(ncrt::ncl_h);
    iov[v + 1].iov_base = &data[offset];
    iov[v + 1].iov_len = dataLen;

    msg[i].msg_hdr.msg_name = &device;
    msg[i].msg_hdr.msg_namelen = sizeof(sockaddr_in);
    msg[i].msg_hdr.msg_iov = &iov[v];
    msg[i].msg_hdr.msg_iovlen = 2;
    msg[i].msg_hdr.msg_control = nullptr;
    msg[i].msg_hdr.msg_controllen = 0;
    msg[i].msg_hdr.msg_flags = 0;
    msg[i].msg_len = 0;

    offset += opt.ValuesPerPacket;
  }

  // Send data using MSG_ZEROCOPY
  int ret = sendmmsg(soc, msg, opt.Window, 0);
  if (ret == -1) {
    perror("sendmmsg failed");
  }

  size_t totalReceived = 0;
  uint32_t offsetBy = opt.Window * opt.ValuesPerPacket;

  while (true) {
      // std::cout << "recvmmsg " << totalReceived << "...\n";
      int received = recvmmsg(soc, msg, opt.Window, 0, nullptr);
      if (received == 0)
          continue;

      totalReceived += received;
      if (totalReceived >= opt.PacketsPerThread) {
          *startingVersion = 1 - version;
          break;
      }

      for (auto i = 0; i < received; ++i) {
          auto *ih = (ncrt::ncl_h *)iov[i * 2].iov_base;

          ih->ncp.h_src = opt.Rank;
          ih->ncp.h_dst = 0;
          ih->ncp.d_src = 0;
          ih->ncp.d_dst = 1;

          version = 1 - ih->agg.ver;
          offset = ntohl(ih->agg.offset) + offsetBy;

          ih->agg.ver = version;
          ih->agg.agg_idx = htons(version ? ntohs(ih->agg.agg_idx) + opt.Slots
                                          : ntohs(ih->agg.agg_idx) - opt.Slots);
          ih->agg.mask = htonl(mask);
          ih->agg.offset = htonl(offset);
          ih->agg.expo = htonl(*expo);

          iov[i * 2 + 1].iov_base = &data[offset];

#ifndef RX_BURST
      if (sendmsg(soc, &msg[i].msg_hdr, 0) == -1)
        perror("sendmsg2 failed");
#endif
    }
#ifdef RX_BURST
    if (sendmmsg(soc, msg, received, 0) == -1)
      perror("sendmmsg3 failed");
#endif
  }
}

uint64_t AllReduce(uint32_t s, int *sockets, ncrt::ncl_h *windows, uint8_t *versions,
                   uint32_t *expo, uint32_t *data, size_t size) {
  if (!opt.Perf) {
    worker() << '\n';
    worker() << "AllReduce #" << s << " | ";
    PrintData(*expo, data, size, 16);
    worker() << '\n';
  }

  // Create worker threads
  std::vector<std::thread> threads;
  std::promise<void> start;
  auto sigstart = start.get_future().share();
  for (auto tid = 0; tid < opt.Threads; ++tid)
    threads.emplace_back(Worker, tid, sockets[tid], &windows[tid * opt.Window],
                         &versions[tid], expo, data, size, sigstart);

  // Start the threads
  // Normally we would reuse threads so lets not time thread creation
  start.set_value();
  auto tStart = std::chrono::high_resolution_clock::now();
  for (auto &t : threads)
    if (t.joinable())
      t.join();
  auto tEnd = std::chrono::high_resolution_clock::now();

  // return 1024;
  return std::chrono::duration_cast<std::chrono::microseconds>(tEnd - tStart)
      .count();
}

int create_socket_for_worker(uint16_t tid, sockaddr_in &worker_addr,
                             sockaddr_in &device_addr) {
  auto soc = socket(AF_INET, SOCK_DGRAM, 0);
  if (soc < 0) {
    perror("Socket creation failed");
    return 1;
  }

  worker_addr.sin_family = AF_INET;
  worker_addr.sin_addr.s_addr = inet_addr(opt.IP.c_str());
  worker_addr.sin_port = htons(opt.Port + tid);
  device_addr.sin_family = AF_INET;
  device_addr.sin_addr.s_addr = inet_addr(opt.DeviceIp.c_str());
  device_addr.sin_port = htons(opt.DevicePort);

  if (opt.Bind) {
    const char *iface = "ens4f0"; // Replace with your network interface name
    struct ifreq ifr;
    memset(&ifr, 0, sizeof(ifr));
    strncpy(ifr.ifr_name, iface, IFNAMSIZ - 1);
    setsockopt(soc, SOL_SOCKET, SO_BINDTODEVICE, (void *)&ifr, sizeof(ifr));
  }


  int reuse = 1;
  int zero_copy = 1;
  setsockopt(soc, SOL_SOCKET, SO_REUSEADDR, (void *)&reuse, sizeof(reuse));
  // setsockopt(soc, SOL_SOCKET, SO_ZEROCOPY, &zero_copy, sizeof(zero_copy));
  int sndbuf_size = 4 * 1024 * 1024; // 4MB
  int rcvbuf_size = 4 * 1024 * 1024; // 4MB
  if (setsockopt(soc, SOL_SOCKET, SO_SNDBUF, &sndbuf_size, sizeof(sndbuf_size)) < 0) {
      perror("setsockopt SO_SNDBUF failed");
  }
  if (setsockopt(soc, SOL_SOCKET, SO_RCVBUF, &rcvbuf_size, sizeof(rcvbuf_size)) < 0) {
      perror("setsockopt SO_SNDBUF failed");
  }
  if (bind(soc, (sockaddr *)&worker_addr, sizeof(sockaddr)) < 0) {
    worker() << "error: failed to bind socket to " << opt.IP << "."
             << ntohs(worker_addr.sin_port) << '\n';
    return 0;
  }

  if (opt.Connect) {
    if (connect(soc, (struct sockaddr *)&device_addr, sizeof(device_addr)) <
        0) {
      worker() << "failed to connect UDP socket to device\n";
      // close(soc);
      exit(EXIT_FAILURE);
    }
  }

  return soc;
}

int main(int argc, char **argv) {
  opt.parse(argc, argv);

  if (opt.Help)
    return opt.help(std::cout);

  PrintWorkerInfo(std::cout);

  // Create version bookeeping
  uint8_t *versions = (uint8_t *)std::malloc(opt.Slots);
  memset(versions, 0, opt.Slots);

  // Create sockets
  sockaddr_in device_addr, worker_addr[opt.Threads];
  std::memset(worker_addr, 0, sizeof(sockaddr_in) * opt.Threads);
  int soc[opt.Threads];
  for (auto i = 0; i < opt.Threads; ++i) {
    soc[i] = create_socket_for_worker(i, worker_addr[i], device_addr);
  }

  const char *interface_name =
      "ens4f0"; // Replace with your network interface name
  struct ifreq ifr;
  memset(&ifr, 0, sizeof(ifr));
  strncpy(ifr.ifr_name, interface_name, IFNAMSIZ - 1);

  // Create packet buffers, at least 2
  ncrt::ncl_h *windows = (ncrt::ncl_h *)std::malloc(
      sizeof(ncrt::ncl_h) * std::max<int>(2, opt.Window * opt.Threads));

  // Just use one exponent for now
  uint32_t expo = opt.Rank; // opt.Random ? xorshift32() :
  uint32_t *data = nullptr;
  if (!GenerateVector(&data, opt.Size, opt.Random ? 0 : opt.Rank)) {
    std::cout << "error: failed to generate data\n";
    return 1;
  }

  worker() << '\n';

  for (auto ws = 0; ws < opt.Warmup; ++ws) {
    worker() << "Running warmup step " << ws << " ...\n";
    AllReduce(ws + 1, soc, windows, versions, &expo, data, opt.Size);
  }

  if (opt.Warmup)
    worker() << '\n';

  uint64_t latency = 0;
  double throughput = 0;
  for (auto s = 0; s < opt.Steps; ++s) {
    auto us = AllReduce(s + 1, soc, windows, versions, &expo, data, opt.Size);
    if (!us)
      return 1;

    // Calculate throughput in values per second
    double currentThroughput =
        ((double)opt.Size * opt.World) / (((double)us) * 1e-6); // us to seconds
    throughput += currentThroughput;

    // Accumulate total latency
    latency += us;

    // Calculate goodput
    double gbps =
        ((double)opt.Size * 4 * 8 * opt.World) / (((double)us) * 1000);

    // Print the results
    worker() << "AllReduce " << (opt.Size * opt.World) << " | "
             << "(" << opt.Size << "/" << (opt.Size * sizeof(uint32_t))
             << "B per worker) : took " << std::setw(2) << std::setfill('0')
             << (us / 1000000) << ":" << std::setw(3) << std::setfill('0')
             << ((us % 1000000) / 1000) << "s, " << std::fixed
             << std::setprecision(2) << currentThroughput << " values/sec, "
             << gbps << " Gbps" << std::endl;
  }

  // Cleanup
  free(versions);
  free(windows);
  for (auto i = 0; i < opt.Threads; ++i)
    close(soc[i]);
  // // Destroy the sockets
  // for (auto i = 0; i < opt.Threads; ++i)
  //   close(soc[i]);

  // Compute AllReduce latency and throughput
  latency /= opt.Steps;
  throughput /= opt.Steps;

  worker() << '\n';
  worker() << "Average latency over " << opt.Steps
           << " runs: " << (latency / 1000000) << ":"
           << ((latency % 1000000) / 1000) << ":"
           << ((latency % 1000000) / 1000) << " (s:m)\n";
  worker() << "Average throughput over " << opt.Steps << " runs: " << throughput
           << " values/sec\n";
}