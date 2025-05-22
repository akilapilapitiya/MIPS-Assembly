    .data
inputString: .asciiz "Enter a number: "
outputString: .asciiz "Factorial is: "

    .text
    li $t0, 1 # Loop Control Variable
    li $t1, 1 # Factorial Store
    #t2 is the users input

    # User Input Prompt
    li $v0, 4
    la $a0, inputString
    syscall

    #Get input
    li $v0, 5
    syscall
    add $t2, $v0, $zero

loop: bgt $t0, $t2, endLoop
    mult $t1, $t0
    mflo $t1
    addi $t0, $t0, 1
    j loop

endLoop:
    # User Output Prompt
    li $v0, 4
    la $a0, outputString
    syscall

    # User Input Answer
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    #Program end
    li $v0, 10
    syscall