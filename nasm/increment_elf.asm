; asmsyntax=nasm

%define SYS_exit 1
%define SYS_write 4
%define FD_stdout 1

segment .data
	count dw 1
	value db 15

segment .text
	global _start

_start:
	inc word [count]			; count = 2
	dec byte [value]			; value = 14

	mov ebx, count				; ebx = 2
	inc word [ebx]				; ebx = 3 ?

	mov ebx, 0
	mov eax, SYS_exit
	int 0x80
