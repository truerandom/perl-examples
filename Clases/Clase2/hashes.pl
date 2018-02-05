#!perl
use warnings;
use strict;
use v5.10;

my @a = 
my %h =(		
	"uno",1,		#llave,valor,
	"dos",2,
	"tres",3,
	"cuatro",4,
	"ene","n",
	"llave","valor",
	"1","uno",
	0,"cero"
);

print $a[1];
say $h{uno};
say $h{"uno"};
#con esto digo que el hash devuelva lo del indice dos
say $h{dos};
say $h{1};
say $h{"1"};
#A veces devuelve un undefined == NULL de C por un cambio de contexto
#Es recomendable usar cadenas como llaves
say $h{0};
say $h{"0"};

print "----------------------\n";
for(keys %h){			#Los arreglos asociativos no tienen orden
	say $_;
}

print "----------------------\n";
for(sort keys %h){		#Ordenamos las llaves de manera ascendente ASCII
	say $_;
}

print "----------------------\n";
for(sort values %h){		#Ordenamos los valores
	say $_;
}

print "----------------------\n";
for(sort keys %h){		#Obtenemos llaves y los valores ordenadas
	say $_," -> ",$h{$_};
}

print "----------------------\n";	
for my $key (sort keys %h){	#Obtenemos los valores secuencialmente y los guardamos en var temp
	say $key," --> ",$h{$key};
}
