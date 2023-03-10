%include "../include/io.mac"

section .data
    contor: dd 0
    len_key: dd 0
    code: dd 0

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    ;Initializeaza cu 0 o variabila contor
    ;Muta lungimea cheii din ecx in variabila len_key si lungimea sirului din eax in ecx pentru a putea folosi instructiunea "loop"
    mov [contor], dword 0
    mov [len_key], ecx
    mov ecx, eax
    ;Loop-ul in care calculeaza caracterul criptat prin formula "caract. criptat = cheie - (caract. initial - 'A')"
    ;Calculeaza in eax diferenta "caract. initial - 'A'" dupa care o pune in variabila code
    ;Pune in eax cheia si scade din ea variabila code, dupa care pune caracterul criptat in vectorul de sirul de caractere criptate
repeat:
    mov eax, [ebx]
    sub eax, 65
    mov [code], eax
    mov eax, [edx]
    sub eax, [code] 
    mov [esi], eax
    ;Determina daca dupa criptarea cu aceasta formula caracterul este mai mic de 'A'
    mov al, [esi]
    cmp al, 65
    jl add_letter_A
    jmp skip
    ;Adauga codul lui 'A' la caracter in cazul in care acesta este mai mic de 'A' pentru a obtine caracterul criptat final
add_letter_A:
    add al, 26 
    ;Adauga 1 la adresele vectorilor pentru a accesa toate caracterele in cadrul loop-ului
    ;Adauga 1 la variabila contor pentru a verifica daca sirul de chei s-a terminat
skip:
    mov [esi], al
    add ebx, 1
    add edx, 1
    add esi, 1
    add [contor], dword 1
    ;Compara contorul cu lungimea sirului de chei
    mov eax, [contor]
    cmp eax, [len_key]
    je subtract
    jmp skip2
    ;Daca acesta s-a terminat, scade contorul din adresa sirului de chei pentru a lua sirul de la inceput
subtract:
    mov [contor], dword 0
    sub edx, eax
    ;Repeta instructiunile cu ajutorul registrului ecx si pune NULL la finalul sirului pentru a nu avea valori reziduale
skip2:
    loop repeat
    mov [esi], byte 0
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
