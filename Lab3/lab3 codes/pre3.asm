Delete_n:
	add $t0, $0, $a0 #pointer
	add $t1, $0, $a1 #value
	
	bne $t1, 1, notHead #Delete first one so head
	
	lw $t7, 0($t0)
	add $v1, $0, $t7
	addi $v0, $0, 0
	j doneDelete
	
notHead :
	add $t6, $t0, $0 #pointer head
	addi $t2, $0, 2 #counter
	
goNthItem :
	beq $t2, $t1, doneGoNthItem
	beq $t6, $0, failGoNthItem # If next is null before 
	
	lw $t7, 0($t6) # next of current node
	add $t6, $0, $t7
	addi $t2, $t2, 1
			
	j goNthItem
	
doneGoNthItem :
	lw $t7, 0($t6)
	lw $t5, 0($t7)
	sw $t5, 0($t6)
	add $v1, $0, $t0
	addi $v0, $0, 0
	j doneDeleteN 
	
failGoNthItem :
	addi $v0, $0, -1
	add $v1, $0, $t0
	doneDeleteN :
	jr $ra
