;##########################################################
;Proyecto #1 Emulador MIPS desde ensamblador x86_64       #
;EL4313 - Laboratorio de Estructura de Microprocesadores  #
;##########################################################

; Lineas de codigo                                        ;Lineas de comentarios de acción o funcionamiento
%include "linux64.inc"
;--------------------Segmento de datos--------------------
section .data
linea_1: db 'Bienvenido al emulador MIPS',0xa                    ;Mensaje Bienvenido
l1_tamano: equ $-linea_1                                    ;tamano bits mensaje bienvenido
linea_2: db 'EL-4313-Lab. Estructura de microprocesadores',0xa            ;Mensaje nombre laboratorio
l2_tamano: equ $-linea_2                                   ;tamano mensaje nombre laboratorio    
linea_3: db '1S-2017',0xa                                     ;Mensaje Semestre
l3_tamano: equ $-linea_3                                   ;tamano bits mensaje Semestre
linea_4: db 'Buscando archivo ROM.txt',0xa                       ;Buscando txt
l4_tamano: equ $-linea_4                                    ;tamano bits buscando
linea_5: db 'Archivo ROM.txt no encontrado',0xa                  ;Mensaje No encontrado
l5_tamano: equ $-linea_5                                    ;tamano bits mensaje NO encontrado
linea_6: db 'Archivo ROM.txt encontrado',0xa                    ;Mensaje encontrado
l6_tamano: equ $-linea_6 ;                                    ;tamano bits mensaje encontrado
linea_7: db 'Enter',0xa                                        ;mensaje Enter
l7_tamano: equ $-linea_7 ;                                ;tamano mensaje Enter
linea_8: db 'Ejecución Exitosa',0xa                        ;mensaje ejec. exitosa
l8_tamano: equ $-linea_8                                 ;tamano mensaje ejec. exitosa
linea_9: db 'Ejecución Fallida',0xa                        ;mensaje ejec. fallida
l9_tamano: equ $-linea_9                                 ;tamano mensaje ejec. fallida
linea_10: db 'Ruth Campos Artavia, 2013026084',0xa                ;Mensaje Nombre Alumno1
l10_tamano: equ $-linea_10                                    ;tamano Mensaje Nombre Alumno1
linea_11: db 'Allan Chacón Cordero, 2013071786 ',0xa                ;Mensaje Nombre Alumno2
l11_tamano: equ $-linea_11                            ;tamano Mensaje Nombre Alumno2
linea_12: db 'Fabricio Saborío Corea, 2014080886',0xa                ;Mensaje Nombre Alumno3
l12_tamano: equ $-linea_12                            ;tamano Mensaje Nombre Alumno3
linea_13: db 'Mario Valenciano Rojas, 2013099217',0xa                ;Mensaje Nombre Alumno4
l13_tamano: equ $-linea_13                            ;tamano Mensaje Nombre Alumno4
linea_14: db 'Leyendo linea 1 de ascci a mem programa',0xa            ;Mensaje lectura mem.ascci(MEM1)
l14_tamano: equ $-linea_14                            ;tamano Mensaje lectura mem.ascci(MEM1)
linea_15: db '1'			              ;mensaje guardado 1
l15_tamano: equ $-linea_15                            ;tamano mensaje guardado 1
linea_16: db '0'			              ;mensaje guardado 0
l16_tamano: equ $-linea_16                            ;tamano mensaje guardado 0
;------------------Funciones-----------------------------------
linea_17: db 'funcion add '                            ;Funcion add
l17_tamano: equ $-linea_17
linea_18: db 'funcion addi '                            ;Funcion addi
l18_tamano: equ $-linea_18
linea_19: db 'funcion addu '                            ;Funcion addu
l19_tamano: equ $-linea_19
linea_20: db 'funcion and '                            ;Funcion and
l20_tamano: equ $-linea_20
linea_21: db 'funcion andi '                            ;Funcion andi
l21_tamano: equ $-linea_21
linea_22: db 'funcion beq '                            ;Funcion beq
l22_tamano: equ $-linea_22
linea_23: db 'funcion bne '                            ;Funcion bne
l23_tamano: equ $-linea_23
linea_24: db 'funcion j '                            ;Funcion j
l24_tamano: equ $-linea_24
linea_25: db 'funcion jal '                            ;Funcion jal
l25_tamano: equ $-linea_25
linea_26: db 'funcion jr '                            ;Funcion jr
l26_tamano: equ $-linea_26
linea_27: db 'funcion lw '                            ;Funcion lw
l27_tamano: equ $-linea_27
linea_28: db 'funcion nor '                            ;Funcion nor
l28_tamano: equ $-linea_28
linea_29: db 'funcion or '                            ;Funcion or
l29_tamano: equ $-linea_29
linea_30: db 'funcion ori '                            ;Funcion ori
l30_tamano: equ $-linea_30
linea_31: db 'funcion slt '                            ;Funcion slt
l31_tamano: equ $-linea_31
linea_32: db 'funcion slti '                            ;Funcion slti
l32_tamano: equ $-linea_32
linea_33: db 'funcion sltiu '                            ;Funcion sltiu
l33_tamano: equ $-linea_33
linea_34: db 'funcion sltu '                            ;Funcion sltu
l34_tamano: equ $-linea_34
linea_35: db 'funcion sll '                            ;Funcion sll
l35_tamano: equ $-linea_35
linea_36: db 'funcion srl '                            ;Funcion srl
l36_tamano: equ $-linea_36
linea_37: db 'funcion sub '                            ;Funcion sub
l37_tamano: equ $-linea_37
linea_38: db 'funcion subu '                            ;Funcion subu
l38_tamano: equ $-linea_38
linea_39: db 'funcion mult '                            ;Funcion mult
l39_tamano: equ $-linea_39
linea_45: db 'funcion sw '                            ;Funcion sw
l45_tamano: equ $-linea_45
; ------ Lineas de mensajes de posibles errores-------
linea_40: db 'opcode no valido',0xa                        ;opcode no valido
l40_tamano: equ $-linea_40
linea_41: db 'funcion invalida',0xa                        ;funcion invalida
l41_tamano: equ $-linea_41
linea_42: db 'Dirección fuera de rango',0xa                    ;Dirección fuera de rango
l42_tamano: equ $-linea_42
;--------REGISTROS-------------------------------------
linea_43: db '$zero'                            ;Registro Constante 0
l43_tamano: equ $-linea_43
linea_44: db '$at $v0 $v1 $a0 $a1 $a2 $a3 $t0 $t1 $t2 $t3 $t4 $t5 $t6 $t7 $s0 $s1 $s2 $s3 $s4 $s5 $s6 $s7 $t8 $t9 $k0 $k1 $gp $sp $fp $ra '                                ;31    return address

linea_47: db 'Enter para terminar',0xa                                ;mensaje Enter
l47_tamano: equ $-linea_47 ;                            ;tamano mensaje Enter
linea_48: db ', ()-= ',0xa

linea_50: db 'Valor introducido invalido',0xa                    ;Dirección fuera de rango
l50_tamano: equ $-linea_50 
linea_51: db 'Exceso de argumentos ingresados',0xa                    ;Exceso de argumentos
l51_tamano: equ $-linea_51 

;---archivo memoria ROM------

ROM db "ROM.txt",0                                 ;link para abrir archivo.txt


;--------------------Segmento de datos sin inicializar--------------------------
section .bss
;Definición de memorias
;nombre memoria res(reserva) byte (8bits) cantidad de bits 
    MemVal: resb 16 				;reserva de memoria, para guardar valores de $a0-$a3
    MEM1 resb 4950                                 ;150 lineas de codigo ascii de 33 bytes  --Memoria ascci
    MEMP resb 1200                                           ;150 lineas de instrucciones de 64 bits -- Memoria de Programa
    MEMD resb 800                                 ;100 datos de 32 bits --Memoria de datoS ;capacidad de 100 palabras de 64 bits --stack 64

;Definicion de banco de registros de 64bits
;nombre registro res(reserva) q(qword- 64bits) cantidad
;Se define resq 1, para generar un solo registro de 64bits
;-------------------------------------------------------------------------------
    BR resb 256                                 ;puntero que recorre de 8 en 8bytes las instrucciones
    buffer resb 10000                             ; se reservan 10 bytes para hacer la lectura del teclado
;--------------------Segmento de texto del programa emulador--------------------

section .text
    global main
;extern p
;extern system                           
main:    
;Iniciacion de valores

    mov r14, 2
    mov QWORD[BR+40], r14 ;a1
    mov r14, 800
    mov QWORD[BR+232], r14 ;SP
    mov r14, 1192
    mov QWORD[BR+248], r14 ;ra
    mov r14, 192
    mov QWORD[BR+32], r14 ;a0



;Iniciacion de valores de memoria de datos

    mov r14, 1
    mov QWORD[MEMD+192], r14 ;1 EN C0
    mov r14, 2
    mov QWORD[MEMD+196], r14 ;2 EN C1
    mov r14, 3
    mov QWORD[MEMD+200], r14 ;3 EN C2
    mov r14, 4
    mov QWORD[MEMD+204], r14 ;4 EN C3
    mov r14, 5
    mov QWORD[MEMD+208], r14 ;5 EN C4
    mov r14, 6
    mov QWORD[MEMD+212], r14 ;6 EN C5
    mov r14, 7
    mov QWORD[MEMD+216], r14 ;7 EN C6
    mov r14, 8
    mov QWORD[MEMD+220], r14 ;8 EN C7
;--------------------------------
    addfile

    call _PB                                 ;llamar pantalla bienvenida
;--------------------Abrir archivo ROM.txt--------------------                                        
    mov rax, 2                                ;abrir
    mov rdi, ROM                                ;LINK archivo
    mov rsi, 0    
    mov rdx, 0
    syscall

;--------------------Leer archivo ROM.txt------------------------                                        
    push rax                                ;meter en stack valor rax
    mov rdi, rax    
    mov rax, 0
    mov rsi, MEM1                                 ;memoria a guardar chars
    mov rdx, 4950                                ;cantidad de chars de ROM.TXT
    syscall
    call _BT                                ;llamado mensaje buscando ROM.txt
;--------------------Cerrar archivo ROM.txt---------------------                                    
    mov rax, 3                                ;cerrar archivo
    pop rdi                                    ;saca valor de rax introducido al leer
    syscall                                    ;llamada para ejecución del programa

;-----------------Llamadas revisión codigo----------------------
    call _print    
_exit1: call _printBR
_exit3: call _PS                                 ; llamar pantalla de salida
    
_e1: ;   push    rbp                                     
      ;  mov     rbp, rsp                               
      ;  mov     edi, cadena                                    ;comandos                                          
      ;  call    system                                                 ;llamadas del sistema
      ;  nop                                                          ;no opera
    ; pop     rbp                                  ;saca del stack donde estaba la llamada

 ;   call p
    call _enter2
 
_e2:    
    mov rax, 60                                ;finalización de correr programa
    mov rdi, 0
    syscall

;------------------Funciones de impresion para revision de codigo---------
_print:
    mov r8,0                                ;puntero de direccion mem texto 0-33
    mov r10,0                                ;puntero de instruccion
    mov r13,0                                ;puntero de direccion mem texto 0-4950

;----------------------------Loop para limpiar memp -------------------------
_loop0:
    mov r12, 0                                ;dato de primera dir
    mov QWORD [MEMP+r10], r12                        ;guardar dato    

_loop1:    
    mov r14, 0
    add r14, r13
    add r14, r8    
    mov al, [MEM1+r14]                             ;dato de primera dir en byte
    cmp al, 10                                ;fin de linea
    je _loop3
    mov r12, [MEMP+r10]                            ;dato de primera dir
    shl r12, 1                                 ;shift para introducir ceros
    mov QWORD [MEMP+r10], r12                        ;guardar dato    
    inc r8    
    cmp al, 31h                                ;comparar con 1
    je _uno                                    ;salto si char es 1
    cmp al, 30h
    jne _loop3

 ;----------Loop para DEJAR CERO----------
  jmp _loop1                                ;si es menor que char #32, continua avanzando en la memoria


;----Loop para avanzar en la siguiente linea de chars------
;incremento 1 cuando termino una linea

_loop3:    
    mov r12, [MEMP+r10]                            ;dato de primera dir
    shr r12, 1                                
    mov QWORD [MEMP+r10], r12                        ;guardar dato    
_loop4:        
    add r10,8                                 ;incremento mi instruccion
    add r13, 34                                ;mover 8bits-1 byte
    mov r8,0                                ;inicio en el char 0
    cmp r10,1200                                ;si llegó a la instruccion 150
    jge _exit1
    jl _loop0                                ;vuelvo a comparar 1's y 0's

;--------------Loop para insertar uno en registro------------------------------
;--------incremento 1 y hago shift para crear instruccion----------------------
_uno:

;-----Sumar un 1-----
    mov rax, [MEMP+r10]                             ;dato de primera dir
    inc rax                                    ;incremento dato
    mov QWORD [MEMP+r10], rax                        ;guardar dato en memoria
    jmp _loop1                                ;si es menor que char #32, continua avanzando en la memoria

;Impresion de memoria de programa
_printBR:
     cmp QWORD[MEMP], 0                            ;compara si memoria de programa esta vacia
    je _exit2                                ;salta a loop de ROM no encontrada
    jne _continue                                ;salta a loop de ROM encontrada(para seguir ejecutando instr.)
_printMP0:
    mov QWORD[BR+224], 0                            ;CERO EN PC
    mov r10, [BR+224]                            ;dato pc    
    mov r12, [MEMP+r10]

    jmp _OPCODE                                ;opcode    
                                        ;saltar a revisar la primera instruccion
;----------------Instrucción Siguiente------------------------------------------
;------Calcula que no se pase de la instruccion 150 además de avanzar de valor de pc a pc+8
_NewInst:
    mov r12, [BR+224]                            ;saca el valor de pc
    add r12,8                                ;obtiene el valor siguiente de pc
   add QWORD[BR+224], 8                            ;dato pc+8    
_NewInst2:
    mov r10, [BR+224]                            ;dato pc        
    jmp _OPCODE                                ;salta a revisar la instrucción siguiente


;------Imprimir la línea enter, porque la memoria no se encontró o se encuentra vacía ----
_exit2:

    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_5                                ;rsi = linea_uno
    mov rdx,l5_tamano                             ;rdx = tamano de linea_uno
    syscall                                  ;Llamar al sistema
    agrfile linea_5,l5_tamano            ; llamada para agregar en el documento .txt
    call _enter0                                 ;imprimir enter para salir
    jmp _e2                                        ; devolverse linea donde pantalla salida

;------Imprimir la linea enter, para continuar con la ejecución de las instrucciones----
_continue:
    

    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_6                                ;rsi = linea rom encontrado
    mov rdx,l6_tamano                             ;rdx = tamano de linea
    syscall                                  ;Llamar al sistema
    agrfile linea_6,l6_tamano            ; llamada para agregar en el documento .txt
    call _enter0    
    jmp _printMP0                                ; devolverse linea PARA DESPLEGAR DATOS DE MEMP
    ;jmp _exit3                                ;salta a pantalla de salida

;----Pantalla de bienvenida del emulador------
;introduce las lineas de bienvenida, nombre del curso y semestre

_PB:
;------Imprimir la primera linea----
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_1                                ;rsi = linea_uno
    mov rdx,l1_tamano                             ;rdx = tamano de linea_uno
    syscall                                  ;Llamar al sistema
    agrfile linea_1,l1_tamano            ; llamada para agregar en el documento .txt
;------Imprimir la segunda línea----
    mov rax,1                                ;rax= imprimir sistema(1)
    mov rdi,1                                ;rdi=1 mostrar en consola
    mov rsi,linea_2                                ;rsi= línea a imprimir
    mov rdx,l2_tamano                            ;rdx=tamaño de linea a imprimir
    syscall                                    ;llamada sistema
    agrfile linea_2,l2_tamano            ; llamada para agregar en el documento .txt
;------Imprimir la tercer línea----
        mov rax,1                                ;rax= imprimir sistema(1)
        mov rdi,1                                ;rdi= mostrar en consola(1)
        mov rsi,linea_3                                ;rsi= línea a imprimir
        mov rdx,l3_tamano                            ;rdx= tamaño de linea a imprimir
    syscall                                    ;llamada sistema
    agrfile linea_3,l3_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retrocede en la siguiente linea donde se realizó call

;----Pantalla de salida del emulador------
;introduce las lineas de nombres de alumnos del curso

_PS:                    

;-------Imprimir el primer nombre
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_10                             ;rsi = linea_uno
    mov rdx,l10_tamano                             ;rdx = tamano de linea_uno
    syscall                                  ;Llamar al sistema
    agrfile linea_10,l10_tamano            ; llamada para agregar en el documento .txt
;-------Imprimir el segundo nombre
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_11                            ;rsi = linea_uno
    mov rdx,l11_tamano                            ;rdx = tamano de linea_uno
    syscall                                    ;Llamar al sistema
    agrfile linea_11,l11_tamano            ; llamada para agregar en el documento .txt
;-------Imprimir el tercer nombre
     mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_12                            ;rsi = linea_uno
    mov rdx,l12_tamano                            ;rdx = tamano de linea_uno
    syscall                                    ;Llamar al sistema
    agrfile linea_12,l12_tamano            ; llamada para agregar en el documento .txt
;-------Imprimir el cuarto nombre
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_13                            ;rsi = linea_uno
    mov rdx,l13_tamano                            ;rdx = tamano de linea_uno
    syscall    
    agrfile linea_13,l13_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retrocede en la siguiente linea donde se realizó call

;----Mensaje de salida de buscando ROM.txt------

_BT:
;------Imprimir la linea buscando ROM.txt----
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_4                                ;rsi = linea_4=Buscando .txt
    mov rdx,l4_tamano                             ;rdx = tamano de linea_4
    syscall                                  ;Llamar al sistema
    agrfile linea_4,l4_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retrocede en la siguiente linea donde se realizó call

_EjExitosa:
;------Imprimir la linea Ejec.Exitosa----
    call _printregs
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_8                                ;rsi = linea_8=Ejec_exitosa
    mov rdx,l8_tamano                             ;rdx = tamano de linea_4
    syscall                                  ;Llamar al sistema
    agrfile linea_8,l8_tamano            ; llamada para agregar en el documento .txt
    jmp _exit3
_EjFallida:
;------Imprimir la línea Ejec.fallida----
    
    mov r14, [MEMP+r10]
    mov r15, 33
    _BUCLE:
    rol r14d, 1
    mov r13,r14
    and r13, 1
    sub r15, 1
    cmp r15, 0
    je _ENDBUCLE
    cmp r13, 1
    je _IMP1
    call _printcero
    jmp _BUCLE
    _IMP1:
    call _printuno
    jmp _BUCLE
    _ENDBUCLE:
    call _nl
    
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_9                                ;rsi = linea_9=Ejec_fallida
    mov rdx,l9_tamano                             ;rdx = tamano de linea_4
    syscall                                  ;Llamar al sistema
    agrfile linea_9,l9_tamano            ; llamada para agregar en el documento .txt
    jmp _e1    

_regs:
;----Imprimir el registro utilizado
    cmp r14,0                                ;compara con cero                        
    je _zero                                ;si es cero imprime la cadena de cero
    shl r14,2                                ;valor del registro*4
    sub r14, 4                                ;valor de registro -4 para obtener valor en linea a imprimir
 

cmp r14, 0
jne _x1
agrfile linea_44,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x1: cmp r14, 4
jne _x2
agrfile linea_44+4,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x2:cmp r14, 8
jne _x3
agrfile linea_44+8,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x3: cmp r14, 12
jne _x4
agrfile linea_44+12,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x4:cmp r14, 16
jne _x5
agrfile linea_44+16,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x5: cmp r14, 20
jne _x6
agrfile linea_44+20,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x6: cmp r14, 24
jne _x7
agrfile linea_44+24,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x7:cmp r14, 28
jne _x8
agrfile linea_44+28,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x8: cmp r14, 32
jne _x9
agrfile linea_44+32,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x9:cmp r14, 36
jne _x10
agrfile linea_44+36,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x10: cmp r14, 40
jne _x11
agrfile linea_44+40,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x11:cmp r14, 44
jne _x12
agrfile linea_44+44,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x12: cmp r14, 48
jne _x13
agrfile linea_44+48,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x13: cmp r14, 52
jne _x14
agrfile linea_44+52,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x14:cmp r14, 56
jne _x15
agrfile linea_44+56,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x15: cmp r14, 60
jne _x16
agrfile linea_44+60,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x16: cmp r14, 64
jne _x17
agrfile linea_44+64,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x17:cmp r14, 68
jne _x18
agrfile linea_44+68,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x18: cmp r14, 72
jne _x19
agrfile linea_44+72,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x19:cmp r14, 76
jne _x20
agrfile linea_44+76,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x20: cmp r14, 80
jne _x21
agrfile linea_44+80,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x21:cmp r14, 84
jne _x22
agrfile linea_44+84,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x22: cmp r14, 88
jne _x23
agrfile linea_44+88,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x23: cmp r14, 92
jne _x24
agrfile linea_44+92,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x24:cmp r14, 96
jne _x25
agrfile linea_44+96,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x25: cmp r14, 100
jne _x26
agrfile linea_44+100,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x26: cmp r14, 104
jne _x27
agrfile linea_44+104,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x27:cmp r14, 108
jne _x28
agrfile linea_44+108,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x28: cmp r14, 112
jne _x29
agrfile linea_44+112,3            ; llamada para agregar en el documento .txt 
 jmp _ret
_x29:cmp r14, 116
jne _x30
agrfile linea_44+116,3            ; llamada para agregar en el documento .txt  
jmp _ret
_x30: cmp r14, 120
jne _x31
agrfile linea_44+120,3            ; llamada para agregar en el documento .txt 
jmp _ret
_x31:
agrfile linea_44+124,3            ; llamada para agregar en el documento .txt 


  

   
_ret:
 mov rcx, linea_44                            ;llama lista de registros
    add rcx, r14                                ;número de registro a imprimir en la línea
    mov rax,1                                ;rax = sys_write
    mov rdi,1                                
    mov rsi, rcx                                ;puntero con el primer char a
    mov rdx,3                                ;rdx = tamano del registro
    syscall                                 ;Llamada del sistema

add r14, 4                                ;valor de registro -4 para obtener valor en linea a imprimir
    shr r14,2                                ;valor del registro/4


    ret                                    ;retroceso a donde fue llamada

_zero:    mov rax,1                                ;rax = sys_write
    mov rdi,1
    mov rsi,linea_43                            ;llamada de línea a imprimir $zero
    mov rdx,l43_tamano                             ;rdx = tamano de línea a imprinir
    syscall                                  ;Llamar al sistema
    agrfile linea_43,l43_tamano            ; llamada para agregar en el documento .txt
    ret

;----Funciones de impresion de instruccion------
;introduce el nombre de la funcion que se está ejecutando en el emulado
;Ej -> funcion x
_siadd:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_17                            ;rsi = linea add
    mov rdx,l17_tamano                             ;rdx = tamano de add
    syscall                                  ;Llamar al sistema
    agrfile linea_17,l17_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_siaddi:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_18                                ;rsi = linea addi
    mov rdx,l18_tamano                             ;rdx = tamano de addi
    syscall                                  ;Llamar al sistema
    agrfile linea_18,l18_tamano            ; llamada para agregar en el documento .txt
    ret

_siaddu:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_19                            ;rsi = linea funcion addu
    mov rdx,l19_tamano                             ;rdx = tamano de addu
    syscall                                  ;Llamar al sistema
    agrfile linea_19,l19_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_siand:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_20                                ;rsi = linea and
    mov rdx,l20_tamano                             ;rdx = tamano de and
    syscall                                  ;Llamar al sistema
    agrfile linea_20,l20_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_siandi:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_21                                ;rsi = linea andi
    mov rdx,l21_tamano                             ;rdx = tamano de andi
    syscall                                  ;Llamar al sistema
    agrfile linea_21,l21_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sibeq:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_22                                ;rsi = linea beq
    mov rdx,l22_tamano                             ;rdx = tamano de beq
    syscall                                  ;Llamar al sistema
    agrfile linea_22,l22_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sibne:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_23                                ;rsi = linea bne
    mov rdx,l23_tamano                             ;rdx = tamano de bne
    syscall                                  ;Llamar al sistema
    agrfile linea_23,l23_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sij:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_24                                ;rsi = linea j
    mov rdx,l24_tamano                             ;rdx = tamano de j
    syscall                                  ;Llamar al sistema
    agrfile linea_24,l24_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sijal:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_25                                ;rsi = linea jal
    mov rdx,l25_tamano                             ;rdx = tamano de jal
    syscall                                  ;Llamar al sistema
    agrfile linea_25,l25_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sijr:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_26                            ;rsi = linea jr
    mov rdx,l26_tamano                             ;rdx = tamano de jr
    syscall                                  ;Llamar al sistema
    agrfile linea_26,l26_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_silw:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_27                            ;rsi = linea lw
    mov rdx,l27_tamano                             ;rdx = tamano de lw
    syscall                                  ;Llamar al sistema
    agrfile linea_27,l27_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada
_sisw:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_45                            ;rsi = linea lw
    mov rdx,l45_tamano                             ;rdx = tamano de lw
    syscall                                  ;Llamar al sistema
    agrfile linea_45,l45_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada
_sinor:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_28                            ;rsi = linea nor
    mov rdx,l28_tamano                             ;rdx = tamano de nor
    syscall                                  ;Llamar al sistema
    agrfile linea_28,l28_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sior:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_29                            ;rsi = linea 0r
    mov rdx,l29_tamano                             ;rdx = tamano de or
    syscall                                  ;Llamar al sistema
    agrfile linea_29,l29_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_siori:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_30                            ;rsi = linea ori
    mov rdx,l30_tamano                             ;rdx = tamano de ori
    syscall                                  ;Llamar al sistema
    agrfile linea_30,l30_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sislt:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_31                            ;rsi = linea slt
    mov rdx,l31_tamano                             ;rdx = tamano de slt
    syscall                                  ;Llamar al sistema
    agrfile linea_31,l31_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sislti:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_32                            ;rsi = linea slti
    mov rdx,l32_tamano                             ;rdx = tamano de slti
    syscall                                  ;Llamar al sistema
    agrfile linea_32,l32_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisltiu:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_33                            ;rsi = linea sltiu
    mov rdx,l33_tamano                             ;rdx = tamano de sltiu
    syscall                                  ;Llamar al sistema
    agrfile linea_33,l33_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisltu:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_34                            ;rsi = linea sltu
    mov rdx,l34_tamano                             ;rdx = tamano de sltu
    syscall                                  ;Llamar al sistema
    agrfile linea_34,l34_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisll:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_35                            ;rsi = linea sll
    mov rdx,l35_tamano                             ;rdx = tamano de sll
    syscall                                  ;Llamar al sistema
    agrfile linea_35,l35_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisrl:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_36                            ;rsi = linea srl
    mov rdx,l36_tamano                             ;rdx = tamano de srl
    syscall                                  ;Llamar al sistema
    agrfile linea_36,l36_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisub:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_37                            ;rsi = linea sub
    mov rdx,l37_tamano                             ;rdx = tamano de sub
    syscall                                  ;Llamar al sistema
    agrfile linea_37,l37_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_sisubu:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_38                            ;rsi = linea subu
    mov rdx,l38_tamano                             ;rdx = tamano de subu
    syscall                                  ;Llamar al sistema
    agrfile linea_38,l38_tamano            ; llamada para agregar en el documento .txt
    ret                                    ;retroceso a donde fue llamada

_simult:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_39                            ;rsi = linea mult
    mov rdx,l39_tamano                             ;rdx = tamano de mult
    syscall                                  ;Llamar al sistema
    agrfile linea_39,l39_tamano
    ret                                    ;retroceso a donde fue llamada
_NOtipo:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_40                            ;rsi = linea opcodenv
    mov rdx,l40_tamano                             ;rdx = tamano de opcodenv
    syscall                                  ;Llamar al sistema
    agrfile linea_40,l40_tamano
    jmp _EjFallida

_NOfunction:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_41                            ;rsi = linea nofunct
    mov rdx,l41_tamano                             ;rdx = tamano de linea nofunct
    syscall                                  ;Llamar al sistema
    agrfile linea_41,l41_tamano
    jmp _EjFallida

_fuerango:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_42                                ;rsi = linea dirfuerango
    mov rdx,l42_tamano                             ;rdx = tamano de dirfuerango
    syscall                                  ;Llamar al sistema
    agrfile linea_42, l42_tamano
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
    agrfile linea_47, l47_tamano
    ret
_enter0:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi, linea_7                            ;imprime enter
    mov rdx,l7_tamano                            ;tamaño de linea enter
    syscall                                    ;Llamada del sistema
    mov rax,0                                ;rax = sys_read (0)
    mov rdi,0                                ;leer
    mov rsi, buffer
    mov rdx,10000
    syscall
    agrfile linea_7, l7_tamano
    ret
_immediate:    
    printVal r14                                ;llamada de impresion del valor inmediato
    ret                                    ;vuelve a donde fue llamado

_coma:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48                            ;rsi = coma
    mov rdx,2                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48, 2
    ret                                   ;vuelve a donde fue llamado
_par1:    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48+2                            ;rsi = parentesis (
    mov rdx,1                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48+2, 1
    ret                                    ;vuelve a donde fue llamado
_par2:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48+3                            ;rsi = parentesis )
    mov rdx,1                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48+3, 1
    ret                                    ;vuelve a donde fue llamado
_menos:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48+4                            ;rsi = guión del menos
    mov rdx,1                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48+4, 1
    ret                                    ;vuelve a donde fue llamado
_nl:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48+7                            ;rsi = linea newline
    mov rdx,1                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48+7, 1
    ret                                    ;vuelve a donde fue llamado
_igual:
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi,linea_48+5                            ;rsi = linea newline
    mov rdx,2                                 ;rdx = tamano de 1
    syscall                                  ;Llamada del sistema
    agrfile linea_48+5,2
    ret    


;-------------------------------------------------------------------------------------------------------------------------
;DECODIFICACIÓN INSTRUCCIONES---------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------

_OPCODE:

    mov r8, [MEMP+r10]                                  ;Guarda en r8 la instrucción
    cmp r8, 0                                           ;Compara si es cero para imprimir Ejecución Exitosa
    je _EjExitosa                                       ;Salta a imprimir Ejecución exitosa
    shr r8, 26                                          ;Obtiene opcode en los bits menos significativos
    cmp r8, 0                                           ;Compara si el opcode es CERO para tipo R
    je _tipoR                                           ;Salta a la evaluación de instrucciones tipo R
    cmp r8, 3                                           ;Compara con 3 para saber si es tipo I o tipo J
    jle _tipoJ                                          ;Salta a la evaluación de instrucciones tipo J
    jmp _tipoI                                          ;Salta a tipo I si no se cumplen las condiciones anteriores

;-------------------------------------------------------------------------------------------------------------------------
_tipoR:
;-------------------------------------------------------------------------------------------------------------------------

    _FUNCTIONwrite:
    mov r15, 63d                                        ;Registro máscara = 0x00111111
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
    and r12, r15                                        ;Aplica la máscara para obtener Function limpio en r12

    cmp r12, 20h                                        ;Compara el Function con los valores respectivos de cada instrucción
    jne _n1                                                ;Si no es igual el OPCODE salta a evaluar la siguiente instrucción
    call _siadd                                         ;Llama la funcion para imprimir el nombre de la instrucción
    jmp _deco                                           ;Salta a etiqueta deco para decodificar la instrucción
    _n1:                                                
    cmp r12, 21h
    jne _n2
    call _siaddu
    jmp _deco
    _n2:
    cmp r12, 24h
    jne _n3
    call _siand
    jmp _deco
    _n3:
    cmp r12, 8h
    jne _n4
    call _sijr
    jmp _rsTR
    _n4:
    cmp r12, 27h
    jne _n5
    call _sinor
    jmp _deco
    _n5:
    cmp r12, 25h
    jne _n6
    call _sior
    jmp _deco
    _n6:
    cmp r12, 2Ah
    jne _n7
    call _sislt
    jmp _deco
    _n7:
    cmp r12, 2Bh
    jne _n8
    call _sisltu
    jmp _deco
    _n8:
    cmp r12, 0h
    jne _n9
    call _sisll
    jmp _deco
    _n9:
    cmp r12, 2h
    jne _n10
    call _sisrl
    jmp _deco
    _n10:
    cmp r12, 22h
    jne _n11
    call _sisub
    jmp _deco
    _n11:
    cmp r12, 23h
    jne _n12
    call _sisubu
    jmp _deco
    _n12:
    cmp r12, 18h
    jne _n13
    call _simult
    jmp _rsTR
    _n13:
    jmp _NOfunction                                     ;Si no se cumple ningun OPCODE salta a etiqueta NOfunction

_deco:
    mov r15, 31d                                        ;Registro máscara = 0x00011111
    mov r14, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
    shr r14, 11                                         ;Obtiene el # del registro rd en bits menos significativos
    and r14, r15                                        ;Aplica la máscara para obtener el # del registro rd limpio
    call _regs                                          ;Llama la impresión de registro
    call _coma                                          ;Llama la impresión de coma
    shl r14, 3                                          ;Obtiene la DIRECCIÓN del registro rd multiplicando por 8
    mov r13, r14                                        ;Guarda la DIRECCIÓN de rd en r13

_rsTR:
    cmp r12, 0h                                         ;Compara si es sll para saltarse rs
    je _rtTR                                            ;Salta rs
    cmp r12, 2h                                         ;Compara si es srl para saltarse rs
    je _rtTR                                            ;Salta rs
    mov r15, [MEMP+r10]                                 ;Guarda en r12 la instrucción
    shr r15, 21                                         ;Obtiene el # del registro rs en bits menos significativos
    mov r14, r15                                        ;Mueve el # de registro a r14
    call _regs                                          ;Imprime el registro rs
    shl r15, 3                                          ;Obtiene la DIRECCIÓN del registro rs multiplicando por 8
    mov r8, [BR+r15]                                    ;Guarda el CONTENIDO de rs en r8
    cmp r12, 8h                                         ;En caso de jump register se salta la impresión de rt
    je _FUNCTION                                        ;Salta imprimir rt y coma
    call _coma                                          ;Llama la impresión de coma

_rtTR:
    mov r15, 31d                                        ;Registro máscara = 0x00011111
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
    shr r12, 16                                         ;Obtiene el # del registro rt en bits menos significativos
    and r12, r15                                        ;Aplica la máscara para obtener el # del registro rt limpio
    mov r14, r12                                        ;Mueve número de registro a r14
    call _regs                                          ;Llama la impresión de registro rt    
    shl r12, 3                                          ;Obtiene la DIRECCIÓN del registro rt multiplicando por 8
    mov r9, [BR+r12]                                    ;Guarda el CONTENIDO de rt en r9

_FUNCTION:

    mov r15, 63d                                        ;Registro máscara = 0x00111111
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
    and r12, r15                                        ;Aplica la máscara para obtener Function limpio en r12
    cmp r12, 20h                                        ;Compara el Function con los valores respectivos de cada instrucción
    je _add
    cmp r12, 21h
    je _addu
    cmp r12, 24h
    je _and
    cmp r12, 8h
    je _jr
    cmp r12, 27h
    je _nor
    cmp r12, 25h
    je _or
    cmp r12, 2Ah
    je _slt
    cmp r12, 2Bh
    je _sltu
    cmp r12, 0h
    je _sll
    cmp r12, 2h
    je _srl
    cmp r12, 22h
    je _sub
    cmp r12, 23h
    je _subu
    cmp r12, 18h
    je _mult
    jmp _NOfunction                                     ;Si no se cumple ningun OPCODE salta a etiqueta NOfunction

_add:   
    add r8, r9                                            ;Operación rd = rs+rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst

_addu:
    mov r15, 4294967295d                                ;Máscara de unos en 32 bits menos significativos
    and r8, r15                                         ;Aplica máscara a rs
    and r9, r15                                         ;Aplica máscara a rt
    add r8, r9                                          ;Operación rd = rs+rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst

_and:
    and r8, r9                                          ;Operación rd = rs and rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst

_jr:
    cmp r8, 1192d                                       ;Compara si la dirección es no válida
    jg _fuerango                                        ;Salta a etiqueta fuera de rango   
    mov QWORD [BR+224] , r8                             ;Guarda el ADDRESS
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst2

_nor:
    or r8, r9                                           ;Operación rd = rs or rt
    not r8                                              ;Operación rd = rs nor rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst

_or:
    or r8, r9                                           ;Operación rd = rs or rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter    
    jmp _NewInst

_slt:
    cmp r8, r9                                          ;Operación rs < rt ?
    jl _UNO                                             ;Salta a rd = 1 si rs < rt
    mov r8, 0                                           ;Guarda rd = 0 si rs > rt
    jmp _CERO                                           ;Salta a final de instrucción a guardar rd = 0
    _UNO:                                               ;Etiqueta rd = 1
    mov r8, 1                                           ;Guarda rd = 1
    _CERO:                                              ;Etiqueta rd = 0
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter    
    jmp _NewInst

_sltu:
    mov r15, 4294967295d                                ;Máscara de unos en 32 bits menos significativos
    and r8, r15                                         ;Aplica máscara a rs
    and r9, r15                                         ;Aplica máscara a rt
    cmp r8, r9                                          ;Operación rs < rt ?
    jl _UNO2                                            ;Salta a rd = 1 si rs < rt
    mov r8, 0                                           ;Guarda rd = 0 si rs > rt
    jmp _CERO2                                          ;Salta a final de instrucción a guardar rd = 0
    _UNO2:                                              ;Etiqueta rd = 1
    mov r8, 1                                           ;Guarda rd = 1
    _CERO2:                                             ;Etiqueta rd = 0
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter    
    jmp _NewInst

_sll:
    mov r15, 31d                                        ;Registro máscara = 0x00011111
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
    shr r12, 6                                          ;Obtiene el SHAMT en bits menos significativos
    and r12, r15                                        ;Aplica la máscara para obtener SHAMT limpio en r12
    mov r14, r12                                        ;Carga SHAMT en r14
    call _coma
    call _immediate                                     ;Llama la funcion para imprimir SHAMT
    _LOP1:                                             ;Etiqueta operación rd = rt <<shamt
    cmp r12, 0                                          ;Compara si el valor del SHAMT es igual a cero
    je _OUT1                                            ;Si es igual a CERO salta a etiqueta OUT1
    shl r9, 1                                           ;Operación rd = rt <<shamt
    sub r12, 1                                          ;Resta uno al SHAMT
    jmp _LOP1                                          ;SALTA DE REGRESO
    _OUT1:                                              ;Etiqueta para salir del LOOP de shift
    mov r15, 4294967295d                                ;Registro máscara = 0x1111111111111111111111111111111 (32 unos)
    and r9, r15                                         ;Aplica la máscara para obtener dato limpio
    mov QWORD [BR+r13], r9                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl
    jmp _NewInst

_srl:
    mov r15, 31d                                        ;Registro máscara = 0x00011111
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
    shr r12, 6                                          ;Obtiene el SHAMT en bits menos significativos
    and r12, r15                                        ;Aplica la máscara para obtener SHAMT limpio en r12
    mov r14, r12                                        ;Carga SHAMT en r14
    call _coma
    call _immediate                                     ;Llama la funcion para imprimir SHAMT
    _LOP2:                                             ;Etiqueta operación rd = rt >>shamt
    cmp r12, 0                                          ;Compara si el valor del SHAMT es igual a cero
    je _OUT2                                            ;Si es igual a CERO salta a etiqueta OUT1
    shr r9, 1                                           ;Operación rd = rt >>shamt
    sub r12, 1                                          ;Resta uno al SHAMT
    jmp _LOP2                                          ;SALTA DE REGRESO
    _OUT2:                                              ;Etiqueta para salir del LOOP de shift
    mov QWORD [BR+r13], r9                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl
    jmp _NewInst

_sub:
    sub r8, r9                                          ;Operación rd = rs sub rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter    
    jmp _NewInst

_subu:
    mov r15, 4294967295d                                ;Máscara de unos en 32 bits menos significativos
    and r8, r15                                         ;Aplica máscara a rs
    and r9, r15                                         ;Aplica máscara a rt
    sub r8, r9                                          ;Operación rd = rs sub rt
    mov QWORD [BR+r13], r8                              ;Guarda CONTENIDO de rd en la dirección del BR respectiva
    call _nl                                            ;Llama la impresión de enter
    jmp _NewInst

_mult:
    imul r8, r9                                         ;Multiplica rs*rt
    mov QWORD [BR+24], r8                               ;Guarda resultado en $v1
    call _nl                                            ;Llama la impresión de enter    
    jmp _NewInst


;-------------------------------------------------------------------------------------------------------------------------
_tipoI:
;-------------------------------------------------------------------------------------------------------------------------

_OPCODEtIWrite:
    mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
    shr r12, 26                                         ;Obtiene el OPCODE en bits menos significativos
    cmp r12, 8h                                         ;Compara el OPCODE con los valores respectivos de cada instrucción
    jne _m0
    call _siaddi                                            
    jmp _deco2
    _m0:

    cmp r12, 12d                                        ;Compara el Function con los valores respectivos de cada instrucción  
    jne _m1                                             ;Si no es igual el OPCODE salta a evaluar la siguiente instrucción
    call _siandi                                        ;Llama la funcion para imprimir el nombre de la instrucción
    jmp _deco2                                          ;Salta a etiqueta deco para decodificar la instrucción
    _m1:

    cmp r12, 4h                                         
    jne _m2
    call _sibeq                                             
    jmp _deco2
    _m2:

    cmp r12, 5h                                         
    jne _m3
    call _sibne
    jmp _deco2
    _m3:

    cmp r12, 23h
    jne _m4
    call _silw
    jmp _deco2
    _m4:

    cmp r12, 2bh
    jne _m5
    call _sisw
    jmp _deco2
    _m5:

    cmp r12, 13d
    jne _m6
    call _siori
    jmp _deco2
    _m6:

    cmp r12, 10d
    jne _m7
    call _sislti
    jmp _deco2
    _m7:

    cmp r12, 11d
    jne _m8
    call _sisltiu
    jmp _deco2
    _m8:
    jmp _NOtipo                                     ;Si no se cumple ningun OPCODE salta a etiqueta NOtipo

_deco2:
mov r15, 31d                                        ;Registro máscara = 0x00011111
mov r14, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
shr r14, 16                                         ;Obtiene el # del registro rt en bits menos significativos
and r14, r15                                        ;Aplica la máscara para obtener el # del registro rt limpio
call _regs                                          ;Llama la impresión de registro
shl r14, 3                                          ;Obtiene la DIRECCIÓN del registro rt multiplicando por 8
mov r9, r14                                         ;Guarda la DIRECCIÓN de rt en r9
call _coma                                          ;Llama impresión de coma

_IMMEDIATEwrite:   
mov r15, 65535d                                     ;Registro máscara = 0x1111111111111111
mov r14, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
and r14, r15                                        ;Aplica la máscara para obtener el IMMEDIATE limpio

cmp r12, 23h
jne _noLWSW1
call _immediate
call _par1
_noLWSW1:

cmp r12, 2bh
jne _noLWSW2
call _immediate
call _par1
_noLWSW2:

mov r15, 31d                                        ;Registro máscara = 0x00011111
mov r14, [MEMP+r10]                                 ;Guarda en r12 la instrucción
shr r14, 21                                         ;Obtiene el # del registro rs en bits menos significativos
and r14, r15                                        ;Aplica la máscara para obtener el # del registro rs limpio
call _regs                                          ;Llama la impresión de registro
shl r14, 3                                          ;Obtiene la DIRECCIÓN del registro rs multiplicando por 8
mov r8, [BR+r14]                                    ;Guarda el CONTENIDO de rs en r8

cmp r12, 23h
je _IMMEDIATE
cmp r12, 2bh
je _IMMEDIATE
call _coma                                          ;Llama impresión de coma

_IMMEDIATE:     
mov r15, 65535d                                     ;Registro máscara = 0x1111111111111111
mov r14, [MEMP+r10]                                 ;Guarda en r14 la instrucción         
and r14, r15                                        ;Aplica la máscara para obtener el IMMEDIATE limpio
mov r15, r14                                        ;Cargo IMMEDIATE a r15 para comparar bit de signo
shr r15, 15                                         ;Aplica shift right para obtener bir de signo en menos significativo
cmp r15, 0                                          ;Compara bit de signo para saber si es positivo
je _posiI                                           ;Salta a etiqueta posiI
not r14                                             ;Invierte el IMMEDIATE para hacer el complemento a2
add r14,1                                           ;Suma uno para terminar el complemento a2
mov r15, 65535d                                     ;Registro máscara = 0x1111111111111111
and r14, r15                                        ;Aplica máscara para obtener IMMEDIATE
call _menos                                         ;Llama la funcion para imprimir un -
_posiI:                                             ;Etiqueta
                
cmp r12, 23h    
jne _noparent1  
call _par2      
jmp _siLWSW     
_noparent1:     
cmp r12, 2bh    
jne _noparent2  
call _par2      
jmp _siLWSW     
_noparent2:     
call _immediate                                     ;Llama la funcion para imprimir IMMEDIATE
_siLWSW:       
call _nl                                            ;Llama impresión de enter

mov r15, 65535d                                     ;Registro máscara = 0x1111111111111111
mov r14, [MEMP+r10]                                 ;Guarda en r14 la instrucción         
and r14, r15                                        ;Aplica la máscara para obtener el IMMEDIATE limpio
mov r15, r14                                        ;Guarda IMMEDIATE en r15
shr r15, 15                                         ;Aplica shift para comparar bit de signo
cmp r15, 0                                          ;Compara bit de signo
je _POSITIVO                                        ;Salta a etiqueta POSITIVO
mov r15, 32767d                                     ;Registro máscara 16 unos
not r15                                             ;niega la máscara para obtener 48 unos y 16 ceros
or r14, r15                                         ;Aplica máscara para hacer IMMEDIATE negativo con extensión de signo
_POSITIVO:                                          ;Etiqueta POSITIVO
mov r13, r14                                        ;Guarda IMMEDIATE en r13

_OPCODEtI:     
mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
shr r12, 26                                         ;Obtiene el OPCODE en bits menos significativos
cmp r12, 8h                                         ;Compara el OPCODE con los valores respectivos de cada instrucción
je _addi                                            
cmp r12, 12d                                        
je _andi                                            
cmp r12, 4h                                         
je _beq                                             
cmp r12, 5h                                         
je _bne
cmp r12, 23h
je _lw
cmp r12, 2bh
je _sw
cmp r12, 13d
je _ori
cmp r12, 10d
je _slti
cmp r12, 11d
je _sltiu
jmp _NOtipo                                         ;Si no se cumple ningun OPCODE salta a etiqueta NOtipo


_addi:
;mov r15, 31d                                        ;Registro máscara = 0x00011111
;mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
;shr r12, 16                                         ;Obtiene el # del registro rt en bits menos significativos
;and r12, r15                                        ;Aplica la máscara para obtener el # del registro rt limpio
;cmp r12, 29
;jne _NOESsp
;mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
;shr r12, 21                                         ;Obtiene el # del registro rs en bits menos significativos
;and r12, r15                                        ;Aplica la máscara para obtener el # del registro rs limpio
;cmp r12, 29
;jne _NOESsp
;imul r13, 2d
;_NOESsp:
add r8, r13                                         ;Operación rt = rs + ZeroExtIMM
mov QWORD [BR+r9], r8                               ;Guarda CONTENIDO de rt en la dirección del BR respectiva
jmp _NewInst

_andi:
and r8, r13                                         ;Operación rt = rs and SignExtIMM
mov QWORD [BR+r9], r8                               ;Guarda CONTENIDO de rd en la dirección del BR respectiva
jmp _NewInst

_beq:
mov r12, [BR+r9]                                    ;Guarda el CONTENIDO de rt
cmp r8, r12                                         ;Compara rs == rt
je _branchE                                         ;Si es igual salta a etiqueta branchE
jmp _NewInst                                        ;Si no es igual continua con la siguiente instrucción
_branchE:                                           ;Etiqueta para rs == rt
shl r13, 3                                          ;Obtiene la DIRECCIÓN del registro $gp (PC) multiplicando por 8
cmp r13,1192
jg _fuerango
add QWORD [BR+224], r13                             ;Cambia PC
jmp _NewInst

_bne:
mov r12, [BR+r9]                                    ;Guarda el CONTENIDO de rt
cmp r8, r12                                         ;Compara rs == rt
jne _branchNE                                       ;Si es igual salta a etiqueta branchE
jmp _NewInst                                        ;Si no es igual continua con la siguiente instrucción
_branchNE:                                          ;Etiqueta para rs == rt
mov r15, [BR+224];
shl r13, 3                                          ;Obtiene la DIRECCIÓN del registro $gp (PC) multiplicando por 8
cmp r13,1192
jg _fuerango
add QWORD[BR+224], r13                              ;Cambia PC
jmp _NewInst

_lw:                      
add r8, r13                                         ;Suma el valor de la BASE más el OFFSET
cmp r8, 800                                        ;Compara la dirección de memoria
jg _fuerango                                        ;Salta a etiqueta fuerango
mov r12d, [MEMD+r8]                                  ;Guarda el dato de la dirección BASE más OFFSET de la MEMD
mov QWORD [BR+r9], r12                              ;Carga el dato en rt
jmp _NewInst

_sw:                     
add r8, r13                                         ;Suma el valor de la BASE más el OFFSET
cmp r8, 800                                        ;Compara la dirección de memoria
jg _fuerango                                        ;Salta a etiqueta fuerango
mov r12, [BR+r9]                                    ;Carga el DATO del registro rt
mov DWORD [MEMD+r8], r12d                            ;Guarda el DATO en la dirección de memoria BASE más OFFSET de MEMD
jmp _NewInst

_ori:
or r8, r13                                          ;Operación rt = rs or SignExtIMM
mov QWORD [BR+r9], r8                               ;Guarda CONTENIDO de rd en la dirección del BR respectiva
jmp _NewInst

_slti:
cmp r8, r13                                         ;Operación rs < SignExtIMM ?
jl _UNO3                                            ;Salta a rt = 1 si rs < SignExtIMM
mov r8, 0                                           ;Guarda rt = 0 si rs > SignExtIMM
jmp _CERO3                                          ;Salta a final de instrucción a guardar rt = 0
_UNO3:                                              ;Etiqueta rt = 1
mov r8, 1                                           ;Guarda rt = 1
_CERO3:                                             ;Etiqueta rt = 0
mov QWORD [BR+r9], r8                               ;Guarda CONTENIDO de rt en la dirección del BR respectiva
jmp _NewInst

_sltiu:
mov r15, 4294967295d                                ;Máscara de unos en 32 bits menos significativos
and r8, r15                                         ;Aplica máscara a rs
mov r15, 65535d                                     ;Máscara de unos en 16 bits menos significativos
mov r13, [MEMP+r10]                                 ;Carga la instrucción en r13
and r13, r15                                        ;Aplica máscara a IMMEDIATE
cmp r8, r13                                         ;Operación rs < SignExtIMM ?
jl _UNO4                                            ;Salta a rt = 1 si rs < SignExtIMM
mov r8, 0                                           ;Guarda rt = 0 si rs > SignExtIMM
jmp _CERO4                                          ;Salta a final de instrucción a guardar rt = 0
_UNO4:                                              ;Etiqueta rt = 1
mov r8, 1                                           ;Guarda rt = 1
_CERO4:                                             ;Etiqueta rt = 0
mov QWORD [BR+r9], r8                               ;Guarda CONTENIDO de rt en la dirección del BR respectiva
jmp _NewInst

;-------------------------------------------------------------------------------------------------------------------------
_tipoJ:
;-------------------------------------------------------------------------------------------------------------------------

mov r15, 67108863d                                  ;Máscara de 26 unos
mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción
and r12, r15                                        ;Aplica máscara para obtener ADDRESS limpio
mov r8, r12                                         ;Guarda en r8 el ADDRESS

mov r12, [MEMP+r10]                                 ;Guarda en r12 la instrucción         
shr r12, 26                                         ;Obtiene el OPCODE en bits menos significativos          
cmp r12, 2h                                         ;Compara el OPCODE con los valores respectivos de cada instrucción
je _j                                                              
cmp r12, 3h                                         
je _jal                                             

_j:
call _sij
shl r8, 3                                           ;Ajusta el ADDRESS
cmp r8, 1192d                                       ;Compara si el ADDRESS está fuera de rango
jg _fuerango                                        ;Salta a etiqueta fuerango
mov r14, r8                                         ;Carga ADDRESS en r14
call _immediate                                     ;Llama la funcion para imprimir ADDRESS
mov QWORD [BR+224] , r8                             ;Carga el ADDRESS en el PC
call _nl
jmp _NewInst2

_jal:
call _sijal
shl r8, 3                                           ;Ajusta el ADDRESS
cmp r8, 1192d                                       ;Compara si el ADDRESS está fuera de rango
jg _fuerango                                        ;Salta a etiqueta fuerango
add QWORD[BR+224], 8                                ;Carga en PC, PC + 8
mov r12, [BR+224]                                   ;Carga PC+8 en r12
mov QWORD[BR+248], r12                              ;Guarda PC+8 en $ra
mov QWORD[BR+224], r8                               ;Carga el ADDRESS en el PC
mov r14, r8                                         ;Carga ADDRESS en r14
call _immediate                                     ;Llama la funcion para imprimir ADDRESS
call _nl
jmp _NewInst2

;-------------------------------------------------------------------------------------------------------------------------
;FIN DECODIFICACIÓN INSTRUCCIONES-----------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------

;VALORES REGISTROS
_printregs:
    call _nl
    mov r14, 2                                      ;Carga número de registro en r14
    call _regs                                      ;Llama funcion para imprimir REGISTRO
    mov r14, [BR+16]                                ;Carga contenido del registro en r14
    call _igual                                     ;Llama funcion para imprimir IGUAL
    call _immediate                                 ;Llama funcion para imprimir VALOR
    call _coma                                      ;Llama funcion para imprimir COMA

    mov r14, 3
    call _regs
    mov r14, [BR+24]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 4
    call _regs
    mov r14, [BR+32]
    call _igual
    call _immediate                                     
    call _nl  

    mov r14, 5
    call _regs
    mov r14, [BR+40]
    call _igual
    call _immediate                                    
    call _coma

    mov r14, 6
    call _regs
    mov r14, [BR+48]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 7
    call _regs
    mov r14, [BR+56]
    call _igual
    call _immediate                                     
    call _nl

    mov r14, 16
    call _regs
    mov r14, [BR+128]
    call _igual
    call _immediate                                    
    call _coma

    mov r14, 17
    call _regs
    mov r14, [BR+136]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 18
    call _regs
    mov r14, [BR+144]
    call _igual
    call _immediate                                     
    call _nl

    mov r14, 19
    call _regs
    mov r14, [BR+152]
    call _igual
    call _immediate                                    
    call _coma

    mov r14, 20
    call _regs
    mov r14, [BR+160]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 21
    call _regs
    mov r14, [BR+168]
    call _igual
    call _immediate                                     
    call _nl

    mov r14, 22
    call _regs
    mov r14, [BR+176]
    call _igual
    call _immediate                                    
    call _coma

    mov r14, 23
    call _regs
    mov r14, [BR+184]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 29
    call _regs
    mov r14, [BR+232]
    call _igual
    call _immediate                                     
    call _nl
    call _nl
    

;para revisiones

    mov r14, 8
    call _regs
    mov r14, [BR+64]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 9
    call _regs
    mov r14, [BR+72]
    call _igual
    call _immediate                                     
    call _coma

    mov r14, 10
    call _regs
    mov r14, [BR+80]
    call _igual
    call _immediate                                     
    call _coma
    
    mov r14, 31
    call _regs
    mov r14, [BR+248]
    call _igual
    call _immediate                                     
    call _coma
    
    mov r14, 0
    call _regs
    mov r14, [BR]
    call _igual
    call _immediate                                     
    call _coma
    call _nl
    call _nl



    ret

_printcero:    
;imprimir insercion de un cero en el registro                    
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi, linea_16                             ;rsi = linea insersion cero
    mov rdx,l16_tamano                            ;rdx = tamano de linea inser. cero
    syscall   
    agrfile linea_16,l16_tamano
ret
_printuno:
;imprimir insercion de un uno en el registro                    
    mov rax,1                                ;rax = sys_write (1)
    mov rdi,1                                ;rdi = 1
    mov rsi, linea_15                             ;rsi = linea insersion uno
    mov rdx,l15_tamano                            ;rdx = tamano de linea_uno
    syscall                                  ;Llamar al sistema
    agrfile linea_15,l15_tamano
ret
