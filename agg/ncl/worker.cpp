#include <algorithm>
#include <arpa/inet.h> // For inet_addr
#include <chrono>
#include <cpuid.h>
#include <cstdlib>
#include <cstring>
#include <future>
#include <immintrin.h> // For AVX2
#include <iomanip>
#include <iostream>
#include <iterator>
#include <memory>
#include <mutex>
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

#include "worker_utils.h"

static options opt;

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
            << ", Burst: " << opt.Window << '\n';
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

std::string vec2str(uint32_t *v, size_t size, size_t n = 8) {
  std::ostringstream oss;
  for (auto i = 0; i < n; ++i) {
    if (i == size)
      break;
    if (i > 0)
      oss << ',';
    oss << v[i];
  }
  return oss.str();
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
  // virtualbox only supports AVX2
  // } else if (opt.AVX512Available && opt.SIMD && size >= 16) {
  //   __m512i vecval = _mm512_set1_epi32(value);
  //   size_t i = 0;
  //   for (; i + 16 <= size; i += 16)
  //     _mm512_storeu_si512((__m512i *)(*p + i), vecval);
  //   for (; i < size; ++i)
  // *(*p + i) = value;
  // } else if (opt.AVX2Available && opt.SIMD && size >= 8) {
  //   __m256i vecval = _mm256_set1_epi32(value);
  //   size_t i = 0;
  //   for (; i + 8 <= size; i += 8)
  //     _mm256_storeu_si256((__m256i *)(*p + i), vecval);
  //   for (; i < size; ++i)
  //     *(*p + i) = value;
  // } else {
  //   for (auto i = 0; i < size; ++i)
  //     *(*p + i) = value;
  // }
  // virtualbox only supports AVX2
  // if (opt.AVX512Available && opt.SIMD && size >= 32) {
  //   // Just rng the first 32 and repeat
  //   __m512i rngvec1 = _mm512_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   __m512i rngvec2 = _mm512_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   size_t i = 0;
  //   for (; i + 32 <= size; i += 32) {
  //     _mm512_storeu_si512((__m512i *)(*p + i), rngvec1);
  //     _mm512_storeu_si512((__m512i *)(*p + i), rngvec2);
  //   }
  //   for (; i < size; ++i)
  //     *(*p + i) = xorshift32();
  // if (opt.AVX2Available && opt.SIMD && size >= 32) {
  //   // Just rng the first 32 and repeat
  //   __m256i rngvec1 = _mm256_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   __m256i rngvec2 = _mm256_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   __m256i rngvec3 = _mm256_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   __m256i rngvec4 = _mm256_setr_epi32(
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32(),
  //       xorshift32(), xorshift32(), xorshift32(), xorshift32());
  //   size_t i = 0;
  //   for (; i + 32 <= size; i += 32) {
  //     _mm256_storeu_si256((__m256i *)(*p + i), rngvec1);
  //     _mm256_storeu_si256((__m256i *)(*p + i), rngvec2);
  //     _mm256_storeu_si256((__m256i *)(*p + i), rngvec3);
  //     _mm256_storeu_si256((__m256i *)(*p + i), rngvec4);
  //   }
  //   for (; i < size; ++i)
  //     *(*p + i) = xorshift32();
  // } else {

  //   }
  // }
  // return true;
  return true;
}

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

size_t NCL_PACKET_SIZE = sizeof(ncl_h) + (32 * sizeof(uint32_t));

} // namespace ncrt

void getIndexRangeForThread(uint32_t tid, uint32_t &lo, uint32_t &hi) {
  lo = tid * opt.ValuesPerThread;
  hi = std::min(lo + opt.ValuesPerThread, opt.Size);
}

int sendNclMessage(uint16_t tid, int soc, sockaddr_in &addr, ncrt::ncl_h &h,
                   uint32_t *data) {
  struct iovec iov[2];
  iov[0].iov_base = &h;
  iov[0].iov_len = sizeof(ncrt::ncl_h);
  iov[1].iov_base = data;
  iov[1].iov_len = opt.ValuesPerPacket * sizeof(uint32_t);

  struct msghdr msg = {};
  msg.msg_name = &addr;
  msg.msg_namelen = sizeof(sockaddr_in);
  msg.msg_iov = iov;
  msg.msg_iovlen = 2;
  return sendmsg(soc, &msg, 0);
}

int sendNclMessageDbg(uint16_t tid, int soc, sockaddr_in &addr, ncrt::ncl_h &h,
                      uint32_t *data) {
  struct iovec iov[2];
  iov[0].iov_base = &h;
  iov[0].iov_len = sizeof(ncrt::ncl_h);
  iov[1].iov_base = data;
  iov[1].iov_len = opt.ValuesPerPacket * sizeof(uint32_t);

  struct msghdr msg = {};
  msg.msg_name = &addr;
  msg.msg_namelen = sizeof(sockaddr_in);
  msg.msg_iov = iov;
  msg.msg_iovlen = 2;

  std::ostringstream ss;
  thread(tid, ss) << "O.<" << ntohl(h.agg.offset) << ',' << (unsigned)h.agg.ver
                  << ',' << ntohs(h.agg.bmp_idx) << ',' << ntohs(h.agg.agg_idx)
                  << "> " << std::string(55 - ss.str().size(), ' ') << ':'
                  << vec2str(data, opt.ValuesPerPacket)
                  << " expo: " << h.agg.expo << '\n';
  std::cout << ss.str();
  return sendmsg(soc, &msg, 0);
}

int recvNclMessage(uint16_t tid, int soc, sockaddr_in &addr, ncrt::ncl_h &h,
                   uint32_t *data) {
  struct iovec iov[2];
  iov[0].iov_base = &h;
  iov[0].iov_len = sizeof(ncrt::ncl_h);
  iov[1].iov_base = data;
  iov[1].iov_len = opt.ValuesPerPacket * sizeof(uint32_t);

  struct msghdr msg = {};
  msg.msg_name = &addr;
  msg.msg_namelen = sizeof(sockaddr_in);
  msg.msg_iov = iov;
  msg.msg_iovlen = 2;

  return recvmsg(soc, &msg, 0);
}

int recvNclMessageDbg(uint16_t tid, int soc, sockaddr_in &addr, ncrt::ncl_h &h,
                      uint32_t *data) {
  struct iovec iov[2];
  iov[0].iov_base = &h;
  iov[0].iov_len = sizeof(ncrt::ncl_h);
  iov[1].iov_base = data;
  iov[1].iov_len = opt.ValuesPerPacket * sizeof(uint32_t);

  struct msghdr msg = {};
  msg.msg_name = &addr;
  msg.msg_namelen = sizeof(sockaddr_in);
  msg.msg_iov = iov;
  msg.msg_iovlen = 2;

  auto sz = recvmsg(soc, &msg, 0);
  std::ostringstream ss;
  thread(tid, ss) << "I.<" << ntohl(h.agg.offset) << ',' << (unsigned)h.agg.ver
                  << ',' << ntohs(h.agg.bmp_idx) << ',' << ntohs(h.agg.agg_idx)
                  << "> " << std::string(55 - ss.str().size(), ' ') << ':'
                  << vec2str(data, opt.ValuesPerPacket)
                  << " expo: " << h.agg.expo << '\n';
  std::cout << ss.str();
  return sz;
}

using sendfn = int (*)(uint16_t, int, sockaddr_in &, ncrt::ncl_h &, uint32_t *);
using recvfn = int (*)(uint16_t, int, sockaddr_in &, ncrt::ncl_h &, uint32_t *);

void Worker(uint16_t tid, int soc, ncrt::ncl_h *window, uint8_t *version,
            uint32_t *expo, uint32_t *data, size_t size, sendfn send,
            recvfn recv, std::shared_future<void> sigstart) {
  sigstart.wait();

  sockaddr_in device;
  device.sin_family = AF_INET;
  device.sin_addr.s_addr = inet_addr(opt.DeviceIp.c_str());
  device.sin_port = htons(opt.DevicePort);

  uint32_t start, end;
  getIndexRangeForThread(tid, start, end);

  uint32_t mask = 1 << (opt.Rank - 1);
  uint16_t startingSlot = tid * opt.Window;
  uint8_t startingVersion = *version;

  memset(window, 0, sizeof(ncrt::ncl_h) * opt.Window);

  uint32_t offset;
  for (auto i = 0; i < opt.Window; ++i) {
    offset = start + i * opt.ValuesPerPacket;

    window[i].ncp.h_src = opt.Rank;
    window[i].ncp.d_dst = 1;
    window[i].ncp.cid = 1;
    window[i].agg.ver = startingVersion;
    // We do not need to bswap all these but lets just do it for now
    window[i].agg.bmp_idx = htons(startingSlot + i);
    window[i].agg.agg_idx =
        htons(startingSlot + i + startingVersion * opt.Slots);
    window[i].agg.mask = htonl(mask);
    window[i].agg.offset = htonl(offset);
    window[i].agg.expo = htonl(*expo);
  }

  for (auto i = 0; i < opt.Window; ++i) {
    send(tid, soc, device, window[i], &data[start + i * opt.ValuesPerPacket]);
  }

  ncrt::ncl_h &oh = window[0], &ih = window[1];
  sockaddr_in iaddr;
  uint32_t *in_data =
      (uint32_t *)std::malloc(opt.ValuesPerPacket * sizeof(uint32_t));

  size_t recvd = 0;
  uint32_t offsetBy = opt.Window * opt.ValuesPerPacket;

  while (true) {
    recv(tid, soc, iaddr, ih, in_data);
    recvd += opt.ValuesPerPacket;

    if (recvd >= opt.ValuesPerThread) {
      *version = 1 - ih.agg.ver;
      break;
    }

    offset = ntohl(ih.agg.offset) + offsetBy;
    if (offset >= end) {
      // this is possible only if e.g. we receive packets
      // with high idx within the window, before packets
      // with lower idx, so the new offset we compute
      // goes out of bounds on this threads idx range
      continue;
    }

    oh.agg.ver = 1 - ih.agg.ver;
    oh.agg.bmp_idx = ih.agg.bmp_idx;
    oh.agg.agg_idx =
        htonl(ntohl(ih.agg.bmp_idx) + (1 - ih.agg.ver) * opt.Slots);
    oh.agg.offset = htonl(offset);
    send(tid, soc, device, oh, &data[offset]);
  }
}

uint64_t AllReduce(uint32_t s, int *sockets, ncrt::ncl_h *windows,
                   uint8_t *versions, uint32_t *expo, uint32_t *data,
                   size_t size) {
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
    threads.emplace_back(
        Worker, tid, sockets[tid], &windows[tid * opt.Window], &versions[tid],
        expo, data, size, opt.Perf ? sendNclMessage : sendNclMessageDbg,
        opt.Perf ? recvNclMessage : recvNclMessageDbg, sigstart);

  // Start the threads
  // Normally we would reuse threads so lets not time thread creation
  auto tStart = std::chrono::high_resolution_clock::now();
  start.set_value();
  for (auto &t : threads)
    t.join();
  auto tEnd = std::chrono::high_resolution_clock::now();

  // return 1024;
  return std::chrono::duration_cast<std::chrono::nanoseconds>(tEnd - tStart)
      .count();
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
  int soc[opt.Threads];
  sockaddr_in addr[opt.Threads];
  std::memset(soc, 0, sizeof(int));
  std::memset(addr, 0, sizeof(sockaddr_in));

  for (auto i = 0; i < opt.Threads; ++i) {
    soc[i] = socket(AF_INET, SOCK_DGRAM, 0);
    addr[i].sin_family = AF_INET;
    addr[i].sin_addr.s_addr = inet_addr(opt.IP.c_str());
    addr[i].sin_port = htons(opt.Port + i);

    int reuse = 1;
    if (setsockopt(soc[i], SOL_SOCKET, SO_REUSEADDR, (void *)&reuse,
                   sizeof(reuse)) < 0) {
      std::cout << "error: SO_REUSEADDR for " << opt.IP << "."
                << ntohs(addr[i].sin_port);
      return 0;
    }

    if (bind(soc[i], (sockaddr *)&addr[i], sizeof(sockaddr)) < 0) {
      worker() << "error: failed to bind socket to " << opt.IP << "."
               << ntohs(addr[i].sin_port) << '\n';
      return 0;
    }
  }

  // Create packet buffers, at least 2
  ncrt::ncl_h *windows = (ncrt::ncl_h *)std::malloc(
      sizeof(ncrt::ncl_h) * std::max<int>(2, opt.Window * opt.Threads));

  // Just use one exponent for now
  uint32_t expo = opt.Random ? xorshift32() : opt.Rank;
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
    auto ns = AllReduce(s + 1, soc, windows, versions, &expo, data, opt.Size);
    if (!ns)
      return 1;

    double currentThroughput =
        ((double)opt.Size * opt.World) / (((double)ns) / 1000000000.0);
    throughput += currentThroughput;
    latency += ns;

    worker() << "AllReduce " << (opt.Size * opt.World) << " | "
             << "(" << opt.Size << "/" << (opt.Size * sizeof(uint32_t))
             << "B per worker) : took " << std::setw(2) << std::setfill('0')
             << (ns / 1000000000UL) << ":" << std::setw(3) << std::setfill('0')
             << ((ns % 1000000000) / 1000000) << ", " << std::fixed
             << std::setprecision(2) << currentThroughput << " values/sec "
             << ((opt.Size * opt.World * 4 * 8) / ns) << " Gbps";
  }

  // Free memory
  free(versions);
  free(windows);
  // Destroy the sockets
  for (auto i = 0; i < opt.Threads; ++i)
    close(soc[i]);

  // Compute AllReduce latency and throughput
  latency /= opt.Steps;
  throughput /= opt.Steps;

  worker() << '\n';
  worker() << "Average latency over " << opt.Steps
           << " runs: " << (latency / 1000000000UL) << ":"
           << ((latency % 1000000000UL) / 1000000) << ":"
           << ((latency % 1000000) / 1000) << '\n';
  worker() << "Average throughput over " << opt.Steps << " runs: " << throughput
           << " values/sec\n";
}