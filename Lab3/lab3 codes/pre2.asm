.data



.text
li $t0, 345 #integer to compute
li $t1, 10
li $t3, 0 #sum of digits

sum:
	div $t0,$t1             
	mflo $t0                
	mfhi $t2                
	add $t3,$t3,$t2         
	beq $t0,$0, end   
	j sum
end:
move $a0, $t3
li $v0, 1
syscall

li $v0,10
syscall
