#include "include/screen.h"

int kmain() {
  clearScreen();
  print("MyOS v0.0.1");
  //char* vidmem = (char*)0xb8000;
  //vidmem[0] = 'A';
  //vidmem[1] = 0x02;
  cursorX = 17;
  cursorY = 10;
  updateCursor();
  print("Hello world");
  return 0;
}
