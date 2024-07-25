# Name: [Your Name]
# Program to reverse the characters "HAPPY" using a function named reverse5
# The main function calls reverse5 with the characters as parameters
# reverse5 pushes the characters onto the stack and pops them in reverse order

.data
    newline: .asciiz "\n"

.text
.globl main

# Main function
main:
    # Load characters into argument registers
    li $a0, 'H'       # Load 'H' into $a0
    li $a1, 'A'       # Load 'A' into $a1
    li $a2, 'P'       # Load 'P' into $a2
    li $a3, 'P'       # Load 'P' into $a3

    # Load the fifth character 'Y' onto the stack manually since we only have 4 argument registers
    li $t0, 'Y'       # Load 'Y' into $t0
    addi $sp, $sp, -4 # Adjust stack pointer
    sw $t0, 0($sp)    # Push 'Y' onto the stack

    # Call reverse5 function
    jal reverse5

    # Exit program
    li $v0, 10        # Load exit syscall code
    syscall           # Make syscall to exit

# reverse5 function
reverse5:
    # Save the return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Push characters onto the stack
    addi $sp, $sp, -4
    sw $a0, 0($sp)    # Push 'H'

    addi $sp, $sp, -4
    sw $a1, 0($sp)    # Push 'A'

    addi $sp, $sp, -4
    sw $a2, 0($sp)    # Push 'P'

    addi $sp, $sp, -4
    sw $a3, 0($sp)    # Push 'P'

    # Push 'Y' which was already on the stack
    # Load 'Y' into $t0 from stack
    lw $t0, 16($sp)   # 'Y' was pushed before the function call, offset by 16 bytes

    # Print and pop characters in reverse order
    # Print 'Y'
    li $v0, 11        # Load print_char syscall code
    move $a0, $t0     # Move 'Y' into $a0
    syscall           # Print 'Y'

    # Pop 'Y'
    addi $sp, $sp, 4  # Adjust stack pointer to remove 'Y'

    # Print 'P'
    lw $t0, 0($sp)    # Load 'P' from stack
    move $a0, $t0     # Move 'P' into $a0
    syscall           # Print 'P'

    # Pop 'P'
    addi $sp, $sp, 4  # Adjust stack pointer to remove 'P'

    # Print 'P'
    lw $t0, 0($sp)    # Load 'P' from stack
    move $a0, $t0     # Move 'P' into $a0
    syscall           # Print 'P'

    # Pop 'P'
    addi $sp, $sp, 4  # Adjust stack pointer to remove 'P'

    # Print 'A'
    lw $t0, 0($sp)    # Load 'A' from stack
    move $a0, $t0     # Move 'A' into $a0
    syscall           # Print 'A'

    # Pop 'A'
    addi $sp, $sp, 4  # Adjust stack pointer to remove 'A'

    # Print 'H'
    lw $t0, 0($sp)    # Load 'H' from stack
    move $a0, $t0     # Move 'H' into $a0
    syscall           # Print 'H'

    # Pop 'H'
    addi $sp, $sp, 4  # Adjust stack pointer to remove 'H'

    # Restore the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    li $v0, 10
    syscall
