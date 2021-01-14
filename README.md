# avx512checker
A utility to check which AVX 512 capabilities your CPU supports. It also outputs info about some general CPU capabilities.

UPDATE: There is probably now more non-AVX512 info than there is info about AVX 512. 

This started as a Windows console application. There is a CMake based Linux build in the Linux subdirectory. 

UPDATE: I fixed the Linux bug. It was a stupid Dave error. I wasn't always preserving RBX; I was only pushing/popping it when I used it.
However, CPUID doesn't care if I'm using it, and will write to it if the leaf calls for it. While Windows is a bit more forgiving, 
Linu isn't.'

I wrote this after watching a set of creel videos about AVX512: https://www.youtube.com/watch?v=D-mM6X5xnTY.

This VS 2019 project is configured to use NASM. So you'll need to install it before building it. 
In addition, NASM must be enabled in Visual Studio.

There is a utility to help set that up here: https://github.com/ShiftMediaProject/VSNASM.


