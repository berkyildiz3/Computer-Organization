.data

quotient: .asciiz "Quotient is "
remainder: .asciiz "Remainder is "
space: .asciiz "\n"

.text
	li $t0, 80 #divident at t0
	li $t1, 3 #divisor at t1
		
	jal division
	
	#quotient prompt
	la $a0, quotient 
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	#remainder prompt
	la $a0, remainder
	li $v0, 4
	syscall
	
	
	move $a0, $t0
	li $v0, 1
	syscall
	

	li $v0, 10
	syscall
	
division:
	li $t2, 0 # quotient at t2
	
substraction:
	ble $t0, 0, end
	sub $t0, $t0, $t1
	addi $t2, $t2, 1
	j substraction	
	
end:
	beq $t0, 0, endMethod
	add $t0, $t0, $t1
	sub $t2, $t2, 1

endMethod: 
	jr $ra
	

	

	
	
	
	
