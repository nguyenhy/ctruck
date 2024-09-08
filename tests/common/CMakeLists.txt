cmake_minimum_required(VERSION 3.5)

project(CtruckCommonTest)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_NAME}/bin")

add_executable(${PROJECT_NAME}_demo demo.cpp ${SOURCE_GLOB} ${TESTS_GLOB})

gtest_discover_tests(${PROJECT_NAME}_demo)
