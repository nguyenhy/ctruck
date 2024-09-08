cmake_minimum_required(VERSION 3.5)

project(Ctruck/Tests)
enable_testing()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_NAME}/bin")

file(GLOB TESTS_GLOB
    "${CMAKE_SOURCE_DIR}/tests/**/*.cpp"
)
message(STATUS "TESTS_GLOB: ${CMAKE_SOURCE_DIR} ${TESTS_GLOB}")
include_directories(${CMAKE_SOURCE_DIR}/tests)

include(GoogleTest)

add_subdirectory(common)
