

// Performs a single MAC operation using custom assembly instruction

#include <stdio.h>  
#include "util.h"  
#define N 8

volatile int A[N];
volatile int B[N];

int main(void) {
    printf("Core-V Wally!\n\r");
     printf(" MAC Operation with hardware!\n\r");
     int acc=0;
      // Initialize arrays A and B
    for (int i = 0; i < N; i++) {
        A[i] = i + 1; 
        B[i] = i + 2;  
    }
    setStats(1);
    // Perform MAC operation
    // MAC operation using a loop
    for (int i = 0; i < N; i++) {
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
        : "=r"(acc)          // %0 = rd
        : "r"(A[i]), "r"(B[i])    // %1 = rs1, %2 = rs2  
    );
   }
    setStats(0);
    printf("Mac Result = %d\n", acc);
   
}



