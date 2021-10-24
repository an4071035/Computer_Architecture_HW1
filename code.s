.data
numBottles: .word 15
numExchange: .word 4
str: .string "maximum number of water bottles you can drink is "
.text
main:
    lw t1, numBottles
    lw t2, numExchange
    add t3, t1, x0    #drink = numBottles
loop1:
    slt t4, t1, t2    #if numBottles < numExchange: t4 = 1 else t4 = 0
    bnez t4, printf    #if t4 = 1 jump to printf
    add t5, x0, x0    #remain = 0
loop2:
    slt t4, t1, t2    #if numBottles < numExchange: t4 = 1 else t4 = 0
    bnez t4, L1    #if t4 = 1 jump to L1
    sub t1, t1, t2    #numBottles -= numExchange
    addi t5, t5, 1    #remain++
    j loop2
L1:
    add t1, t1, t5    #numBottles += remain
    add t3, t3, t5    #drink += remain
    j loop1
printf:
    la a0, str
    li a7,4                # print string
    ecall 
    mv a0, t3
    li a7, 1               # print integer
    ecall