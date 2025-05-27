.data
arr:        .word 10, 20, 30, 40, 50   # Array of 5 integers
msg:        .asciiz "The number is: "

.text
.globl main

main:
    # Load base address of the array
    la $t0, arr         # $t0 = base address of arr

    # Select index
    li $t1, 2           # Want to print arr[2]

    # Calculate offset = index * 4 (word size)
    li $t2, 4
    mul $t3, $t1, $t2   # $t3 = byte offset

    # Calculate address of arr[index]
    add $t4, $t0, $t3   # $t4 = address of arr[2]

    # Load the value at that address
    lw $t5, 0($t4)      # $t5 = arr[2] = 30

    # Print the message
    li $v0, 4
    la $a0, msg
    syscall

    # Print the number
    li $v0, 1
    add $a0, $t5, $zero
    syscall

    # Exit
    li $v0, 10
    syscall
