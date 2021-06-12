#!/usr/bin/perl
#Step1 :Declaration of the subroutine called "total"
 sub total{
           my (@numbers) = @_;  #Setting up local variables to the subroutine and without assigning them values right away
           return $numbers[0] + $numbers[1] + $numbers[2] + $numbers[3]; #Return the summed up value
          }
#Step2 :Define a for loop for first 10 integers
  for($i = 0 ; $i < 10 ; $i++){
            print "$i is summed up to ",total($i,$i,$i,$i), "\n";
 }