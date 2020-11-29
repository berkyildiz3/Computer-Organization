.data 
sumColumnOutput:.asciiz "Column-major summation: "



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

sumColumn:
	li $t5, 0  #sum
	la $a0, sumColumnOutput
	li $v0, 4
	syscall
	
	addi $s1, $zero, 0 #index
	addi $t0, $s0, 0   #address
doColumnSum:
	bge $s1, $a1, printSumColumn
	addi $s1, $s1, 1
	lw $a0, ($t0)
	add $t5, $t5, $a0
	addi $t0, $t0, 4	
	j doColumnSum

printSumColumn:
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall




	
	
