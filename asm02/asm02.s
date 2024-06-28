global _start
section .bss
    input resb 2

section .data
    msg: db "1337", 01
    .len: equ $ - msg
    help: db "Ask user to input a number, return 1337 if input is 42", 10
    .lenHelp: equ $ - help
    usage: db "USAGE : ./asm02", 10
    .lenUsage: equ $ - usage



section .text
_start:
    
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 4
    syscall         

    mov al, [input] 
    cmp al, '4'
    jne _not42

    mov al, [input + 1] 
    cmp al, '2'
    jne _not42

    mov al, [input + 2] 
    cmp al, 10
    jne _not42

_exit:
    mov rax, 1        
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg.len
    syscall
 
    mov rax, 60
    mov rdi, 0
    syscall

_not42:           
    mov rax, 60
    mov rdi, 1 
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

