    .data
userInput: .asciiz "Enter the number: "
newLine: .asciiz "\n"
    .text
    # $t0 to store the input 
    # $t1 controls the loop
    li $t1, 1
    li $t2, 1 
    li $t4, 2

    li $v0, 4
    la $a0, userInput
    syscall

    li $v0, 5
    syscall
    add $t0, $v0 ,$zero


forLoop: bgt $t1, $t0, endLoop

    # and $t3, $t1, $t2
    div $t1, $t4
    mfhi $t5


# ifCondition: beq $t3, $t2, odd
ifCondition: beq $t5, $t2, odd
    j loopReset

odd:
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

loopReset:
    addi $t1, $t1, 1
    j forLoop


endLoop:
    li $v0, 10
    syscall