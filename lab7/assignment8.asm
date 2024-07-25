# Shawn McDaniel
# Lab Assignment 8

# Function: f (int a, int b, int c, int d)
f:
    # Prologue (Save registers on stack)
    addi    $sp, $sp, -12   # Make space on the stack for 3 registers
    sw      $ra, 8($sp)    # Save return address
    sw      $s0, 4($sp)    # Save $s0 (if you use it for calculations)
    sw      $s1, 0($sp)    # Save $s1 (if you use it for calculations)

    # Body of the function (logic)
    slt     $t0, $a0, $a1   # $t0 = 1 if a < b, else 0
    bne     $t0, $zero, less_than   # Branch if a < b

    beq     $a0, $a1, equal        # Branch if a == b

    # If execution reaches here, a > b. I think this is the default value
    add     $v0, $a2, $a3  # $v0 = c + d
    j       end_f           # Jump to the end

less_than: 
    move    $v0, $a2       # $v0 = c
    j       end_f           # Jump to the end

equal:
    move    $v0, $a3       # $v0 = d
    j       end_f           # Jump to the end

end_f:
    # Epilogue (Restore registers and return)
    lw      $ra, 8($sp)    # Restore return address
    lw      $s0, 4($sp)    # Restore $s0 (if used)
    lw      $s1, 0($sp)    # Restore $s1 (if used)
    addi    $sp, $sp, 12   # Restore stack pointer
    jr      $ra           # Return to the caller

# Main function:
main:
    # Set up arguments for f(7, 12, 19, 41)
    li      $a0, 7
    li      $a1, 12
    li      $a2, 19
    li      $a3, 41

    # Call the function f
    jal     f            # Jump and link to f

    # Store the result from f in $v0 
    move    $s0, $v0       # $s0 = $v0 

    li      $v0, 10       # System call code for exit
    syscall                # Terminate the program


