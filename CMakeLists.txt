cmake_minimum_required(VERSION 3.5)

project(Ctruck)

# cmake var
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add additional compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

# Enable the generation of compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "=====GLOG=============")
include(${CMAKE_SOURCE_DIR}/lib/glog/build.cmake)

message(STATUS "=====GTEST============")
include(${CMAKE_SOURCE_DIR}/lib/googletest/build.cmake)

message(STATUS "=====kangaru===========")
include(${CMAKE_SOURCE_DIR}/lib/kangaru/build.cmake)

message(STATUS "======================")
include_directories(${CMAKE_SOURCE_DIR}/src)

file(GLOB SOURCE_GLOB
    "${CMAKE_SOURCE_DIR}/src/Ctruck/*.cpp"
    "${CMAKE_SOURCE_DIR}/src/Ctruck/**/*.cpp"
)
message(STATUS "SOURCE_GLOB: ${SOURCE_GLOB}")

add_subdirectory(macos)
add_subdirectory(tests)
