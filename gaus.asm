.586
.model flat
.code

_gaus proc

push ebp
mov ebp, esp

push ebx
push esi
push edi

mov esi, dword ptr [ebp + 12] ; esi has lun
mov ecx, dword ptr [ebp + 8]
mov edi, 0
mov eax, 0

startloop:
mov ebx, dword ptr [ecx + edi * 4]
cmp edi, esi
je endloop
inc edi
add eax, ebx
jmp startloop

endloop:

cdq
idiv esi


mov ebx, dword ptr [ebp + 16]
mov dword ptr [ebx], eax


push eax ; saving eax into stack

mov eax, 0
mov edi, 0
mov esi, 0 ; somma qui

startloop1:
mov ebx, dword ptr [ecx + edi * 4]
cmp edi, dword ptr [ebp+12]
je endloop1
inc edi
mov eax, ebx
imul eax
add esi, eax
jmp startloop1

endloop1:

mov eax, esi

cdq
idiv dword ptr [ebp+12]

mov ebx, dword ptr [ebp + 20]


mov ecx, eax
pop eax


imul eax
sub ecx, eax ; ecx final var

mov dword ptr [ebx], ecx


pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret

_gaus endp


End
