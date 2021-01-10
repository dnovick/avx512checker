// wjunk1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <vector>
#include <functional>


#include "asmfuncs.h"


struct Avx512TestInfo
{
    std::string             avx512cap;
    std::function<bool()>   testfunc;
};


std::vector<Avx512TestInfo> testInfos{
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

void do_and_show_test(const Avx512TestInfo& testInfo)
{
    std::cout << "Has AVX512 " << testInfo.avx512cap << ":" << (testInfo.testfunc() ? "TRUE\n" : "FALSE\n");
    
}

int main()
{
    std::cout << "Welcome to the AVX 512 Capabilities Checker!\n\n";

    for (auto ti : testInfos)
    {
        do_and_show_test(ti);

    }
}
