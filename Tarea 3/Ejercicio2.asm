org     100h

        section .text
                XOR DI, DI ; Limpiando el registro DI
                XOR SI, SI ; limpiando el registro SI
                MOV word CX, 5d ; Las 5 iteraciones
                MOV AX, 1d
                jmp iterar ; salto sin condicion, vamos a la porcion del codio cuya etiqueta sea iterar
        
        iterar: 
                MOV BX, CX
                MUL BX
                LOOP iterar
                MOV [20bh], AX
        exit:
            int 20h