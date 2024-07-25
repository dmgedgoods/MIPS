.text
.globl main

main:
    li $v0, 4
    la $a0, msg
    syscall

    jal testfunc

    li $v0, 10
    syscall

testfunc:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    # Do nothing

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

.data
msg: .asciiz "Hello, World!\n"

