    .data
output: .asciiz "Sum of the squares of even numbers from 1 to 10 is: "

    .text
    li $t0, 1 # Loop Controller
    li $t1, 0 # Sum
loop:   bgt $t0, 10, endLoop
        andi $t2, $t0, 1
        beq $t2, $zero, even
        j else
    
even:   mult $t0, $t0
        mflo $t3
        add $t1, $t1, $t3
        j loop
        



else:   addi $t0, $t0, 1
        j loop

endLoop: #Lebel Print
        li $v0, 4
        la $a0, output
        syscall

        #Print the Number
        li $v0, 1
        add $a0, $t1, $zero
        syscall

        #end Sequence
        li $v0, 10
        syscall