
# raylib configuration
set(RAYLIB_VERSION "5.0")
set(RAYLIB_FILENAME "raylib-${RAYLIB_VERSION}")
set(RAYLIB_DIR "${CMAKE_SOURCE_DIR}/lib/raylib")
set(RAYLIB_EXTRACTED_DIR "${RAYLIB_DIR}/${RAYLIB_FILENAME}")

message(STATUS "find_library: ${RAYLIB_EXTRACTED_DIR}/install/lib")
find_library(
    LIB_RAYLIB
    NAMES raylib
    REQUIRED
    PATHS ${RAYLIB_EXTRACTED_DIR}/install/lib NO_DEFAULT_PATH
)
message(STATUS "->: ${LIB_RAYLIB} (LIB_RAYLIB)")

message(STATUS "include_directories: ${RAYLIB_EXTRACTED_DIR}/install/include")
include_directories(${RAYLIB_EXTRACTED_DIR}/install/include)

link_libraries(${LIB_RAYLIB})
