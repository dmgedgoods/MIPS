# Shawn McDaniel
# Lab Assignment 7

.data
    newline: .asciiz "\n"

.text
.globl main

# Main function to load characters into the argument registers
main: 
    li $a0, 'H'
    li $a1, 'A'
    li $a2, 'P'
    li $a3, 'P'
    
    li $t0, 'Y'         # there are only 4 argument registers. Y can go into temp
    addi $sp, $sp, -4   # adjust stack pointer
    sw $t0, 0($sp)      # push Y to stack

    jal reverse5        # call the reverse5 function

    li $v0, 10          # load syscall
    syscall             # exit

# reverse5 function to reverse the order of the string
reverse5:
    addi $sp, $sp, -4
    sw $ra, 0($sp)      # save return address

    # push characters to the stack
    addi $sp, $sp, -4
    sw $a0, 0($sp)    # push H

    addi $sp, $sp, -4
    sw $a1, 0($sp)    # push A

    addi $sp, $sp, -4
    sw $a2, 0($sp)    # push P

    addi $sp, $sp, -4
    sw $a3, 0($sp)    # push P

    lw $t0, 20($sp)   # load Y from stack (20 bytes offset from current $sp)

    # print and pop characters in reverse order
    li $v0, 11        # print_char syscall code

    move $a0, $t0     # move Y to $a0
    syscall           # print Y
    addi $sp, $sp, 4  # pop Y from stack

    lw $t0, 0($sp)    # load P from stack
    move $a0, $t0     # move P to $a0
    syscall           # print P
    addi $sp, $sp, 4  # pop P from stack

    lw $t0, 0($sp)    # load P from stack
    move $a0, $t0     # move P to $a0
    syscall           # print P
    addi $sp, $sp, 4  # pop P from stack

    lw $t0, 0($sp)    # load A from stack
    move $a0, $t0     # move A to $a0
    syscall           # print A
    addi $sp, $sp, 4  # pop A from stack

    lw $t0, 0($sp)    # load H from stack
    move $a0, $t0     # move H to $a0
    syscall           # print H
    addi $sp, $sp, 4  # pop H from stack

    # restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    li $v0, 10
    syscall

