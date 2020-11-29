

.globl array
array:
.data
	prompt_size:		.asciiz "Enter the size of the array: "
	prompt_value:		.asciiz "Enter an integer: "
.text
	la $a0, prompt_size
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	move $v1, $v0		# $v1 size of the array
			
	sll $a0, $v1, 2 	#allocate memory
	li $v0, 9
	syscall
	addi $s0, $v0, 0	# $s0 has beginning address of array
	addi $t0, $zero, 0	# $t0 index
value:
	beq $t0, $v1, done
	
	la $a0, prompt_value
	li $v0, 4
	syscall
	li $v0, 5
	syscall 
	
	sw $v0, ($s0)
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	j value
done:
	sll $t0, $t0, 2 
	sub $v0, $s0, $t0
	jr $ra
