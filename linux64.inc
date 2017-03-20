section .data
     documento db "resultado.txt",0

section .bss
    digito resb 100
    Posdigito resb 8

%macro printVal 1
    mov rax, %1
%%printRAX:
    mov rcx, digito
    mov rbx, 10
    mov [rcx], rbx
    mov [Posdigito], rcx
 
%%printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48
 
    mov rcx, [Posdigito]
    mov [rcx], dl
    inc rcx
    mov [Posdigito], rcx
   
    pop rax
    cmp rax, 0
    jne %%printRAXLoop
    mov rbx, 0
%%printRAXLoop2:
cmp rbx, 1
jne %%continuar
agrfile [Posdigito], 1

%%continuar:
mov rbx, 1
    mov rcx, [Posdigito]
 
    mov rax, SYS_WRITE
    mov rdi, SYS_WRITE
    mov rsi, rcx
    mov rdx, 1
    syscall
 
    mov rcx, [Posdigito]
    dec rcx
    mov [Posdigito], rcx
    cmp rcx, digito
    jge %%printRAXLoop2
 
%endmacro
 
%macro exit 0
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
%endmacro

%macro addfile 0
	mov rax, SYS_OPEN
	mov rdi, documento
	mov rsi, O_CREAT+O_TRUNC
	mov rdx, 0644o
	syscall

	mov rax, SYS_CLOSE
	pop rdi
	syscall
%endmacro 

%macro agrfile 2
	mov rax, SYS_OPEN
	mov rdi, documento
	mov rsi, O_WRONLY+O_APPEND
	mov rdx, 0644o
	syscall

	push rax
	mov rdi, rax
	mov rax, SYS_WRITE
	mov rsi, %1
	mov rdx, %2
	syscall

	mov rax, SYS_CLOSE
	pop rdi
	syscall
%endmacro

O_WRONLY    equ 1
O_APPEND    equ 1024
SYS_WRITE   equ 1
SYS_OPEN    equ 2
SYS_CLOSE   equ 3
SYS_EXIT    equ 60
O_CREAT     equ 64
O_TRUNC     equ 512

