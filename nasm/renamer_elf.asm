; asmsyntax=nasm

%define SYS_exit 1
%define SYS_write 4
%define FD_stdout 1



section .text
	global _start
_start:

	; write the name 'Zara Ali'
	mov edx, 9
	mov ecx, name
	mov ebx, FD_stdout
	mov eax, SYS_write
	int 0x80

	; Change name to 'Nuha Ali'
	mov [name], dword 'Nuha'

	; write the name 'Nuha Ali'
	mov edx, name_len
	mov ecx, name
	mov ebx, FD_stdout
	mov eax, SYS_write
	int 0x80

	mov ebx, 0
	mov eax, SYS_exit
	int 0x80


section .data
	name db 'Zara Ali', 0xa			; 0xa => ASCII 10 => LF (Line Feed)
	name_len equ $-name				; len => 9bytes = 1byte per character in string + 1byte for LF
