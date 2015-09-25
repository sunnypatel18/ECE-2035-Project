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

FindGeorge:		addi	$1, $0, Array	# point to array base
			swi	570		# generate tumbling crowd
			addi	$3, $0, 7	#green pixel
			addi	$4, $0, 8	#black pixel
			addi	$5, $0, 3	#blue pixel
			addi	$6, $0, 1	#white pixel
			addi	$7, $0, 2	#red pixel
			addi	$8, $0, 5	#yellow pixel
			addi	$1, $0, 0	#initialize index i to 0
			addi	$13,$0, 0	#initialize index j to 0
			addi	$10,$0, 0	#initialize index k to 0

LoopVert:        	addi    $10, $10, 256
			slti    $15, $10, 4096
			beq     $15, $0, VerticalCounter
			lb      $17, Array($10)
			beq     $17, $6, CheckDirection90
			bne	$17, $6, LoopHori

LoopHori:		addi	$1, $1, 5
			slti	$14, $1, 4096
			beq	$14, $0, End
			lb	$17, Array($1)
			beq	$17, $6, Check1Direction90
			bne	$17, $6, LoopVert

VerticalCounter:	addi	$13, $13, 1
			addi	$10, $13, 0
			slti	$12, $13, 64
			beq	$12, $0, End
			j	LoopVert	

CheckDirection0:	addi	$11, $10, 576
			lb	$17, Array($11)
			beq	$17, $5, Check0		# 0 degrees
		
CheckDirection180:	slti	$16, $10, 576
			bne	$16, $0, LoopHori
			addi	$11, $10, -576
			lb	$17, Array($11)
			beq	$17, $5, Check180	# 180 degrees
			bne	$17, $5, LoopHori

CheckDirection90:	addi	$11, $10, 9
			lb	$17, Array($11)		
			beq	$17, $5, Check90	# 90 degrees
		
CheckDirection270:	addi	$11, $10, -9
			lb	$17, Array($11)
			beq	$17, $5, Check270	# 270 degrees
			bne	$17, $5, CheckDirection0

Check1Direction0:	addi	$11, $1, 576
			lb	$17, Array($11)
			beq	$17, $5, Check0		# 0 degrees
			
Check1Direction180:	slti	$16, $1, 576
			bne	$16, $0, LoopHori
			addi	$11, $1, -576
			lb	$17, Array($11)
			beq	$17, $5, Check180 	# 180 degrees		
			bne	$17, $5, LoopVert

Check1Direction90:	addi	$11, $1, 9
			lb	$17, Array($11)		
			beq	$17, $5, Check90	# 90 degrees
			
Check1Direction270:	addi	$11, $1, -9
			lb	$17, Array($11)
			beq	$17, $5, Check270	# 270 degrees
			bne	$17, $5, Check1Direction0

Check0:			addi	$9, $11, -192
			lb	$17, Array($9)
			beq	$17, $4, Check0one
			addi	$9, $11, -448
			lb	$17, Array($9)
			beq	$17, $3, Check0two
			addi	$9, $11, -2
			lb	$17, Array($9)
			bne	$17, $5, Check0three
			addi	$9, $11, 2
			lb	$17, Array($9)
			bne	$17, $5, Check0four
			j	LoopVert

Check0one:		addi	$9, $11, -512
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, -640
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, -318
			lb	$17, Array($9)
			bne	$17, $4, LoopVert
			addi	$9, $11, -320
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, -448
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, -446
			lb	$17, Array($9)
			bne	$17, $3, LoopVert
			addi	$18, $11, -704
			add	$2, $18, $0
			sll	$2, $2, 16
			or	$2, $2, $11
			swi	571
			j	End

Check0two:		addi	$16, $11, -1
			lb	$17, Array($16)
			bne	$17, $5, Check0five
			addi	$16, $11, 1
			lb	$17, Array($16)
			bne	$17, $5, Check0six
			j	LoopVert

Check0three:		addi	$11, $11, 1	#shift to next row
			j	Check0one

Check0four:		addi	$11, $11, -1 #shift to the previous row
			j	Check0one	

Check0five:		addi	$11, $11, 2
			j	Check0one

Check0six:		addi	$11, $11, -2
			j	Check0one
	
Check180:		addi	$9, $11, 192
			lb	$17, Array($9)
			beq	$17, $4, Check180one
			addi	$9, $11, 448
			lb	$17, Array($9)
			beq	$17, $3, Check180two
			addi	$9, $11, -2
			lb	$17, Array($9)
			bne	$17, $5, Check180three
			addi	$9, $11, 2
			lb	$17, Array($9)
			bne	$17, $5, Check180four
			j	LoopVert

Check180one:		addi	$9, $11, 512
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, 640
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, 318
			lb	$17, Array($9)
			bne	$17, $4, LoopVert
			addi	$9, $11, 320
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, 448
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, 446
			lb	$17, Array($9)
			bne	$17, $3, LoopVert
			addi	$18, $11, 704
			add	$2, $18, $0
			sll	$2, $2, 16
			or	$2, $2, $11
			swi	571
			j	End

Check180two:		addi	$16, $11, -1
			lb	$17, Array($16)
			bne	$17, $5, Check180five
			addi	$16, $11, 1
			lb	$17, Array($16)
			bne	$17, $5, Check180six
			j	LoopVert

Check180three:		addi	$11, $11, 1	#shift to next row
			j	Check180one

Check180four:		addi	$11, $11, -1 #shift to the previous row
			j	Check180one	

Check180five:		addi	$11, $11, 2
			j	Check180one

Check180six:		addi	$11, $11, -2
			j	Check180one

Check90:		addi	$9, $11, -3
			lb	$17, Array($9)
			beq	$17, $4, Check90one
			addi	$9, $11, -7
			lb	$17, Array($9)
			beq	$17, $3, Check90two
			addi	$9, $11, -128
			lb	$17, Array($9)
			bne	$17, $5, Check90three
			addi	$9, $11, 128
			lb	$17, Array($9)
			bne	$17, $5, Check90four
			j	LoopVert

Check90one:		addi	$9, $11, -8
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, -10
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, 123
			lb	$17, Array($9)
			bne	$17, $4, LoopVert
			addi	$9, $11, -5
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, -7
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, 121
			lb	$17, Array($9)
			bne	$17, $3, LoopVert
			addi	$18, $11, -11
			add	$2, $18, $0
			sll	$2, $2, 16
			or	$2, $2, $11
			swi	571
			j	End

Check90two:		addi	$16, $11, -64
			lb	$17, Array($16)
			bne	$17, $5, Check90five
			addi	$16, $11, 64
			lb	$17, Array($16)
			bne	$17, $5, Check90six
			j	LoopVert

Check90three:		addi	$11, $11, 64	#shift to next row
			j	Check90one

Check90four:		addi	$11, $11, -64 #shift to the previous row
			j	Check90one	

Check90five:		addi	$11, $11, 128
			j	Check90one

Check90six:		addi	$11, $11, -128
			j	Check90one

Check270:		addi	$9, $11, 3
			lb	$17, Array($9)
			beq	$17, $4, Check270one
			addi	$9, $11, 7
			lb	$17, Array($9)
			beq	$17, $3, Check270two
			addi	$9, $11, -128
			lb	$17, Array($9)
			bne	$17, $5, Check270three
			addi	$9, $11, 128
			lb	$17, Array($9)
			bne	$17, $5, Check270four
			j	LoopVert

Check270one:		addi	$9, $11, 8
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, 10
			lb	$17, Array($9)
			bne	$17, $7, LoopVert
			addi	$9, $11, -123
			lb	$17, Array($9)
			bne	$17, $4, LoopVert
			addi	$9, $11, 5
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, 7
			lb	$17, Array($9)
			bne	$17, $8, LoopVert
			addi	$9, $11, -121
			lb	$17, Array($9)
			bne	$17, $3, LoopVert
			addi	$18, $11, 11
			add	$2, $18, $0
			sll	$2, $2, 16
			or	$2, $2, $11
			swi	571
			j	End

Check270two:		addi	$16, $11, -64
			lb	$17, Array($16)
			bne	$17, $5, Check270five
			addi	$16, $11, 64
			lb	$17, Array($16)
			bne	$17, $5, Check270six
			j	LoopVert

Check270three:		addi	$11, $11, 64	#shift to next row
			j	Check270one

Check270four:		addi	$11, $11, -64 #shift to the previous row
			j	Check270one	

Check270five:		addi	$11, $11, 128
			j	Check270one

Check270six:		addi	$11, $11, -128
			j	Check270one
	
End:			jr	$31
