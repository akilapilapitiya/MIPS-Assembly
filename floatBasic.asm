    .data

    .text
    
    li $v0, 6
    syscall
    mov.s $f4, $f0

    
    li $v0, 2
    mov.s $f12, $f4
    syscall