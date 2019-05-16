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

ans:
	.word	1100470148
	.word	0

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

	.text
main:

dfs:
