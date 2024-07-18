# 3.15 Lab Assignment 5
# Shawn McDaniel

    .data
    # Our data for the assignement
tenints:  .word 3, 17, 12, 9, 36, 102, 81, 500, -1, 9 # ten ints is really just words
target:  .word 767 # Target value, as word 
result:  .word 0 #Starting result

    .text
    .globl main

main:
    # Register initialization
    la   $t1, tenints   # Load address of the array
    li   $t2, 10        # Load the number of elements in the array
    li   $t3, 0         # Sum register, initially 0
    li   $t4, 0         # Loop index register, initially 0
    lw   $t5, target    # Load the target value 767

loop:
    # The loop
    beq  $t4, $t2, check_sum   # If index equals number of elements, exit loop
    lw   $t6, 0($t1)           # Load the array element into $t6
    add  $t3, $t3, $t6         # Add the element to the sum
    addi $t1, $t1, 4           # Move to the next element
    addi $t4, $t4, 1           # Increment the index
    j    loop                  # Jump back to the beginning of the loop

check_sum:
    # First check
    blt  $t3, $t5, less_than   # If sum < 767, jump to less_than
    bgt  $t3, $t5, greater_than # If sum > 767, jump to greater_than
    beq  $t3, $t5, equal_to    # If sum == 767, jump to equal_to

less_than:
    # Set less than 
    li   $t0, -1               # Set $t0 to -1
    j    end                   # Jump to end

greater_than:
    # Set greater than
    li   $t0, 1                # Set $t0 to 1
    j    end                   # Jump to end

equal_to:
    # Set equal to
    li   $t0, 0                # Set $t0 to 0

end:
    # End of program
    nop   
