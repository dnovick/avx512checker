bits 64
cpu x64

global HasSSE3
global HasPCLMULQDQ

global HasSSSE3
global HasFMA
global HasSSE41
global HasSSE42
global HasAES
global HasAVX
global HasRDRAND
global HasRDSEED
global HasSHANI

global HasAVX2

; EBX

global HasAVX512F
global HasAVX512DQ
global HasAVX512FMA
global HasAVX512PF
global HasAVX512ER
global HasAVX512CD
global HasAVX512BW
global HasAVX512VL

; ECX
global HasAVX512VBMI
global HasAVX512VBMI2
global HasAVX512VNNI
global HasAVX512BITALG
global HasAVX512POPCNT

; EDX
global HasAVX512VNNIW
global HasAVX512FMAPS

global AVX512State

global LogicalProcCount

global HasHTT

section .text


HasSSE3:
	
	mov eax, 1
	cpuid
	;shr ecx, 28
	and ecx, 1
	mov rax, rcx
		
	ret


HasPCLMULQDQ:
	mov eax, 1
	
	cpuid
	shr ecx, 1
	and ecx, 1
	mov rax, rcx
		
	ret

HasSSSE3:
	
	mov eax, 1
	
	cpuid
	shr ecx, 9
	and ecx, 1
	mov rax, rcx
		
	ret


HasFMA:
	
	mov eax, 1
	
	cpuid
	shr ecx, 12
	and ecx, 1
	mov rax, rcx
		
	ret


HasSSE41:
	
	mov eax, 1
	
	cpuid
	shr ecx, 19
	and ecx, 1
	mov rax, rcx
		
	ret


HasSSE42:
	
	mov eax, 1
	
	cpuid
	shr ecx, 20
	and ecx, 1
	mov rax, rcx
		
	ret


HasAES:
	mov eax, 1
	
	cpuid
	shr ecx, 25
	and ecx, 1
	mov rax, rcx
		
	ret

HasAVX:
	
	mov eax, 1
	
	cpuid
	shr ecx, 28
	and ecx, 1
	mov rax, rcx
		
	ret


HasRDRAND:
	
	mov eax, 1
	
	cpuid
	shr ecx, 30
	and ecx, 1
	mov rax, rcx
		
	ret


HasRDSEED:
	push rbx

	mov eax, 7
	xor rcx, rcx
	
	cpuid
	shr ebx, 18
	and ebx, 1
	mov rax, rbx
		
	pop rbx
	ret


HasSHANI:
	push rbx

	mov eax, 7
	xor rcx, rcx
	
	cpuid
	shr ebx, 29
	and ebx, 1
	mov rax, rbx
		
	pop rbx
	ret

HasAVX2:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 5
	and ebx, 1
	mov rax, rbx

	pop rbx
	ret

; EBX

HasAVX512F:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 16
	and ebx, 1
	mov rax, rbx

	pop rbx
	ret




HasAVX512DQ:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 17
	and ebx, 1
	mov rax, rbx
	
	pop rbx
	ret



HasAVX512FMA:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 21
	and ebx, 1
	mov rax, rbx

	pop rbx
	ret


HasAVX512PF:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 26
	and ebx, 1
	mov rax, rbx
	
	pop rbx
	ret


HasAVX512ER:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 27
	and ebx, 1
	mov rax, rbx

	pop rbx
	ret


HasAVX512CD:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 28
	and ebx, 1
	mov rax, rbx
	
	
	pop rbx
	ret



HasAVX512BW:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 30
	and ebx, 1
	mov rax, rbx
	
	pop rbx
	ret


HasAVX512VL:
	push rbx

	mov eax, 7
	mov ecx, 0
	cpuid
	shr ebx, 31
	and ebx, 1
	mov rax, rbx

	pop rbx
	ret

; ECX
HasAVX512VBMI:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr ecx, 1
	and ecx, 1
	mov rax, rcx
	ret

HasAVX512VBMI2:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr ecx, 6
	and ecx, 1
	mov rax, rcx
	ret

HasAVX512VNNI:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr ecx, 11
	and ecx, 1
	mov rax, rcx
	ret

HasAVX512BITALG:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr ecx, 12
	and ecx, 1
	mov rax, rcx
	ret

HasAVX512POPCNT:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr ecx, 14
	and ecx, 1
	mov rax, rcx
	ret


; EDX
HasAVX512VNNIW:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr edx, 2
	and edx, 1
	mov rax, rdx
	ret

HasAVX512FMAPS:
	mov eax, 7
	mov ecx, 0
	cpuid
	shr edx, 3
	and edx, 1
	mov rax, rdx
	ret



AVX512State:
	mov eax, 0Dh
	mov ecx, 0
	cpuid
	shr eax, 5
	and eax, 111b
	
	ret

LogicalProcCount:
	push rbx
	xor rcx, rcx
	mov eax, 01h
	cpuid
	shr ebx, 16
	
	and ebx, 0FFh
	mov rax, rbx

	pop rbx
	ret



HasHTT:

	mov eax, 01h
	cpuid
	shr edx, 28
	
	and edx, 1
	mov rax, rdx


	ret
		