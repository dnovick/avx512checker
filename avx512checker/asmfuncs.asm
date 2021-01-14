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

global HasIBRS
global HasSTIBP

global HasCETSS
global HasCETIBT

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


; DOCPUID eax_val, leaf_reg, bit_num
; TODOD: Add support for non 0 ecx values - i.e. other leaves.
%macro DOCPUID 4
	push rbx		;Some CPUID calls modify rbx which must be preserved.
	
	%if %2 == 0		; Set the rcx leaf
		xor rcx, rcx
	%else
		mov ecx, %2
	%endif

	mov eax, %1		; Set the eax value
	cpuid


	shr e%3, %4		; Shift the results reg by the bit we want
	and e%3, 1		; And the shifted bit to extract it.
	mov rax, r%3	; Move the extracted bit to the return value
	
	pop rbx			;Restore caller rbx
	
	ret

%endmacro




HasSSE3:
	DOCPUID 1, 0, cx, 0

;HasSSE3:
	
;	mov eax, 1
;	cpuid
	
;	and ecx, 1
;	mov rax, rcx
	
;	ret

HasPCLMULQDQ:
	DOCPUID 1, 0, cx, 1

;HasPCLMULQDQ:
;	mov eax, 1
	
;	cpuid
;	shr ecx, 1
;	and ecx, 1
;	mov rax, rcx
		
;	ret

HasSSSE3:
	DOCPUID 1, 0, cx, 9

;HasSSSE3:
	
;	mov eax, 1
	
;	cpuid
;	shr ecx, 9
;	and ecx, 1
;	mov rax, rcx
		
;	ret

HasFMA:
	DOCPUID 1, 0, cx, 12


;HasFMA:
	
;	mov eax, 1
	
;	cpuid
;	shr ecx, 12
;	and ecx, 1
;	mov rax, rcx
		
;	ret

HasSSE41:
	DOCPUID 1, 0, cx, 19

;HasSSE41:
	
;	mov eax, 1
	
;	cpuid
;	shr ecx, 19
;	and ecx, 1
;	mov rax, rcx
		
;	ret


HasSSE42:
	DOCPUID 1, 0, cx, 20

;	mov eax, 1
	
;	cpuid
;	shr ecx, 20
;	and ecx, 1
;	mov rax, rcx
		
;	ret


HasAES:
	DOCPUID 1, 0, cx, 25
;	mov eax, 1
	
;	cpuid
;	shr ecx, 25
;	and ecx, 1
;	mov rax, rcx
		
;	ret

HasAVX:
	DOCPUID 1, 0, cx, 28	
;	mov eax, 1
	
;	cpuid
;	shr ecx, 28
;	and ecx, 1
;	mov rax, rcx
		
;	ret


HasRDRAND:
	DOCPUID 1, 0, cx, 30
;	mov eax, 1
	
;	cpuid
;	shr ecx, 30
;	and ecx, 1
;	mov rax, rcx
		
;	ret


HasRDSEED:
	DOCPUID 7, 0, bx, 18
;	push rbx

;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr ebx, 18
;	and ebx, 1
;	mov rax, rbx
		
;	pop rbx
;	ret


HasSHANI:
	DOCPUID 7, 0, bx, 29
;	push rbx

;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr ebx, 29
;	and ebx, 1
;	mov rax, rbx
		
;	pop rbx
;	ret

HasIBRS:
	DOCPUID 7, 0, dx, 26
;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr edx, 26
;	and edx, 1
;	mov rax, rdx
		
;	ret

HasSTIBP:
	DOCPUID 7, 0, dx, 27
;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr edx, 27
;	and edx, 1
;	mov rax, rdx
		
;	ret


HasCETSS:
	DOCPUID 7, 0, cx, 7
;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr ecx, 7
;	and ecx, 1
;	mov rax, rcx
		
;	ret

HasCETIBT:
	DOCPUID 7, 0, dx, 20	
;	mov eax, 7
;	xor rcx, rcx
	
;	cpuid
;	shr edx, 20
;	and edx, 1
;	mov rax, rdx
		
;	ret



HasAVX2:
	DOCPUID 7, 0, bx, 5
;	push rbx

;	mov eax, 7
;	xor ecx, ecx
;	cpuid
;	shr ebx, 5
;	and ebx, 1
;	mov rax, rbx

;	pop rbx
;	ret

; EBX

HasAVX512F:
	DOCPUID 7, 0, bx, 16
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 16
;	and ebx, 1
;	mov rax, rbx

;	pop rbx
;	ret




HasAVX512DQ:
	DOCPUID 7, 0, bx, 17
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 17
;	and ebx, 1
;	mov rax, rbx
	
;	pop rbx
;	ret



HasAVX512FMA:
	DOCPUID 7, 0, bx, 21
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 21
;	and ebx, 1
;	mov rax, rbx

;	pop rbx
;	ret


HasAVX512PF:
	DOCPUID 7, 0, bx, 26
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 26
;	and ebx, 1
;	mov rax, rbx
	
;	pop rbx
;	ret


HasAVX512ER:
	DOCPUID 7, 0, bx, 27
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 27
;	and ebx, 1
;	mov rax, rbx

;	pop rbx
;	ret


HasAVX512CD:
	DOCPUID 7, 0, bx, 28
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 28
;	and ebx, 1
;	mov rax, rbx
	
	
;	pop rbx
;	ret



HasAVX512BW:
	DOCPUID 7, 0, bx, 30
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 30
;	and ebx, 1
;	mov rax, rbx
	
;	pop rbx
;	ret


HasAVX512VL:
	DOCPUID 7, 0, bx, 31
;	push rbx

;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ebx, 31
;	and ebx, 1
;	mov rax, rbx

;	pop rbx
;	ret

; ECX
HasAVX512VBMI:
	DOCPUID 7, 0, cx, 1
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ecx, 1
;	and ecx, 1
;	mov rax, rcx
;	ret

HasAVX512VBMI2:
	DOCPUID 7, 0, cx, 6
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ecx, 6
;	and ecx, 1
;	mov rax, rcx
;	ret

HasAVX512VNNI:
	DOCPUID 7, 0, cx, 11
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ecx, 11
;	and ecx, 1
;	mov rax, rcx
;	ret

HasAVX512BITALG:
	DOCPUID 7, 0, cx, 12
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ecx, 12
;	and ecx, 1
;	mov rax, rcx
;	ret

HasAVX512POPCNT:
	DOCPUID 7, 0, cx, 14
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr ecx, 14
;	and ecx, 1
;	mov rax, rcx
;	ret


; EDX
HasAVX512VNNIW:
	DOCPUID 7, 0, dx, 2
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr edx, 2
;	and edx, 1
;	mov rax, rdx
;	ret

HasAVX512FMAPS:
	DOCPUID 7, 0, dx, 3
;	mov eax, 7
;	mov ecx, 0
;	cpuid
;	shr edx, 3
;	and edx, 1
;	mov rax, rdx
;	ret



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
	DOCPUID 1, 0, dx, 28
;	mov eax, 01h
;	cpuid
;	shr edx, 28
	
;	and edx, 1
;	mov rax, rdx


;	ret
		