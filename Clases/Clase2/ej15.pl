#!/usr/bin/perl
use strict;
use 5.014;

open(FCG,"<","copia") or die "Nel \n";
while(<FCG){
	chomp;
	#corto el primero y el ultimo campo
	#	si hubo una coincidencia regresa 1
	# 	user|:pass:uid:gid:geckos?:home:|shell	<- Corte
	#  	$'		$&		    $`
	#
	#	1				$_
	#	/bin/bash 			$'
	#	:x:1000:1000:fcg,,,:/home/fcg:	$&
	#	fcg				
	if($_=/:.*:/){
		say $_;		#Si hubo una coincidencia
		say $';		#Imprime antes de la coincidencia
		say $&;		#Imprime la coincidencia
		say $`;		#Imprime despues de la coincidencia
		say '';
	}
}
close(FCG);
