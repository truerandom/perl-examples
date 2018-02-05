#!/usr/bin/perl
use strict;
use 5.014;

my @d=qw(1 2 3 4 5 6);		#quote words, pone entre comillas y separa por coma, elems en espacios
my %shell=(
		"user" => "shell",
		"fcg" => "/bin/bash",
		"apt" => "/bin/nologin",
		"otro" =>\@d	#
);

#print $shell{"otro"}->[2];	#Obtiene el numero 3 a partir del hash
print $shell{"otro"}[2];	#<|:{v
#similar a:
print ${$shell{"otro"}}[2];	#Lo de las llaves internas son la direccion de memoria	
print $shell{"otro"}->[2];	# C|:v 
print $shell{"otro"}[2];	#No recomendable <|:v-|-<
#my @a = ();
#@a = (1,2,3);
#$a[3] = 4;
#my $ref =\ @a			#Referenciacion
#$ref = 0xffab

#			RAM
#			--------------------------------
#	0xffab		|@a			1	|
#			|			2	|
#			|			3	|
#			--------------------------------

#			|	user	|	shell	|
#			|	otro	|	\@d	|
#
#Si hacemos $shell{"otro"} = 0xffcd devuelve la direccion
#Podemos hacer que lo trate como un arreglo:
#	$$shell{"otro"}[2]	como dentro de @d[2] es un escalar tenetmos que poner $
#O podemos dereferenciarlo:
#	$shell{"otro"}->[2]

