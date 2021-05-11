        org     100h

        section .text
                XOR DI, DI ; Limpiando el registro DI
                XOR SI, SI ; limpiando el registro SI
                MOV word CX, 8d ; Tamano de la variable
                XOR AX, AX
                jmp iterar ; salto sin condicion, vamos a la porcion del codio cuya etiqueta sea iterar
        
        iterar: 
                MOV byte AL, [car+DI]
                MOV byte [200h+SI], AL
                MOV AH, [200h+SI]
                XOR AH, 48d
                ADD BL, AH
                INC DI
                INC SI
                LOOP iterar
                XOR AX, AX
                MOV Al, BL
                MOV BX, 08h
                DIV BL
                MOV [20ah], BL
        exit:
                int 20h

        section .data

        car DB "00156618"