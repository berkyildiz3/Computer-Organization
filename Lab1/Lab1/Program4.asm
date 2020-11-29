
	#((A/B) - (C+D)) % E
	
.data
	 getA: .asciiz "Enter the value of A: "
	 getB: .asciiz "Enter the value of B: "
	 getC: .asciiz "Enter the value of C: "
	 getD: .asciiz "Enter the value of D: "
	 getE: .asciiz "Enter the value of E: "
	 prompt: .asciiz "Result is : "

.text
	#prompt to get A 
	li $v0, 4
	la $a0, getA
	syscall 
	#get the value of A from user
	li $v0, 5
	syscall
	
	move $t0, $v0 # $t0 = A
	
	#prompt to get B
	li $v0, 4
	la $a0, getB
	syscall 
	#get the value of B from user
	li $v0, 5
	syscall
	
	move $t1, $v0 # $t1 = B
	
	#prompt to get C 
	li $v0, 4
	la $a0, getC
	syscall 
	#get the value of C from user
	li $v0, 5
	syscall
	
	move $t2, $v0 # $t2 = C
	
	#prompt to get D 
	li $v0, 4
	la $a0, getD 
	syscall 
	#get the value of D from user
	li $v0, 5
	syscall
	
	move $t3, $v0 # $t3 = D
	
	#prompt to get E 
	li $v0, 4
	la $a0, getE
	syscall 
	#get the value of E from user
	li $v0, 5
	syscall
	move $t4, $v0 # $t4 = E
	
	
	div $t0, $t1 #$t0 / $t1
	mflo $t5 #$t5 = $t0 / $t1
	sub $t5, $t5, $t2 #$t5 = $t5 - $t2
	sub $t5, $t5, $t3 #$t5 = $t5 - $t3
	div $t5, $t4 #$t5 / $t4
	mfhi $t6 # $t6 = $t5 % $t4
	
	#prompt
	li $v0, 4
	la $a0, prompt
	syscall 
	
	#display the result
	li $v0, 1
	move $a0, $t6
	syscall
	
	#end the program
	li $v0, 10
	syscall
	
	

	
	
	
	