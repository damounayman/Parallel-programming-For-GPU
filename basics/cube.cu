#include <stdio.h>
#include "cuda.h"

__global__ void cube(float *deviceOut, float *deviceIn)
{
    int idx = threadIdx.x;
    float f = deviceIn[idx];
    deviceOut[idx] = f * f * f;
}

int main(void)
{

    const int ARRAY_SIZE = 96;
    const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);

    float h_in[ARRAY_SIZE];
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        h_in[i] = float(i);
    }

    float h_out[ARRAY_SIZE];

    float *d_in;
    float *d_out;

    cudaMalloc((void **)&d_in, ARRAY_BYTES);
    cudaMalloc((void **)&d_out, ARRAY_BYTES);

    cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);

    cube<<<1, ARRAY_SIZE>>>(d_out, d_in);

    cudaMemcpy(h_out, d_out, ARRAY_BYTES, cudaMemcpyDeviceToHost);

    for (int  i =0;i<ARRAY_SIZE; i++)
	{
	    printf("%f%s", h_out[i], (i % 4 != 3) ? "\t" : "\n");


	}


    cudaFree(d_in);
	cudaFree(d_out);
	return 0;


}