#!perl
use warnings;
use strict;

my %hash;
#declaro otro hash
my %hash2;
my $filename="datos.txt";
open FILE,"<",$filename;
#guardo todas las lineas del descriptor de archivo, 
#cada linea representa un indice del arreglo
my @file=(<FILE>);
#Podemos omitir ya que $_ es la variable por defecto
for(@file){
	if($_=~/(.*):(.*):(.*):(.*):(.*):(.*):(.*)/){
		$hash{"user"}=$1;
		$hash{"pass"}=$2;
		$hash{"uid"}=$3;
		$hash{"gid"}=$4;
		$hash{"desc"}=$5;
		$hash{"home"}=$6;
		#Podemos utilizar cualquier tipo de separador
		#my @temp=$hash{"user"};
		my @temp= split /\//,$7;
		$hash{"shell"}=\@temp;
	}
	my $temp = $hash{"user"};
	#Digo que en hash dos con la llave usuario (nombre user ej root,} 
	#La llave es el nombre del usuario (chaos pej.) y el valor es todo el hash que esta arriba
	#Usando referencias
	$hash2{$temp}=\%hash;
	
}

#for(keys %hash){
#	print "Llave: ",$_," Valor: ","$hash{$_} \n";
#}
#Ahora para imprimir el contenido itero sobre hash2
#var es una variable temporal que guarda los nombres de usuario
for my $var(keys %hash2){
	print "\nLlave: ",$var,"\nValores:\n";
	for (keys %{$hash2{$var}}){		#Esto es una direccion de memoria
		print $_,":",$hash2{$var}{$_},"\n";
		if($_ eq "shell"){				#en la evaliacion nos cva ir de la verga
			for(@{$hash2{$var}{$_}}){
				print $_,"\n";
			}
		}
	}
}	
close FILE;

#
#	%hash={
#		"user" -> "root",
#		"pass" -> "x",
#		"uid"  -> "0",
#		...
#	}

#
#	%hash2={	
#		"root" -> 0xffcd,	(referencia al hash)
#		"www-data" -> 0xffdd
#	}
#	Entonces si hacemos $hash{"root} = 0xffcd obtenemos la referencia al hash
#		$hash{root}{user} = root
#		$hash{root}{pass} = x
#		
#	%hash2{root}{shell}	devuelve una direccion de memoria
#	%hash2{root}{shell}[0]	devuelve el primer valor
