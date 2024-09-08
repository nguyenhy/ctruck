#define GLOG_USE_GLOG_EXPORT
#include <glog/logging.h>

void GLogPrefixFormatter(std::ostream &s, const google::LogMessage &m,
                         void * /*data*/);
void initLogger(char *name, std::string *log_dir);
