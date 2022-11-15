.586
.model flat
.code


_contapari proc

push ebp
mov ebp, esp

push ebx
push esi
push edi


mov edi, 0
mov esi, 0; here the counter

startloop:
mov ebx, dword ptr [ebp + 8]
mov al, byte ptr [ebx + edi]
cmp edi, dword ptr[ebp + 12]
je endloop
inc edi
call checkpari
cmp edx, 1 
je parifound
jmp startloop


parifound:
inc esi
jmp startloop

endloop:


mov eax, esi

pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret


checkpari proc

; al has char
; edx gives the feedback

push ebx
mov ebx, 0
mov edx, 0
mov bl, 2

cbw
idiv bl

cmp ah, 0
je parifound1
jmp endloop1

parifound1:
mov edx, 1

endloop1:

pop ebx

ret
checkpari endp


_contapari endp




End
