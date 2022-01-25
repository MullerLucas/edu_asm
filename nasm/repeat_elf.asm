; asmsyntax=nasm



section .data
	msg_1 db 'Please enter a number: '
	msg_1_len equ $-msg_1
	msg_2 db 'You have enetered: '
	msg_2_len equ $-msg_2



section .bss			; uninitialized data
	num resb 5			; reserve 5 bytes (numeric, 1 for sign) for num



section .text
	global _start

_start:
	; print msg_1
	mov edx, msg_1_len
	mov ecx, msg_1
	mov ebx, 1				; sysout
	mov eax, 4				; SYS_write
	int 0x80

	; read and store user input
	mov edx, 5
	mov ecx, num
	mov ebx, 2				; stdin
	mov eax, 3				; SYS_read
	int 0x80

	; print msg_2
	mov edx, msg_2_len
	mov ecx, msg_2
	mov ebx, 1
	mov eax, 4
	int 0x80

	; print stored user input
	mov edx, 5
	mov ecx, num
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0				; err-code
	mov eax, 1				; SYS_exit
	int 0x80
