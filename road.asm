%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;Scade 1 din numarul de puncte deoarece numarul de distante este egal cu "numarul de puncte"-1
    ;Contorul cu care parcurg vectorul de puncte, dar si cel de distante
    dec ecx
    mov esi, 0
    ;Asemenea punctului anterior pune in dx coordonatele celui de-al doilea punct si le scade pe cele ale primului punct
    ;Aceste instructiuni se afla intr-un loop deoarece calculam len-1 distante nu una singura
points:
    mov dx, [eax+esi+4]
    add dx, [eax+esi+6]
    sub dx, [eax+esi]
    sub dx, [eax+esi+2]
    ;Compara distanta cu 0 pentru a afla daca este negativa
    cmp dx, 0
    jl negate
    jmp skip
    ;Transforma distanta negativa in una pozitiva
negate:
    neg dx
    ;Muta distanta calculata la adresa din registrul eax transformand-o din tip short in tip int
    ;Adauga 4 la contor pentru a parcurge elementele aflate din 2 in 2 biti, fiind cate doua coordonate de tip short si repeta instructiunile de "ecx" ori
skip:
    movsx edi, dx
    mov [ebx+esi], edi
    add esi, 4
    loop points
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY