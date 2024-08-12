#include <algorithm>
#include <arpa/inet.h> // For inet_addr
#include <bits/types/struct_iovec.h>
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

void Worker(uint16_t tid, int soc, ncrt::ncl_h *window, uint8_t *version,
            uint32_t *expo, uint32_t *data, size_t size,
            std::shared_future<void> sigstart) {
  sigstart.wait();

  sockaddr_in device;
  device.sin_family = AF_INET;
  device.sin_addr.s_addr = inet_addr(opt.DeviceIp.c_str());
  device.sin_port = htons(opt.DevicePort);

  uint32_t start, end;
  getIndexRangeForThread(tid, start, end);

  // Create NCL(+agg) messages into the window buffer
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

  // Create iovec and mmsghdr buffers
  iovec *iov = (iovec *)malloc(2 * opt.Window * sizeof(iovec));
  mmsghdr *msg = (mmsghdr *)malloc(opt.Window * sizeof(mmsghdr));
  memset(iov, 0, 2 * opt.Window * sizeof(iovec));
  memset(msg, 0, opt.Window * sizeof(mmsghdr));

  // Create opt.Window messages to send
  auto dataOffset = 0;
  auto dataLen = opt.ValuesPerPacket * sizeof(uint32_t);
  for (auto i = 0, v = 0; i < opt.Window; ++i, v += 2) {
    iov[v].iov_base = &window[i];
    iov[v].iov_len = sizeof(ncrt::ncl_h);
    iov[v + 1].iov_base = data + dataOffset;
    iov[v + 1].iov_len = dataLen;
    dataOffset += opt.ValuesPerPacket;

    msg[i].msg_hdr.msg_name = &device;
    msg[i].msg_hdr.msg_namelen = sizeof(sockaddr_in);
    msg[i].msg_hdr.msg_iov = &iov[v];
    msg[i].msg_hdr.msg_iovlen = 2;
    msg[i].msg_hdr.msg_control = nullptr;
    msg[i].msg_hdr.msg_controllen = 0;
    msg[i].msg_hdr.msg_flags = 0;
    msg[i].msg_len = 0;
  }
  // Burst tx opt.Window message
  int n = sendmmsg(soc, msg, opt.Window, 0);
  thread(tid) << "send " << n << " messages\n";

  size_t recvd = 0;

  uint32_t offsetBy = opt.Window * opt.ValuesPerPacket;

  unsigned newVersion;
  unsigned newOffset;

  while (recvd < opt.PacketsPerThread) {
    // receive burst of opt.Window messages
    int n = recvmmsg(soc, msg, opt.Window, 0, nullptr);
    thread(tid) << "received: " << n << '\n';
    if (n == 0)
      continue;

    recvd += n;

    for (auto i = 0; i < n; ++i) {
      newOffset = ntohl(window[i].agg.offset) + offsetBy;
      newVersion = 1 - window[i].agg.ver;

      window[i].agg.ver = 1 - newVersion;
      window[i].agg.agg_idx =
          htonl(ntohl(newVersion ? window[i].agg.agg_idx + opt.Slots
                                 : window[i].agg.agg_idx - opt.Slots));
      //  : window[i].agg.agg_idx =
      //        htonl(ntohl(window[i].agg.agg_idx) - opt.Slots);
      window[i].agg.mask = mask;
      window[i].agg.offset = htonl(newOffset);
      window[i].agg.expo = *expo;

      msg->msg_hdr.msg_iov[1].iov_base = &data[newOffset];
      sendmmsg(soc, &msg[i], 1, 0);
    }

    if (recvd >= opt.PacketsPerThread)
      *version = 1 - newVersion;
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
    threads.emplace_back(Worker, tid, sockets[tid], &windows[tid * opt.Window],
                         &versions[tid], expo, data, size, sigstart);

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

    double gbps = ((double)(opt.Size * 4 * 8)) / ((double)ns);

    worker() << "AllReduce " << (opt.Size * opt.World) << " | "
             << "(" << opt.Size << "/" << (opt.Size * sizeof(uint32_t))
             << "B per worker) : took " << std::setw(2) << std::setfill('0')
             << (ns / 1000000000UL) << ":" << std::setw(3) << std::setfill('0')
             << ((ns % 1000000000) / 1000000) << ", " << std::fixed
             << std::setprecision(2) << currentThroughput << " values/sec "
             << gbps << " Gbps" << std::endl;
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