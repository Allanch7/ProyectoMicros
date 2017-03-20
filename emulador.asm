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
linea_15: db 'Guardado en memoria programa uno (1)',0xa				;mensaje guardado 1
l15_tamano: equ $-linea_15							;tamano mensaje guardado 1
linea_16: db 'Guardado en memoria programa cero (0)',0xa			;mensaje guardado 0
l16_tamano: equ $-linea_16							;tamano mensaje guardado 0


linea_17: db 'función add '						;Funcion add
l17_tamano: equ $-linea_17
linea_18: db 'función addi',0xa							;Funcion addi
l18_tamano: equ $-linea_18
linea_19: db 'función addu',0xa							;Funcion addu
l19_tamano: equ $-linea_19
linea_20: db 'función and',0xa							;Funcion and
l20_tamano: equ $-linea_20
linea_21: db 'función andi',0xa							;Funcion andi
l21_tamano: equ $-linea_21
linea_22: db 'función beq',0xa							;Funcion beq
l22_tamano: equ $-linea_22
linea_23: db 'función bne',0xa							;Funcion bne
l23_tamano: equ $-linea_23
linea_24: db 'función j',0xa							;Funcion j
l24_tamano: equ $-linea_24
linea_25: db 'función jal',0xa							;Funcion jal
l25_tamano: equ $-linea_25
linea_26: db 'función jr',0xa							;Funcion jr
l26_tamano: equ $-linea_26
linea_27: db 'función lw',0xa							;Funcion lw
l27_tamano: equ $-linea_27
linea_28: db 'función nor',0xa							;Funcion nor
l28_tamano: equ $-linea_28
linea_29: db 'función or',0xa							;Funcion or
l29_tamano: equ $-linea_29
linea_30: db 'función ori',0xa							;Funcion ori
l30_tamano: equ $-linea_30
linea_31: db 'función slt',0xa							;Funcion slt
l31_tamano: equ $-linea_31
linea_32: db 'función slti',0xa							;Funcion slti
l32_tamano: equ $-linea_32
linea_33: db 'función sltiu',0xa						;Funcion sltiu
l33_tamano: equ $-linea_33
linea_34: db 'función sltu',0xa							;Funcion sltu
l34_tamano: equ $-linea_34
linea_35: db 'función sll',0xa							;Funcion sll
l35_tamano: equ $-linea_35
linea_36: db 'función srl',0xa							;Funcion srl
l36_tamano: equ $-linea_36
linea_37: db 'función sub',0xa							;Funcion sub
l37_tamano: equ $-linea_37
linea_38: db 'función subu',0xa							;Funcion subu
l38_tamano: equ $-linea_38
linea_39: db 'función mult',0xa							;Funcion mult
l39_tamano: equ $-linea_39
linea_40: db 'opcode no valido',0xa						;opcode no valido
l40_tamano: equ $-linea_40
linea_41: db 'Función invalida',0xa						;Función invalida
l41_tamano: equ $-linea_41
linea_42: db 'Dirección fuera de rango',0xa					;Dirección fuera de rango
l42_tamano: equ $-linea_42
										;*******--REGISTROS--*******
linea_43: db '$zero',0xa							;0	Constante 0
l43_tamano: equ $-linea_43
linea_44: db '$at,$v0,$v1,$a0,$a1,$a2,$a3,$t0,$t1,$t2,$t3,$t4,$t5,$t6,$t7,$s0,$s1,$s2,$s3,$s4,$s5,$s6,$s7,$t8,$t9,$k0,$k1,$gp,$sp,$fp,$ra,',0xa								;31	return address 

linea_45: db 'funcion sw',0xa							;0	Constante 0
l45_tamano: equ $-linea_45

;---archivo memoria ROM------
ROM db "ROM.txt",0 								;link para abrir archivo.txt

cadena:   db "lscpu | grep Vendor",0xa
cadena1:   db "lscpu | grep name",0xa
cadena2:   db "lscpu | grep family",0xa
cadena3:   db "lscpu | grep Arch",0xa
cadena4:   db "ps -C m -o %cpu,cmd",0xa
;--------------------Segmento de datos sin inicializar--------------------------
section .bss
;Definición de memorias
;nombre memoria res(reserva) byte (8bits) cantidad de bits
	MEM1 resb 640 								;150 lineas de codigo ascii de 35 bytes  --Memoria ascci
	MEMP resq 150 							;150 lineas de instrucciones de 64 bits -- Memoria de Programa
	MEMD resq 100 								;100 datos de 64 bits --Memoria de datos
	STACK resq 100 								;capacidad de 100 palabras de 64 bits --stack

;Definicion de banco de registros de 64bits
;nombre registro res(reserva) q(qword- 64bits) cantidad
;Se define resq 1, para generar un solo registro de 64bits
	BR resb 256 								;puntero que recorre de 8 en 8bytes las instrucciones

;--------------------Segmento de texto del programa emulador--------------------

section .text
	global main
extern system                           
main:										;Instancia global para el programa
	call _PB 								;llamar pantalla bienvenida
;--------------------Abrir archivo ROM.txt--------------------										
	mov rax, 2								;abrir
	mov rdi, ROM								;LINK archivo
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
_exit1: 	;call _PS 								; llamar pantalla de salida
	call _printBR

_exit:	call _siadd
	mov r14, 21
	call _regs
	mov r14, 0
	call _regs
_e1:	push    rbp                                     
        mov     rbp, rsp                               
        mov     edi, cadena                             
        call    system                                  
        nop                                             
 	pop     rbp  
;	ret
	mov rax, 60								;finalización de correr programa
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
	mov rsi, MEM1								;rsi = linea char a imprimir
	mov rdx,34 								;rdx = tamano de linea memoria a imprimir
	syscall 								;Llamar al sistema
	
 	mov r8,0								;puntero de direccion mem texto
	mov r10,0								;puntero de direccion mem programa
	mov r13,0								;puntero de direccion mem programa
;--------Loop para comparar con uno-----------
_loop0:
	mov r12, 0								;dato de primera dir
	mov QWORD [MEMP+r10], r12						;guardar dato	

_loop1:	
	mov r14, 0
	add r14, r13
	add r14, r8	
	mov al, [MEM1+r14] 							;dato de primera dir en byte
	cmp al, 10								;fin de linea
	je _lop
	mov r12, [MEMP+r10]							;dato de primera dir
	shl r12, 1 								;shift para introducir ceros
	mov QWORD [MEMP+r10], r12						;guardar dato	
	inc r8	
	cmp al, 31h								;comparar con 1
	je _uno									;salto si char es 1
	cmp al, 30h
	jne _lop

;----------Loop para DEJAR CERO----------
_loop2:	
;imprimir insercion de un cero en el registro					
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_16 							;rsi = linea insersion cero
	mov rdx,l16_tamano							;rdx = tamano de linea inser. cero
	syscall

;	cmp r8,33								;compara con el char #32
;	je _loop3								;si es igual a 32 avanzar a la instrucción siguiente
	jmp _loop1;jne								;si es menor que char #32, continua avanzando en la memoria
	
;----Loop para avanzar en la siguiente linea de chars------
;incremento 1 cuando termino una linea
_lop:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_7 							;rsi = linea insersion enter
	mov rdx,l7_tamano							;rdx = tamano de linea inser. enter
	syscall
_loop3:	
	mov r12, [MEMP+r10]							;dato de primera dir
	shr r12, 1								
	mov QWORD [MEMP+r10], r12						;guardar dato	
_loop4:		
	add r10,8 								;incremento mi instruccion
	add r13, 34								;mover 8bits-1 byte
	mov r8,0								;inicio en el char 0
	cmp r10,640								;si llegó a la instruccion 150
	jge _exit1
	jl _loop0								;vuelvo a comparar 1's y 0's

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
	mov QWORD [MEMP+r10], rax						;guardar dato en memoria
	;cmp r8,32								;compara con el char #32
	;je _loop3								;si es igual a 32 avanzar a la instrucción siguiente
	jmp _loop1;jne _loop1							;si es menor que char #32, continua avanzando en la memoria

;Impresion de memoria de programa
_printBR:
	cmp QWORD[MEMP], 0							;compara si memoria de programa esta vacia
	je _exit2								;salta a loop de ROM no encontrada
	jne _continue								;salta a loop de ROM encontrada(para seguir ejecutando instr.)
_printMP0:
	mov QWORD[BR+244], 0								;CERO EN PC
	
_printMP1:
	mov r10, [BR+244]							;dato pc
	mov r12, [MEMP+r10]							;dato de primera dir
	cmp r10, 160								;leer hasta la instruccion 20
	jle _printMP2								;brincar para incrementar instruccion
	jg _exit								;saltar
_printMP2:
	add QWORD[BR+244], 8							;incrementa instruccion
	jmp _printMP1								;brinca a recorrer mem programa
_exit2:
	;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_5								;rsi = linea_uno
	mov rdx,l5_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema
	jmp _exit								; devolverse linea donde pantalla salida

_continue:
	;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_6								;rsi = linea_uno
	mov rdx,l6_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema
	jmp _printMP0								; devolverse linea PARA DESPLEGAR DATOS DE MEMP


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

_EjExitosa:
;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_8								;rsi = linea_8=Ejec_fallida
	mov rdx,l8_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema

	ret	
_EjFallida:
;------Imprimir la primera linea----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_9								;rsi = linea_9=Ejec_fallida
	mov rdx,l9_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema

	ret	

_regs:
	cmp r14,0
	je _zero
	shl r14,2
	sub r14, 4
	mov rcx, linea_44
	add rcx, r14
	mov rax,1
	mov rdi,1
	mov rsi, rcx
	mov rdx,4							;rdx = tamano de add
	syscall 
	ret

_zero:	mov rax,1
	mov rdi,1
	mov rsi,linea_43
	mov rdx,l43_tamano 							;rdx = tamano de add
	syscall  								;Llamar al sistema
	ret

_siadd:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_17								;rsi = linea add
	mov rdx,l17_tamano 							;rdx = tamano de add
	syscall  								;Llamar al sistema

	ret


