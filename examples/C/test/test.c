

// Performs a single MAC operation without hardware support

#include <stdio.h>  
#include "util.h"  
int main() {
     printf("Core-V Wally!\n\r");
    printf("Single MAC Operation without hardware!\n\r");
   volatile int a = 2;
   volatile int b = 10;
   volatile int c = 0;
    setStats(1);
    c += a*b;  // Single multiplication and addition
    setStats(0);
    printf("a = %d, b = %d, Custom = %d\n", a, b, c);
    return 0;
}


