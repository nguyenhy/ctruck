#include "raylib.h"

/**
 * @param {Rectangle} `rect` assume origin coordinate is at bottom-left corner (0,0)
 * @return {Rectangle} origin is at top-left corner (0,0) to match system origin coordinate
 */
Rectangle toScreenCoordinate(Rectangle rect, int screenWidth, int screenHeight);
