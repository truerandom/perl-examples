use warnings;
use strict;

my $num1;
my $num2;
my $op;

principal();
sub principal{
	print "\nMenu:\n";
	print "\n[1] Suma ";
	print "\n[2] Resta ";
	print "\n[3] Division ";
	print "\n[4] Multiplicacion\n";
	chomp ($op = <STDIN>);
	chomp ($num1 = <STDIN>);
	chomp ($num2 = <STDIN>);
	if($op == 1){
		suma();
	}
	if($op == 2){
		resta();
	}
	if($op == 3){
		division();
	}
	if($op == 4){
		multiplicacion();
	}else{
		print "no valido";
	}
}

sub suma{
	print $num1+$num2;
}

sub resta{
	print $num1-$num2;
}

#validar div entre 0
sub division{
	if($num2==0){
		print "\nNo puedes dividir entre 0";
	}else{
		print $num1/$num2;
	}
}

sub mult{
	print $num1*$num2;
}
