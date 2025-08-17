_start:
    addi x1, x0, 2
    addi x2, x0, 5
    addi x3, x0, 0

repeat:
    add x3, x3, x1
    add x2, x2, -1
    bne x2, x0, repeat

j . 
