use warnings;
use strict;

my $cmd;
my $num1 = 0;
my $num2 = 0;
my $r = 0;
my @resultados = ();
my %HoF = (                           						# Compose a hash of functions
    salir   =>  sub { print "R: @resultados\n"; exit; },	# Subrutina implicita o anonima
    suma    =>  \&suma,										# Referencias a funciones
    resta   =>  \&resta,									# => (fat gorda) :v  es igual a ,
    multi   =>  \&multi,				
    divi    =>  \&divi,
    help    =>  sub { print "\n(suma|resta|multi|divi|help|mod) arg1 arg2"; },
    mod	    =>  sub { 
			my $a = shift;
			my $b = shift;
			print $a % $b;
		}
);

while(1){
   print "\n\nIngresa el comando: cmd arg1 arg2\n";
   chomp($cmd = <STDIN>);					#La variable es igual al argumento 0
   my @args = split / /, $cmd;
   my $cmdx = $args[0];
   if($HoF{lc $cmdx}){						#lc convierte a lowercase, busco en  hash
	$num1 = $args[1];
	$num2 = $args[2];
	$r = $HoF{lc $cmdx}->($num1,$num2);		#Si la encuentra opera con los siguientes args
	push (@resultados,"$r,");	
   }
   else {
 	warn "\nUnknown command: `$cmd';\nTry `help' next time\n";	#cmd desconocido, warn devuelve al proceso superior
   }
}

sub suma{
	print $_[0]+$_[1];
	return $_[0]+$_[1];	
}

sub resta{
	print $_[0]-$_[1];
	return $_[0]+$_[1];
}

#validar div entre 0
sub division{
	if($_[1]==0){
		print "\nNo puedes dividir entre 0";
	}else{
		print $_[0]/$_[1];
		return $_[0]/$_[1];
	}
}

sub multi{
	print $_[0]*$_[1];
	return $_[0]*$_[1];
}
