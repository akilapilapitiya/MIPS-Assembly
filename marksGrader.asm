    .data
input:  .asciiz "Enter your marks: "
gradeA: .asciiz "Grade A"
gradeB: .asciiz "Grade B"
gradeC: .asciiz "Grade C"
gradeS: .asciiz "Grade S"
gradeF: .asciiz "Grade F"

    .text

    #Label for user input
    li $v0, 4
    la $a0, input
    syscall

    #integerInput
    li $v0, 5
    syscall
    add $t0, $v0, $zero
    

    bge $t0, 75, gradeAExec
    bge $t0, 65, gradeBExec
    bge $t0, 50, gradeCExec
    bge $t0, 35, gradeSExec

    # FSequence if any doesnt work
    li $v0, 4
    la $a0, gradeF
    syscall
    j endSequence

    # ASequence 
gradeAExec: li $v0, 4
            la $a0, gradeA
            syscall
            j endSequence

    # BSequence 
gradeBExec: li $v0, 4
            la $a0, gradeB
            syscall
            j endSequence

    # CSequence 
gradeCExec: li $v0, 4
            la $a0, gradeC
            syscall
            j endSequence

    # SSequence 
gradeSExec: li $v0, 4
            la $a0, gradeS
            syscall
            j endSequence


endSequence:    li $v0, 10
                syscall