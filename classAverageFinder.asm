    .data
count: .asciiz "Enter the Number of Students in the Class: "
inputLabel: .asciiz "Enter the marks of the Student: "
sum: .asciiz "The Class Total is: "
average: .asciiz "The Class Average is: "
valid: .asciiz "Please Enter a valid Mark......"
newLine: .asciiz "\n"


    .text
    # t0 loopController
    # t1 totalSum
    # t2 average
    # t3 current marks
    # t4 classCount

    li $t0, 1
    li $t1, 0

studentCount:
    # Student COunt Input Label
    li $v0, 4
    la $a0, count
    syscall

    # Count Input
    li $v0, 5
    syscall
    add $t4, $v0, $zero

forLoop:
    bgt $t0, $t4, endLoop

input:
    # Marks Input Label
    li $v0, 4
    la $a0, inputLabel
    syscall

    # Marks Input
    li $v0, 5
    syscall
    add $t3, $v0, $zero

rangeCheck:
    bgt $t3, 100, validPrompt
    blt $t3, 0, validPrompt
    j continue

validPrompt:
    li $v0, 4
    la $a0, valid
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    j input

continue:
    # newLine
    li $v0, 4
    la $a0, newLine
    syscall

    # Add to total Marks
    add $t1, $t1, $t3

    addi $t0, $t0, 1
    j forLoop

endLoop:    
    # Sum Label Print
    li $v0, 4
    la $a0, sum
    syscall

    # Sum value Print
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    #NewLine
    li $v0, 4
    la $a0, newLine
    syscall

    #Calculate Average
    div $t1, $t4

    #to mfhi mand mflo
    mflo $t2

    # Average Label Print
    li $v0, 4
    la $a0, average
    syscall

    # Average value Print
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    #End Program
    li $v0, 10
    syscall
