    .data

    .text
    li $t1, 10
    li $t2, 4

    # t1 / t2
    div $t1, $t2    #10 / 5 = 2.0

    mflo $t3
    mfhi $t4

    li $v0, 1
    add $a0, $t4, $zero
    syscall