   .data

    .text 
    li $t0, 2
    li $t1, 9
    li $v1, 3

    add $t2, $t0, $t1
    addi $t3, $t0, 6



    li $v0, 1
    add $a0, $t3, $zero
    syscall


