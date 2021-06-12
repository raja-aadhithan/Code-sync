#!/usr/bin/perl
 #Step 1 : Display a string that should prompt to enter the first number
  print "\n enter the 1st number: ";
  $number1 = <STDIN>;

 #Step 2 : Display another string that should prompt to enter the second number
  print "\n enter the 2nd number: ";
  $number2 = <STDIN>;

 $result = ($number1 * $number2);
 #Step3 : Display another string that is going to print the result
 print "\n the result is $result \n";