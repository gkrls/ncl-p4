#ifndef _OPTIONS_H_
#define _OPTIONS_H_

#include "popl.h" // https://github.com/badaix/popl
#include <cstdint>
#include <iostream>
#include <ostream>
#include <string>

inline void exitWithErrorMessage(const std::string &msg) {
  std::cout << "error: " << msg << '\n';
  exit(1);
}

struct options {

private:
  popl::OptionParser parser;

public:
  bool Help;
  bool Perf;
  bool Interactive;
  uint32_t Threads;
  std::string IP;
  uint16_t Port;
  std::string ServerIp;
  uint16_t ServerPort;
  uint16_t ServerPorts;
  std::string DeviceMac;
  std::string DeviceIp;
  uint16_t DevicePort;

#if defined(__AVX2__)
  bool AVX2Available = true;
#else
  bool AVX2Available = false;
#endif
#if defined(__AVX512F__)
  bool AVX512Available = true;
#else
  bool AVX512Available = false;
#endif

public:
  options() {
    parser.add<popl::Switch>("h", "help", "print this help message", &Help);
    parser.add<popl::Value<std::string>>("I", "ip", "the workers's ip",
                                         "42.0.0.1", &IP);
    parser.add<popl::Value<uint16_t>>("P", "port", "base udp port", 4242,
                                      &Port);
    parser.add<popl::Value<unsigned>>("j", "threads", "number of threads", 1,
                                      &Threads);

    parser.add<popl::Switch>("", "perf", "run in performance mode", &Perf);

    parser.add<popl::Value<std::string>>("", "device-mac", "device MAC address",
                                         "42:00:00:00:00:00", &DeviceMac);
    parser.add<popl::Value<std::string>>("", "server-ip", "server IPv4 address",
                                         "42.0.0.4", &ServerIp);
    parser.add<popl::Value<uint16_t>>("", "server-port", "server UDP port",
                                      4242, &ServerPort);
    parser.add<popl::Value<uint16_t>>("", "server-ports", "number of server ports",
                                  1, &ServerPorts);
    parser.add<popl::Switch>("i", "interactive", "run in interactive mode", &Interactive);
  }

  void parse(int argc, char **argv) {
    parser.parse(argc, argv);

    if (Threads == 0)
      exitWithErrorMessage("-j/--threads must be > 0");

  }

  int help(std::ostream &o = std::cout) {
    o << this->parser;
    return 0;
  }
};

inline std::string vec2str(uint32_t *v, size_t size, size_t n = 8) {
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

namespace detail {

static inline uint32_t DefaulRngtState = 123456789;

}

inline uint32_t xorshift32(uint32_t &state = detail::DefaulRngtState) {
  state ^= state << 13;
  state ^= state >> 17;
  state ^= state << 5;
  return state;
};

inline uint32_t xorshift32(uint32_t state) {
  state ^= state << 13;
  state ^= state >> 17;
  state ^= state << 5;
  return state;
};

#endif