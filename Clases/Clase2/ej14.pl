#!/usr/bin/perl
use strict;
use 5.014;
my @tmp;
open(FCG,"<","copia") or die "No se puede";
	while(<FCG>){
		chomp;
		if(/(.*):(.*):(.*):(.*):(.*):(.*):(.*)/){
			my $user=$1;
			my $home=$6;
			#=~ expresion regular
			if($home=~/$user/){
				say $user;
				say $home;
				say '';
			}
		}
	}

close(FCG);
