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
    addi $sp, $sp, -4   # load the stack pointer and adjust its position
    sw $t0, 0($sp)      # push Y to stack

    jal reverse5        # call the reverse5 function

    li $v0, 10          # load syscall
    syscall             # exit

# reverse5 function to reverse the order of the string
reverse5:
    addi $sp, $sp, -4
    sw $ra, 0($sp)      #return address saved

    # push characters to the stack
    addi $sp, $sp, -4
    sw $a0, 0($sp)    # H

    addi $sp, $sp, -4
    sw $a1, 0($sp)    # A

    addi $sp, $sp, -4
    sw $a2, 0($sp)    # P

    addi $sp, $sp, -4
    sw $a3, 0($sp)    # P

    lw $t0, 16($sp)   # push Y to stack with 16 byte offset

    # print and pop characters in reverse order
    li $v0, 11        # load print_char syscall code
    move $a0, $t0     # move Y to $a0
    syscall           # Print 'Y'

    # pop Y
    addi $sp, $sp, 4 

    lw $t0, 0($sp)    # load P from stack
    move $a0, $t0     # move P to $a0
    syscall           # print P

    # pop P
    addi $sp, $sp, 4 

    lw $t0, 0($sp)    # load P from stack
    move $a0, $t0     # move P into $a0
    syscall           # print P

    # popP
    addi $sp, $sp, 4 

    lw $t0, 0($sp)    # load A from stack
    move $a0, $t0     # move A into $a0
    syscall           # print A

    # pop A
    addi $sp, $sp, 4 

    lw $t0, 0($sp)    # load H from stack
    move $a0, $t0     # move H to $a0
    syscall           # print H

    # pop H
    addi $sp, $sp, 4  

    # restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    li $v0, 10
    syscall
