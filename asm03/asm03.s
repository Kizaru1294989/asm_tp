global _start

section .bss
    input resb 2

section .data
    msg: db "1337", 01
    .len: equ $ - msg
    help: db "Take number as parameter, return 1337 if parameter is 42", 10
    .lenHelp: equ $ - help
    usage: db "USAGE : ./asm03 NUMBER", 10
    .lenUsage: equ $ - usage


section .text
_start:
    
    mov r13, [rsp]
    cmp r13, 0x2
    jne _error      

    mov rsi, rsp        
    add rsi, 16        
    mov rsi, [rsi]    
    mov rdi, input   
    mov rcx, 4      
    rep movsb       

    mov al, [input] 
    cmp al, '4'
    jne _not42

    mov al, [input + 1] 
    cmp al, '2'     
    jne _not42

    mov al, [input + 2] 
    cmp al, 0
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
    
    mov rax, 1s
    mov rdi, 1
    mov rsi, usage
    mov rdx, usage.lenUsage
    syscall


    mov rax, 60
    mov rdi, 1
    syscall
