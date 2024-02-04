## notes

- Core gpu design tenets:
  - lot of simple compute units trade simple control for more compute.
  - Explicitly parallel programming model.
  - optimize for throughput not latency

- ***"cudaMemcpy"*** is used to copy data between different memory spaces within a CUDA program. It is commonly used to transfer data between the CPU (host) and the GPU (device) memory. The function has the following signature in CUDA C/C++:
-
```cpp
cudaError_t cudaMemcpy(void *dst, const void *src, size_t count, cudaMemcpyKind kind);
```


- ***"cudaMalloc"*** is a function for allocating memory on the GPU. It is used to dynamically allocate memory on the GPU device, making it available for use by CUDA kernels and functions.
-
```cpp
cudaError_t cudaMalloc(void **devPtr, size_t size);
```