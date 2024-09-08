#include "logger.hpp"
#include <iomanip>
#include <string>

void GLogPrefixFormatter(std::ostream &s, const google::LogMessage &m,
                         void * /*data*/) {
  s << google::GetLogSeverityName(m.severity())[0] << std::setw(4)
    << 1900 + m.time().year() << std::setw(2) << 1 + m.time().month()
    << std::setw(2) << m.time().day() << ' ' << std::setw(2) << m.time().hour()
    << ':' << std::setw(2) << m.time().min() << ':' << std::setw(2)
    << m.time().sec() << "." << std::setw(6) << m.time().usec() << ' '
    << std::setfill(' ') << std::setw(5) << m.thread_id() << std::setfill('0')
    << ' ' << m.basename() << ':' << m.line() << "]";
}

void initLogger(char *name, std::string *log_dir) {
  if (log_dir == nullptr) {
    FLAGS_logtostdout = 1;
    FLAGS_logtostderr = 1;
  } else {
    FLAGS_logtostdout = 0;
    FLAGS_logtostderr = 0;
    FLAGS_log_dir = *log_dir;
  }
  google::InitGoogleLogging(name);
  google::InstallPrefixFormatter(&GLogPrefixFormatter);
}
