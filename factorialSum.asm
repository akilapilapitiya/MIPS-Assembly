    .data
inputLabel: .asciiz "Enter the Number: "
sumLabel: .asciiz "The sum of Factorials is: "


    .text
    # $t0 loop controller
    # $t1 sub loop controller
    # $t2 user input
    # $t3 sum 
    # t4 product store
    li $t0, 1 
    li $t3, 0
    
    # Get User Input
    li $v0, 4
    la $a0, inputLabel
    syscall

    li $v0, 5
    syscall
    add $t2, $v0, $zero

mainLoop:
    bgt $t0, $t2, endMainLoop
    li $t1, 1  
    li $t4, 1

subLoop:
    bgt $t1, $t0, endSubLoop
    mult $t1, $t4
    mflo $t4
    addi $t1, $t1, 1
    j subLoop

endSubLoop:
    add $t3, $t3, $t4
    addi $t0, $t0, 1
    j mainLoop

endMainLoop:
    # Outputs
    li $v0, 4
    la $a0, sumLabel
    syscall

    li $v0, 1
    add $a0, $t3, $zero
    syscall

progEnd:
    li $v0, 10
    syscall
