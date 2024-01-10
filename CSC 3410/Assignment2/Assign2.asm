.586
.MODEL FLAT
.STACK 4096

.DATA
primeArray			DWORD	2, 3, 98 DUP (?)
primeCount		DWORD	2
candidate		DWORD	5
index			DWORD   ?

.CODE
main		PROC

while1:		cmp primeCount, 100						; primeCount < 100
			jnb	endWhile1
			mov index, 1							; set ecx to index temporarily
			mov ecx, index
			
			while2:		cmp	ecx, primeCount			; index <= primeCount
						jnbe endwhile2
						mov	edx, 0h
						mov	eax, candidate
						mov	ebx, primeArray[4*ecx-4]
						div	ebx
						cmp	edx, 0				; remainder != 0				
						je	endwhile2
						inc ecx
						jmp	while2
			endWhile2:
			mov eax, candidate
			mov	ebx, primeCount
			cmp	ecx, ebx						; index > primeCount
			jna elseLess		
			inc ebx
			mov primeArray[4*ebx-4], eax
	elseLess:
			add	eax, 2
			mov candidate, eax

			mov primeCount, ebx
			jmp	while1

endWhile1:
			mov	eax, 0							; make sure to set all registers used to 0
			mov ebx, 0
			mov ecx, 0
			ret
main		ENDP
END