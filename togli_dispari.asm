.586 
.model flat
.code

_togli_dispari proc
 
 push ebp
 mov ebp, esp

 push esi
 push edi
 push ebx

 mov ebx, dword ptr [ebp + 8]
 mov edi, dword ptr [ebp + 12]
 mov esi, 0

 ciclo:
 mov al, byte ptr [ebx + esi]
 mov ecx, dword ptr [ebp + 12]
 dec ecx
 cmp esi, ecx
 je fine
 call checkparita
 cmp edi, 1
 je dispari
 avanti:
 inc esi
 jmp ciclo


 dispari:
 cmp esi, 0
 je avanti
 dec edi
 cmp esi, edi
 je avanti_disp
 dec esi
 mov al, byte ptr [ebx + esi]
 call checkparita
 cmp edi, 1
 je avanti_disp
 add esi, 2
 mov al, byte ptr [ebx + esi]
 call checkparita
 cmp edi, 1
 je avanti
 dec esi
 call calcolomedia
 jmp avanti

 avanti_disp:
 inc esi
 jmp avanti


 fine:


 mov eax, 0

 pop ebx
 pop edi
 pop esi

 mov esp, ebp
 pop ebp
 ret


_togli_dispari endp


checkparita proc

; al value
; cl 2

push eax
push ecx

mov ah, 0
mov cl,2
idiv cl
cmp ah, 0
jne dispari
mov edi, 0
jmp pari

dispari:
mov edi, 1

pari:

pop ecx
pop eax
ret

checkparita endp


calcolomedia proc
; esi has index attuale

push ebx
push edx
push ecx
push edi
push esi


inc esi
mov al, byte ptr [ebx + esi]
sub esi, 2
mov bl, byte ptr [ebx + esi]
add al, bl
mov cl, 2
mov ah, 0
idiv cl
call checkparita
cmp edi, 1
je mediadispari
jmp mediapari


mediadispari:
inc esi
mov ebx, dword ptr [ebp + 8]
inc al
mov byte ptr [ebx + esi], al
jmp fine

mediapari:
inc esi
mov ebx, dword ptr [ebp + 8]
mov byte ptr [ebx + esi], al

fine:


pop esi 
pop edi
pop ecx
pop edx
pop ebx
ret

calcolomedia endp

end
