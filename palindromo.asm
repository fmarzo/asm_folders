.586
.model flat
.code

; RESTITUISCE 1 SE PALINDROMO, 0 SE NON LO E

_palindromo proc

push ebp
mov ebp, esp

push edi
push ebx
push esi

mov esi, 0
mov ebx, 0
mov edi, 0
mov edx, 0
mov ecx, 0

mov eax, dword ptr [ebp + 8]


call upcase  ; esi has len

dec esi
 
inizio:
mov bl, byte ptr [eax + esi]
mov dl, byte ptr [eax + edi] ; debug purpose
cmp bl, dl
jne notPal
cmp esi, 0
je pal
dec esi
inc edi
jmp inizio


notPal:
mov eax, 0 
jmp fine

pal:
mov eax, 1
jmp fine


fine:


pop esi
pop ebx
pop edi

mov esp, ebp
pop ebp

ret

_palindromo endp


upcase proc

inizio:
mov bl, byte ptr [eax + esi]
cmp bl, 0
je fine
cmp bl, 97
jl nonConvertire
cmp bl, 122
jg nonConvertire
sub bl, 32
mov byte ptr [eax + esi], bl
inc esi
jmp inizio


nonConvertire:
inc esi
jmp inizio

fine:
ret
upcase endp



End
