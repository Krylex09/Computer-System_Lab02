# Listing 3 - swap two scores in memory
# Memory offsets: scores[0] = 0($s0), scores[4] = 16($s0)
.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # load scores[0] (40) into $t0
    lw   $t1, 16($s0)     # load scores[4] (100) into $t1
    sw   $t1, 0($s0)      # store $t1 (100) into scores[0]
    sw   $t0, 16($s0)     # store $t0 (40) into scores[4]
    li   $v0, 10
    syscall