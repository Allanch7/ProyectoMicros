;##########################################################
;Proyecto #1 Emulador MIPS desde ensamblador x86_64       #
;EL4313 - Laboratorio de Estructura de Microprocesadores  #
; Librería impresion de macros tomado de  #
;##########################################################

; Lineas de codigo                                        ;Lineas de comentarios de acción o funcionamiento

;--------------------Segmento de datos--------------------
section .data
     documento db "resultado.txt",0			 ;Definicion nombre del archivo a guardar
     
;--------------------Segmento de datos sin inicializar--------------------------
section .bss
    digito resb 100					;Memoria de reserva de digitos para imprimir
    Posdigito resb 8					;Reserva para obtener la posicion del digito a imprimir

%macro printVal 1					; macro para imprimir, el 1 significa que recibe un valor cuando es llamado
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
agrfile [Posdigito], 1						; para agregar cada digito al documento de texto que fue impreso en consola

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


%macro addfile 0						; macro para crear o truncar un documento de texto
	mov rax, SYS_OPEN					;abrir el sistema
	mov rdi, documento					;nombre del documento
	mov rsi, O_CREAT+O_TRUNC				;crear o truncar los datos existentes
	mov rdx, 0644o						
	syscall

	mov rax, SYS_CLOSE
	pop rdi
	syscall
%endmacro 

%macro agrfile 2						; macro para agregar datos al documento de texto
	mov rax, SYS_OPEN					; abre la carpeta
	mov rdi, documento					; con el nombre correspondiente
	mov rsi, O_WRONLY+O_APPEND				; y se le da permiso de escritura y concatenacion de datos
	mov rdx, 0644o
	syscall

	push rax
	mov rdi, rax
	mov rax, SYS_WRITE					;se realiza escritura de datos
	mov rsi, %1						;cadena que se va a agregar
	mov rdx, %2						; ancho de la cadena(tamano)
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

