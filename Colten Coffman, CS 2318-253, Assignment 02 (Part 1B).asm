##########################################################################
# Colten Coffman, CS 2318-253, Assignment 2 Part 1 Program B
############################
# prompt user to enter an integer, read the integer, and display a 0 if the bits at the
# 16 and 256 place value positions of the integer are both 1 and display a 1 otherwise
############################ data segment ################################
			.data
outputLegend1:		.asciiz "0 = both bits at 16 & 256 place value positions are 1\n"
outputLegend2:		.asciiz "1 = bits at 16 & 256 place value positions NOT both 1\n\n"
inputPrompt:		.asciiz "Enter integer: "
outputLabel:		.asciiz "Integer entered is of type "
############################ code segment ################################
			.text
			.globl main
main:
			li $v0, 4
			la $a0, outputLegend1        
			syscall			# print output legend part 1
			la $a0, outputLegend2        
			syscall			# print output legend part 2
			la $a0, inputPrompt        
			syscall			# print integer prompt
			li $v0, 5
			syscall			# read integer
			move $t0, $v0		# save integer read in $t0
			li $v0, 4
			la $a0, outputLabel        
			syscall			# print output label

			li $v0, 1

			##########################################################
			# Insert NO MORE THAN 5 lines of code that involve ONLY 
			#   bit manipulating instructions (ANDing, ORing, XORing,
			#   NORing and shifting - only whatever that are needed)
			# so that the program will work just like the sample runs 
			# shown at the bottom (some blank lines edited out).
			# HINT: Risking telling the obvious, the instructions you
			#       insert are to cause content of $a0 to become the
			#       desired value (0 or 1) when printed as integer.
			# TIP: See 1st question posted under Drills and Challenges
			# You MUST test your completed program for AT LEAST the 
			# test cases shown (and include the result in hardcopy).
			##########################################################

			andi $t1, $t0, 0x0010		# And given with mask1
			srl $t1, $t1, 4			# Shift Right Logical 4 positions
			andi $t2, $t0, 0x0100		# And given with mask2
			srl $t2, $t2, 8			# Shift Right Logical 8 positions
			and $t3, $t1, $t2		# And two masks to get result
			xori $a0, $t3, 0x0001		# Toggle Result
			

			
			
			
			
			
			
			syscall			# display desired output
			
	                ##########################################################
                                                
			li $v0, 10		# exit gracefully
                	syscall
			
########################## sample test runs ##############################
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 0
# Integer entered is of type 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 16
# Integer entered is of type 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 256
# Integer entered is of type 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 272
# Integer entered is of type 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 12349876
# Integer entered is of type 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 0 = both bits at 16 & 256 place value positions are 1
# 1 = bits at 16 & 256 place value positions NOT both 1
# 
# Enter integer: 12346789
# Integer entered is of type 1
# -- program is finished running --
# 
######################## end sample test runs ############################
