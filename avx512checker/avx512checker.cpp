#include <iostream>
#include <vector>
#include <functional>
#include <thread>

#include "asmfuncs.h"


struct TestInfo
{
    std::string             capability;
    std::function<bool()>   testfunc;
};

std::vector<TestInfo> testInfos{
    {"HTT",         HasHTT},

    {"FMA",         HasFMA},
    {"AES NI",      HasAES},
    {"PCLMULQDQ",   HasPCLMULQDQ},
    {"RDRAND",      HasRDRAND},
    {"RDSEED",      HasRDSEED},
    {"SHA NI",      HasSHANI},
    {"SSE3",        HasSSE3},    
    {"SSSE3",       HasSSSE3},
    
    {"SSE4.1",      HasSSE41},
    {"SSE4.2",      HasSSE42},
    {"AVX",         HasAVX},
    {"AVX2",        HasAVX2}

};


std::vector<TestInfo> avx512TestInfos{
    //ebx tests
    {"Foundations", HasAVX512F},
    {"DQ",          HasAVX512DQ},
    {"FMA",         HasAVX512FMA},
    {"PF",          HasAVX512PF},
    {"ER",          HasAVX512ER},
    {"CD",          HasAVX512CD},
    {"BW",          HasAVX512BW},
    {"VL",          HasAVX512VL},

    //ecx tests
    {"VBMI",        HasAVX512VBMI},
    {"VBMI2",       HasAVX512VBMI2},
    {"VNNI",        HasAVX512VNNI},
    {"BITALG",      HasAVX512BITALG},
    {"POPCNT",      HasAVX512POPCNT},

    //edx tests
    {"4VNNIW",      HasAVX512VNNIW},
    {"4FMAPS",      HasAVX512FMAPS}



};


void do_and_show_test(const TestInfo& testInfo)
{
    std::cout << "Has " << testInfo.capability << ": " << (testInfo.testfunc() ? "TRUE\n" : "FALSE\n");

}

void do_and_show_avx512_test(const TestInfo& testInfo)
{
    std::cout << "Has AVX512 " << testInfo.capability << ": " << (testInfo.testfunc() ? "TRUE\n" : "FALSE\n");
    
}

int main()
{
    std::cout << "Welcome to the AVX 512 Capabilities Checker!\n\n";

    std::cout << "======General Features=====\n\n";
    
    std::cout << "This CPU has " << std::thread::hardware_concurrency() << " logical processors.\n\n";
     
    //This returns 64 on my Core i9 which has 38 logical procs, because 64 is the nearest power of 2.
    //std::cout << "This CPU has " << LogicalProcCount() << " logical processors.\n\n";

         
    for (auto ti : testInfos)
    {
        do_and_show_test(ti);
    }

    std::cout << "\n\n";

    std::cout << "\n\n======AVX 512 Capabilities=====\n\n";

    for (auto ti : avx512TestInfos)
    {
        do_and_show_avx512_test(ti);

    }
}
