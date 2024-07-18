# 3.14 assignment 4
# Shawn McDaniel

.data
a:  .word 5    # Information given for assignment: Label a with value 5

.text
.globl main

main:
    # Load the value of 'a' into register $t1
    la   $t1, a       # Load address of label 'a' into $t1
    lw   $t2, 0($t1)  # Load the value of 'a' into $t2

    # Conditional logic
    bltz $t2, less_than_zero    # If $t2 < 0, branch to less_than_zero
    beq  $t2, $zero, equal_zero # If $t2 == 0, branch to equal_zero

    # else
    li   $t0, 1                 # Assign 1 to $t0
    j    end                    # Jump to end

less_than_zero:
    li   $t0, -1                # Assign -1 to $t0
    j    end                    # Jump to end

equal_zero:
    li   $t0, 0                 # Assign 0 to $t0

end:
    # End of program
    nop                     
