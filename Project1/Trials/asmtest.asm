#     F i n d  T u m b l i n g G e o r g e  i n  a  C r o w d
#
#
# This routine finds an exact match of George's face which may be
# rotated in a crowd of tumbling (rotated) faces.
#
# <10/16/13>                               <Sunny Patel>

.data
Array:  .alloc	1024

.text

FindGeorge:	addi	$1, $0, Array		# point to array base
		swi	570			# generate tumbling crowd

# your code goes here


		addi	$1, $0, 0	#initialize index i to 0
		addi	$3, $0, 7	#green pixel
		addi	$4, $0, 8	#black pixel
		addi	$5, $0, 3	#blue pixel
		addi	$6, $0, 1	#white pixel
		addi	$7, $0, 2	#red pixel
		addi	$8, $0, 5	#yellow pixel

Loop:		lb	$2, Array($1)
		beq	$2, $3, CheckDirection	#finds green pixel
		addi	$1, $1, 1		
		addi	$9, $1, 0	
		j	Loop
	
CheckDirection:	addi	$1, $1, 128
		lb	$2, Array($1)
		beq	$2, $4, Check0Yellow
		beq	$2, $6, Check180Yellow
		addi	$1, $1, -130
		lb	$2, Array($1)		
		beq	$2, $4,	Check90Yellow
		beq	$2, $6,	Check270Yellow

Jumping:	addi	$1, $9, 1
		addi	$9, $9, 1
		j	Loop

Check0Yellow:	addi	$1, $1, -127
		lb	$2, Array($1)
		bne	$2, $8, Jumping

Check0Blue:	addi	$1, $1, 447
		lb	$2, Array($1)
		bne	$2, $5, Jumping

Check0White:	addi	$1, $1, -574
		lb	$2, Array($1)
		bne	$2, $6, Jumping

Check0Red:	addi	$1, $1, -64
		lb	$2, Array($1)
		bne	$2, $7, Jumping
		beq	$2, $7, End

Check180Yellow:	addi	$1, $1, -127
		lb	$2, Array($1)
		bne	$2, $8, Jumping

Check180Black:	addi	$1, $1, -129
		lb	$2, Array($1)
		bne	$2, $4, Jumping

Check180Blue:	addi	$1, $1, -320
		lb	$2, Array($1)
		bne	$2, $5, Jumping

Check180Red:	addi	$1, $1, 642
		lb	$2, Array($1)
		bne	$2, $7, Jumping
		beq	$2, $7, End

Check90Yellow:	addi	$1, $1, 66
		lb	$2, Array($1)
		bne	$2, $8, Jumping

Check90Blue:	addi	$1, $1, -71
		lb	$2, Array($1)
		bne	$2, $5, Jumping

Check90White:	addi	$1, $1, 137
		lb	$2, Array($1)
		bne	$2, $6, Jumping

Check90Red:	addi	$1, $1, 1
		lb	$2, Array($1)
		bne	$2, $7, Jumping
		beq	$2, $7, End

Check270Yellow:	addi	$1, $1, 66
		lb	$2, Array($1)
		bne	$2, $8, Jumping

Check270Black:	addi	$1, $1, -62
		lb	$2, Array($1)
		bne	$2, $4, Jumping

Check270Blue:	addi	$1, $1, 5
		lb	$2, Array($1)
		bne	$2, $5, Jumping

Check270Red:	addi	$1, $1, 118
		lb	$2, Array($1)
		bne	$2, $7, Jumping
		beq	$2, $7, End	

End:		addi	$16, $0, 69


# The following instructions only demo the swi's.
# They should be replaced with your code.
add    $2, $0, $9             # mark the 160th pixel
swi	552			# with this swi
add    $2, $0, $1             # mark the 161th pixel
swi	552			# with this swi

lui     $2, 1300                 # guess the 300th and
ori     $2, $2, 2004            # and 1004th pixels

swi	571			# submit answer and check
jr	$31			# return to caller
