; asmsyntax=nasm

%define SYS_exit 1
%define SYS_write 4
%define FD_stdout 1



section .text
	global _start

_start:

	; print start
	mov edx, stars_len
	mov ecx, stars
	mov ebx, FD_stdout
	mov eax, SYS_write
	int 0x80

	; exit
	mov ebx, 0
	mov eax, SYS_exit
	int 0x80


section .data
	stars times 18 db '*'
	stars_len equ $-stars
