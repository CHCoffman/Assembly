# Colten Coffman, CS 2318-253, Assignment 2 Part 1 Program A
			.data
intprompt:		.asciiz "Enter an integer: "
yintIs:			.asciiz "Your integer is: "
strprompt:		.asciiz "Enter a 25 character string: "
ysIs:			.asciiz "Your string is: "
string:			.space 26	# up to 25 char
charprompt:		.asciiz "Enter a single character: "
ycIs:			.asciiz "Your char is: "

			.text
			.globl main
main:
			li $v0, 4		# Prompts user for integer, reads, displays.
			la $a0, intprompt
			syscall
			li $v0, 5
			syscall
			move $t0, $v0
			li $v0, 4
			la $a0, yintIs
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4		# Prompts user for a string
			la $a0, strprompt
			syscall
			li $v0, 8
			la $a0, string
			li $a1, 26
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4		# Prints user's string
			la $a0, ysIs
			syscall
			li $v0, 4
			la $a0, string
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4		# Prompt user for a single char
			la $a0, charprompt
			syscall
			li $v0, 12
			syscall
			move $t0, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4		# Print user's char
			la $a0, ycIs
			syscall
			li $v0, 11
			move $a0, $t0
			syscall
			
			li $v0, 10		# Exit program
			syscall
			
			