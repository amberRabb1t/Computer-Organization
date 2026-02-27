	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sll $t0, $a1, 2
	add $t0, $s0, $t0
	lw $s1, 0($t0)		#v[l] / pivot
	move $s2, $a0		#i
	move $s3, $a0		#j
	move $s4, $a1		#l
LOOP:
	slt $t0, $s3, $s4		#if j<l
	beq $t0, $zero, OUT
	sll $t0, $s3, 2
	add $t0, $s0, $t0
	lw $t1, 0($t0)		#v[j]
	slt $t0, $t1, $s1		#if v[j]<pivot
	beq $t0, $zero, GGGONEXT
	move $a0, $s2
	addi $s2, $s2, 1
	move $a1, $s3
	jal swap
GGGONEXT:
	addi $s3, $s3, 1
	j LOOP
OUT:
	move $a0, $s2
	move $a1, $s4
	jal swap
	move $v0, $s2
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 20