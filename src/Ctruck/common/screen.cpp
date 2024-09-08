#include "raylib.h"

Rectangle toScreenCoordinate(Rectangle rect, int screenWidth,
                             int screenHeight) {
  Rectangle output;
  output.height = rect.height;
  output.width = rect.width;
  output.x = rect.x;
  output.y = screenHeight - rect.y - rect.height;
  return output;
}
