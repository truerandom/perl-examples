#!perl
=pod

=head1 Tarea2: Expresiones Regulares
	Este programa extrae correos, ip , nombres de dominio, urls y sus ocurrencias
	Recibe el nombre del archivo donde buscar y devuelve un archivo llamado
	reporte.txt con los datos y sus ocurrencias.
	El programa tarda un poco en ejecutarse
	Modo de uso:

		perl 02gvazquez.pl archivo

	Regresa:
		Ocurrencia	|	Dato

=cut

use strict;
use 5.014;
if($#ARGV != 0){
        print "\nNecesitas pasar el nombre del archivo\n";
        exit;
}else{
	print "\nEspere por favor";
}

open(FCG,'<',$ARGV[0]) or die "No se puede abrir $ARGV[0]\n";
#Redirigimos los die al archivo errores
open(STDERR, '>>', 'errores.txt') or die "No se puede iniciar el log";
print "\nAlmost done";
my %correos = ();
my $cuentacorreos = 0;
my %dominios = ();
my $cuentadominios = 0;
my %ips = ();
my $cuentaips = 0;
my %url = ();
my $cuentaurl = 0;
while(<FCG>){
        chomp;
	if (my @groups =$_=~/((\w+)(\.[[:alpha:]]{3,})+)/g) {
		$dominios{$groups[0]}++;
		$cuentadominios++;
        }
	if($_ =~ /(^|\D)(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5])\.){3}(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5]))(\D|$)/){
		if($2<255 && $3 <255 && $4<255 && $5 <255){
				$ips{$&}++;
				$cuentaips++;
		}	
	}	
	if(my @m = $_ =~/(\w+@\w+\.\w+)(\.\w+)*/){
		my $lel = join("",@m);
		$correos{$lel}++;
		$cuentacorreos++;
	}        
	if ($_=~/https?:\/\/[a-zA-Z0-9-]+[a-zA-Z0-9](\.[a-zA-Z]{2,})+/){
		$url{$&}++;
		$cuentaurl++;
        }
}
close(FCG);

my $reporte = "reporte.txt";
open(FHS,'>',$reporte) or die "No puede crearse el reporte : $!";

print FHS "\n---------------------------------------------------------------------";
print FHS "\nCorreos:";
print FHS "\nTotal:\t $cuentacorreos";
print FHS "\nDiferentes:\t ",scalar keys %correos;
print FHS "\n\nVeces\t|\tCorreo\n";

#exp
my @keys = sort { $correos{$b} <=> $correos{$a} } keys(%correos);
foreach my $v (@keys){
	print FHS $correos{$v},"\t|\t$v\n";
}

#exp
print FHS "\n---------------------------------------------------------------------";
print FHS "\nDominios:";
print FHS "\nTotal:\t $cuentadominios";
print FHS "\nDiferentes:\t ",scalar keys %dominios;
print FHS "\n\nVeces\t|\tDominio\n";
my @keys = sort { $dominios{$b} <=> $dominios{$a} } keys(%dominios);
foreach my $v (@keys){
	print FHS $dominios{$v},"\t|\t$v\n";
}

print FHS "\n---------------------------------------------------------------------";
print FHS "\nIPS:";
print FHS "\nTotal:\t $cuentaips";
print FHS "\nDiferentes:\t ",scalar keys %ips;
print FHS "\n\nVeces\t|\tIP\n";
foreach my $ip (sort {$ips{$b} <=> $ips{$a}} keys %ips) {
	print FHS $ips{$ip},"\t|\t",$ip ,"\n";
}

print FHS "\n---------------------------------------------------------------------";
print FHS "\nURLS:";
print FHS "\nTotal:\t $cuentaurl";
print FHS "\nDiferentes:\t ",scalar keys %url;
print FHS "\n\nVeces\t|\tURLS\n";
my @keys = sort { $url{$b} <=> $url{$a} } keys(%url);
foreach my $v (@keys){
	print FHS $url{$v},"\t|\t$v\n";
}

print "\nFinalizado:";
print "\n";
print "\n\tCORREOS:\t$cuentacorreos";
print "\n\tURLS:\t\t$cuentaurl";
print "\n\tIPS:\t\t$cuentaips";
print "\n\tDOMINIOS:\t$cuentadominios";
print "\nEl reporte completo se encuentra en reporte.txt\n";

close(FHS);
