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

Loop:			addi	$1, $1, 3		
			addi	$9, $1, 0	
			lb	$2, Array($1)
			slti    $10, $1, 4096
			slti	$11, $1, 0
			bne	$11, $0, Set0 	
			beq	$2, $6, CheckDirection	#finds white pixel
			beq	$2, $8, CheckDirection1	#finds yellow pixel
			bne     $10, $0, Loop
			beq	$10, $0, End

Set0:			addi	$1,$0, 0
			j	Loop


CheckDirection:		addi	$1, $1, 576
			lb	$2, Array($1)
			beq	$2, $5, Check0Yellow		# 0 degrees
			addi	$1, $1, -1152
			lb	$2, Array($1)
			beq	$2, $5, Check180Yellow		# 180 degrees
			
CheckDirection1:	addi	$1, $1, -4
			lb	$2, Array($1)		
			beq	$2, $8,	Check90Row2		# 90 degrees
			addi	$1, $1, 8
			lb	$1, Array($1)
			beq	$2, $5,	Check270Row2		# 270 degrees

Jumping:		addi	$1, $9, 3
			addi	$9, $9, 3
			j	Loop

Check0Yellow:		addi	$1, $1, -384
			lb	$2, Array($1)
			bne	$2, $8, Jumping

Check0Red:		addi	$1, $1, -256
			lb	$2, Array($1)
			bne	$2, $7, Jumping
			addi	$1, $1, 128
			lb	$2, Array($1)
			bne	$2, $7, Jumping

Check0EyeRow:		addi	$1, $1, 64
			lb	$2, Array($1)
			beq	$2, $3, Check0Black
			beq	$2, $8, Check0TopWhite
			bne	$2, $3, Jumping
			bne	$2, $8, Jumping

Check0Black:		addi	$1, $1, 128
			lb	$2, Array($1)
			bne	$2, $4, Jumping
			beq	$2, $4, End

Check0TopWhite: 	addi	$1, $1, -256
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check0Yellow1:		addi	$1, $1, 384
			lb	$2, Array($1)
			bne	$2, $8, Jumping	
			beq	$2, $8, End

Check180Yellow:		addi	$1, $1, 384
			lb	$2, Array($1)
			bne	$2, $8, Jumping

Check180Red:		addi	$1, $1, 256
			lb	$2, Array($1)
			bne	$2, $7, Jumping
			addi	$1, $1, -128
			lb	$2, Array($1)
			bne	$2, $7, Jumping

Check180EyeRow: 	addi	$1, $1, -64
			lb	$2, Array($1)
			beq	$2, $3, Check180Black
			beq	$2, $8, Check180TopWhite
			bne	$2, $3, Jumping
			bne	$2, $8, Jumping

Check180Black:		addi	$1, $1, -128
			lb	$2, Array($1)
			bne	$2, $4, Jumping
			beq	$2, $4, End

Check180TopWhite:	addi	$1, $1, 256
			lb	$2, Array($1)
			bne	$2, $6, Jumping
			
Check180Yellow1:	addi	$1, $1, -384
			lb	$2, Array($1)
			bne	$2, $8, Jumping	
			beq	$2, $8, End			

Check90Row2:		addi	$1, $1, 64
			lb	$2, Array($1)
			beq	$2, $8, Check90Black1 #hits yellow pixel
			beq	$2, $4, Check90Green #hits black pixel
			beq	$2, $3, Check90Black #hits green pixel
			bne	$2, $8, Jumping
			bne	$2, $4, Jumping
			bne	$2, $3, Jumping

Check90Black1:		addi	$1, $1, -1
			lb	$2, Array($1)
			beq	$2, $4, Check90Blue
			bne	$2, $4, Jumping

Check90Black2:		addi	$1, $1, 1
			lb	$2, Array($1)
			beq	$2, $4, Check90Blue
			bne	$2, $4, Jumping

Check90Black3:		addi	$1, $1, 2
			lb	$2, Array($1)
			beq	$2, $4, Check90Blue
			bne	$2, $4, Jumping


Check90Green:		addi	$1, $1, 2
			lb	$2, Array($1)
			bne	$2, $3, Jumping

Check90Blue1:		addi	$1, $1, -7
			lb	$2, Array($1)
			bne	$2, $5, Jumping

Check90White1:		addi	$1, $1, 137
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check90Red1:		addi	$1, $1, 1
			lb	$2, Array($1)
			beq	$2, $7, End
			bne	$2, $7, Jumping


Check90Black:		addi	$1, $1, -2
			lb	$2, Array($1)
			bne	$2, $4, Jumping

Check90Blue:		addi	$1, $1, -5
			lb	$2, Array($1)
			bne	$2, $5, Jumping

Check90White:		addi	$1, $1, 137
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check90Red:		addi	$1, $1, 1
			lb	$2, Array($1)
			beq	$2, $7, End
			bne	$2, $7, Jumping

Check270Row2:		addi	$1, $1, 64
			lb	$2, Array($1)
			beq	$2, $8, Check270Black1 #hits yellow pixel
			beq	$2, $4, Check270Green #hits black pixel
			beq	$2, $3, Check270Black #hits green pixel
			bne	$2, $8, Jumping
			bne	$2, $4, Jumping
			bne	$2, $3, Jumping

Check270Black1:		addi	$1, $1, -1
			lb	$2, Array($1)
			beq	$2, $4, Check270Blue
			bne	$2, $4, Jumping

Check270Black2:		addi	$1, $1, 1
			lb	$2, Array($1)
			beq	$2, $4, Check270Blue
			bne	$2, $4, Jumping

Check270Black3:		addi	$1, $1, -2
			lb	$2, Array($1)
			beq	$2, $4, Check270Blue
			bne	$2, $4, Jumping

Check270Green:		addi	$1, $1, -2
			lb	$2, Array($1)
			bne	$2, $3, Jumping

Check270Blue1:		addi	$1, $1, 7
			lb	$2, Array($1)
			bne	$2, $5, Jumping

Check270White1:		addi	$1, $1, 129
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check270Red1:		addi	$1, $1, -1
			lb	$2, Array($1)
			beq	$2, $7, End
			bne	$2, $7, Jumping

Check270Black:		addi	$1, $1, 2
			lb	$2, Array($1)
			bne	$2, $4, Jumping

Check270Blue:		addi	$1, $1, 5
			lb	$2, Array($1)
			bne	$2, $5, Jumping

Check270White:		addi	$1, $1, 129
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check270Red:		addi	$1, $1, -1
			lb	$2, Array($1)
			beq	$2, $7, End
			bne	$2, $7, Jumping

End:			addi	$16, $0, 100


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
