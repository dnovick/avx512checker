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

section .text

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


