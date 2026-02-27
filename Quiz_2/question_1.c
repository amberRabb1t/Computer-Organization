#include <stdio.h>
#include <stdint.h>

int A[10] = {10,20,30,40,50,60,70,80,90,100};
int B[10] = {-10,-20,-30,-40,-50,-60,-70,-80,-90,-100};

struct pair {
    int x, y;
};

struct pair C[5] = {1000,-1000,2000,-2000,3000,-3000,4000,-4000};
char D[] = "The quick brown fox jumped over the laze dog.";

int main() {
	int* p = &A[1];
	for (int i = 0; i < 64; ++i) {
		p = p - 1;
		printf("M[%lx] = %d\n", (uintptr_t) p, *p);
		p = p + 2;
	}
	return 0;
}
