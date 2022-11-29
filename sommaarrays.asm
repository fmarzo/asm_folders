.586
.model flat
.code

_sommaarr proc

push ebp
mov ebp, esp

push edi
push esi
push ebx

mov ebx, dword ptr [ebp + 8]
call sumtot

mov ebx, dword ptr [ebp + 12]
call sumtot

pop ebx
pop esi
pop edi
mov esp, ebp
pop ebp

ret



sumtot proc
; in ebx address on array
; in esi value of the sum


mov esi, 0 
mov edi, 0

ciclo1:
cmp edi, dword ptr [ebp + 20]
je endciclo
add esi, dword ptr [ebx + edi * 4]
inc edi
jmp ciclo1


endciclo:
mov dword ptr [ebx], esi

ret
sumtot endp


_sommaarr endp




End
