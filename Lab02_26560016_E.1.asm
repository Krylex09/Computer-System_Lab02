# Extension: 3x3 Board in Memory
# Formula: Address = base + 4 * (3 * r + c)
# Note: 3 * r = r + (r << 1)
.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board          # $s0 = base address of board


    addi $s1, $zero, 1       # r = 1
    addi $s2, $zero, 2       # c = 2
    addi $t0, $zero, 1       # value = 1 (mark X)

    sll  $t1, $s1, 1         # $t1 = 2 * r
    add  $t1, $t1, $s1       # $t1 = 2 * r + r = 3 * r
    add  $t1, $t1, $s2       # $t1 = 3 * r + c (element index)

    sll  $t1, $t1, 2         # $t1 = index * 4 (byte offset)
    add  $t1, $t1, $s0       # $t1 = board + offset
    sw   $t0, 0($t1)         # store 1 into cell (1, 2)


    addi $s1, $zero, 2       # r = 2
    addi $s2, $zero, 0       # c = 0
    addi $t0, $zero, 2       # value = 2 (mark O)

    sll  $t1, $s1, 1         # $t1 = 2 * r
    add  $t1, $t1, $s1       # $t1 = 3 * r
    add  $t1, $t1, $s2       # $t1 = 3 * r + c

    sll  $t1, $t1, 2         # $t1 = index * 4
    add  $t1, $t1, $s0       # $t1 = board + offset
    sw   $t0, 0($t1)         # store 2 into cell (2, 0)

    li   $v0, 10
    syscall