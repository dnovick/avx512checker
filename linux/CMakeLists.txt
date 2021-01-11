cmake_minimum_required(VERSION 3.17)
project(avx512checker C CXX)

set(SOURCE_DIR ${PROJECT_SOURCE_DIR}/../avx512checker)

set(CMAKE_CXX_STANDARD 20)

enable_language(ASM_NASM)



add_executable(avx512checker
        ${SOURCE_DIR}/avx512checker.cpp
        ${SOURCE_DIR}/asmfuncs.asm
        )
