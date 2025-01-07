global _start

section .data

input_file db "1.input", 0

section .text

_start:
  mov rax,  0x2
  lea rdi,  input_file
  mov rsi,  0x0
  mov rdx,  0x0
  syscall
  cmp rax, $1
  mov rdi,  rax
  js  exit

success:
  mov rdi,  0x0
exit:
  mov rax,  0x3c
  syscall
