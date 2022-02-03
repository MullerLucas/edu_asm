; asmsyntax=nasm

%define SYS_exit 1
%define SYS_write 4
%define FD_stdout 1

segment .data
	count dw 1
	value db 15
	var db 6

segment .text
	global _start

_start:
	inc word [count]			; count++;
	dec byte [value]			; value = 14

	mov ebx, count				; move address of count into ebx
	inc word [ebx]				; count++;

	mov eax, [var]
	add eax, '0'
	mov [var], eax

	mov edx, 1
	mov ecx, var
	mov ebx, 1
	mov eax, 4
	int 0x80

exit:
	mov ebx, 0
	mov eax, SYS_exit
	int 0x80
