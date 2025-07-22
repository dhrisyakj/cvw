

// Performs MAC operation without hardware support

#include <stdio.h>  
#include "util.h" 
#define N 8

volatile int A[N];
volatile int B[N];

int main() {
    int acc = 0;
    printf("Core-V Wally!\n\r");
    printf("MAC Operation without hardware!\n\r");
    // Initialize arrays A and B
    for (int i = 0; i < N; i++) {
        A[i] = i + 1; 
        B[i] = i + 2;  
    }
    // Perform MAC operation
    // Using a loop to simulate the MAC operation
    // acc = A[0]*B[0] + A[1]*B[1] + ... + A[N-1]*B[N-1]
    setStats(1);
    // MAC operation using a loop
    for (int i = 0; i < N; i++) {
        acc+= A[i] * B[i];
    }
    setStats(0);
    printf(" MAC Result= %d\n", acc);
    return 0;
}


