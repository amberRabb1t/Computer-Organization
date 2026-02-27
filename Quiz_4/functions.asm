partition:
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
	
qsort:
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