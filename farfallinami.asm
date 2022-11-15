.586
.model flat
.code


_farfallinami proc

push ebp
mov ebp, esp

push edi
push esi
push ebx


mov eax, 0
mov al, byte ptr [ebp + 16]

call checkvocale

mov ebx, dword ptr [ebp + 8]
mov edx, dword ptr [ebp + 12]

cmp esi, 0
jne sostituisci


call copiastr

sostituisci:

mov edi, 0 
mov cl, byte ptr [ebp + 16]

iniziociclo1:
mov al, byte ptr [ebx + edi]
cmp al, 0
je fineprog
call checkvocale
cmp esi, 0
je addcons
mov byte ptr [edx + edi], cl
jmp prossimogiro


addcons:
mov byte ptr [edx + edi], al

prossimogiro:
inc edi
jmp iniziociclo1




fineprog:



pop ebx
pop esi
pop edi

mov esp, ebp
pop ebp
ret


_farfallinami endp


checkvocale proc
; vocale in al
; in esi se c'è o no

mov esi, 0

cmp al, 'a'
je fine
cmp al, 'e'
je fine
cmp al, 'i'
je fine
cmp al, 'o'
je fine
cmp al, 'u'
je fine
ret


fine:
mov esi, 1
ret


checkvocale endp


copiastr proc

; ebx indirizzo prima string
; edx indirizzo seconda string

push ecx

mov edi, 0
ciclo:
mov cl, byte ptr [ebx + edi]
cmp cl, 0
je fineciclo
mov byte ptr [edx + edi], cl
inc edi 
jmp ciclo


fineciclo:
pop ecx

ret

copiastr endp
End


