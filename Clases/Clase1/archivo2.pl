#!perl -w
use warnings;
use strict;

#Si los parentesis no son necesarios se puede prescindir de ellos
my @a=(1..10);
for(@a){

	print "$_\n";	#Las variables se pueden usar directamente dentro de cadenas
}
