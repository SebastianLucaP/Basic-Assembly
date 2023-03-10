%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    ;Pune in registrul dx coordonatele x si y de tip short al celui de-al doilea punct si le scade pe cele ale primului punct
    ;In acesta rezulta distanta dintre cele doua puncte
    mov dx, [ebx+4]
    add dx, [ebx+6]
    sub dx, [ebx]
    sub dx, [ebx+2]
    ;Compara distanta cu 0 pentru a afla daca aceasta e negativa
    cmp dx, 0
    jl negate
    jmp skip
    ;Transforma distanta negativa in una pozitiva
negate:
    neg dx
    ;Muta distanta calculata la adresa din registrul eax transformand-o din tip short in tip int
skip:
    movsx edi , dx
    mov [eax], edi
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY