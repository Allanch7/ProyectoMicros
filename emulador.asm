;##########################################################
;Proyecto #1 Emulador MIPS desde ensamblador x86_64       #
;EL4313 - Laboratorio de Estructura de Microprocesadores  #
;##########################################################

; Lineas de codigo								;Lineas de comentarios de acción o funcionamiento
%include "linux64.inc"
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
;------------------Funciones-----------------------------------
linea_17: db 'función add '							;Funcion add
l17_tamano: equ $-linea_17
linea_18: db 'función addi '							;Funcion addi
l18_tamano: equ $-linea_18
linea_19: db 'función addu '							;Funcion addu
l19_tamano: equ $-linea_19
linea_20: db 'función and '							;Funcion and
l20_tamano: equ $-linea_20
linea_21: db 'función andi '							;Funcion andi
l21_tamano: equ $-linea_21
linea_22: db 'función beq '							;Funcion beq
l22_tamano: equ $-linea_22
linea_23: db 'función bne '							;Funcion bne
l23_tamano: equ $-linea_23
linea_24: db 'función j '							;Funcion j
l24_tamano: equ $-linea_24
linea_25: db 'función jal '							;Funcion jal
l25_tamano: equ $-linea_25
linea_26: db 'función jr '							;Funcion jr
l26_tamano: equ $-linea_26
linea_27: db 'función lw '							;Funcion lw
l27_tamano: equ $-linea_27
linea_28: db 'función nor '							;Funcion nor
l28_tamano: equ $-linea_28
linea_29: db 'función or '							;Funcion or
l29_tamano: equ $-linea_29
linea_30: db 'función ori '							;Funcion ori
l30_tamano: equ $-linea_30
linea_31: db 'función slt '							;Funcion slt
l31_tamano: equ $-linea_31
linea_32: db 'función slti '							;Funcion slti
l32_tamano: equ $-linea_32
linea_33: db 'función sltiu '							;Funcion sltiu
l33_tamano: equ $-linea_33
linea_34: db 'función sltu '							;Funcion sltu
l34_tamano: equ $-linea_34
linea_35: db 'función sll '							;Funcion sll
l35_tamano: equ $-linea_35
linea_36: db 'función srl '							;Funcion srl
l36_tamano: equ $-linea_36
linea_37: db 'función sub '							;Funcion sub
l37_tamano: equ $-linea_37
linea_38: db 'función subu '							;Funcion subu
l38_tamano: equ $-linea_38
linea_39: db 'función mult '							;Funcion mult
l39_tamano: equ $-linea_39
linea_45: db 'funcion sw '							;Funcion sw
l45_tamano: equ $-linea_45
; ------ Lineas de mensajes de posibles errores-------
linea_40: db 'opcode no valido',0xa						;opcode no valido
l40_tamano: equ $-linea_40
linea_41: db 'Función invalida',0xa						;Función invalida
l41_tamano: equ $-linea_41
linea_42: db 'Dirección fuera de rango',0xa					;Dirección fuera de rango
l42_tamano: equ $-linea_42
;--------REGISTROS-------------------------------------
linea_43: db '$zero'							;Registro Constante 0
l43_tamano: equ $-linea_43
linea_44: db '$at $v0 $v1 $a0 $a1 $a2 $a3 $t0 $t1 $t2 $t3 $t4 $t5 $t6 $t7 $s0 $s1 $s2 $s3 $s4 $s5 $s6 $s7 $t8 $t9 $k0 $k1 $gp $sp $fp $ra '								;31	return address 

linea_47: db 'Enter para terminar',0xa								;mensaje Enter
l47_tamano: equ $-linea_47 ;							;tamano mensaje Enter
linea_48: db ', ()-= ',0xa
;---archivo memoria ROM------
ROM db "ROM.txt",0 								;link para abrir archivo.txt
cadena:   db "lscpu | grep Vendor",0xa						;vendedor del procesador
cadena1:   db "lscpu | grep name",0xa						;nombre del modelo del procesador
cadena2:   db "lscpu | grep family",0xa						;familia del procesador
cadena3:   db "lscpu | grep Arch",0xa						;arquitectura del procesador()
cadena4:   db "top -bn1 | grep 'Cpu(s)'",0xa
;cadena5:   db "lscpu | grep Vendor >> resultado.txt",0xa						;vendedor del procesador
;cadena6:   db "lscpu | grep name >> resultado.txt",0xa						;nombre del modelo del procesador
;cadena7:   db "lscpu | grep family >> resultado.txt",0xa						;familia del procesador
;cadena8:   db "lscpu | grep Arch >> resultado.txt",0xa	
;cadena9:   db "top -bn1 | grep 'Cpu(s)' >> resultado.txt",0xa

;--------------------Segmento de datos sin inicializar--------------------------
section .bss
;Definición de memorias
;nombre memoria res(reserva) byte (8bits) cantidad de bits
	MEM1 resb 640 								;150 lineas de codigo ascii de 35 bytes  --Memoria ascci
	MEMP resq 150 					      		        ;150 lineas de instrucciones de 64 bits -- Memoria de Programa
	MEMD resq 100 								;100 datos de 64 bits --Memoria de datos
	STACK resq 100 								;capacidad de 100 palabras de 64 bits --stack

;Definicion de banco de registros de 64bits
;nombre registro res(reserva) q(qword- 64bits) cantidad
;Se define resq 1, para generar un solo registro de 64bits
;-------------------------------------------------------------------------------
	BR resb 256 								;puntero que recorre de 8 en 8bytes las instrucciones
	buffer resb 10000 							; se reservan 10 bytes para hacer la lectura del teclado
;--------------------Segmento de texto del programa emulador--------------------

section .text
	global main
extern system                           
main:	
	
	addfile

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
_exit1:	call _printBR
_exit3: call _PS 								; llamar pantalla de salida
	

_exit:	call _igual
;	call _sior	
;	mov r14, 31
;	call _immediate
;	call _regs
;	call _coma
;	mov r14, 0
;	call _immediate
;	call _regs
;	call _coma
;	mov r14, 20
;	call _immediate
;	call _regs
;	call _nl
	
_e1:	push    rbp                                     
        mov     rbp, rsp                               
        mov     edi, cadena                					;comandos                                          
        call    system                                 				;llamadas del sistema
        nop                                          				;no opera
 	pop     rbp  								;saca del stack donde estaba la llamada
;	ret
	call _enter2
 
_e2:	
	mov rax, 60								;finalización de correr programa
	mov rdi, 0
	syscall

;------------------Funciones de impresion para revision de codigo---------
_print: 
;	call _enter0
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
	mov r10,0								;puntero de instruccion
	mov r13,0								;puntero de direccion mem texto 0-4950

;----------------------------Loop para comparar con uno-------------------------
_loop0:
	mov r12, 0								;dato de primera dir
	mov QWORD [MEMP+r10], r12						;guardar dato	

_loop1:	
	mov r14, 0								;establece un cero
	add r14, r13								;aumenta el valor de memoria
	add r14, r8								;mueve r14, mem de texto
	mov al, [MEM1+r14] 							;mueve al byte dato de la dir 
	cmp al, 10								;fin de linea
	je _loop5
	mov r12, [MEMP+r10]							;dato de primera dir
	shl r12, 1 								;shift para introducir ceros
	mov QWORD [MEMP+r10], r12						;guardar dato	
	inc r8	
	cmp al, 31h								;comparar con 1
	je _uno									;salto si char es 1
	cmp al, 30h								;comparar con 0
	jne _loop5								;

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
_loop4:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_7 							;rsi = linea insersion enter
	mov rdx,l7_tamano							;rdx = tamano de linea inser. enter
	syscall									;llamada del sistema
_loop3:	
	mov r12, [MEMP+r10]							;dato de primera dir
	shr r12, 1								
	mov QWORD [MEMP+r10], r12						;guardar dato	
_loop5:		
	add r10,8 								;incremento mi instruccion
	add r13, 34								;mover 8bits-1 byte
	mov r8,0								;inicio en el char 0
	cmp r10,640								;si llegó a la instruccion 150
	jge _exit1
	jl _loop0								;vuelvo a comparar 1's y 0's

;--------------Loop para insertar uno en registro------------------------------
;--------incremento 1 y hago shift para crear instruccion----------------------
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
	mov QWORD[BR+224], 0							;CERO EN PC
	mov r10, [BR+224]							;dato pc	
;	jmp _OPCODE								;opcode	
										;saltar a revisar la primera instruccion
;----------------Instrucción Siguiente------------------------------------------
;------Calcula que no se pase de la instruccion 150 además de avanzar de valor de pc a pc+8
_NewInst:
	mov r12, [BR+224]							;saca el valor de pc
	add r12,8								;obtiene el valor siguiente de pc
	cmp r12,0;1192d								;compara si el valor está en el límite
	jg _exit3								;salta a pantalla de salida
	mov QWORD[BR+224], r12							;dato pc+8	
_NewInst2:
	mov r10, [BR+224]							;dato pc		
;	jmp _OPCODE								;salta a revisar la instrucción siguiente
	jmp _NewInst								;salta a aumentar la pc


;------Imprimir la línea enter, porque la memoria no se encontró o se encuentra vacía ----
_exit2:

	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_5								;rsi = linea_uno
	mov rdx,l5_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema
	call _enter0					 			;imprimir enter para salir
	jmp _e2							    		; devolverse linea donde pantalla salida

;------Imprimir la linea enter, para continuar con la ejecución de las instrucciones----
_continue:
	

	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_6								;rsi = linea_uno
	mov rdx,l6_tamano 							;rdx = tamano de linea_uno
	syscall  								;Llamar al sistema
	call _enter0	
	;jmp _printMP0								; devolverse linea PARA DESPLEGAR DATOS DE MEMP
	jmp _exit3								;salta a pantalla de salida

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
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_11							;rsi = linea_uno
	mov rdx,l11_tamano							;rdx = tamano de linea_uno
	syscall									;Llamar al sistema

;-------Imprimir el tercer nombre
 	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_12							;rsi = linea_uno
	mov rdx,l12_tamano							;rdx = tamano de linea_uno
	syscall									;Llamar al sistema

;-------Imprimir el cuarto nombre
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_13							;rsi = linea_uno
	mov rdx,l13_tamano							;rdx = tamano de linea_uno
	syscall	
	ret									;retrocede en la siguiente linea donde se realizó call

;----Mensaje de salida de buscando ROM.txt------

_BT:
;------Imprimir la linea buscando ROM.txt----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_4								;rsi = linea_4=Buscando .txt
	mov rdx,l4_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema

	ret									;retrocede en la siguiente linea donde se realizó call

_EjExitosa:
;------Imprimir la linea Ejec.Exitosa----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_8								;rsi = linea_8=Ejec_exitosa
	mov rdx,l8_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema
	jmp _e1
_EjFallida:
;------Imprimir la línea Ejec.fallida----
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_9								;rsi = linea_9=Ejec_fallida
	mov rdx,l9_tamano 							;rdx = tamano de linea_4
	syscall  								;Llamar al sistema
	jmp _e1	

_regs:
;----Imprimir el registro utilizado
	cmp r14,0								;compara con cero						
	je _zero								;si es cero imprime la cadena de cero
	shl r14,2								;valor del registro*4
	sub r14, 4								;valor de registro -4 para obtener valor en linea a imprimir
	mov rcx, linea_44							;llama lista de registros
	add rcx, r14								;número de registro a imprimir en la línea
	mov rax,1								;rax = sys_write
	mov rdi,1								
	mov rsi, rcx								;puntero con el primer char a
	mov rdx,3								;rdx = tamano del registro
	syscall 								;Llamada del sistema
	ret									;retroceso a donde fue llamada

_zero:	mov rax,1								;rax = sys_write
	mov rdi,1
	mov rsi,linea_43							;llamada de línea a imprimir $zero
	mov rdx,l43_tamano 							;rdx = tamano de línea a imprinir
	syscall  								;Llamar al sistema
	ret

;----Funciones de impresion de instruccion------
;introduce el nombre de la funcion que se está ejecutando en el emulado
;Ej -> funcion x
_siadd:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_17							;rsi = linea add
	mov rdx,l17_tamano 							;rdx = tamano de add
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_siaddi:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_18								;rsi = linea addi
	mov rdx,l18_tamano 							;rdx = tamano de addi
	syscall  								;Llamar al sistema

	ret

_siaddu:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_19							;rsi = linea funcion addu
	mov rdx,l19_tamano 							;rdx = tamano de addu
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_siand:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_20								;rsi = linea and
	mov rdx,l20_tamano 							;rdx = tamano de and
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_siandi:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_21								;rsi = linea andi
	mov rdx,l21_tamano 							;rdx = tamano de andi
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sibeq:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_22								;rsi = linea beq
	mov rdx,l22_tamano 							;rdx = tamano de beq
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sibne:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_23								;rsi = linea bne
	mov rdx,l23_tamano 							;rdx = tamano de bne
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sij:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_24								;rsi = linea j
	mov rdx,l24_tamano 							;rdx = tamano de j
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sijal:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_25								;rsi = linea jal
	mov rdx,l25_tamano 							;rdx = tamano de jal
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sijr:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_26							;rsi = linea jr
	mov rdx,l26_tamano 							;rdx = tamano de jr
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_silw:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_27							;rsi = linea lw
	mov rdx,l27_tamano 							;rdx = tamano de lw
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada
_sisw:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_45							;rsi = linea lw
	mov rdx,l45_tamano 							;rdx = tamano de lw
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada
_sinor:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_28							;rsi = linea nor
	mov rdx,l28_tamano 							;rdx = tamano de nor
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sior:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_29							;rsi = linea 0r
	mov rdx,l29_tamano 							;rdx = tamano de or
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_siori:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_30							;rsi = linea ori
	mov rdx,l30_tamano 							;rdx = tamano de ori
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sislt:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_31							;rsi = linea slt
	mov rdx,l31_tamano 							;rdx = tamano de slt
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sislti:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_32							;rsi = linea slti
	mov rdx,l32_tamano 							;rdx = tamano de slti
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisltiu:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_33							;rsi = linea sltiu
	mov rdx,l33_tamano 							;rdx = tamano de sltiu
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisltu:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_34							;rsi = linea sltu
	mov rdx,l34_tamano 							;rdx = tamano de sltu
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisll:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_35							;rsi = linea sll
	mov rdx,l35_tamano 							;rdx = tamano de sll
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisrl:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_36							;rsi = linea srl
	mov rdx,l36_tamano 							;rdx = tamano de srl
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisub:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_37							;rsi = linea sub
	mov rdx,l37_tamano 							;rdx = tamano de sub
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_sisubu:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_38							;rsi = linea subu
	mov rdx,l38_tamano 							;rdx = tamano de subu
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada

_simult:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_39							;rsi = linea mult
	mov rdx,l39_tamano 							;rdx = tamano de mult
	syscall  								;Llamar al sistema
	ret									;retroceso a donde fue llamada
_NOtipo:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_40							;rsi = linea opcodenv
	mov rdx,l40_tamano 							;rdx = tamano de opcodenv
	syscall  								;Llamar al sistema
	jmp _EjFallida

_NOfunction:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_41							;rsi = linea nofunct
	mov rdx,l41_tamano 							;rdx = tamano de linea nofunct
	syscall  								;Llamar al sistema
	jmp _EjFallida

_fuerango:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_42								;rsi = linea dirfuerango
	mov rdx,l42_tamano 							;rdx = tamano de dirfuerango
	syscall  								;Llamar al sistema
	jmp _EjFallida

_enter2: 
	mov rax,1
	mov rdi,1
	mov rsi, linea_47							
	mov rdx,l47_tamano
	syscall
	mov rax,0
	mov rdi,0
	mov rsi, buffer
	mov rdx,10000
	syscall
	ret
_enter0: 
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi, linea_7							;imprime enter
	mov rdx,l7_tamano							;tamaño de linea enter
	syscall									;Llamada del sistema
	mov rax,0								;rax = sys_read (0)
	mov rdi,0								;leer
	mov rsi, buffer
	mov rdx,10000
	syscall
	ret
_immediate:	
	printVal r14								;llamada de impresion del valor inmediato
	ret									;vuelve a donde fue llamado

_coma:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48							;rsi = coma
	mov rdx,2 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
	ret									;vuelve a donde fue llamado
_par1:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48+2							;rsi = parentesis (
	mov rdx,1 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
	ret									;vuelve a donde fue llamado
_par2:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48+3							;rsi = parentesis )
	mov rdx,1 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
	ret									;vuelve a donde fue llamado
_menos:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48+4							;rsi = guión del menos
	mov rdx,1 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
	ret									;vuelve a donde fue llamado
_nl:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48+7							;rsi = linea newline
	mov rdx,1 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
	ret									;vuelve a donde fue llamado
_igual:
	mov rax,1								;rax = sys_write (1)
	mov rdi,1								;rdi = 1
	mov rsi,linea_48+5							;rsi = linea newline
	mov rdx,2 								;rdx = tamano de 1
	syscall  								;Llamada del sistema
;	agrfile linea_48+5, 2

	ret	

 
