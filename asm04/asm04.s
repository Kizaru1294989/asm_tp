global _start

section .bss 
    input resb 32

section .data
    help: db "Check if user input is even or odd, return 0 if even, 1 if odd", 10
    .lenHelp: equ $ - help
    usage: db "USAGE : ./asm04", 10
    .lenUsage: equ $ - usage

section .text
_start:

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 32
    syscall       

    xor rdx, rdx
loop:
    mov al, byte [input + rdx] 
    cmp al, 10
    je foundNewline            
    inc rdx
    jmp loop

foundNewline:
    dec rdx                       
    movzx eax, byte [input + rdx] 
    sub al, '0'                   
                                  

    test al, 1                    
    jnz _odd                      
    jz _even                      

_odd:
    mov rdi, 1
    jmp _exit

_even:
    mov rdi, 0
_exit:
    mov rax, 60
    syscall

_error:

    mov rax, 1    
    mov rdi, 1
    mov rsi, help
    mov rdx, help.lenHelp
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, usage
    mov rdx, usage.lenUsage
    syscall


    mov rax, 60
    mov rdi, 1
    syscall

