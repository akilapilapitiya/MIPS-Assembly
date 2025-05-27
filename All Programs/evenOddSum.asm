    .data
inputLabel: .asciiz "Enter a number: "
evenSum: .asciiz "Even Sum is: "
evenCount: .asciiz "Even Count is: "
oddSum: .asciiz "Odd Sum is: "
oddCount: .asciiz "Odd Count is: "
newLine: .asciiz "\n"


    .text
    li $t0, 1 # LoopController
    li $t1, 0 # evenSum
    li $t2, 0 # oddSum
    li $t3, 0 # evenCount
    li $t4, 0 # oddCount
    # t5 for user input
    # t6 for odd even value
     

# User Input Label
    li $v0, 4
    la $a0, inputLabel
    syscall

# User Input
    li $v0, 5
    syscall
    add $t5, $v0, $zero

forLoop: bgt $t0, $t5, endLoop
    andi $t6, $t0, 1
    beq $t6, $zero, evenCheck

    #Tasks if Odd
    add $t2, $t2, $t0
    addi $t4, $t4, 1
    j loopReset

evenCheck: #Tasks if even
    add $t1, $t1, $t0
    addi $t3, $t3, 1

loopReset: #Common Tasks for loop reset
    addi $t0, $t0, 1
    j forLoop

endLoop: 
    #Print the Label for Even Sum
    li $v0, 4
    la $a0, evenSum
    syscall

    #Print value for Even Sum
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    # Newline
    li $v0, 4
    la $a0, newLine
    syscall

    #Print the Label for Even Count
    li $v0, 4
    la $a0, evenCount
    syscall

    #Print value for Even Count
    li $v0, 1
    add $a0, $t3, $zero
    syscall

    # Newline
    li $v0, 4
    la $a0, newLine
    syscall

    #Print the Label for Pdd Sum
    li $v0, 4
    la $a0, oddSum
    syscall

    #Print value for Even Sum
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    # Newline
    li $v0, 4
    la $a0, newLine
    syscall

    #Print the Label for Odd Count
    li $v0, 4
    la $a0, oddCount
    syscall

    #Print value for Odd Count
    li $v0, 1
    add $a0, $t4, $zero
    syscall

    #End Program
    li $v0, 10
    syscall