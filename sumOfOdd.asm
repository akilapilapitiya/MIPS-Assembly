    .data
inputLabel: .asciiz "Enter a number: "
answerLabel: .asciiz "The sum of Odd Numbers is: "

    .text
    li $t0, 1 # Loop Controller
    li $t1, 0 # Sum variable
    #t3 store AND state

    #Label for user input
    li $v0, 4
    la $a0, inputLabel
    syscall

    #Input for Number
    li $v0, 5
    syscall
    add $t2, $v0, $zero

loop: bgt $t0, $t2, endLoop
    andi $t3, $t0, 1
    beq $t3, $zero, skip

    #if Odd do these
    add $t1, $t1, $t0

skip: addi $t0, $t0, 1
      j loop

endLoop: # Print Label
        li $v0, 4
        la $a0, answerLabel
        syscall   

        #Print the answer
        li $v0, 1
        add $a0, $t1, $zero
        syscall

        #End Program
        li $v0, 10
        syscall     

