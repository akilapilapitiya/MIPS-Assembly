    .data
inputLabel: .asciiz "Enter the digit combination to analyze: "
sumLabel: .asciiz "Sum of digits is: "
countLabel: .asciiz "Count of Digits is: "
newLine: .asciiz "\n"

    .text
    # $t0 for input
    # $t1 for sum
    # $t2 for count 
    # $t3 for divisor
    # $t4 for mflo 
    # $t5 for mfhi
    li $t1, 0
    li $t2, 0
    li $t3, 10

    # Get User Input
    li $v0, 4
    la $a0, inputLabel
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

loop:
    ble $t0, $zero, endLoop
    div $t0, $t3
    mflo $t4
    mfhi $t5
    add $t1, $t1, $t5
    add $t0, $t4, $zero
    addi $t2, $t2, 1
    j loop

endLoop:
    # Print Sum
    li $v0, 4
    la $a0, sumLabel
    syscall

    li $v0, 1
    add $a0, $t1, $zero
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    # Print Count
    li $v0, 4
    la $a0, countLabel
    syscall

    li $v0, 1
    add $a0, $t2, $zero
    syscall

progEnd:
    li $v0, 10
    syscall








