#!perl
use warnings;
use strict;

my @nombres = ('Hugo','Paco','Luis');
print @nombres,"\n";
my $nom = join " <-> ",@nombres;	#junta los elementos del arreglo con el delim, la funcion recibe delim,lista
print $nom,"\n"				#regresa el arreglo descompuesto en una cadena
