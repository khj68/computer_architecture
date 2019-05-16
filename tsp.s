	.file	1 "tsp.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.globl	cities
	.data
	.align	2
	.type	cities, @object
	.size	cities, 84
cities:
	.word	1
	.word	0
	.word	0
	.word	2
	.word	8
	.word	6
	.word	3
	.word	2
	.word	4
	.word	4
	.word	6
	.word	7
	.word	5
	.word	1
	.word	3
	.word	6
	.word	9
	.word	4
	.word	7
	.word	2
	.word	3

	.comm	visit,28,4
	.globl	ans
	.align	3
	.type	ans, @object
	.size	ans, 8
ans:
	.word	1100470148
	.word	0

	.comm	arr,392,8

	.comm	current_path,28,4

	.comm	shortest_path,28,4
	.text
	.align	2
	.globl	save_path
	.set	nomips16
	.set	nomicromips
	.ent	save_path
	.type	save_path, @function
save_path:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$0,4($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L3:
	lw	$3,%got(current_path)($28)
	lw	$2,4($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,%got(shortest_path)($28)
	lw	$2,4($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L2:
	lw	$2,4($fp)
	slt	$2,$2,7
	bne	$2,$0,$L3
	nop

	nop
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	save_path
	.size	save_path, .-save_path
	.align	2
	.globl	distance
	.set	nomips16
	.set	nomicromips
	.ent	distance
	.type	distance, @function
distance:
	.frame	$fp,40,$31		# vars= 0, regs= 2/2, args= 16, gp= 8
	.mask	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,28($sp)
	sw	$fp,24($sp)
	sdc1	$f20,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$2,40($fp)
	lw	$3,4($2)
	lw	$2,44($fp)
	lw	$2,4($2)
	subu	$2,$3,$2
	mtc1	$2,$f0
	cvt.d.w	$f0,$f0
	lui	$2,%hi($LC0)
	ldc1	$f2,%lo($LC0)($2)
	mov.d	$f14,$f2
	mov.d	$f12,$f0
	lw	$2,%call16(pow)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pow
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mov.d	$f20,$f0
	lw	$2,40($fp)
	lw	$3,8($2)
	lw	$2,44($fp)
	lw	$2,8($2)
	subu	$2,$3,$2
	mtc1	$2,$f0
	cvt.d.w	$f0,$f0
	lui	$2,%hi($LC0)
	ldc1	$f2,%lo($LC0)($2)
	mov.d	$f14,$f2
	mov.d	$f12,$f0
	lw	$2,%call16(pow)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,pow
1:	jalr	$25
	nop

	lw	$28,16($fp)
	add.d	$f0,$f20,$f0
	mov.d	$f12,$f0
	lw	$2,%call16(sqrt)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,sqrt
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	ldc1	$f20,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	distance
	.size	distance, .-distance
	.rdata
	.align	2
$LC1:
	.ascii	"%d \000"
	.text
	.align	2
	.globl	print_path
	.set	nomips16
	.set	nomicromips
	.ent	print_path
	.type	print_path, @function
print_path:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L7
	nop

	.option	pic2
$L8:
	lw	$2,28($fp)
	sll	$2,$2,2
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$5,$2
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L7:
	lw	$2,28($fp)
	slt	$2,$2,7
	bne	$2,$0,$L8
	nop

	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	print_path
	.size	print_path, .-print_path
	.align	2
	.globl	dfs
	.set	nomips16
	.set	nomicromips
	.ent	dfs
	.type	dfs, @function
dfs:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$7,52($fp)
	sw	$6,48($fp)
	lw	$3,44($fp)
	li	$2,6			# 0x6
	bne	$3,$2,$L10
	nop

	lw	$4,%got(arr)($28)
	lw	$3,40($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f0,0($2)
	ldc1	$f2,48($fp)
	add.d	$f0,$f2,$f0
	sdc1	$f0,48($fp)
	lui	$2,%hi(ans)
	ldc1	$f0,%lo(ans)($2)
	ldc1	$f2,48($fp)
	c.lt.d	$fcc0,$f2,$f0
	bc1t	$fcc0,$L19
	nop

	.option	pic0
	b	$L9
	nop

	.option	pic2
$L19:
	lui	$2,%hi(ans)
	ldc1	$f0,48($fp)
	sdc1	$f0,%lo(ans)($2)
	.option	pic0
	jal	save_path
	nop

	.option	pic2
	lw	$28,16($fp)
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L10:
	li	$2,1			# 0x1
	sw	$2,28($fp)
	.option	pic0
	b	$L14
	nop

	.option	pic2
$L18:
	lw	$3,%got(visit)($28)
	lw	$2,28($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L21
	nop

	lw	$4,%got(arr)($28)
	lw	$3,40($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f2,0($2)
	ldc1	$f0,48($fp)
	add.d	$f2,$f2,$f0
	lui	$2,%hi(ans)
	ldc1	$f0,%lo(ans)($2)
	c.lt.d	$fcc1,$f2,$f0
	bc1f	$fcc1,$L16
	nop

	lw	$3,%got(visit)($28)
	lw	$2,28($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sw	$3,0($2)
	lw	$2,44($fp)
	addiu	$5,$2,1
	lui	$4,%hi(cities)
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$4,%lo(cities)
	addu	$2,$2,$3
	lw	$3,0($2)
	lw	$4,%got(current_path)($28)
	sll	$2,$5,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,44($fp)
	addiu	$5,$2,1
	lw	$4,%got(arr)($28)
	lw	$3,40($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f2,0($2)
	ldc1	$f0,48($fp)
	add.d	$f0,$f2,$f0
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lw	$4,28($fp)
	.option	pic0
	jal	dfs
	nop

	.option	pic2
	lw	$28,16($fp)
	lw	$3,%got(visit)($28)
	lw	$2,28($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$0,0($2)
	.option	pic0
	b	$L16
	nop

	.option	pic2
$L21:
	nop
$L16:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L14:
	lw	$2,28($fp)
	slt	$2,$2,7
	bne	$2,$0,$L18
	nop

$L9:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	dfs
	.size	dfs, .-dfs
	.rdata
	.align	2
$LC2:
	.ascii	"SHORTEST PATH : \000"
	.align	2
$LC3:
	.ascii	"DISTANCE : %f\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$0,24($fp)
	.option	pic0
	b	$L23
	nop

	.option	pic2
$L26:
	sw	$0,28($fp)
	.option	pic0
	b	$L24
	nop

	.option	pic2
$L25:
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,2
	lui	$3,%hi(cities)
	addiu	$3,$3,%lo(cities)
	addu	$4,$2,$3
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,2
	lui	$3,%hi(cities)
	addiu	$3,$3,%lo(cities)
	addu	$2,$2,$3
	move	$5,$2
	.option	pic0
	jal	distance
	nop

	.option	pic2
	lw	$28,16($fp)
	lw	$4,%got(arr)($28)
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	sdc1	$f0,0($2)
	lw	$4,%got(arr)($28)
	lw	$3,24($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	lw	$3,28($fp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f0,0($2)
	lw	$4,%got(arr)($28)
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	lw	$3,24($fp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	sdc1	$f0,0($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L24:
	lw	$3,28($fp)
	lw	$2,24($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L25
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L23:
	lw	$2,24($fp)
	slt	$2,$2,7
	bne	$2,$0,$L26
	nop

	lw	$2,%got(shortest_path)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	lw	$2,%got(current_path)($28)
	li	$3,1			# 0x1
	sw	$3,0($2)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	move	$4,$0
	.option	pic0
	jal	dfs
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi($LC2)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,%got(shortest_path)($28)
	.option	pic0
	jal	print_path
	nop

	.option	pic2
	lw	$28,16($fp)
	lui	$2,%hi(ans)
	ldc1	$f0,%lo(ans)($2)
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC0:
	.word	1073741824
	.word	0
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
