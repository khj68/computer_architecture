# SWE3005 Computer Architectures
# Prof. Hee Yong Youn
# 2019 Spring Course Project
# TSP on MIPS
# Phase 2: Manually compile into MIPS
# Team. 20: Hyungjun Kim, Ju-eun Park

.data
cities:		# city num, x, y
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

# TODO: ?
ans:
	.double	100000000.0

# TODO: which strategy should be used?
arr:	# array for distance
	.double	0.000000	# row 1
	.double 10.000000
	.double 4.472136
	.double 9.219544
	.double 3.162278
	.double 9.848858
	.double 3.605551
	.double 10.000000	# row 2
	.double 0.000000
	.double 6.324555
	.double 2.236068
	.double 7.615773
	.double 2.236068
	.double 6.708204
	.double 4.472136	# row 3
	.double 6.324555
	.double 0.000000
	.double 5.000000
	.double 1.414214
	.double 7.000000
	.double 1.000000
	.double 9.219544	# row 4	
	.double 2.236068
	.double 5.000000
	.double 0.000000
	.double 6.403124
	.double 4.242641
	.double 5.656854
	.double 3.162278	# row 5
	.double 7.615773
	.double 1.414214
	.double 6.403124
	.double 0.000000
	.double 8.062258
	.double 1.000000 
	.double 9.848858	# row 6
	.double 2.236068
	.double 7.000000
	.double 4.242641
	.double 8.062258
	.double 0.000000
	.double 7.071068
	.double 3.605551	# row 7
	.double 6.708204
	.double 1.000000
	.double 5.656854
	.double 1.000000
	.double 7.071068
	.double 0.000000

visit:			.space 28	# int visit[7];
shortest_path:	.space 28	# int shortest_path[7];
current_path:	.space 28	# int current_path[7];
space:			.asciiz " "
newline:		.asciiz "\n"

test:			.word 1, 2, 3, 4, 5, 6, 7

.text
main:
	li		$a0, 0
	li		$a1, 0
	ldc1	$f14, 0
	jal		dfs				# call dfs
	
	la		$a0, test  # TODO: it is just test
	jal		print_path		# call print_path

	la		$a0, shortest_path
	jal		print_path
	
	li   $v0, 10		# terminate program
    syscall

print_path:
	addi	$sp, $sp, -8
	sw		$ra, 4($sp)
	sw		$a0, 0($sp)

	li		$t1, 7		# $t1 = 7
	li		$t3, 0		# i = 0
	L1:
		bge		$t3, $t1, print_path_dfs_end	# if i >= 7 then print_path_dfs_end
		sll		$t4, $t3, 2		# i * 4 (offset)
		add		$t4, $a0, $t4	# arr[i]
		
		lw		$a0, 0($t4)		# $a0 = arr[i]
		li		$v0, 1			# print integer
		syscall

		la		$a0, space		# print space
		li		$v0, 4
		syscall

		addiu	$t3, $t3, 1		# i++
		b		L1				# branch to L1
	print_path_dfs_end:
		la		$a0, newline	# print newline (not really useful for here)
		li		$v0, 4
		syscall

		lw		$a0, 0($sp)
		lw		$ra, 4($sp)
		addi	$sp, $sp, 8
		jr		$ra			# jump to $ra

save_path:
	li		$t1, 7
	li		$t3, 0
	L3:
		bge		$t3, $t1, save_path_end
		sll		$t4, $t3, 2
		la 		$s3, current_path
		add		$t4, $s3, $t3

		lw		$s1, 0($t4)
		sw		$s1, 0($s3)

		addiu	$t3, $t3, 1
		b		L3			# branch to L3
	save_path_end:
		jr		$ra

dfs:  # $a0 - n,  $a1 - depth, $f14 - sum, $t2 - i
	beq $a1, 6, dfs_end   # if depth == 6 then end

	addi	$sp, $sp, -16
	sw		$ra, 12($sp)
	sw		$a0, 8($sp)
	sw		$a1, 4($sp)
	sdc1		$f14, 0($sp)

	li		$t2, 0   # $t2 is i
	L2: 
		addi	$t2, $t2, 1       # i
		sll		$t3, $t2, 2
		la		$s1, visit
		lw		$t6, 0($s1)
		add		$t4, $t3, $t6		# TODO: address
		lw		$t5, 0($t4)			# visit[i]
		beq		$t5, 1, L2			# if visit[i] == 1 continue;

		la		$t0, arr			# $t0 = &arr TODO:?
		mul		$t1, $a0, 7
		add		$t1, $t1, $t2
		mul		$t1, $t1, 8
		add		$t0, $t0, $t1
		ldc1	$f1, 0($t0)
		add.d	$f0, $f1, $f14    # sum+arr[n][i]
		ldc1	$f2, ans
		c.lt.d	$f0, $f2
		bc1t	L2
		
		addi	$t5, $zero, 1
		sw		$t5, 0($t4)
		lw		$t6, cityi+0		# cities[i].num
		addi	$t7, $a1, 1			# depth+1
		mul		$t8, $t7, 4
		la		$s2, current_path
		lw		$t4, 0($s2)
		add		$t8, $t8, $t4		# TODO: address
		sw		$t6, 0($t8)

		move	$t2, $a0	# save next argument 
		move	$t7, $a1	# TODO: 순서???
		mtc1	$f0, $f14	# TODO: error!!!
		jal		dfs			# call dfs
		
		sw		$zero, 0($t4)   # visit[i] = 0
		jr		$ra
	dfs_end: 
		move	$t0, 0(arr)		# $t0 = &arr TODO:?
		mul		$t1, $a0, 7
		mul		$t1, $t1, 8
		add		$t0, $t0, $t1
		ldc1	$f1, 0($t0)
		add.d	$f2, $f14, $f1      #sum += arr[n][0]
		c.lt.d	$f2, ans	      # if sum < ans
		bc1t	save		      # save_path
		jr		$ra
	save: 
		mtc1 $f0, ans	      # ans = sum
		jal save_path

		lw		$f14, 0($sp)
		lw		$a1, 4($sp)
		lw		$a0, 8($sp)
		lw		$ra, 12($sp)
		addi	$sp, $sp, 16
		jr $ra
