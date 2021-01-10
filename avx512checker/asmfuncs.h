#pragma once


extern "C"
{
	bool HasPCLMULQDQ();
	bool HasAES();
	bool HasSSE3();
	bool HasSSSE3();
	bool HasFMA();
	bool HasSSE41();
	bool HasSSE42();
	bool HasAVX();
	bool HasRDRAND();
	bool HasRDSEED();
	bool HasSHANI();

	bool HasAVX2();

	//ebx
	
	bool HasAVX512F();
	bool HasAVX512DQ();
	bool HasAVX512FMA();
	bool HasAVX512PF();
	bool HasAVX512ER();
	bool HasAVX512CD();
	bool HasAVX512BW();
	bool HasAVX512VL();

	//ecx
	bool HasAVX512VBMI();
	bool HasAVX512VBMI2();
	bool HasAVX512VNNI();
	bool HasAVX512BITALG();
	bool HasAVX512POPCNT();

	//edx
	bool HasAVX512VNNIW();
	bool HasAVX512FMAPS();
	
	int AVX512State();
	int LogicalProcCount();

	bool HasHTT();



};