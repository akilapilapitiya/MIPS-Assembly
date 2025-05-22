# forLoop.asm
	.data
vara: 	.word			# allocate memory for variable a
varb:	.word 0			# allocate memory for variable b and initialize with 0
varc:	.word			# allocate memory for variable c
	.text
	# load addresses of variables a, b and c
main: 	la $a0, vara		# load address of variable a to register 4
	la $a1, varb		# load address of variable b to register 5
	la $a2, varc		# load address of variable c to register 6
	# load values of variables b
	lw $t1, ($a1)		# load word at address in register 5 to register 9
	# a = 1;
	li $t0, 1		# load immediate 1 to register 8
	sw $t0, ($a0)		# store word in register 8 at memory address in register 4
	li $t2, 3		# load immediate 3 to register 10
	# loop condition for (a <= 3)
loop:	bgt $t0, $t2, endLoop	# if value of register 8 is greater than that of register 10, branch to label endLoop
	# loop body b = b + a;
	add $t1, $t1, $t0	# add values of register 9 and register 8 and assign result to register 9
	sw $t1, ($a1)		# store word in register 9 at memory address in register 5
	# loop increment a++;
	addi $t0, $t0, 1	# increment value of register 8 by 1
	sw $t0, ($a0)		# store word in register 8 at memory address in register 4
	# jump to loop condition
	j loop			# jump (unconditional branch) to label loop
	# end loop c = b;
endLoop:sw $t1, ($a2)		# store word in register 9 at memory address in register 6
	# print result in c
	lw $a0, ($a2)		# load word at address in register 6 to register 4
	li $v0, 1		# load immediate 1 (service 1: print integer) to register 2
	syscall			# issue a system call to print integer
	# end program
	li $v0, 10		# load immediate 10 (service 10: terminate program) to register 2
	syscall			# issue a system call to terminate program