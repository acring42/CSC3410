.MODEL FLAT
INCLUDE io.h
.STACK 4096

.DATA
Ary			DWORD	20, 15, 62,  40, 18
nbrElts		DWORD	5
number1		DWORD   ?
prompt1		BYTE	"Pick a number", 0
string		BYTE	20 DUP (?)
resultLbl	BYTE	"The number's position is:", 0
result		BYTE	11 DUP (?), 0

.CODE
_MainProc PROC
	input	prompt1, string, 20
	atod	string
	mov		number1, eax

	lea		ebx, Ary		; get address of array
	mov		ecx, nbrElts	; ecx = num of elements

	push	ecx				; num of elements (parameter 3)
	push	ebx				; address of Ary (parameter 2)
	push	number1			; search value (parameter 1)
	call	fctn1
	add		esp, 12			; removes parameters from stack

	dtoa	result, eax
	output	resultLbl, result

	mov		eax, 0
	ret
_MainProc ENDP
fctn1	PROC
		push	ebp
		mov		ebp, esp
		mov		eax, 1						; eax = 1 (first position in array)
		mov		ebx, [ebp+8]				; ebx = input value for search
		mov		esi, [ebp+12]				; esi = address of Ary

forCmp:	cmp		eax, [ebp+16]				; position < num of elements
		jg		notInArray					; if value isn't in array, set eax to 0
		cmp		ebx, [esi]					; value = array element
		jz		endOfProc					; jump if value is in array
		inc		eax							; add 1 to eax for next element
		add		esi, 4						; next element in array
		jmp		forCmp

notInArray:
		mov		eax, 0						

endOfProc:
		pop		ebp
		ret
fctn1	ENDP

END