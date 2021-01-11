# avx512checker
A utility to check which AVX 512 capabilities your CPU supports. It also outputs info about some general CPU capabilities.

This started as a Windows console application. There is a CMake based Linux build in the Linux subdirectory. Right now, it builds but crashes when run.

I wrote this after watching a set of creel videos about AVX512: https://www.youtube.com/watch?v=D-mM6X5xnTY.

This VS 2019 project is configured to use NASM. So you'll need to install it before building it. 
In addition, NASM must be enabled in Visual Studio.

There is a utility to help set that up here: https://github.com/ShiftMediaProject/VSNASM.


