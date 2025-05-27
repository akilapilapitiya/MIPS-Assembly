    .data
inputLabel: .asciiz "Enter the number of Inputs: "
outputLabel: .asciiz "Average is: "
nextInput: .asciiz "Enter Number: "
newLine: .asciiz "\n"
floatSum: .float 0.0

    .text
    li $t0, 1 # Loop Controller
    l.s $f1, floatSum # Sum

    # Label for number input
    li $v0, 4
    la $a0, inputLabel
    syscall

    # Get integer input
    li $v0, 5
    syscall
    add $t3, $v0, $zero

forLoop: bgt $t0, $t3, endLoop
    
    # Label for float input
    li $v0, 4
    la $a0, nextInput
    syscall

    # Float Input
    li $v0, 6
    syscall

    #Add float
    add.s $f1, $f1, $f0

    #Increment the loop
    addi $t0, $t0, 1

    j forLoop


endLoop: 
    # Print Label
    li $v0, 4
    la $a0, outputLabel
    syscall

    # Print Answer
    li $v0, 2
    mov.s $f12, $f1
    syscall


