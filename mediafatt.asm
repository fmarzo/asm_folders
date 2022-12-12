.586
.model flat
.code



_fatt proc

push ebp
mov ebp, esp

push edi
push esi
push ebx

mov eax, dword ptr [ebp + 8]; eax contains num
mov ebx, eax

inizio:
dec ebx
cmp ebx, 0
je fine
mul ebx
jmp inizio

fine:


pop ebx
pop esi
pop edi

mov esp,ebp 
pop ebp
ret


_fatt endp


_media proc

push ebp
mov ebp, esp

push edi
push esi
push ebx

mov eax, dword ptr [ebp + 8]; eax contains data addr
mov ebx, dword ptr [ebp + 12]; ebx contains dim
dec ebx

mov esi, 0 
mov edi, 0

inizio:

add esi, dword ptr [eax + edi * 4]
cmp edi, ebx
je fine
inc edi
jmp inizio


fine:
; divido

cdq
inc ebx
mov eax, esi
idiv ebx


pop ebx
pop esi
pop edi

mov esp,ebp 
pop ebp
ret




_media endp




End
