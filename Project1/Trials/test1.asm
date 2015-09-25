Check0Yellow:		addi	$1, $1, -384
			lb	$2, Array($1)
			bne	$2, $8, Jumping
			addi	$1, $1, 64
			lb	$2, Array($1)
			addi	$1, $1, -64
			bne	$2, $4, Check0Red

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
			beq	$2, $8, Check0Frown

Check0Frown:		addi	$1, $1, 128
			lb	$2, Array($1)
			bne	$2, $4, End 

