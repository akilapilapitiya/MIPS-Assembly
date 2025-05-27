    .data

    .text
    li $t1, 13
    li $t2, 5

    sub	$t0, $t1, $t2		# $t0 = $t1 - $t2
    subi $t3, $t1, 6


    li $v0, 1
    add $a0, $t3, $zero
    syscall
    
    