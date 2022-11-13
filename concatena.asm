.586
.model flat
.code


_concatena proc

push ebp
mov ebp, esp

push ebx
push esi
push edi


mov eax, dword ptr [ebp + 8]; eax -> s1 addr
mov ebx, dword ptr [ebp + 12]; ebx -> s2 addr
mov ecx, dword ptr [ebp + 16]; ecx -> s3 addr
mov esi, dword ptr [ebp + 20]; esi -> mode

cmp esi, 0
je mode1
cmp esi, 1
je mode2 
cmp esi, 3
je mode3
jmp fineend


mode1:
call unisci
mov edx, eax
mov eax, ebx
call unisci
jmp fineend

mode2:
mov edx, eax
mov eax, ebx
call unisci
mov eax, edx
call unisci
jmp fineend

mode3:
call countchar


fineend:

inc ecx
mov byte ptr [ecx], 0

pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret


_concatena endp


unisci proc

; eax -> s* addr
; ecx -> s3 addr


push esi 
push edx

mov dl, 0
mov esi, 0
mov edi, 0

startciclo:
cmp byte ptr [eax + esi], 0
je fineciclo
mov dl, byte ptr [eax + esi]
mov byte ptr [ecx], dl
inc esi
inc ecx
jmp startciclo


fineciclo:


pop edx
pop esi

ret
unisci endp


countchar proc

; eax -> s* addr
; esi -> n char

mov esi,0


startloop1:
mov bl, byte ptr[eax + esi]
cmp bl, 0
je fineciclo1
inc esi
jmp startloop1


fineciclo1:

ret


countchar endp





End
