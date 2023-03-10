%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;Contorul cu care parcurg sirul de caractere
    mov eax, 0    
    ;Loop-ul in care am mutat fiecare caracter in registrul ebx si am adaugat numarul step la codul sau ASCII
cipher:
    mov ebx, [esi+eax]
    add ebx, edx
    mov [edi+eax], ebx
    ;Compartaie pentru a determina daca caracterul dupa criptare a trecut de caracterul 'Z'
    cmp byte [edi+eax], 'Z'
    jg decrement
    jmp skip
    ;Scade din codul caracterului codul lui 'A' in cazul in care acesta a trecut de caracterul 'Z'
decrement:
    mov ebx, [edi+eax]
    sub ebx, 26
    mov [edi+eax], ebx
    ;Creste contorul si repeta instructiunile de "ecx" ori
skip:
    inc eax
    loop cipher
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
