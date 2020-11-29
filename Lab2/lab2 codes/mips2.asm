

.globl bubbleSort

bubbleSort:
	
	# $a0 beginning adress
	# $a1 size of array
	
	addi $sp, $sp, -20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $t0, 4($sp)
	sw $t1, 0($sp)
initialize:
	move $s0, $a0		# move array adress to s0
	addi $s1, $zero, 1	# $s1 index
	addi $s2, $zero, 1	# controller
	

compare:
	beq $s1, $a1, done   	#done if index = size
	addi $s1, $s1, 1	#increment index
	lw $t0, ($s0)		#take first elemnt to compare	
	lw $t1, 4($s0)		#take second element to compare
	bgt $t0, $t1, change	#if first element is bigger, go to change
moveNext:
	addi $s0, $s0, 4	#increment adress
	j compare
change:
	addi $s2, $zero, 0
	sw $t1, ($s0)
	sw $t0, 4($s0)
	j moveNext
done:
	beqz $s2, initialize
	lw $s0, 16($sp)
	lw $s1, 12($sp)
	lw $s2, 8($sp)
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	addi $sp, $sp, 20
	jr $ra
