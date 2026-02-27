	slt $t0, $a0, $a1		#if f<l
	beq $t0, $zero, LEAVE
	addi $sp, $sp, -16
	sw $ra, 8($sp)
	sw $a0, 0($sp)			#f
	sw $a1, 4($sp)			#l
	jal partition
	lw $a0, 0($sp)
	addi $a1, $v0, -1		#p-1
	sw $v0, 12($sp)			#p
	jal qsort
	lw $t0, 12($sp)
	addi $a0, $t0, 1		#p+1
	lw $a1, 4($sp)
	jal qsort
	lw $ra, 8($sp)
	addi $sp, $sp, 16
LEAVE: