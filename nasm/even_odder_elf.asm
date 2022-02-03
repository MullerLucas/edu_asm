; asmsyntax=nasm

%define SYS_EXIT 1
%define SYS_READ 3
%define SYS_WRITE 4

%define FD_STDIN 0
%define FD_STDOUT 1



section .data
	even_msg db 'Even Number!'
	even_msg_len equ $ - even_msg

	odd_msg db 'Odd Number!'
	odd_msg_len equ $ - odd_msg



section .bss
	usr_in resb 1



section .text
	global _start

_start:
	; read in user input
	mov edx, 1
	mov ecx, usr_in
	mov ebx, FD_STDIN
	mov eax, SYS_READ
	int 0x80

	; convert ASCII to number
	mov eax, [usr_in]
	sub eax, '0'

	; test value 8h
	and ax, 1
	jz  evnn

	; write odd-msg
	mov edx, odd_msg_len
	mov ecx, odd_msg
	mov ebx, FD_STDOUT
	mov eax, SYS_WRITE
	int 0x80
	jmp exit

evnn:
	mov ah, 09h

	; write even-msg
	mov edx, even_msg_len
	mov ecx, even_msg
	mov ebx, FD_STDOUT
	mov eax, SYS_WRITE
	int 0x80

exit:
	mov ebx, 0
	mov eax, SYS_EXIT
	int 0x80
