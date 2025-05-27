    .data
inputLabel: .asciiz "Enter the number: "
outputLabel: .asciiz "The number is a "
primeAttrib: .asciiz "prime number."
compAttrib: .asciiz "composite number."
noneAttrib: .asciiz "neither Prime nor Composite."

    .text
    # $t0 has 2
    # $t1 has input-1
    # $t2 is input 
    # $t3 for mfhi
    li $t0, 2

    # Get Input
    li $v0, 4
    la $a0, inputLabel
    syscall

    li $v0, 5
    syscall
    subi $t1, $v0, 1
    add $t2, $v0, $zero

    # Output Label
    li $v0, 4
    la $a0, outputLabel
    syscall

check:
    blt $t2, $t0, none

loop:
    beq $t1, $t0, endLoop
    div $t2, $t0
    mfhi $t3

    beq $t3, $zero, composite
    addi $t0, $t0, 1
    j loop

endLoop:
    li $v0, 4
    la $a0, primeAttrib
    syscall
    j programEnd

composite:
    li $v0, 4
    la $a0, compAttrib
    syscall
    j programEnd

none:
    li $v0, 4
    la $a0, noneAttrib
    syscall

programEnd:
    li $v0, 10
    syscall

