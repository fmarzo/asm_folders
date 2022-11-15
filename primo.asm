.586
.model flat
.code

_primo proc

push ebp
mov ebp, esp

push esi
push edi
push ebx

mov ecx, 1
mov edi, 2


startloop:
mov eax, dword ptr [ebp + 8]
cmp edi, eax
je endloop
cdq
idiv edi
cmp edx, 0
je notprime
inc edi

jmp startloop

notprime:
mov ecx, 0
mov eax, ecx

endloop:

mov eax, ecx

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_primo endp



End
