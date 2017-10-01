#Computes the largest number and index of an element in an array
.globl main
main:

.data
A : .word 89, 19, 91, 23, 31, 96, 3, 67, 17, 11, 43, 75 #declare the array
str1: .asciiz "Index of the largest number: "
str2: .asciiz "The largest number: "
newline: .asciiz "\n"	#screen cursor will move to the next line

.text

la $s4, A 				 #$s4 is equal to the address of the array

addi $s0, $zero, 0 		 #int max = 0
addi $s1, $zero, 0 		 #int max index = 0
addi $s2, $zero, 0 		 #int i = 0

STARTLOOP:

addi $s3, $s2, -12 		 #$s3 = i - 12 
bgez $s3, ENDLOOP		 #if i - 12 < 0 is false then jump out of the loop
add $s6, $s2, $s2		 #temp = 2i
add $s6, $s6, $s6 		 #temp = 4i
add $s5, $s4, $s6		 #compute address of A[i]
lw $s7, 0($s5)			 #load the word A[i]
		 
sub $t1, $s7, $s0		 #temp = A[i] - max
blez $t1, E				 #if A[i] > max (temp) is false, jump to E
						 
add $s0, $zero, $s7 	 #max = A[i]
add $s1, $zero, $s2		 #maxIndex = i
	
E:	
addi $s2, $s2, 1		 #increment i by one			 
j STARTLOOP; 			 #jump to the start of the loop
ENDLOOP:

la $a0, str1			 #load address of the first string into register $a0
li $v0, 4				 #load I/O code to print the str1 to console
syscall					 #print the str1 to console
move $t0, $a0			 #move input to another register

li $v0, 1				 #first service of printing integer loaded
move $a0, $s1			 #load largest int index to register
syscall					 #print index of largest number
move $t1, $a0			 #move input to another register

la $a0, newline			 #print the newline character
li $v0, 4				 #load I/O code to print the newline to console
syscall					 #print the newline to console
move $t2, $a0			 #move input to another register

la $a0, str2			 #load address of the second string into register $a0
li $v0, 4				 #load I/O code to print the str2 to console
syscall					 #print the str2 to console
move $t3, $a0			 #move input to another register

li $v0, 1				 #first service of printing integer loaded
move $a0, $s0			 #load largest int to register
syscall					 #print index of largest number
move $t4, $a0			 #move input to another register

la $a0, newline			 #print the newline character
li $v0, 4				 #load I/O code to print the newline to console
syscall					 #print the newline to console
move $t2, $a0			 #move input to another register

li $v0, 10 				 #syscall code 10 that ends the program  
syscall

