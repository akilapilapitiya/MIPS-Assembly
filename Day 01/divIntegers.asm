    .data
quotient: .asciiz "The Quotient is: "
remainder: .asciiz "The Remainder is: "
newLine: .asciiz "\n"

    .text
    # Values
    li $t1, 10
    li $t2, 4

    # calcualation
    # t1 / t2
    div $t1, $t2    #10 / 5 = 2.0
    mflo $t3
    mfhi $t4

    # Label for Quotient
    li $v0, 4
    la $a0, quotient
    syscall

    # Quotient Values
    li $v0, 1
    add $a0, $t3, $zero
    syscall

    #newLine
    li $v0, 4
    la $a0, newLine
    syscall


    # Label for Remainder
    li $v0, 4
    la $a0, remainder
    syscall

    # Remainder Values
    li $v0, 1
    add $a0, $t4, $zero
    syscall


    #Program End
    li $v0, 10
    syscall