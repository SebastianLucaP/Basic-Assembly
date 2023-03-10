%include "../include/io.mac"

section .data
    NxN: dd 0
    r1: dd 0
    c1: dd 0
    r2: dd 0
    c2: dd 0
    iter: dd 0
    eaxc: dd 0
    caracter: dd 0
    increment: dd 0
section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    ;Pune in variabila NxN numarul de elemente din matricea de chei care este vazuta in memorie ca un vector de N x N elemente
    mov [NxN], eax
    imul eax, eax
    mov esi, [NxN]
    mov [NxN], eax
    mov eax, esi
    ;Pune in variabilele r1 si c1(row, column) 0 si in variabilele r2 si c2 N-1 pentru algoritmul de parcurgere in spirala a matricei
    ;Pune 0 in variabila iter
    mov [r1], dword 0
    mov [c1], dword 0
    mov [r2], eax
    sub [r2], dword 1
    mov [c2], eax
    sub [c2], dword 1
    mov [iter], dword 0
    ;Loop-ul mare in care se afla 4 loop-uri ce parcurg matricea in spirala in ordinea linie, coloana, linie, coloana
    ;Copiaza valoarea lui eax in variablia eaxc pentru a putea folosi eax ca auxiliar in alte instructiuni
wholeloop:
    mov [eaxc], eax
    ;Muta in esi variabila c1 ce va fi folosita drept contor pentru primul loop
    ;Primul loop parcurge liniile de sus ale matricei de la primul la ultimul element
    ;Parcurge in acelasi timp sirul de caractere cu ajutorul variabilei iter si cripteaza fiecare caracter
    mov esi, [c1]
firstloop:
    ;Pune in eax valoarea cu care trebuie incrementata adresa matricei de chei pentru a obtine elementul curent
    ;Pune in variabila caracter cheia care trebuie adaugata la caracter
    ;Pune in eax caracterul initial si adauga cheia la acesta
    ;Pune caracterul criptat in sirul final
    mov edi, [r1]
    imul eax, edi
    add eax, esi
    imul eax, 4
    mov [increment], eax
    add ecx, [increment]
    mov eax, [ecx]
    sub ecx, [increment]
    mov [caracter], eax
    add ebx, [iter]
    mov eax, [ebx]
    sub ebx, [iter]
    add eax, [caracter]
    add edx, [iter]
    mov [edx], eax
    sub edx, [iter]
    add esi, 1
    add [iter], dword 1
    mov eax, [iter]
    ;Dupa fiecare caracter criptat verifica daca aceastea s-au terminat pentru a iesi din loop-uri
    cmp eax, [NxN]
    je skip
    ;Repeta instructiunile pana cand printeaza toate elementele de pe linie de la primul la ultimul
    mov eax, [eaxc]
    cmp esi, [c2]
    jle firstloop
    ;Muta in esi variabila r1+1 ce va fi folosita drept contor pentru al doilea loop
    ;Al doilea loop parcurge coloanele din dreapta ale matricei de la al doilea la ultimul element
    ;Parcurge in acelasi timp sirul de caractere cu ajutorul variabilei iter si cripteaza fiecare caracter
    mov esi, [r1]
    add esi, 1
secondloop:
    ;Pune in eax valoarea cu care trebuie incrementata adresa matricei de chei pentru a obtine elementul curent
    ;Pune in variabila caracter cheia care trebuie adaugata la caracter
    ;Pune in eax caracterul initial si adauga cheia la acesta
    ;Pune caracterul criptat in sirul final
    mov edi, [c2]
    imul eax, esi
    add eax, edi
    imul eax, 4
    mov [increment], eax
    add ecx, [increment]
    mov eax, [ecx]
    sub ecx, [increment]
    mov [caracter], eax
    add ebx, [iter]
    mov eax, [ebx]
    sub ebx, [iter]
    add eax, [caracter]
    add edx, [iter]
    mov [edx], eax
    sub edx, [iter]
    add esi, 1
    add [iter], dword 1
    mov eax, [iter]
    ;Dupa fiecare caracter criptat verifica daca aceastea s-au terminat pentru a iesi din loop-uri
    cmp eax, [NxN]
    je skip
    ;Repeta instructiunile pana cand printeaza toate elementele de pe coloana de la al doilea la ultimul
    mov eax, [eaxc]
    cmp esi, [r2]
    jle secondloop
    ;Muta in esi variabila c2+1 ce va fi folosita drept contor pentru al treilea loop
    ;Al treilea loop parcurge liniile de jos ale matricei de la penultimul la primul element
    ;Parcurge in acelasi timp sirul de caractere cu ajutorul variabilei iter si cripteaza fiecare caracter
    mov esi, [c2]
    sub esi, 1
thirdloop:
    ;Pune in eax valoarea cu care trebuie incrementata adresa matricei de chei pentru a obtine elementul curent
    ;Pune in variabila caracter cheia care trebuie adaugata la caracter
    ;Pune in eax caracterul initial si adauga cheia la acesta
    ;Pune caracterul criptat in sirul final
    mov edi, [r2]
    imul eax, edi
    add eax, esi
    imul eax, 4
    mov [increment], eax
    add ecx, [increment]
    mov eax, [ecx]
    sub ecx, [increment]
    mov [caracter], eax
    add ebx, [iter]
    mov eax, [ebx]
    sub ebx, [iter]
    add eax, [caracter]
    add edx, [iter]
    mov [edx], eax
    sub edx, [iter]
    sub esi, 1
    add [iter], dword 1
    mov eax, [iter]
    ;Dupa fiecare caracter criptat verifica daca aceastea s-au terminat pentru a iesi din loop-uri
    cmp eax, [NxN]
    je skip
    ;Repeta instructiunile pana cand printeaza toate elementele de pe linie de la penultimul la primul
    mov eax, [eaxc]
    cmp esi, [c1]
    jge thirdloop
    ;Muta in edi variabila r2 ce va fi folosita drept contor pentru al patrulea loop
    ;Al patrulea loop parcurge coloanele din stanga ale matricei de la penultimul la al doilea element
    ;Parcurge in acelasi timp sirul de caractere cu ajutorul variabilei iter si cripteaza fiecare caracter
    mov esi, [r2]
    sub esi, 1
fourthloop:
    ;Pune in eax valoarea cu care trebuie incrementata adresa matricei de chei pentru a obtine elementul curent
    ;Pune in variabila caracter cheia care trebuie adaugata la caracter
    ;Pune in eax caracterul initial si adauga cheia la acesta
    ;Pune caracterul criptat in sirul final
    mov edi, [c1]
    imul eax, esi
    add eax, edi
    imul eax, 4
    mov [increment], eax
    add ecx, [increment]
    mov eax, [ecx]
    sub ecx, [increment]
    mov [caracter], eax
    add ebx, [iter]
    mov eax, [ebx]
    sub ebx, [iter]
    add eax, [caracter]
    add edx, [iter]
    mov [edx], eax
    sub edx, [iter]
    sub esi, 1
    add [iter], dword 1
    mov eax, [iter]
    ;Dupa fiecare caracter criptat verifica daca aceastea s-au terminat pentru a iesi din loop-uri
    cmp eax, [NxN]
    je skip
    ;Repeta instructiunile pana cand printeaza toate elementele de pe coloana de la penultimul la al doilea
    mov eax, [eaxc]
    cmp esi, [r1]
    jg fourthloop
    ;Adauga 1 la r1 si c1 si scade 1 din r2 si c2 pentru a trece la urmatorul "strat" al spiralei
    ;Sare la inceputul loop-ului intreg finalul acestuia fiind determinat in fiecare loop mic
    add [r1], dword 1
    sub [r2], dword 1
    add [c1], dword 1
    sub [c2], dword 1
    jmp wholeloop
skip:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
