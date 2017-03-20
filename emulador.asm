;##########################################################
;Proyecto #1 Emulador MIPS desde ensamblador x86_64       #
;EL4313 - Laboratorio de Estructura de Microprocesadores  #
;##########################################################

; Lineas de codigo								;Lineas de comentarios de acción o funcionamiento

;--------------------Segmento de datos--------------------
section .data
linea_1: db 'Bienvenido al emulador MIPS',0xa					;Mensaje Bienvenido
l1_tamano: equ $-linea_1							;tamano bits mensaje bienvenido
linea_2: db 'EL-4313-Lab. Estructura de microprocesadores',0xa			;Mensaje nombre laboratorio
l2_tamano: equ $-linea_2							;tamano mensaje nombre laboratorio	
linea_3: db '1S-2017',0xa							;Mensaje Semestre
l3_tamano: equ $-linea_3							;tamano bits mensaje Semestre
linea_4: db 'Buscando archivo ROM.txt',0xa					;Buscando txt
l4_tamano: equ $-linea_4							;tamano bits buscando
linea_5: db 'Archivo ROM.txt no encontrado',0xa					;Mensaje No encontrado
l5_tamano: equ $-linea_5							;tamano bits mensaje NO encontrado
linea_6: db 'Archivo ROM.txt encontrado',0xa					;Mensaje encontrado
l6_tamano: equ $-linea_6 ;							;tamano bits mensaje encontrado
linea_7: db 'Enter',0xa								;mensaje Enter
l7_tamano: equ $-linea_7 ;							;tamano mensaje Enter
linea_8: db 'Ejecución Exitosa',0xa						;mensaje ejec. exitosa
l8_tamano: equ $-linea_8 							;tamano mensaje ejec. exitosa
linea_9: db 'Ejecución Fallida',0xa						;mensaje ejec. fallida
l9_tamano: equ $-linea_9 							;tamano mensaje ejec. fallida
linea_10: db 'Ruth Campos Artavia, 2013026084',0xa				;Mensaje Nombre Alumno1
l10_tamano: equ $-linea_10							;tamano Mensaje Nombre Alumno1
linea_11: db 'Allan Chacón Cordero, 2013071786 ',0xa				;Mensaje Nombre Alumno2
l11_tamano: equ $-linea_11							;tamano Mensaje Nombre Alumno2
linea_12: db 'Fabricio Saborío Corea, 2014080886',0xa				;Mensaje Nombre Alumno3
l12_tamano: equ $-linea_12							;tamano Mensaje Nombre Alumno3
linea_13: db 'Mario Valenciano Rojas, 2013099217',0xa				;Mensaje Nombre Alumno4
l13_tamano: equ $-linea_13							;tamano Mensaje Nombre Alumno4
linea_14: db 'Leyendo linea 1 de ascci a mem programa',0xa			;Mensaje lectura mem.ascci(MEM1)
l14_tamano: equ $-linea_14							;tamano Mensaje lectura mem.ascci(MEM1)
linea_15: db 'sumado en memoria de un uno (1)',0xa				;mensaje guardado 1
l15_tamano: equ $-linea_15							;tamano mensaje guardado 1
linea_16: db 'guardado en memoria programa cero (0)',0xa			;mensaje guardado 0

l16_tamano: equ $-linea_16							;tamano mensaje guardado 0
;---archivo memoria ROM------
ROM db "ROM.txt",0 								; link para abrir archivo.txt
;--------------------Segmento de datos sin inicializar--------------------
section .bss
;Definición de memorias
;nombre memoria res(reserva) byte (8bits) cantidad de bits
	MEM1 resb 4950 								;150 lineas de codigo ascii de 33 bytes  --Memoria ascci
	MEMP resq 150 								;150 lineas de instrucciones de 64 bits -- Memoria de Programa
	MEMD resq 100 								;100 datos de 64 bits --Memoria de datos
	STACK resq 100 								;capacidad de 100 palabras de 64 bits --stack

;Definicion de banco de registros de 64bits
;nombre registro res(reserva) q(qword- 64bits) cantidad
;Se define resq 1, para generar un solo registro de 64bits
	$s0 resq 1
	$s1 resq 1
	$s2 resq 1
	$s3 resq 1
	$s4 resq 1
	$s5 resq 1
	$s6 resq 1
	$s7 resq 1
	$a0 resq 1
	$a1 resq 1
	$a2 resq 1
	$a3 resq 1
	$sp resq 1
	$v0 resq 1
	$v1 resq 1
;	$pc resq 1								;puntero que recorre de 8 en 8bytes las instrucciones

;--------------------Segmento de texto del programa emulador--------------------

section .text
	global _start

_start:										;Instancia global para el programa
	call _PB 								;llamar pantalla bienvenida

;--------------------Abrir archivo ROM.txt--------------------										
	mov rax, 2	;abrir
	mov rdi, ROM	;LINK archivo
	mov rsi, 0	
	mov rdx, 0
	syscall

;--------------------Leer archivo ROM.txt------------------------										
	push rax								;meter en stack valor rax
	mov rdi, rax	
	mov rax, 0 
	mov rsi, MEM1 								;memoria a guardar chars
	mov rdx, 1200 								;cantidad de chars de ROM.TXT
	syscall
	call _BT								;llamado mensaje buscando ROM.txt
;--------------------Cerrar archivo ROM.txt---------------------									
	mov rax, 3								;cerrar archivo
	pop rdi									;saca valor de rax introducido al leer
	syscall									;llamada para ejecución del programa

	mov rdi, rax
	mov rax, 1
	mov rsi, MEM1
	mov rdx, 1200 								; cantidad de chars a imprimir
	syscall
;-----------------Llamadas revisión codigo----------------------
	call _print	
 	;call _PS 								; llamar pantalla de salida

_exit:	mov rax, 60								;finalización de correr programa
	mov rdi, 0
	syscall

;------------------Funciones de impresion repara revision de codigo---------
_print: 
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_14 							;rsi = linea_ascci a memprog
	mov rdx,l14_tamano 							;rdx = tamano de linea_asc-prog
	syscall

	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, MEM1+31							;rsi = linea char a imprimir
	mov rdx,32 								;rdx = tamano de linea memoria a imprimir
	syscall 								;Llamar al sistema
	
 	mov r8,31								;puntero de direccion mem texto
	mov r10,1								;puntero de direccion mem programa
;--------Loop para comparar con uno-----------
_loop1:
	mov al, [MEM1+r8] 							;dato de primera dir
	cmp al, 31h								;comparar con 1
	je _uno									;salto si char es 1
;----------Loop para avanzar en char----------
_loop2:	
	mov rax, [MEMP+r10]							;dato de primera dir
	shl rax, 1 								;shift para introducir ceros
	mov QWORD [MEMP+r10], rax						;guardar dato	

;imprimir insercion de un cero en el registro					
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_16 							;rsi = linea insersion cero
	mov rdx,l16_tamano							;rdx = tamano de linea inser. cero
	syscall
	
	mov r9, [MEMP+r10] 							;imprime primer dato de primera dir 	
	add r8,1 								;mover 8bits-1 byte
	cmp r8,63								;compara con el char #32
	jge _exit	;je _loop3							;si es igual a 32 avanzar a la instrucción siguiente
	jl _loop1								;si es menor que char #32, continua avanzando en la memoria


;----Loop para avanzar en la siguiente linea de chars------
;incremento 1 cuando termino una linea
;_loop3:
;add r10,1
;mov r8
;jmp loop	

;----Loop para insertar uno en registro------
;incremento 1 y hago shift para crear instruccion

_uno:
;imprimir insercion de un uno en el registro					
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_15 							;rsi = linea insersion uno
	mov rdx,l15_tamano							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema
;-----Sumar un 1-----
	mov rax, [MEMP+r10] 							;dato de primera dir
	inc rax									;incremento dato
	mov QWORD [MEMP+r10], rax							;guardar dato en memoria
	jmp _loop2								;salto a loop para avanzar de char a insertar

;----Pantalla de bienvenida del emulador------
;introduce las lineas de bienvenida, nombre del curso y semestre

_PB:
;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_1								;rsi = linea_uno
	mov rdx,l1_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema

;------Imprimir la segunda línea----
	mov rax,1								;rax= imprimir sistema(1)
	mov rdi,1								;rdi=1 mostrar en consola
	mov rsi,linea_2								;rsi= línea a imprimir
	mov rdx,l2_tamano							;rdx=tamaño de linea a imprimir
	syscall									;llamada sistema

;------Imprimir la tercer línea----
        mov rax,1								;rax= imprimir sistema(1)
        mov rdi,1								;rdi= mostrar en consola(1)
        mov rsi,linea_3								;rsi= línea a imprimir
        mov rdx,l3_tamano							;rdx= tamaño de linea a imprimir
	syscall									;llamada sistema

	ret									;retrocede en la siguiente linea donde se realizó call

;----Pantalla de salida del emulador------
;introduce las lineas de nombres de alumnos del curso 

_PS:					

;-------Imprimir el primer nombre
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_10 							;rsi = linea_uno
	mov rdx,l10_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema

;-------Imprimir el segundo nombre
	mov rax,1								;rax
	mov rdi,1								;rdi
	mov rsi,linea_11							;rsi
	mov rdx,l11_tamano							;rdx
	syscall

;-------Imprimir el tercer nombre
        mov rax,1								;rax
        mov rdi,1								;rdi
        mov rsi,linea_12							;rsi
        mov rdx,l12_tamano							;rdx
	syscall

;-------Imprimir el cuarto nombre
        mov rax,1								;rax
        mov rdi,1								;rdi
        mov rsi,linea_13							;rsi
        mov rdx,l13_tamano							;rdx
	syscall									;Llamar al sistema
	ret									;retrocede en la siguiente linea donde se realizó call

;----Mensaje de salida de buscando ROM.txt------

_BT:
;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_4								;rsi = linea_4=Buscando .txt
	mov rdx,l4_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema

	ret									;retrocede en la siguiente linea donde se realizó call


