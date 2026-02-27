encode:
	sll $t0, $a0, 31
	sll $t1, $a1, 23
	or $t0, $t0, $t1
	sll $t1, $a2
	or $v0, $t0, $t1

decode:
	srl $t0, $a3, 31
	sw $t0, 0($a0)
	sll $t0, $a3, 1
	srl $t0, $t0, 24
	sw $t0, 0($a1)
	sll $t0, $a3, 9
	srl $t0, $t0, 9
	sw $t0, 0($a2)

normalize:
	lw $t0, 0($a0)
	lw $t1, 0($a1)
	REPEAT:
		srl $t2, $t1, 24
		andi $t2, $t2, 255
		beq $t2, $zero, NEXT
		srl $t1, $t1, 1
		addi $t0, $t0, 1
		j REPEAT
	NEXT:
		srl $t2, $t1, 20
		andi, $t2, $t2, 8
		bne $t2, $zero, LEAVE
		sll $t1, $t1, 1
		addi $t0, $t0, -1
		j NEXT
	LEAVE:
		sw $t0, 0($a0)
		sw $t1, 0($a1)

shift_exponentials:
	lw $t0, 0($a0)
	lw $t1, 0($a1)
	lw $t2, 0($a2)
	lw $t3, 0($a3)
	LOOP:
		slt $t4, $t0, $t2
		beq $t4, $zero, OUT
		addi $t0, $t0, 1
		srl $t1, $t1, 1
		j LOOP
	OUT:
		slt $t4, $t2, $t0
		beq $t4, $zero, EXIT
		addi $t2, $t2, 1
		srl $t3, $t3, 1
		j OUT
	EXIT:
		sw $t0, 0($a0)
		sw $t1, 0($a1)
		sw $t2, 0($a2)
		sw $t3, 0($a3)