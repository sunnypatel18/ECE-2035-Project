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
			addi	$10,$10,0	#initialize index j to 0
			addi	$13,$13,0
			addi	$3, $0, 7	#green pixel
			addi	$4, $0, 8	#black pixel
			addi	$5, $0, 3	#blue pixel
			addi	$6, $0, 1	#white pixel
			addi	$7, $0, 2	#red pixel
			addi	$8, $0, 5	#yellow pixel

Loop:			lb	$2, Array($1)
			beq	$2, $6, CheckDirection0		#finds white pixel in 0 and 180 degree direction
			addi	$1, $1, 5		
			addi	$9, $1, 0

			lb	$11, Array($10)
			beq	$11, $6, CheckDirection90	#finds white pixel in 90 and 270 degree direction
			addi	$10, $10, 320
			slti	$14, $10, 1025			# end of the column
			addi	$12, $10, 0
			beq	$14, $0, VerticalCounter
			j	Loop

loop1:        addi    $1, $1, 5
        slti    $22, $20, 3776    
        beq    $22, $0, reset
        addi    $20, $20, 320
        lb    $4, Array($20)
        beq    $4, $5, step1    
        lb    $4, Array($1)
        #beq    $4, $5, step11
        slti    $14, $1, 4096
        bne    $14, $0, loop1

VerticalCounter:	addi	$13, $13, 1
			addi	$10, $13, 0
			j	Loop	

CheckDirection0:	addi	$1, $1, 576
			lb	$2, Array($1)
			beq	$2, $5, Check0Yellow		# 0 degrees
			
CheckDirection180:	addi	$1, $1, -1152
			lb	$2, Array($1)
			beq	$2, $5, Check180Yellow		# 180 degrees			
			bne	$2, $5, Jumping

CheckDirection90:	addi	$10, $10, -9
			lb	$11, Array($10)		
			beq	$11, $5, Check90Yellow		# 90 degrees
			
CheckDirection270:	addi	$10, $10, 18
			lb	$11, Array($1)
			beq	$2, $5,	Check270Yellow		# 270 degrees
			bne	$2, $5, Jumping1

Jumping:		addi	$1, $9, 5
			addi	$9, $9, 5
			j	Loop

Jumping1:		addi	$10, $12, 256
			addi	$12, $12, 256
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

Check0Black1:		addi	$1, $1, 256
			lb	$2, Array($1)	
			beq	$2, $8, Jumping
			bne	$2, $8, End

Check0TopWhite: 	addi	$1, $1, -256
			lb	$2, Array($1)
			bne	$2, $6, Jumping

Check0Yellow1:		addi	$1, $1, 384
			lb	$2, Array($1)
			bne	$2, $8, Jumping

Check0Frown:		addi	$1, $1, 128
			lb	$2, Array($1)
			bne	$2, $8, End 

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

Check180Black1:		addi	$1, $1, -256
			lb	$2, Array($1)	
			beq	$2, $8, Jumping
			bne	$2, $8, End

Check180TopWhite:	addi	$1, $1, 256
			lb	$2, Array($1)
			bne	$2, $6, Jumping
			
Check180Yellow1:	addi	$1, $1, -384
			lb	$2, Array($1)
			bne	$2, $8, Jumping				

Check180Frown:		addi	$1, $1, -128
			lb	$2, Array($1)
			bne	$2, $8, End 

Check90Yellow:		addi	$10, $10, 6
			lb	$11, Array($10)
			bne	$11, $8, Jumping1

Check90Red:		addi	$10, $10, 4
			lb	$11, Array($10)
			bne	$11, $7, Jumping1
			addi	$10, $10, -2
			lb	$11, Array($10)
			bne	$11, $7, Jumping1

Check90EyeRow:  	addi	$10, $10, -1
			lb	$11, Array($10)
			beq	$11, $3, Check180Black
			beq	$11, $8, Check180TopWhite
			bne	$11, $3, Jumping1
			bne	$11, $8, Jumping1

Check90Black:		addi	$10, $10, -2
			lb	$11, Array($10)
			bne	$11, $4, Jumping1
			beq	$11, $4, End

Check90TopWhite:	addi	$10, $10, 4
			lb	$11, Array($10)
			bne	$11, $6, Jumping1

Check90Yellow1:		addi	$10, $10, -6
			lb	$11, Array($10)
			bne	$11, $8, Jumping1	

Check90Frown:		addi	$10, $10, -2
			lb	$11, Array($10)
			bne	$11, $4, End 



Check270Yellow:		addi	$10, $10, -6
			lb	$11, Array($10)
			bne	$11, $8, Jumping1

Check270Red:		addi	$10, $10, -4
			lb	$11, Array($10)
			bne	$11, $7, Jumping1
			addi	$10, $10, 2
			lb	$11, Array($10)
			bne	$11, $7, Jumping1

Check270EyeRow:  	addi	$10, $10, 1
			lb	$11, Array($10)
			beq	$11, $3, Check180Black
			beq	$11, $8, Check180TopWhite
			bne	$11, $3, Jumping1
			bne	$11, $8, Jumping1

Check270Black:		addi	$10, $10, 2
			lb	$11, Array($10)
			bne	$11, $4, Jumping1
			beq	$11, $4, End

Check270TopWhite:	addi	$10, $10, -4
			lb	$11, Array($10)
			bne	$11, $6, Jumping1

Check270Yellow1:	addi	$10, $10, 6
			lb	$11, Array($10)
			bne	$11, $8, Jumping1

Check270Frown:		addi	$10, $10, 2
			lb	$11, Array($10)
			bne	$11, $4, End

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
