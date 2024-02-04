#include <cstdio>
#include "cuda.h"

__global__ void helloWorld()
{
  printf("Hello from block %d/%d\n",
      blockIdx.x, gridDim.x);
}

int main(int argc, char **argv)
{
  helloWorld<<<6,1>>>();
  cudaDeviceSynchronize();
  return 0;
}


