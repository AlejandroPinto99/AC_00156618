org 100h

    section .text
    XOR AX, AX
    XOR SI, SI
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 ;fila donde inicia el ejercicio
    MOV DL, 20 ;columna donde inicia el ejercicio

    call modotexto

    ITERARNOMBRE:
        call movercursor
        MOV CL, [nombre+SI]
        CMP CL, " "
        je saltarlinea
        call escribircaracter
        INC SI ;nos movemos al siguiente caracter
        INC DL ;nos movemos una columna
        INC DI
        CMP DI, 31d
        JB escribirenlinea
        jmp esperartecla
    saltarlinea:
        ADD DH, 2d
        MOV DL, 20
        INC SI
        INC DI
        call ITERARNOMBRE
    escribirenlinea:
        call ITERARNOMBRE ;hacemos el proceso de nuevo
    modotexto:
        MOV AH, 0h ; actimvamos el modo texto
        MOV AL, 03h ;activamos el modo
        INT 10h
        RET
    movercursor:
        MOV AH, 02h ;posicionamos cursor
        MOV BH, 0h
        INT 10h
        RET ; retornamos
    escribircaracter:
        MOV AH, 0Ah ; Escribimos
        MOV AL, CL ; El caracter que se escribee en pantalla
        MOV BH, 0h
        MOV CX, 1h; escribirmos el caracter una vez
        INT 10h 
        RET
    esperartecla:
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h

    section .data

    nombre DB 'Alejandro Enrique Pinto Santos'

