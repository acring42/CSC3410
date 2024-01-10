; given an array of doubleword integers, (1) find their average
; and (2) add 10 to each number smaller than average
; author:  R. Detmer
; revised:  6/2013

.586
.MODEL FLAT
.STACK  4096

.DATA
nbrArray    DWORD    25, 47, 15, 50, 32, 95 DUP (?)
nbrElts     DWORD    5
temp        DWORD    ?
.CODE
main        PROC
; find sum and average
            mov    eax,0            ; sum := 0
            lea    ebx,nbrArray     ; get address of nbrArray
            mov    ecx,nbrElts      ; count := nbrElts
            jecxz  quit             ; quit if no numbers
forCount1:  add    eax,[ebx]        ; add number to sum
            add    ebx,4            ; get address of next array elt
            loop   forCount1        ; repeat nbrElts times

            cdq                     ; extend sum to quadword
            idiv   nbrElts          ; calculate average

; add 10 to each array element below average
            lea    ebx,nbrArray     ; get address of nbrArray
            mov    ecx,nbrElts      ; count := nbrElts

forCount2:  mov    edx, [ebx]      ; mov average to temp for later use
            sub    edx,eax        ; getting distance from number to average
            cmp    edx,5          ; number < average ?
            jg     endOutRange      ; continue if not less
            cmp    edx,-5         ; number < average ?
            jl     endOutRange       ; continue if not less

            mov    [ebx], eax
            add    ebx,4            ; get address of next array elt
            loop   forCount2        ; repeat
            jmp    quit

endOutRange:
            mov    edx, 0      ; get address of next array elt
            add    ebx, 4
            loop   forCount2        ; repeat
            
quit:       mov   eax, 0      ; exit with return code 0
            ret
main        ENDP
END
