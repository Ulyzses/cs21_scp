addi    $t1, $0, 25         # $t1 = 25
xori    $t1, $t1, 0x22      # $t1 = 25 ^ 0x22 = 7
addi    $t1, $t1, 0
addi    $t1, $0, 1          # $t1 = 1
xori    $t1, $t1, 0xf000    # $t1 = 1 ^ 0xf000 = 0xf001
addi    $t1, $t1, 0         

lui     $t1, 0x6723         # $t1 = 0x67230000
addi    $t1, $t1, 0         
lui     $t1, 0xf451         # $t1 = 0xf4510000
addi    $t1, $t1, 0

addi    $t2, $0, 0x8        # $t2 = 0x8
srlv    $t1, $t1, $t2       # $t1 = 0xf4510000 >> 0x8 = 0x00f45100
addi    $t1, $t1, 0
addi    $t2, $0, 0x24       # $t2 = 0x24
srlv    $t1, $t1, $t2       # $t1 = 0x00f45100 >> 0x24 = 0x000000f4
addi    $t1, $t1, 0

li      $t1, 0x6723         # $t1 = 0x6723
addi    $t1, $t1, 0
li      $t1, 0xf451         # $t1 = 0xf451
addi    $t1, $t1, 0

addi    $t1, $0, 0          # $t1 = 0
addi    $t2, $0, 2          # $t2 = 2
bgtz    $t2, 0x1            # $t2 > 0, branch forward once
addi    $t1, $t1, 1         # skip
addi    $t1, $t1, 2         # $t1 = 2
addi    $t1, $t1, 0
addi    $t2, $0, 0xfffe     # $t2 = 0xfffe
bgtz    $t2, 0x1            # $t2 < 0, do not branch
addi    $t1, $t1, 1         # $t1 = 3
addi    $t1, $t1, 2         # $t1 = 5
addi    $t1, $t1, 0         # loop here
addi    $t2, $0, 3          # $t2 = 3
bgtz    $t2, 0xfffc         # $t2 > 0, branch back to loop here
addi    $t1, $t1, 1         # unvisited
addi    $t1, $t1, 2
addi    $t1, $t1, 0
