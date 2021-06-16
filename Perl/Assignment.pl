# 1)Write a perl script that prints your name and your area of interest in VLSI Domain and run the script.
#!/usr/bin/perl
print "Raja Aadhithan : Front end Design \n";

# 2)Create a perl script to calculate area of a square.
print " enter the side length of square : ";
$side = <STDIN>;
$area = $side ** 2;
print " the area is $area sq.units \n" ;

# 3)Write a program that prompts for a number and prints out a string,  the number of times indicated by the number on separate lines.
#       (Hint: Use the "x" operator) . If the user enters "3" and the script has a string value "fred", the output should be printed on three next lines as "fred".

print " enter number of times " ;
$a = <STDIN>;
$string = " \t test input \n";
$result = $string x $a;
print " output : \n $result \n";

# 4)Write a program that reads a list of numbers (on separate lines) until end of input and then prints for each number the corresponding person's name from the list of a string array as shown below(fred, wilson, kelly, lewis, andrew).For example :if the input numbers were 0,1,3,2 then the output names would be fred,wilson,lewis,kelly.
print " enter n numbers ( the modulus will be taken ) press ctrl+D when done : \n ";
@numbers = <STDIN>;
@string = ("fred","wilson","kelly","lewis","andrew");
foreach $num (@numbers) {
        $x = $num%5;
        print "@string[$x] \n";
        }

# 5)Calculate Simple interest for year 2000. Assume Principal = 10000,time = 5years ,rate = 10% .(Hint) SI = PTR/100 .
$principle = 10000;
$time = 5;
$rate = 0.1;
$SI = $principle * $time * $rate / 100;
print "interest is $SI \n";