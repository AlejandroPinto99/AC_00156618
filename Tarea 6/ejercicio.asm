org 100h

section.text
        xor     DI, DI
        mov     DI, 0d
        
        mov DH, 10 ;fila donde inicia el ejercicio
        mov DL, 20 ;columna donde inicia el ejercicio

        call modotexto
        call leer
        call longitud
        int 20h

modotexto:
        mov     AH, 00h
        mov     AL, 03h
        int     10h
        ret
leer:
        xor     SI, SI
while:
        call    esperar
        cmp     AL, 0x0D
        je      exit
        mov     [300h+SI], AL
        inc     SI
        jmp     while
esperar:
        mov     AH, 00h
        int     16h
        ret
longitud:
        cmp SI, 5d
        je comparar
        jne iniciaerror
comparar:
        mov CL, [300h+DI]
        mov BL, [clave+DI]
        cmp DI, 5d
        je iniciabienvenido
        inc DI
        cmp CL, BL
        je comparar  
        jne iniciaerror
iniciaerror:
        xor DI, DI
        xor SI, SI
        call error
        ret
iniciabienvenido:
        xor DI, DI
        xor SI, SI
        call bienvenido
        ret
error:
        call movercursor
        mov CL, [incorrecto+DI]
        call escribircaracter
        INC SI ;nos movemos al siguiente caracter
        INC DL ;nos movemos una columna
        INC DI
        CMP DI, 10d
        JB error
bienvenido:
        call movercursor
        MOV CL, [correcto+DI]
        call escribircaracter
        INC SI ;nos movemos al siguiente caracter
        INC DL ;nos movemos una columna
        INC DI
        CMP DI, 10d
        JB bienvenido
movercursor:
        mov AH, 02h ;posicionamos cursor
        mov BH, 0h
        int 10h
        ret ; retornamos
escribircaracter:
        MOV AH, 0Ah ; Escribimos
        MOV AL, CL ; El caracter que se escribee en pantalla
        MOV BH, 0h
        MOV CX, 1h; escribirmos el caracter una vez
        INT 10h 
        RET
exit:
        ret


section .data

clave DB 'clave'
incorrecto DB 'INCORRECTO'
correcto DB 'BIENVENIDO'