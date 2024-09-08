
# GLOG configuration
set(GOOGLETEST_VERSION "1.15.2")
set(GOOGLETEST_FILENAME "googletest-${GOOGLETEST_VERSION}")
set(GOOGLETEST_DIR "${CMAKE_SOURCE_DIR}/lib/googletest")
set(GOOGLETEST_EXTRACTED_DIR "${GOOGLETEST_DIR}/${GOOGLETEST_FILENAME}")

message(STATUS "find_library: ${GOOGLETEST_EXTRACTED_DIR}/install/lib")
find_library(
    LIB_GOOGLETEST
    NAMES gtest
    REQUIRED
    PATHS ${GOOGLETEST_EXTRACTED_DIR}/install/lib NO_DEFAULT_PATH
)
message(STATUS "-> ${LIB_GOOGLETEST} (LIB_GOOGLETEST)")
find_library(
    LIB_GOOGLETEST_MAIN
    NAMES gtest_main
    REQUIRED
    PATHS ${GOOGLETEST_EXTRACTED_DIR}/install/lib NO_DEFAULT_PATH
)
message(STATUS "->: ${LIB_GOOGLETEST_MAIN} (LIB_GOOGLETEST_MAIN)")

message(STATUS "include_directories: ${GOOGLETEST_EXTRACTED_DIR}/install/include")
include_directories(${GOOGLETEST_EXTRACTED_DIR}/install/include)

link_libraries(${LIB_GOOGLETEST} ${LIB_GOOGLETEST_MAIN})
