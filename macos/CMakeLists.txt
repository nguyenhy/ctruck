cmake_minimum_required(VERSION 3.5)

project(CtruckMacos)


add_executable(${PROJECT_NAME}
    "${CMAKE_SOURCE_DIR}/macos/main.cpp"
    ${SOURCE_GLOB}
)
link_libraries(${PROJECT_NAME} PUBLIC kangaru::kangaru)
