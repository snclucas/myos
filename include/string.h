#ifndef STRING_H
#define STRING_H

#include "types.h"

#define BLACK           0
#define BLUE            1
#define GREEN           2
#define CYAN            3
#define RED             4
#define MAGENTA         5
#define BROWN           6
#define LIGHT_GREY      7
#define DARK_GREY       8
#define LIGHT_BLUE      9
#define LIGHT_GREEN     10
#define LIGHT_CYAN      11
#define LIGHT_RED       12
#define LIGHT_MAGENTA   13
#define LIGHT_BROWN     14
#define WHITE           15

/*
Bit:        | 15 14 13 12 11 10 9 8 | 7 6 5 4 | 3 2 1 0 |
Content:    | ASCII                 | FG      | BG      | 
*/


#define SCREEN_FRAMEBUFFER_ADDR 0xb8000

uint16 strlength(string ch);

uint8 strEql(string ch1,string ch2);

#endif