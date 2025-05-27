# Enter the Age
# if Age > 18
#     display adult
# else
#     display child

# end

    .data
inputLabel: .asciiz "Enter Your age: "
child: .asciiz "a Child."
adult: .asciiz "an Adult."
output: .asciiz "You are "

    .text
    # $t0, store the age input 
    # $t1, store 18 
    li $t1, 18


    li $v0, 4
    la $a0, inputLabel
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $v0, 4
    la $a0, output
    syscall

# Check for age  reg1, reg2, move condition
ifCondition: bgt $t0, $t1, adultPrint
# below 18
    li $v0, 4
    la $a0, child
    syscall

j programEnd

#Above 18
adultPrint:
    li $v0, 4
    la $a0, adult
    syscall

programEnd:
    li $v0, 10
    syscall




    li $v0, 1
    add $a0, $t1, $zero
    syscall