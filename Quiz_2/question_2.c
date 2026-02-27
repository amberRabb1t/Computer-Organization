#include <stdio.h>
#include <stdint.h>

void printABCD(void);

int A[10] = {10,20,30,40,50,60,70,80,90,100};
int B[10] = {-10,-20,-30,-40,-50,-60,-70,-80,-90,-100};

struct pair{
    int x,y;
};

struct pair C[5] = {1000,-1000,2000,-2000,3000,-3000,4000,-4000};

char D[] = "The quick brown fox jumped over the laze dog.";

int main() {

  int* p = &A[1];

  *(p + 4) = 66;

  *(p + 22) = -88;

  *(p + 33) = 2021;

  *(p + 56) = 2038063468;

  for (int i = 0; i < 4; i++) {
      printf("M[%lx] = %d\n", (uintptr_t) p, *p);

      p = p + 14;
  }

  printABCD();

  return 0;
}

void printABCD(void)
{
    printf("\n");
    for(int i=0;i<10;i++)
    {
        printf("A[%d]=%d\n",i,A[i]);
    }
    printf("\n");
    for(int i=0;i<10;i++)
    {
        printf("B[%d]=%d\n",i,B[i]);
    }
    printf("\n");
    for(int i=0;i<5;i++)
    {
        printf("C[%d].x=%d   C[%d].y=%d\n",i,C[i].x,i,C[i].y);
    }
    printf("\n");
    printf("D[]=%s",D);
    printf("\n");
}
