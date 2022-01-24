; - [sys-calls] (https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit)

%define STDOUT 1
%define SYS_write 4
%define SYS_exit 1



; fixed
; defines area in memory that stores the instruction codes
section .text				; contains actuall code
	global _start			; must be declared for linker (ld)

_start:
	mov edx, len
	mov ecx, msg
	mov ebx, STDOUT			; file descriptor (stdout)
	mov eax, SYS_write		; sys call number (sys_write)
	int 0x80				; call kernel

	mov edx, 13
	mov ecx, s2
	mov ebx, STDOUT
	mov eax, SYS_write
	int 0x80

	mov ebx, 0
	mov eax, SYS_exit		; sys call number (sys_exit)
	int 0x80



; declares the data region where data elements are stored
; cannot be expanded after the elements are declared (remains static throughout the program)
section .data
	msg db 'Hello, world!', 0xa
	len equ $ - msg			; length of msg
	s2 times 13 db '*'



; also a static memory section
; contains buffers for data to be declared later in the program
; this buffer memory is zero-filled
; section .bss

; stack-segment:
; contains data values passed to functions and procedures within the program


; ten 32-bit registers and six 16-bit registers in IA-32 architecture
