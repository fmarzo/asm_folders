.586
.model flat
.code

; a * b or a / b


_mulOrDiv proc


push ebp
mov ebp, esp

push edi
push esi
push ebx

mov al, byte ptr [ebp + 8] ; a
mov bl, byte ptr [ebp + 12] ; b 
mov cl, byte ptr [ebp + 16] ; mode


cmp ecx, 0
je multipl
jmp divis

multipl:
imul bl
jmp fine



divis:
mov dx, 0
idiv bl
jmp fine

fine: 



pop ebx
pop esi
pop edi

mov esp, ebp
pop ebp

ret


_mulOrDiv endp


End
