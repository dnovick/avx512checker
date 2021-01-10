#pragma once


extern "C"
{
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
	
	


};