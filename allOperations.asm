    .data
count: .asciiz "Enter the Number of Inputs: "
input: .asciiz "Enter Number: "
newLine: .asciiz "\n"
sum: .asciiz "Sum: "
average: .asciiz "Average: "
max: .asciiz "Max: "
min: .asciiz "Min: "


    .text
    # $t0 loopController
    # $t1 count
    # $t2 nextValue
    # $t3 sum
    # $t4 average
    # $t5 min
    # $t6 max
    li $t0, 1
    li $t3, 0
    li $t4, 0


inputCount:
    # Label
    li $v0, 4
    la $a0, count
    syscall

    # Value
    li $v0, 5
    syscall
    add $t1, $v0, $zero

loop:
    bgt $t0, $t1, endLoop
    # Label
    li $v0, 4
    la $a0, input
    syscall

    # Value
    li $v0, 5
    syscall
    add $t2, $v0, $zero

    # newLine
    li $v0, 4
    la $a0, newLine
    syscall

    add $t3, $t3, $t2
    beq $t0, 1, minMaxSet

    minLogic:blt $t2, $t6, minSet
    maxLogic:bgt $t2, $t6, maxSet

    continue:
        addi $t0, $t0, 1
        j loop

minMaxSet:
        add $t5, $t2, $zero
        add $t6, $t2, $zero
        j minLogic

minSet: add $t5, $t2, $zero
        j maxLogic

maxSet: add $t6, $t2, $zero
        j continue

endLoop:
    averageLogic:
        div $t3, $t1
        mflo $t4

    sumPrint:
        # Label
        li $v0, 4
        la $a0, sum
        syscall

        # Value
        li $v0, 1
        add $a0, $t3, $zero
        syscall

        # newLine
        li $v0, 4
        la $a0, newLine
        syscall

    avgPrint:
        # Label
        li $v0, 4
        la $a0, average
        syscall

        # Value
        li $v0, 1
        add $a0, $t4, $zero
        syscall

        # newLine
        li $v0, 4
        la $a0, newLine
        syscall

    minPrint:
        # Label
        li $v0, 4
        la $a0, min
        syscall

        # Value
        li $v0, 1
        add $a0, $t5, $zero
        syscall

        # newLine
        li $v0, 4
        la $a0, newLine
        syscall

    maxPrint:
        # Label
        li $v0, 4
        la $a0, max
        syscall

        # Value
        li $v0, 1
        add $a0, $t6, $zero
        syscall

        # newLine
        li $v0, 4
        la $a0, newLine
        syscall

    endProg:
        li $v0, 10
        syscall
