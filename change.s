#  Name:   Nguyen, Peter
#  Project: #1
#  Due:     10/6/22
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#    This project takes a user input and outputs the change in the coins needed
#
#

          .data
prompt:   .asciiz   "Please enter your change needed: "
output:   .asciiz   "\nYour change is "
quarters: .asciiz   "\nQuarters: "
dimes:    .asciiz   "\nDimes: "
nickels:  .asciiz   "\nNickels: "
pennies:  .asciiz   "\nPennies: "


          .text
main:
               #prints out the prompt
               li $v0,   4
               la $a0,   prompt
               syscall

               #Get the user input for their change
               li $v0,   5
               syscall

               #Store the input into $t0 in order to manipulate
     move      $t0,      $v0

               li $t2,   25        # $t2 is quarters
               li $t3,   10        # $t3 is dimes
               li $t4,   5         # $t4 is nickels
               li $t5,   1         # $t5 is pennies

               #Divide $t0 to get amount of quarters
     div       $t0, $t2   
     mfhi      $t6                 # t6 is remainder
     mflo      $t7                 # t7 is quotient
     beqz      $t7       divideDimes
     
printQuarter:
               #Print Quotient for Quarters
               li $v0,   4
               la $a0,   quarters
               syscall
               li $v0,   1
     move      $a0,      $t7
               syscall

divideDimes:
               #Divide $t6 to get amount of Dimes
     div       $t6, $t3   
     mfhi      $t6                 # t6 is remainder
     mflo      $t7  
     beqz      $t7       divideNickels

printDime:
               #Print Quotient for Dimes
               li $v0,   4
               la $a0,   dimes
               syscall
               li $v0,   1
     move      $a0,      $t7
               syscall

divideNickels:
               #Divide $t6 to get amount of Nickels
     div       $t6, $t4   
     mfhi      $t6                 # t6 is remainder
     mflo      $t7  
     beqz      $t7       dividePennies

printNickels:
               #Print Quotient for Nickels
               li $v0,   4
               la $a0,   nickels
               syscall
               li $v0,   1
     move      $a0,      $t7
               syscall

dividePennies:
               #Divide $t6 to get amount of Pennies
     div       $t6, $t5   
     mfhi      $t6                 # t6 is remainder
     mflo      $t7  
     beqz      $t7,      End

printPennies:
               #Print Quotient for Pennies
               li $v0,   4
               la $a0,   pennies
               syscall
               li $v0,   1
     move      $a0,      $t7       #exit
               syscall

End:
               li $v0,   10
               syscall