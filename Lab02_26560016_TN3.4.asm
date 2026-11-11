# Listing 8: Capitalize letters at offsets 0, 7, 11 of str1
# Register plan:  $s0 = address of the first byte of str1
# Formula: Capital Letter ASCII = Lower-case Letter ASCII - 32
# Offsets: 0 ('n' -> 'N'), 7 ('v' -> 'V'), 11 ('a' -> 'A')
.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"

.text
.globl main
main:
    la   $s0, str1           # $s0 = base address of str1

    lb   $t0, 0($s0)         # load byte at offset 0
    addi $t0, $t0, -32       # subtract 32 to convert to uppercase
    sb   $t0, 0($s0)         # store modified byte back to offset 0

    lb   $t0, 7($s0)         # load byte at offset 7
    addi $t0, $t0, -32       # subtract 32 to convert to uppercase
    sb   $t0, 7($s0)         # store modified byte back to offset 7

    lb   $t0, 11($s0)        # load byte at offset 11
    addi $t0, $t0, -32       # subtract 32 to convert to uppercase
    sb   $t0, 11($s0)        # store modified byte back to offset 11

    li   $v0, 4              # syscall 4: print string
    add  $a0, $s0, $zero     # address of str1
    syscall

    li   $v0, 4              # syscall 4: print string
    la   $a0, nl             # print newline "\n"
    syscall

    li   $v0, 10             # syscall 10: exit
    syscall
