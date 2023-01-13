.586 
.model flat
.code


;    int v[6] = { 23,5,19,3 ,1, 0};
;    int dst[6];
;    int lun = 6;
;    
;    int return2 = primi_ordine(v, dst, lun);

; trova i primi e li ordina in dst
; f ritorna 0




_primi_ordine proc

push ebp
mov ebp, esp

push edi
push esi
push ebx 

mov esi, 0
mov ecx, 0
mov ebx, dword ptr [ebp + 8]

ciclo:
mov eax, dword ptr [ebx + esi * 4]
call checkifprime
cmp edi, 1
je verified_prime
continua:
inc esi
cmp esi , dword ptr [ebp + 16]
je fine
jmp ciclo


verified_prime:
push ebx
mov ebx, dword ptr [ebp + 12]
mov dword ptr [ebx + ecx * 4], eax
pop ebx
inc ecx
jmp continua

fine:

mov edi, ecx
dec edi
mov esi, 0
mov ebx, dword ptr [ebp + 12]


ciclo_bubble:
mov eax, dword ptr [ebx + esi * 4]
inc esi
mov ecx, dword ptr [ebx + esi * 4]
cmp eax, ecx
jge scambia
continua_ord:
cmp esi, edi
je again
jmp ciclo_bubble


scambia:
dec esi
mov dword ptr [ebx + esi * 4], ecx
inc esi
mov dword ptr [ebx + esi * 4], eax
jmp continua_ord


again:
mov esi, 0
dec edi
cmp edi, 0
je fine_ordinamento
jmp ciclo_bubble

fine_ordinamento:

mov eax, 0 


pop ebx
pop esi
pop edi

mov esp, ebp
pop ebp
ret








_primi_ordine endp

checkifprime proc

push ecx
push eax

cmp eax, 0
je not_prime
cmp eax, 1
je is_prime



mov edi, 0
mov ecx, 2

ciclo_prime:
mov eax, dword ptr [ebx + esi *4 ]
mov edx, 0
div ecx
cmp edx, 0
je not_prime
inc ecx
mov eax, dword ptr [ebx + esi*4]
cmp ecx, eax
je is_prime
jmp ciclo_prime


not_prime:
mov edi, 0
jmp fine_prime

is_prime:
mov edi, 1

fine_prime:

pop eax
pop ecx

ret

checkifprime endp

End


