    org 200h

    mov BX, 200h
    mov AX, "A"
    mov CL, "E"
    mov DL, "P"
    mov DH, "S"

    mov     [200h], AX
    mov     [201h], CL
    mov     [202h], DL
    mov     [203h], DH

    mov AX, [200h]
    
    mov Cl, [BX]

    mov DL, [BX + SI]

    mov DH, [DI + 100h]