#Uso perl {suma|salir|resta|multi|divi} num1 num2
my $cmd;
my %HoF = (                           		# Compose a hash of functions
    salir   =>  sub { exit },			# Subrutina implicita o anonima
    suma    =>  \&suma,				# Referencias a funciones
    resta   =>  \&resta,			# => (fat gorda) es igual a ,
    multi   =>  \&multi,			# 
    divi    =>  \&divi,
);

#while(1){
$cmd=$ARGV[0];					#La variable es igual al argumento 0
   if($HoF{lc $cmd}){				#La funcion lc convierte a lowercase y la busca en el hash
    $HoF{lc $cmd}->($ARGV[1],$ARGV[2]);		#Si la encuentra opera con los siguientes args
   }
   else {
    warn "Unknown command: `$cmd'; Try `help' next time\n";	#Si no mostramos cmd desconocido, warn devuelve al proceso superior
   }
#}

sub suma{
   my $a=shift;
   my $b=shift;
   print $a+$b,"\n";
}
sub resta{
   my $a=shift;
   my $b=shift;
   print $a-$b,"\n";
}
sub multi{
   my $a=shift;
   my $b=shift;
   print $a*$b,"\n";
}
sub divi{
   my $a=shift;
   my $b=shift;
   print $a/$b,"\n";
}

