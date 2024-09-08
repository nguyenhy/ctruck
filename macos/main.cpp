#include "Ctruck/common/logger.hpp"
#include "Ctruck/constant.hpp"
#include "raylib.h"

int main(int argc, char *argv[]) {
  initLogger(argv[0], nullptr);

  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT,
             "raylib [core] example - basic window");

  while (!WindowShouldClose()) {

    BeginDrawing();
    ClearBackground(RAYWHITE);

    EndDrawing();
  }

  CloseWindow();

  return 0;
}
