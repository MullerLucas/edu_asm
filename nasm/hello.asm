; - [sys-calls] (https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit)

%define STDOUT 1
%define SYS_write 4
%define SYS_exit 1

section .text				; contains actuall code
	global _start			; must be declared for linker (ld)

_start:
	mov  edx, len
	mov  ecx, msg
	mov  ebx, STDOUT		; file descriptor (stdout)
	mov  eax, SYS_write		; sys call number (sys_write)
	int  0x80				; call kernel

	mov ebx, 0
	mov eax, SYS_exit		; sys call number (sys_exit)
	int 0x80



section .data				; contains initialized data or constants
	msg db 'Hello, world!', 0xa
	len equ $ - msg			; length of msg



; block starting symbol: statically allocated variables, that are declared but have not been assigned a value yet
; section .bss

