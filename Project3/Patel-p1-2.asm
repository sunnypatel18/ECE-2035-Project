# DNA Search
#
#
# This routine counts the number of (possibly overlapping) occurrences
# of a pattern string in an input DNA sequence.
#
# 24 March 2014                               <Sunny Patel>

.data
Input:   	.alloc	600
Array:		.alloc	600

.text
DNAsearch:	addi	$1, $0, Input	# points to base of Input array
		swi	548		# create DNA search
		srl	$3, $2, 16	# pattern length
		andi	$15,$2, 0x7FFF	# pattern
		addi	$4, $0, 0x7FFF  # 15 ones
		addi	$5, $0, 0	# index for Input
		addi	$10,$0, 4800	# exit condition
		sub	$10,$10,$3	# exit condition wih buffer at the end of sequence
		addi	$11,$0, 15 	# used for excess
		addi	$16,$0, 0	# index for Array
		sll	$3, $3, 1	# multiply pattern length 2x
		sub	$12,$11,$3	# subtract to find excess
		srlv	$13,$4, $12	# shift the excessive off
		addi	$19,$0, 7	# max number of shifts
		addi	$22,$0, -1	# position within the Input array

Reset:		addi	$18,$0, 0	# counter for number of shifts
		addi	$21,$0, 2	# increment the srl variable

Loop:		lw	$6, Input($5)	# load word
		addi	$5, $5, 4	# increment index to next word
		lw	$7, Input($5)	# load next word
		sll	$8, $7, 16	# shift by 16
		or	$9, $6, $8	# or it with the lower 16 in next word
		and	$14,$9, $13	# and it with the mask length of the pattern
		addi	$22,$22,1	# increment the position within sequence
		beq	$14,$15,Found	# checks if pattern is found in sequence
		beq	$22,$10,Exit	# checks if the entire sequence is completed

Next:		srlv	$20,$9, $21	# shift the word by value in register 21
		and	$14,$20,$13	# and it with the mask 
		addi	$22,$22,1	# increment the position within sequence 
		addi	$18,$18,1	# increment the number of shifts
		addi	$21,$21,2	# increment the shift value in register 21
		beq	$18,$19,Reset	# checks if the shift limit is reached
		beq	$14,$15,Found	# checks if the pattern is found
		beq	$22,$10,Exit	# checks if the entire sequence is completed
		j	Next		# jump back to Next subroutine
		
Found:		sw	$22, Array($16)	# store indice in array
		#addi	$1, $22,0	# used for highlighting the found pattern
		#swi	549		# same as above
		addi	$16,$16,4	# move to the next word in Array
		j	Next		# jump back to Next subroutine

Exit:		addi	$2, $0, Array	# points to base of Array array
		swi	580		# matches software interrupt
		jr	$31		# return to caller
