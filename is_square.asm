%include "../include/io.mac"

section .data
    nr: dd 1
section .text
    global is_square
    extern printf
is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;Muta numarul de distante din eax in esi pentru a avea eax liber pentru inmultiri
    ;Contorul cu care parcurg vectorul de distante si vectorul final
    mov esi, eax
    mov edi, 0
    ;Loop-ul in care am mutat fiecare distanta in registrul edx si am verifcat daca acesta este patrat perfect
    ;Variabila nr este initializata cu 0 pentru a verifica in al doilea loop daca distanta este patrat perfect
repeat:
    mov [nr], dword 0
    mov edx, [ebx+edi]
    ;Al doilea loop in care pun numere incepand de la 0 in registrul eax din variabila nr si le calculez patratul
    ;Calcularea patratelor continua pana cand patratul devine mai mare decat distanta sau egal cu aceasta, punand 1 sau 0 in vectorul final
sqaure:
    mov eax, [nr]
    imul eax, eax
    add [nr], dword 1
    cmp eax, edx
    jg zero
    cmp eax, edx
    jl sqaure
    jmp one
    ;Pune in vectorul final 1 in cazul in care distanta este patrat perfect
one:
    mov [ecx+edi], dword 1
    jmp skip
    ;Pune in vectorul final 0 in cazul in care distanta nu este patrat perfect
zero:
    mov [ecx+edi], dword 0
    ;Adauga 4 la contor pentru a parcurge vectorul cu distante de tip int din 4 in 4 biti
    ;Scade 1 din contorul pentru numarul de distante ce trebuie verificate
skip:
    add edi, 4
    sub esi, 1
    ;Repeta verificarea distantelor prin intermediul unei comparatii a numarului de distante cu 0
    cmp esi, 0
    jge repeat
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY