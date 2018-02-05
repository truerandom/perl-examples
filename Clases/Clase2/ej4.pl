#!/usr/bin/perl -w
#Este programa imprime la cadena pasada n veces
#-w es un parametro que activa warnings == use warnings
use strict;
chomp(my $s=<STDIN>);	#chomp quita el salto de linea
my $n=<STDIN>;
print $s x $n;		#Imprime n veces el caracter
