#!perl

=head1 Tarea1

=head1 DESCRIPTION

	Este programa regresa los numeros primos hasta $limite

=cut

use warnings;
use strict;
my $limite = 50;				#limite
my @primos = ();				#lista para los primos
my $esprimo = 1;				#bool

print "\nLos pragmas (pragmatic modules) son modulos que modifican la compilacion";
print "\nSon llamados usando use o no.";
print "\nComo las variables tambien son afectadas en el scope\n\n";

for(my $i = 2; $i < $limite; $i++){
	$esprimo = 1;
	for(my $j=2;$j<$i;$j++){
		if($i % $j == 0){
			$esprimo = 0;
		}
	}
	if($esprimo){
		print $i," es primo \n"
	}
}
	
