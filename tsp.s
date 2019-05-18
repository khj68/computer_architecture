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
	.word	1100470148
	.word	0

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
	li		$a2, 0
	jal		dfs				# call dfs
	
	la		$a0, test  # TODO: it is just test
	jal		print_path		# call print_path
	
	li   $v0, 10		# terminate program
    syscall

print_path:
	move 	$s1, $a0		# $s1 = $a0
	addi	$sp, $sp, -8
	sw		$ra, 4($sp)
	sw		$a0, 0($sp)

	li		$t1, 7		# $t1 = 7
	li		$t3, 0		# i = 0
	L1:
		bge		$t3, $t1, print_path_end	# if i >= 7 then print_path_end
		sll		$t4, $t3, 2		# i * 4 (offset)
		add		$t4, $s1, $t4	# arr[i]
		
		lw		$a0, 0($t4)		# $a0 = arr[i]
		li		$v0, 1			# print integer
		syscall

		la		$a0, space		# print space
		li		$v0, 4
		syscall

		addiu	$t3, $t3, 1		# i++
		b		L1				# branch to L1
	print_path_end:
		la		$a0, newline	# print newline (not really useful for here)
		li		$v0, 4
		syscall

		lw		$a0, 0($sp)
		lw		$ra, 4($sp)
		addi	$sp, $sp, 8
		jr		$ra			# jump to $ra

# TODO: implement dfs
dfs:
	jr		$ra				# jump to $ra
