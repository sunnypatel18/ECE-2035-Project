#     DNA Search
#
#
# This routine counts the number of (possibly overlapping) occurrences
# of a pattern string in an input DNA sequence.
#
# 24 March 2014                               <your name here>

.data
Input:  .alloc	600
Pattern .alloc  7
Array	.alloc  600

.text

DNAsearch:	addi	$1, $0, Input		# point to input base
		swi	548			# create DNA search

		addi	$3, 0, 0
		addi	$4, 0, 0
		addi	$5, 0, 0
		addi	$6, 0, 0

Pattern:	srlv	$5, $2, $6
		andi	$5, $5, 3
		addi	$6, $6, 2
		beq	
		








# your code goes here

		addi	$1, $0, 5		# highlight position
		swi     549

		addi	$1, $0, 86		# highlight position
		swi     549

		addi	$1, $0, 167		# highlight position
		swi     549
	
                addi    $2, $0, 1               # print the output
		#swi	xxx			# 
		jr	$31			# return to caller
