#!perl
use warnings;
use strict;

#lista del uno al 10
my @list=(1...10);
my @pares = ();

#$x = 0;
for(@list){
	if($_ %2 == 0){
		#$pares[$x] = $_;
		#$x = $x+1;
		push(@pares,$_);
	}
}
print @pares;

