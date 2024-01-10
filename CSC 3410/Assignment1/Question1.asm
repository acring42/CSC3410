.586
.MODEL FLAT

.STACK 4096							; reserve 4096-byte stack

.DATA								; reserve storage for data
number1	DWORD	-105
number2 DWORD	52
sum		DWORD	?

.CODE								; start of main program code
main	PROC
		mov		EAX, number1		; first number to EAX
		add		EAX, number2		; second number to EAX
		mov		sum, EAX			; sum to memory

		mov		EAX, 0				; exit with return code 0
		ret
main	ENDP

END									; end of source code