.data 
sumRowOutput: 	.asciiz "Row-major summation: "



.text

enterSize:
	li $v0, 250
	move $v1, $v0		# $v1 dimension of the matrix
	move $s2, $v0		# store dimension in s2 to use later
	
	
allocateMatrix:
	mul $v1, $v1, $v1
	sll $a0, $v1, 2 	#allocate memory
	li $v0, 9
	syscall
	
	addi $s0, $v0, 0	# $s0 has beginning address of array
	addi $t0, $zero, 0	# $t0 index
	li $v0, 1
value:	
	beq $t0, $v1, done	
	
	sw $v0, ($s0)
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	addi $v0, $v0, 1
	j value
done:
	sll $t0, $t0, 2 
	sub $v0, $s0, $t0
	
	addi $s0, $v0, 0
	addi $a1, $v1, 0

sumRow:
	move $t4, $s2  #move dimension to t4
	li $t5, 0  #sum  t5
	li $t6, 0 #dimension index
	li $t7, 0 #total address
	li $t8, 0
	mul $t1, $t4, 4 #address increment
	mul $t2, $t4, $t4 #size	
	mul $t7, $t2, 4
	
	la $a0, sumRowOutput
	li $v0, 4
	syscall

	addi $t0, $s0, 0   #address
	add $t7, $t7, $t0 
	li $s1, 0 #index
doRowSum:
	bge $s1, $t2, printSumRow
	addi $s1, $s1, 1
	bge $t6, $t4, cont
cont:
	addi $t6, $t6, 1
	lw $a0, ($t0)
	 
	add $t5, $t5, $a0 
	add $t0, $t0, $t1
	bge $t0, $t7, doRowSum2	
	
	j doRowSum
	
doRowSum2:
	move $t0, $s0
	addi $t8, $t8, 4
	add $t0, $t0, $t8	
	
	j doRowSum
	
printSumRow:
	move $a0, $t5
	li $v0, 1
	syscall

	li $v0, 10
	syscall

	
	
