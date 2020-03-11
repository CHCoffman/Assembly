# Colten Coffman, CS 2318-253, Assignment 02(Part 1C)
# Program will allocate a global array, display labeled output
# re-order the array, and swap contents
			.data
intArray:			.word 88, 77, 33, 99, 44	# global int array of size 5
arrLabel:			.asciiz "Original Array:"
newArrLabel:			.asciiz "New Array:"
			.text
			.globl main
main:
			li $v0, 4
			la $a0, arrLabel	# Original Array Label
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			la $t0, intArray	# $t0 has address of intArray
			li $v0, 1
			lw $a0, 0($t0)		# $a0 has address of intArr[0]
			syscall
			lw $a0, 4($t0)		# $a0 has address of intArr[1]
			syscall
			lw $a0, 8($t0)		# $a0 has address of intArr[2]
			syscall
			lw $a0, 12($t0)		# $a0 has address of intArr[3]
			syscall
			lw $a0, 16($t0)		# $a0 has address of intArr[4]
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			lw $t1, 0($t0)		# Loading elements into registers
			lw $t2, 4($t0)
			lw $t3, 8($t0)
			lw $t4, 12($t0)
			lw $t5, 16($t0)
			syscall
			sw $t1, 12($t0)		# Swapping elements and storing back
			sw $t2, 16($t0)
			sw $t3, 8($t0)
			sw $t4, 0($t0)
			sw $t5, 4($t0)
			syscall
			
			li $v0, 4		# Print new array label
			la $a0, newArrLabel
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 1		# Print swapped elements from element 5 to 1
			lw $a0, 16($t0)
			syscall
			lw $a0, 12($t0)
			syscall
			lw $a0, 8($t0)
			syscall
			lw $a0, 4($t0)
			syscall
			lw $a0, 0($t0)	
			syscall

			li $v0, 10		# exit
			syscall
			