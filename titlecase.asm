.586 
.model flat
.code

_titlecase proc



push ebp 
mov ebp, esp

push ebx
push edi
push esi


mov eax, dword ptr [ebp + 8]

mov esi, 0
mov edi, 0
mov ebx, 0

inizio:
mov bl, byte ptr [eax + esi]
cmp bl, 0
je fine
cmp bl, 32
je caseup
jmp nextcycle


caseup:
dec esi
mov bl, byte ptr [eax + esi]
cmp byte ptr [eax + esi], 97
jl notalpha
cmp byte ptr [eax + esi], 122
jg notalpha
sub bl, 32
mov byte ptr [eax + esi], bl
inc esi ; ripristino esi alla fine
jmp nextcycle


notalpha:
inc esi
jmp nextcycle


nextcycle:
inc esi
jmp inizio

fine:

pop esi 
pop edi
pop ebx

mov esp, ebp
pop ebp


_titlecase endp


strlen proc

mov esi, 0

inizio:
cmp byte ptr [eax + esi], 0
je fine
inc esi
je inizio
fine:

ret

strlen endp

End
