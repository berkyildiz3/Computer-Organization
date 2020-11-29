.globl median
median:
	
	
	li $t0 , 2
	div $a1, $t0
	mfhi $t1
	move $t2, $t1
	beqz $t2, ifSizeEven
ifSizeOdd:
	addi $t2, $a1, 1
	div $t2, $t0
	mflo $t2
	sll $t2, $t2, 2		
	add $t2, $t2, $a0
	addi $t2, $t2, -4
	lw $t2, ($t2)
	move $v0, $t2
	jr $ra
ifSizeEven:
	addi $t2, $a1, 0
	div $t2, $t0
	mflo $t2
	sll $t2, $t2, 2		
	add $t2, $t2, $a0
	addi $t2, $t2, -4
	lw $t3, ($t2)
	lw $t4, 4($t2)
	add $t5, $t3, $t4
	div $t5, $t0
	mflo $t6
	move $v0, $t6
	jr $ra
