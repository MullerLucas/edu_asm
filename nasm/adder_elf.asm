; asmsyntax=nasm

%define SYS_exit 1
%define SYS_read 3
%define SYS_write 4

%define STDIN 0
%define STDOUT 1



segment .data
	msg_1 db 'Please enter the first number: ', 0xA, 0xD		; LF, CR
	msg_1_len equ $ - msg_1

	msg_2 db 'Please enter the second number: ', 0xA, 0xD
	msg_2_len equ $ - msg_2

	msg_3 db 'The result is: ', 0xA, 0xD
	msg_3_len equ $ - msg_3



segment .bss
	num_1 resb 2			; reserve 2 bytes of uinitialized space
	num_2 resb 2
	res resb 1



segment .text
	global _start

_start:
	; write msg-1
	mov edx, msg_1_len
	mov ecx, msg_1
	mov ebx, STDOUT
	mov eax, SYS_write
	int 0x80

	; read num-1
	mov edx, 2
	mov ecx, num_1
	mov ebx, STDIN
	mov eax, SYS_read
	int 0x80

	; write msg-2
	mov edx, msg_2_len
	mov ecx, msg_2
	mov ebx, STDOUT
	mov eax, SYS_write
	int 0x80

	; read num-2
	mov edx, 2
	mov ecx, num_2
	mov ebx, STDIN
	mov eax, SYS_read
	int 0x80

	; write result-msg
	mov edx, msg_3_len
	mov ecx, msg_3
	mov ebx, STDOUT
	mov eax, SYS_write
	int 0x80

	; add numbers
	mov eax, [num_1]
	sub eax, '0'			; subract '0', to cenvert it into a decimal number
							; '0' = 16 -> after subtraction '0' = 0
	mov ebx, [num_2]
	sub ebx, '0'

	add eax, ebx

	add eax, '0'			; add '0' to convert the sum from decimal to ASCII
	mov [res], eax

	; write result
	mov edx, 1
	mov ecx, res
	mov ebx, STDOUT
	mov eax, SYS_write
	int 0x80

exit:
	mov ebx, 0
	mov eax, SYS_exit
	int 0x80

