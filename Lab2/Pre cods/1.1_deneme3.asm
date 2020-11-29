convertToDec:
move $s1, $a0 # save string to $s1 (base address)
# Initialize
addi $t0, $0, 0 # sum of the digits in decimal
addi $t1, $0, 1 # initilize k
addi $t2, $0, 0 # initilize i
lbu $t3, 0($s1) # get first char
addi $s2, $0, 48 # 0's ASCII value
addi $s3, $0, 55 # 7's ASCII value
move $s4, $s1 # copy of the address of the first char
icounter: # calculate the length of the string
beq $t3, $0, initk
addi $t2, $t2, 1 # i++
addi $s4, $s4, 1
lbu $t3, 0($s4)
j icounter
initk: # count the first factor to multiply the most sign dig by
 beq $t2, 1, endinitk
sll $t1, $t1, 3
addi $t2, $t2, -1
j initk
endinitk:
lbu $t3, 0($s1) # get first char again
loop: # calculate decimal number
 beq $t3, $0, endloop # leave if string char is empty
 # check if char is within 48 and 55
 # which is char is a number
 slt $t5, $t3, $s2
 beq $t5, 1, error
 slt $t5, $s3, $t3
 beq $t5, 1, error
 # convert char to int
 addi $t4, $t3, -48
 mul $t4, $t4, $t1
 # add decicam number to result
add $t0, $t0, $t4
# prep for next loop
addi $s1, $s1, 1
lbu $t3, 0($s1)
srl $t1, $t1, 3
j loop
error: # if not an octal number
addi $s0, $0, -1
endloop:
move $v0, $t0
 jr $ra