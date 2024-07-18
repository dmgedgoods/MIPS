# Shawn McDaniel
# CS270 
# Assignment Lab 6

.data

.text
.globl main

main:
    # Load four int values into registers $t0, $t1, $t2, and $t3
    li $t0, 10 # 10 is example value 1
    li $t1, 20 # 20 is value 2
    li $t2, 30 # 30 is value 3
    li $t3, 40 # 40 is value 4

    # Push all values to the stack
    addi $sp, $sp, -16
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $t3, 12($sp)

    # Move parameters
    lw $a0, 0($sp)
    lw $a1, 4($sp)
    lw $a2, 8($sp)
    lw $a3, 12($sp)

    jal add4 # call add4

    move $s1, $v0 # get sum from $v0 and stroe it in $s1

    # Clean up
    addi $sp, $sp, 16

    # Add exit or the program keeps running
    li $v0, 10 # exit
    syscall

add4:
    # add 4 parameters
    add $t0, $a0, $a1
    add $t0, $t0, $a2
    add $v0, $t0, $a3

    # return
    jr $ra
