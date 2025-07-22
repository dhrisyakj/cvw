

// Performs a single MAC operation using custom assembly instruction

#include <stdio.h>  
#include "util.h"  
int main(void) {
    printf("Core-V Wally!\n\r");
     printf("Single MAC Operation with hardware!\n\r");
     int a = 2;
     int b = 10;
     int c;
    setStats(1);
    // Custom single MAC instruction
    // .insn r - directive to specify a R format instruction
    // opcode - Ox2B - 0101011
    // funct3 - 0x0  -  001
    // funct7 - 0x01 - 1000000
    // rd = %0 - mapped to "c"
    // rs1 = %1 - mapped to "a"
    // rs2 = %2 - mapped to "b" 
    asm volatile (
        ".insn r 0x2B, 0x1, 0x40, %0, %1, %2"
        : "=r"(c)          // %0 = rd
        : "r"(a), "r"(b)    // %1 = rs1, %2 = rs2  
    );
    setStats(0);
    printf("a = %d, b = %d, Custom = %d\n", a, b, c);
   
}



