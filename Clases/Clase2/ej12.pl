#!perl
use warnings;
use strict;
#	< modo lectura
#	> modo escritura
# 	>> modo concatenacion
#	+> modo lectura y escritura
#Leer archivos, open {variablemanejadordearchivo} {ruta}
#open PASS, "/tmp/passwds"/;
open PASS, "/tmp/passwds" or die "ERROR ($!)";
#leemos el archivo con <MANEJADOR>
while(<PASS>){
	print $_;
}
#Cerramos el manejadir
close PASS;				
