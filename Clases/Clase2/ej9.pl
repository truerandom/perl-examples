#!perl
use strict;
my $n=<STDIN>;

#for(1..10){
#	print $_*$n,"\n";
#}

#map puede recibir un bloque o una expresion y una lista
#map {bloque} (lista)
map {print ($_ * $n,"\n");} (1..10);

