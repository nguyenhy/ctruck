cmake_minimum_required(VERSION 3.5)

project(CtruckMacos)

# https://github.com/raysan5/raylib/wiki/Working-on-macOS#without-xcode---building-statically
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "Minimum OS X deployment version")
link_libraries(
    "-framework CoreVideo"
    "-framework IOKit"
    "-framework Cocoa"
    "-framework GLUT"
    "-framework OpenGL"
)

add_executable(${PROJECT_NAME}
    "${CMAKE_SOURCE_DIR}/macos/main.cpp"
    ${SOURCE_GLOB}
)
link_libraries(${PROJECT_NAME} PUBLIC kangaru::kangaru)
