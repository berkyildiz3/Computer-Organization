.data
array:    .space 400

	prompt0: .asciiz "Enter the size of the array: "
	prompt1: .asciiz "Enter the values of the array (Enter 0 to end): \n"
	option1: .asciiz " 1 - Find summation of numbers stored in the array which is greater than an input number.\n"
	option2: .asciiz " 2 - Find summation of even and odd numbers and display them.\n"
	option3: .asciiz " 3 - Display the number of occurrences of the array elements divisible by a certain input number.\n"
	option4: .asciiz " 4 - Quit\n"
	prompt2: .asciiz " Enter a option: " 
	prompt3: .asciiz " Enter an integer: "
	prompt4: .asciiz " Sum of the odd numbers: \n"
	prompt5: .asciiz " Sum of the even numbers: \n"
	prompt6: .asciiz " Number of Occurence: \n"
   .text
	main:
			
	        	addi $t0, $zero, 0
	           	
	           	
	           	li $v0, 4
			la $a0, prompt0
			syscall
			
			li $v0, 5
	   		syscall
	   		
	   		move $t1, $v0
	   		mul $t2, $t1, 4
						        	
			li $v0, 4
			la $a0, prompt1
			syscall 
		#Create the array with user's inputs
	top: 
	       		li $v0, 5
	       		syscall
	       		beq $v0, 0, done
	       		sw $v0, array($t0)
	       		addi $t0, $t0, 4
	       	
   bottomTest:  	bne $t0, $t2, top
         done:	 	addi $t0, $t0, -4
         	
         menu:		#display option 1
         		li $v0, 4
			la $a0, option1
			syscall 
			
			#display option 2
			li $v0, 4
			la $a0, option2
			syscall 
			
			#display option 3
			li $v0, 4
			la $a0, option3
			syscall 
			
			#display option 4
			li $v0, 4
			la $a0, option4
			syscall 
			
			#display prompt
			li $v0, 4
			la $a0, prompt2
			syscall 
			
			#get option from user
			li $v0, 5
			syscall	
			
			j select
			
			
			
	select: 
			beq $v0, 1, sumGreaterthanInput
			beq $v0, 2, sumEvenOdd
			beq $v0, 3, divisibleOccurence
			beq $v0, 4, exit
			
	sumGreaterthanInput:	
				#prompt
				li $v0, 4
				la $a0, prompt3
				syscall 
				
				#get integer input 
				li $v0, 5
				syscall
				j menu
					
	sumEvenOdd:		
				li $v0, 4
				la $a0, prompt4
				syscall 
				
				li $v0, 4
				la $a0, prompt5
				syscall 
			
				j menu
	
	divisibleOccurence:	
				li $v0, 4
				la $a0, prompt3
				syscall 
				
				li $v0, 5
				syscall
				
				li $v0, 4
				la $a0, prompt6
				syscall
		
				j menu
	
		exit:	
				li $v0, 10
				syscall	
	
              
              
              
              


