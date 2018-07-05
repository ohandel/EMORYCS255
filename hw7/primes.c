// Collaboration Statement:
// THIS CODE WAS MY OWN WORK , IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. 
// Owen Handel

#include "header.h"
#include <stdio.h>

#define SetBit(A, k)     ( A[(k/32)] |= (1 << (k%32)) ) //functions for setting and testing bits
#define TestBit(A, k)    ( A[(k/32)] & (1 << (k%32)) )

void sieveOfE(int N) {
    int i;   //variables
    int k;
    int j;

    //prime is a global variable so at main will init at 0
    //no need to waste time looping to set to 0

    SetBit(prime, 0);    //set bit 0 to be not prime
    SetBit(prime, 1);    //set bit 1 to be not prime

    k = 2; //init k

    while (k <= N) {    //loop to run through bit array starting at k
        for (i = k; i <= N; i++) {  //loop runs from bit k to bit N
            if (TestBit(prime, i) == 0) {    //tests bit
                break;   //if bit is 0 breaks as bit is prime
            }
        }
        for (j = 2 * i; j <= N; j = j + i) {  //sieve part of loop finds any multiples of prime
            SetBit(prime, j);    //sets bit to be not prime
        }                    //iterates through loop by increasing by the found prime each time

        k = i + 1; //increase k by 1

    }

}

int countPrimes(int N) {
    int i;
    int count = 0; //init count at 0

    for (i = 2; i <= N; i++) {  //runs through bits
        if (TestBit(prime, i) == 0) {    //same as above loop tests bit
            count++;     //instead of break if bit == 0 then iterate count
        }
    }

    return count; //return final count

}

void printPrimes(int N) {
    int i;

    for (i = 2; i <= N; i++) {  //runs through bits
        if (TestBit(prime, i) == 0) {    //same as above loop

            printf("%d\n", i);   //prints each prime

        }
    }
}



















