

main:
.data
	prompt0:	.asciiz "(1) Create array.\n"
	prompt1:	.asciiz "(3) Bubble sort.\n"
	prompt2:	.asciiz "(2) Find the second minimum and second maximum values of the array.\n"
	prompt3:	.asciiz "(4) Find the median.\n"
	prompt4:	.asciiz "(5) Print the array.\n"
	prompt5:	.asciiz "(6) Quit.\n"
	prompt6:	.asciiz " is the second minimum." 
	prompt7:	.asciiz " is the second maximum." 
	prompt8:	.asciiz "Elements of the array are: "
	prompt9: 	.asciiz " is the median"
	blank:		.asciiz " "
	line: 		.asciiz "\n"
	
.text
menu:
	la $a0, line
	li $v0, 4
	syscall
	la $a0, line
	li $v0, 4
	syscall
	la $a0, prompt0
	li $v0, 4
	syscall
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 4
	la $a0, prompt1
	syscall
	li $v0, 4
	la $a0, prompt3
	syscall
	li $v0, 4
	la $a0, prompt4
	syscall
	li $v0, 4
	la $a0, prompt5
	syscall
	li $v0, 4
	li $v0, 5
	syscall
	# move to the appropriate branch
	addi $a0, $s0, 0
	beq $v0, 1, createArray
	beq $v0, 3, sortArray
	beq $v0, 2, findMinMax2nd
	beq $v0, 4, findMedian
	beq $v0, 5, printer
	bne $v0, 6, menu
	# or quit
	li $v0, 10
	syscall

createArray:
	jal array
	addi $s0, $v0, 0
	addi $a1, $v1, 0
	j menu
sortArray:
	jal bubbleSort
	j menu
	
findMinMax2nd:
	jal minMax2nd
	
		
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0, prompt6
	li $v0, 4
	syscall
	
	la $a0, line
	li $v0, 4
	syscall
	
	
	
	move $a0, $v1
	li $v0, 1
	syscall
	
	la $a0, prompt7
	li $v0, 4
	syscall
	j menu
	
findMedian:
	jal median
	addi $a0, $v0, 0
	li $v0, 1
	syscall
	la $a0, prompt9
	li $v0, 4
	syscall
	j menu

printer:
	la $a0, prompt8
	li $v0, 4
	syscall
	
	addi $s1, $zero, 0 #index
	addi $t0, $s0, 0	#address
do:
	bge $s1, $a1, menu
	addi $s1, $s1, 1
	lw $a0, ($t0)
	addi $t0, $t0, 4
	
	li $v0, 1
	syscall
	la $a0, blank
	li $v0, 4
	syscall
	j do
	
	

indexDisplay:
	la $a0, promptInputI
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	move $t3, $v0 #move i to t3
	
	la $a0, promptInputJ
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	move $t4, $v0 #move j to t4
	
	la $a0, line
	li $v0, 4
	syscall
	
	#calculate index -> (j-1) * dimension + i
	addi $t4, $t4, -1
	mul $t4, $t4, $s2
	add $t4, $t4, $t3
	
	la $a0, promptIndexOut
	li $v0, 4
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall 	

