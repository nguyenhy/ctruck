
# GLOG configuration
set(GLOG_VERSION "0.7.1")
set(GLOG_FILENAME "glog-${GLOG_VERSION}")
set(GLOG_DIR "${CMAKE_SOURCE_DIR}/lib/glog")
set(GLOG_EXTRACTED_DIR "${GLOG_DIR}/${GLOG_FILENAME}")

message(STATUS "find_library: ${GLOG_EXTRACTED_DIR}/install/lib")
find_library(
    LIB_GLOG
    NAMES glog
    REQUIRED
    PATHS ${GLOG_EXTRACTED_DIR}/install/lib NO_DEFAULT_PATH
)
message(STATUS "->: ${LIB_GLOG} (LIB_GLOG)")

file(GLOB LIB_GLOG_GLOB
    ${GLOG_EXTRACTED_DIR}/install/lib/*.dylib
    ${GLOG_EXTRACTED_DIR}/install/lib/*.lib
    ${GLOG_EXTRACTED_DIR}/install/lib/*.so
)
message(STATUS "LIB_GLOG_GLOB: ${LIB_GLOG_GLOB}")

message(STATUS "include_directories: ${GLOG_EXTRACTED_DIR}/install/include")
include_directories(${GLOG_EXTRACTED_DIR}/install/include)

link_libraries(${LIB_GLOG} ${LIB_GLOG_GLOB})
