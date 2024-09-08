# https://github.com/gracicot/kangaru#installation
set(KANGARU_VERSION "4.3.2")
set(KANGARU_FILENAME "kangaru-${KANGARU_VERSION}")
set(KANGARU_DIR "${CMAKE_SOURCE_DIR}/lib/kangaru")
set(KANGARU_EXTRACTED_DIR "${KANGARU_DIR}/${KANGARU_FILENAME}")

set(CMAKE_PREFIX_PATH "${KANGARU_EXTRACTED_DIR}/install" ${CMAKE_PREFIX_PATH})

find_package(kangaru 4.3 REQUIRED)

message(STATUS "include_directories: ${KANGARU_EXTRACTED_DIR}/install/include")
include_directories(${KANGARU_EXTRACTED_DIR}/install/include)
