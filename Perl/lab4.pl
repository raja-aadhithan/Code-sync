#!/usr/bin/perl
 #Step1 :Take the inputs for an array & then press ctrl+D
 print " enter n elements of array : [press ctrl+D] once done \n: ";
 #Inputs to be taken from the keyboard
 @lines = <STDIN>;

 #Reverse the entered list of strings using keyword "reverse"
 @reverse_lines = reverse @lines;

 #Step2:Print the final output
 print "\n the results are : @reverse_lines \n";