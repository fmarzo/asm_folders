
.586 
.model flat
.code


_contavocali proc


push ebp
mov ebp, esp

push esi
push edi
push ebx

mov eax, dword ptr [ebp + 8]

mov esi, 0
mov edi, 0
mov edx, 0 ; -> numero vocali

call strlen



inizio1:
mov cl, byte ptr [eax + edi]
cmp cl, 0
je fine1
cmp cl, 65
je vocale
cmp cl, 69
je vocale
cmp cl, 73
je vocale
cmp cl, 79
je vocale
cmp cl, 85 
je vocale
cmp cl, 97
je vocale
cmp cl, 101
je vocale
cmp cl, 105
je vocale
cmp cl, 111
je vocale
cmp cl, 117 
je vocale
jmp nextcycle


vocale:
inc edx
inc edi
jmp inizio1

nextcycle:
inc edi
jmp inizio1

fine1:

pop ebx
pop edi
pop edi

mov esp, ebp
pop ebp
ret


_contavocali endp

strlen proc


inizio:

cmp byte ptr [eax + esi], 0
je fine
inc esi
jmp inizio

fine:

ret

strlen endp

End
