#include "container.hpp"

kgr::container &container() {
  static kgr::container container;
  return container;
}
