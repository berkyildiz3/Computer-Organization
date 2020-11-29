
.data
	
	array:	.space 400
	maximumSize: .word 100
	prompt0: .asciiz "Enter the size of the array: "
	prompt1: .asciiz "Enter a value: "
	option1: .asciiz " 1 - Find summation of numbers stored in the array which is greater than an input number.\n"
	option2: .asciiz " 2 - Find summation of even and odd numbers and display them.\n"
	option3: .asciiz " 3 - Display the number of occurrences of the array elements divisible by a certain input number.\n"
	option4: .asciiz " 4 - Quit\n"
	prompt2: .asciiz "Sum: "
	prompt3: .asciiz " Enter an integer: "
	prompt4: .asciiz " Sum of the odd numbers: "
	prompt5: .asciiz " Sum of the even numbers: "
	prompt6: .asciiz " Number of Occurence: "
	line:	.asciiz "\n"

.text
	lw $s0, maximumSize	
	la $s1, array
size:
	li $v0, 4
	la $a0, prompt0
	syscall
	
	li $v0, 5
	syscall
	
	bgt $v0, $s0, size #if input is higher, again ask for array size
	addi $s0, $v0, 0 #s0 max size
	sll $s2, $s0, 2 #size is at $s2
	
	li $s3, 0 #index
	
arrayElements:
	bge $s3, $s2, main #check if index reaches to size
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, array($s3)
	addi $s3, $s3, 4 #increment index
	
	j arrayElements

main:
	li $v0, 4
	la $a0, option1
	syscall
	
	la $a0, option2
	syscall
	
	la $a0, option3
	syscall
	
	la $a0, option4
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, mainOption1
	beq $v0, 2, mainOption2
	beq $v0, 3, mainOption3
	bne $v0, 4, main
	
	li $v0, 10
	syscall
	
mainOption1:
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 5
	syscall
	
	li $s3, 0 #index
	add $s4, $v0, $zero #user input
	li $s5, 0 #sum
	
sumOperation:
	bge $s3, $s2, printSum #if index reaches the end, prints the sum
	lw $s6, array($s3)
	addi $s3, $s3, 4 #increment index
	ble $s6, $s4, sumOperation #if input smaller than the array element, sum 
	add $s5, $s5, $s6 #update sum
	
	j sumOperation
	
printSum:
	li $v0, 4
	la $a0, prompt2
	syscall
	
	add $a0, $s5, $zero
	li $v0, 1
	syscall
	
	la $a0, line
	li $v0, 4
	syscall	
	
	j main

mainOption2:
	addi $s3, $zero, 0 #index
	addi $s4, $zero, 0 # sum of even 
	addi $s5, $zero, 0 # sum of odd 
evenOdd:
	bge $s3, $s2, printEvenOdd
	lw $s6, array($s3)
	addi $s3, $s3, 4
	addi $t8, $zero, 2
	rem $s7, $s6, $t8
	bne $s7, $zero, odd #if num is odd, send to odd
	add $s5, $s5, $s6 #if not odd,  add up to even

	j evenOdd
	
odd:
	add $s4, $s4, $s6
	
	j evenOdd
	
printEvenOdd:
	li $v0, 4
	la $a0, prompt4
	syscall
	
	li $v0, 1	
	addi $a0, $s4, 0
	syscall
	
	li $v0, 4		
	la $a0, line
	syscall
	
	li $v0, 4
	la $a0, prompt5
	syscall
	
	li $v0, 1		
	addi $a0, $s5, 0
	syscall
	
	li $v0, 4		
	la $a0, line
	syscall
	
	j main
	
mainOption3:
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 5
	syscall
	
	addi $s3, $zero, 0 #index
	addi $s4, $v0, 0 #number
	addi $s5, $zero, 0 #number of occurence
	
occurence:
	bge $s3, $s2, printOccurence
	lw $s6, array($s3)
	addi $s3, $s3, 4
	div $s6, $s4
	mfhi $s6
	bne $s6, $zero, occurence
	addi $s5, $s5, 1
	
	j occurence
	
printOccurence:
	li $v0, 4
	la $a0, prompt6
	syscall
	
	li $v0, 1
	addi $a0, $s5, 0
	syscall
	
	li $v0, 4
	la $a0, line
	syscall
	
	j main
