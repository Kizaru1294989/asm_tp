section .text
    global _start

_start:
    ; Mettre 0 dans le registre EAX
    xor eax, eax

    ; Terminer le programme avec le code de sortie 0
    mov ebx, eax
    mov eax, 1  ; Code pour l'appel système "exit"
    int 0x80    ; Appel système

section .data

