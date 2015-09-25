#     F i n d  T u m b l i n g G e o r g e  i n  a  C r o w d
#
#
# This routine finds an exact match of George's face which may be
# rotated in a crowd of tumbling (rotated) faces.
#
# <date>                               <your name here>

.data
Array:  .alloc    1024

.text

FindGeorge:    addi    $1, $0, Array        # point to array base
        swi    570            # generate tumbling crowd

# your code goes here
        addi     $20, $0, 0
        addi    $21, $0, 0
        addi    $1, $0, 0
        addi     $5, $0, 1 #white
        addi    $6, $0, 2 #red
        addi    $7, $0, 3 #blue
        addi     $8, $0, 5 #yellow
        addi    $9, $0, 7 #green
        addi    $10, $0, 8 #black

loop1:        addi    $20, $20, 256
        slti    $27, $20, 4032    
        beq    $27, $0, reset
        lb    $4, Array($20)
        bne    $4, $5, loop2
        addi    $23, $20, 9
        lb    $4, Array($23)
        beq    $4, $7, ninety
        addi    $23, $20, -9
        lb    $4, Array($23)
        beq    $4, $7, twoseven
        addi    $23, $20, 576
        lb    $4, Array($23)
        beq    $4, $7, normal
        slti    $12, $20, 576
        bne    $12, $0, loop2
        addi    $23, $20, -576
        lb    $4, Array($23)
        beq    $4, $7, upside
        j    loop2

loop2:        addi    $1, $1, 5
        slti    $22, $1, 4096
        beq    $22, $0, exit
        lb    $4, Array($1)
        bne    $4, $5, loop1
        addi    $23, $1, 9
        lb    $4, Array($23)
        beq    $4, $7, ninety
        addi    $23, $1, -9
        lb    $4, Array($23)
        beq    $4, $7, twoseven
        addi    $23, $1, 576
        lb    $4, Array($23)
        beq    $4, $7, normal
        slti    $12, $1, 576
        bne    $12, $0, loop1
        addi    $23, $1, -576
        lb    $4, Array($23)
        beq    $4, $7, upside
        j    loop1

        

reset:        addi    $21, $21, 1
        addi    $20, $21, 0
        slti    $17, $21, 64
        beq    $17, $0, exit
        j    loop1
ninety:        addi    $11, $23, -3
        lb    $4, Array($11)
        beq    $4, $10, ninetymid
        addi    $11, $23, -7
        lb    $4, Array($11)
        beq    $4, $9, ninetyside
        addi    $11, $23, -128
        lb    $4, Array($11)
        bne    $4, $7, ninetyot1
        addi    $11, $23, 128
        lb    $4, Array($11)
        bne    $4, $7, ninetyot2
        j    loop1
ninetyot1:    addi    $23, $23, 64
        j    ninetymid
ninetyot2:    addi    $23, $23, -64
        j    ninetymid
        

ninetyside:    addi    $12, $23, -64
        lb    $4, Array($12)
        bne    $4, $7, ninetyt
        addi    $12, $23, 64
        lb    $4, Array($12)
        bne    $4, $7, ninetyb
        j    loop1
ninetyt:    addi    $23, $23, 128
        j    ninetymid
ninetyb:    addi    $23, $23, -128
        j    ninetymid

ninetymid:    addi    $11, $23, -8
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, -10
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, 123
        lb    $4, Array($11)
        bne    $4, $10, loop1
        addi    $11, $23, -5
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, -7
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, 121
        lb    $4, Array($11)
        bne    $4, $9, loop1
        addi    $24, $23, -11
        add    $2, $24, $0
        sll    $2, $2, 16
        or    $2, $2, $23
        swi    571
        j    exit

twoseven:    addi    $11, $23, 3
        lb    $4, Array($11)
        beq    $4, $10, twosevenmid
        addi    $11, $23, 7
        lb    $4, Array($11)
        beq    $4, $9, twosevenside
        addi    $11, $23, -128
        lb    $4, Array($11)
        bne    $4, $7, twosevenot1
        addi    $11, $23, 128
        lb    $4, Array($11)
        bne    $4, $7, twosevenot2
        j    loop1

twosevenot1:    addi    $23, $23, 64
        j    twosevenmid
twosevenot2:    addi    $23, $23, -64
        j    twosevenmid

twosevenside:    addi    $12, $23, -64
        lb    $4, Array($12)
        bne    $4, $7, twosevent
        addi    $12, $23, 64
        lb    $4, Array($12)
        bne    $4, $7, twosevenb
        j    loop1
twosevent:    addi    $23, $23, 128
        j    twosevenmid
twosevenb:    addi    $23, $23, -128
        j    twosevenmid

twosevenmid:    addi    $11, $23, 8
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, 10
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, -123
        lb    $4, Array($11)
        bne    $4, $10, loop1
        addi    $11, $23, 5
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, 7
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, -121
        lb    $4, Array($11)
        bne    $4, $9, loop1
        addi    $24, $23, 11
        add    $2, $24, $0
        sll    $2, $2, 16
        or    $2, $2, $23
        swi    571
        j    exit

normal:        addi    $11, $23, -192
        lb    $4, Array($11)
        beq    $4, $10, normalmid
        addi    $11, $23, -448
        lb    $4, Array($11)
        beq    $4, $9, normalside
        addi    $11, $23, -2
        lb    $4, Array($11)
        bne    $4, $7, normalot1
        addi    $11, $23, 2
        lb    $4, Array($11)
        bne    $4, $7, normalot2
        j    loop1
normalot1:    addi    $23, $23, 1
        j    normalmid
normalot2:    addi    $23, $23, -1
        j    normalmid

normalside:    addi    $12, $23, -1
        lb    $4, Array($12)
        bne    $4, $7, normalt
        addi    $12, $23, 1
        lb    $4, Array($12)
        bne    $4, $7, normalb
        j    loop1
normalt:    addi    $23, $23, 2
        j    normalmid
normalb:    addi    $23, $23, -2
        j    normalmid
normalmid:    addi    $11, $23, -512
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, -640
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, -318
        lb    $4, Array($11)
        bne    $4, $10, loop1
        addi    $11, $23, -320
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, -448
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, -446
        lb    $4, Array($11)
        bne    $4, $9, loop1
        addi    $24, $23, -704
        add    $2, $24, $0
        sll    $2, $2, 16
        or    $2, $2, $23
        swi    571
        j    exit
upside:        addi    $11, $23, 192
        lb    $4, Array($11)
        beq    $4, $10, upsidemid
        addi    $11, $23, 448
        lb    $4, Array($11)
        beq    $4, $9, upsideside
        addi    $11, $23, -2
        lb    $4, Array($11)
        bne    $4, $7, upsideot1
        addi    $11, $23, 2
        lb    $4, Array($11)
        bne    $4, $7, upsideot2
        j    loop1
upsideot1:    addi    $23, $23, 1
        j    upsidemid
upsideot2:    addi    $23, $23, -1
        j    upsidemid

upsideside:    addi    $12, $23, -1
        lb    $4, Array($12)
        bne    $4, $7, upsidet
        addi    $12, $23, 1
        lb    $4, Array($12)
        bne    $4, $7, upsideb
        j    loop1
upsidet:    addi    $23, $23, 2
        j    upsidemid
upsideb:    addi    $23, $23, -2
        j    upsidemid
upsidemid:    addi    $11, $23, 512
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, 640
        lb    $4, Array($11)
        bne    $4, $6, loop1
        addi    $11, $23, 318
        lb    $4, Array($11)
        bne    $4, $10, loop1
        addi    $11, $23, 320
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, 448
        lb    $4, Array($11)
        bne    $4, $8, loop1
        addi    $11, $23, 446
        lb    $4, Array($11)
        bne    $4, $9, loop1
        addi    $24, $23, 704
        add    $2, $24, $0
        sll    $2, $2, 16
        or    $2, $2, $23
        swi    571
        j    exit
exit:        jr    $31
