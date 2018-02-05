#!/usr/bin/perl
use strict;
use 5.014;
my @tmp;
open(FCG,"<","copia") or die "No se puede \n";
while(<FCG>){
	chomp;
	if(/(.*)(\:(.*)){6}(.*)/){			#|algo:algo:...:algo|= 7, las llaves representan #repeticiones
							# Las regex entre parentesis son llamados grupos de captura
		say "El usuario $1 tiene shell $3";	#Imprimimos el primer grupo y el ultimo
	}
}
close(FCG);
