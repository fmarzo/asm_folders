.586
.model flat
.code 


_divisione_array proc


push ebp
mov ebp, esp 

push esi
push edi
push ebx

mov ecx, dword ptr [ebp + 8]
mov esi, 0
mov edi, dword ptr [ebp + 12]
mov ebx, 0

ciclo:
mov ecx, dword ptr [ebp + 8]
mov eax, dword ptr [ecx + esi * 4]
cdq
idiv edi
mov dword ptr [ecx + esi * 4], eax
mov ecx, dword ptr [ebp + 20]
mov dword ptr [ecx + esi * 4], edx
inc esi
cmp esi, dword ptr [ebp + 16]
je fine
jmp ciclo

fine:

mov edi, 0
mov esi, 0

mov ebx, dword ptr [ebp + 20]

ciclo2:
add edi, dword ptr [ebx + esi * 4]
inc esi
cmp esi, dword ptr [ebp + 16]
je fine2
jmp ciclo2

fine2:
cmp edi, 0
je return_1
mov esi, 0
ciclo3:
mov edi, dword ptr [ebx + esi * 4]
cmp edi, 0
je return2
inc esi
cmp esi, dword ptr [ebp + 16]
je return1
jmp ciclo3


return2:
mov eax, 2
jmp finetotale

return_1:
mov eax, 1
neg eax
jmp finetotale

return1:
mov eax, 1

finetotale:


pop ebx
pop edi
pop esi

mov esp, ebp
pop ebp
ret

_divisione_array endp



end
