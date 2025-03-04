;Programa que calcula el factorial de un n?mero (n)
;en donde n < 13

;Definici?n de nombres para registros
number	rn r0	;n?mero de entrada	
count	rn r1	;contador de iteraciones
temp	rn r2

;area de variables
;-------------------------
			area mis_variables, data, readwrite
			align
input		dcd		0x12345678	;entrada del n?mero	
	
;area de programa
;----------------
			area Ac_1, code, readonly		; area de codigo
			entry
			export __main					; se exporta a startup_stm32f10x_md.s
			
;inicio del programa
;-------------------
__main
	ldr r1, =0x8000000 ; direccion de la base
	MOV r2, #0			;ponemos un cero en r2
	MOV r3, #1			;ponemos un 1 en r3
	STR r2, [r1], #4    ;almacena f(0)
	CMP r0, #0			;si el numero introducido es 0 termina el programa
	BEQ end				;Hace la directiva end
	STR r3, [r1], #4
	CMP r0, #1  		;si la entrada es 1 terminar el programa
	BEQ end				;hace end
	
ciclo
	ADD r4, r2, r3			;sumar los dos numeros anteriores
	STR r4, [r1], #4		;almacena el resultado en la memoria
	MOV r2, r3				;actualiza ambos valores para el siguiente paso
	MOV r3, r4
	SUBS r0, r0, #1			;decrementa el contador
	BNE ciclo				; se repite hasta que salga 0

end
	B end 
		
		
		END