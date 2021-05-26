
    org     100h

    section .text

    mov BP, numeros
    call EvaluarPares
    call EvaluarImpares

    
    int 20h

    section .data

numeros dw 21d, 04d, 02d, 13d, 05d, 08d, 07d, 10d,11d, 16d 0xA

; Funciones

EvaluarPares:
 xor SI, SI ;Es decir que SI es ahora 0
 xor DI, DI ;Es decir que DI es ahora 0
while:
    xor AX, AX
    xor CX, CX
    mov AL, [BP+SI]  ; AX = [puntero a arreglo + SI]
    mov CL, AL
    cmp AL, 0xA      ; verifica si AX == 0xA
    je end           ; salta a end si se cumple lo anterior
    mov BL, 2        ; BL = 2
    div BL          ; AL = cociente, y AH = residuo
    inc SI           ;Incrementa el contador
    cmp AL, 00
    je while
    cmp AH, 0d       ; Comparando si AH es igual 0
    je ubicarPar
    jmp while
ubicarPar:
    mov BX, 300h
    mov [BX + DI], CX
    inc DI
    jmp while
end:
    ret              ;Regresa al main


EvaluarImpares:
 xor SI, SI ;Es decir que SI es ahora 0
 xor DI, DI ;Es decir que DI es ahora 0
bucle:
    xor AX, AX
    xor CX, CX
    mov AL, [BP+SI]  ; AX = [puntero a arreglo + SI]
    mov CL, AL
    cmp AL, 0xA      ; verifica si AX == 0xA
    je end           ; salta a end si se cumple lo anterior
    mov BL, 2        ; BL = 2
    div BL          ; AL = cociente, y AH = residuo
    inc SI           ;Incrementa el contador
    cmp AL, 00
    je bucle
    cmp AH, 0d       ; Comparando si AH es igual 0
    je bucle
    jmp ubicarImpar
ubicarImpar:
    mov BX, 320h
    mov [BX + DI], CX
    inc DI
    jmp bucle
              ;Regresa al main