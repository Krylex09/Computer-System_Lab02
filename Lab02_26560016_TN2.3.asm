# Listing 4 - the index of the element is held in a register
# Step 2.3 - Personal Data (D = 6, k = 1, V = 77)
# 1. Update scores[1] = 77 using dynamic address computation (Step 2.2)
# 2. Compute total of 5 elements in $s3 using lw with constant offsets
# 3. Print "Total: " followed by the total value and newline
.data
scores: .word 40, 55, 70, 85, 100
msg_total: .asciiz "Total: "
nl:        .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores         # $s0 = base address of scores[0]


    addi $s1, $zero, 1       # $s1 = k = 1
    addi $t0, $zero, 77      # $t0 = V = 77
    sll  $t1, $s1, 2         # $t1 = k * 4 (byte offset)
    add  $t1, $t1, $s0       # $t1 = address of scores[k]
    sw   $t0, 0($t1)         # store V into scores[k]


    lw   $t2, 0($s0)         # load scores[0] (40)
    lw   $t3, 4($s0)         # load scores[1] (77)
    lw   $t4, 8($s0)         # load scores[2] (70)
    lw   $t5, 12($s0)        # load scores[3] (85)
    lw   $t6, 16($s0)        # load scores[4] (100)

    add  $s3, $t2, $t3       # $s3 = scores[0] + scores[1]
    add  $s3, $s3, $t4       # $s3 += scores[2]
    add  $s3, $s3, $t5       # $s3 += scores[3]
    add  $s3, $s3, $t6       # $s3 += scores[4] (Total = 372)



    li   $v0, 4
    la   $a0, msg_total
    syscall

    li   $v0, 1
    add  $a0, $s3, $zero
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall