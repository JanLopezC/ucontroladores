AREA    RESET, CODE, READONLY
        ENTRY

__main
        MOV     R0, #7           ; n = 7 (puedes cambiarlo)
        MOV     R1, #0           ; F(0) = 0
        MOV     R2, #1           ; F(1) = 1

        CMP     R0, #0           ; Si n == 0, devolver 0
        BEQ     guarda
        CMP     R0, #1           ; Si n == 1, devolver 1
        BEQ     guarda

        SUB     R0, R0, #1       ; Resta 1 porque ya tenemos F(1)

ciclo
        ADD     R3, R1, R2       ; temp = F(n-1) + F(n-2)
        MOV     R1, R2           ; F(n-2) = F(n-1)
        MOV     R2, R3           ; F(n-1) = temp
        SUBS    R0, R0, #1       ; n--
        BNE     ciclo            ; Repetir hasta que n == 0

guarda
        MOV     R0, R2           ; Guardar resultado en R0
        B       fin

fin
        END