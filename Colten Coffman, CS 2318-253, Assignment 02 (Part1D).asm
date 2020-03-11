# Colten Coffman, CS 2318-253, Assignment 02 (Part 1D)
# Program takes user-input values for exam 1, exam 2, and final exam
# and computes/outputs the weighted average based off of the formula
# avgScore = 512/222*e1Score + 555/2048 * e2Score + finscore/2
			.data
e1Prompt:			.asciiz "Enter score for exam 1: "
e2Prompt:			.asciiz "Enter score for exam 2: "
finExamPrompt:			.asciiz "Enter the final exam score: "
avgScoreLabel:			.asciiz "The weighted average is: "
			.text
			.globl main
main:
			li $v0, 4
			la $a0, e1Prompt
			syscall
			
			li $v0, 5		# Get value for exam 1
			syscall
			sll $t0, $v0, 9		# Begin computation involving exam 1
			li $t4, 2222
			div $t0, $t4
			mflo $t0		# 512/2222 * e1Score is in $t0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, e2Prompt
			syscall
			
			li $v0, 5		# Get value for exam 2
			syscall
			li $t4, 555
			mul $t1, $v0, $t4
			srl $t1, $t1, 11	# 555/2048 * e2Score in $t1
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, finExamPrompt
			syscall
			
			li $v0, 5		# Get final exam value
			syscall
			srl $t2, $v0, 1		# FinExam / 2 in $t2
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			add $t9, $t0, $t1	# Add the 3 values
			add $t9, $t9, $t2
			
			li $v0, 4		# Output Label
			la $a0, avgScoreLabel
			syscall
			
			li $v0, 1		# Output Average Weighted Score
			move $a0, $t9
			syscall
			
			li $v0, 10
			syscall