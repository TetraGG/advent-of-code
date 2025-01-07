section .bss

tmp_buffer: resb 0x400

section .rodata

input_file  db  "1.input", 0
print_int   db  "%d", 10, 0

section .text

extern printf
global main

main:
open:
    mov     rax, 0x2
    lea     rdi, input_file
    xor     rsi, rsi
    xor     rdx, rdx
    syscall
    test    rax, rax
    mov     rdi, rax
    js      exit
; rbx = fd
    mov     rbx, rax
; r12 = res
    xor     r12, r12

read_loop:
    xor     rax, rax
    mov     rdi, rbx
    lea     rsi, tmp_buffer
    mov     rdx, 0x400
    syscall
    test    rax, rax
    jz      close
    mov     rdi, rax
    js      exit
; rcx = counter
    xor     rcx, rcx
read_char:
    cmp     byte[tmp_buffer + rcx], '('
    je      read_incr
    cmp     byte[tmp_buffer + rcx], ')'
    je      read_dec
    jmp     read_end
read_dec:
    dec     r12
    jmp     read_end
read_incr:
    inc     r12
read_end:
    inc     rcx
    cmp     rax,  rcx
    je      read_loop
    jmp     read_char

close:
    mov     rax, 0x3
    mov     rdi, rbx
    syscall

print:
    xor     rax, rax
    mov     rsi, r12
    mov     rdi, print_int
    call    printf

success:
    mov     rdi, 0x0
exit:
    mov     rax, 0x3c
    syscall
