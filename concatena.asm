

.586
.model flat
.code

_concatena proc

push ebp
mov ebp, esp
push ebx
push edi
push esi


mov esi, dword ptr [ebp + 20]; esi modalità
mov eax, dword ptr [ebp + 8]; eax indirizzo s1
mov ebx, dword ptr [ebp + 12]; ebx indirizzo s2
mov ecx, dword ptr [ebp + 16]; ecx indirizzo s3


cmp esi, 0
je mode1
cmp esi, 1
je mode2
cmp esi, 3
je mode3
jmp fine

mode1:

call insertstring

mov eax, ebx
call insertstring

jmp fine



mode2:

mode3:


fine:

mov byte ptr[ecx], 0

pop esi
pop edi
pop ebx
mov esp, ebp
pop ebp
ret

_concatena endp


insertstring proc 
; eax indirizzo string da inserire
; ecx indirizzo stringa dove inserire
push edi

mov edi, 0

iniziociclo1:
mov dl, byte ptr [eax+ edi]
cmp dl, 0
je fineciclo1
mov byte ptr [ecx], dl
inc ecx
inc edi
jmp iniziociclo1


fineciclo1:

pop edi

ret
insertstring endp






End