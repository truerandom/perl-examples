#!perl
use warnings;
use strict;

#my @a = (1..11);
my @a = ('a'..'z');
my @z = ();		#Arreglo vacio
my $x=$a[5];
my $y=@a;		#Que pasa aqui?
			#Si pido un arreglo como si fuera un escalar
			#cuento El numero de elementos y lo devuelvo
			#Cambio de contexto
#print @a;		#Imprime todo el escalar
#print 0+@a;		#Sumamos al escalar 0 una lista -> convierte la lista (devueleve la longitud)
			#Y los suma

#print $x,$y;		

#Segunda parte
($x,@z) = ($x,@a);	#Asignacion de una lista con otra, listas de ambos lados
#print "\n",@z;		#Devuelve todo el alfabeto
#print $x;
#print @a[5,8];		#solo imprime dos valores a[5] y a[8] f y i
#print @a[5..8];		#Solo toma una parte del arreglo
$x=@a;			#Aqui x toma la longitud de la lista a
#print $x;

$x=\@a;			#La antidiagonal sirve para obtener la referencia
			#Una referencia es un escalar: la direccion de memoria
print $x,"\n";		#Imprime la direccion donde se encuentra la varible a
print @a,"\n";		#Imprime todos los elementos abcde...z
ref @a;			#ref regresa el tipo de la variable: arreglo,escalar
ref $x;
$x->[5];		#Como se que x tiene la referencia a un arreglo, puedo
			#derreferenciarlo y obtener el 5to elemento.
for(@$x){		#En  x hay una referencia que quiero que trates como arreglo 
	print $_;	#Cuando pongo la arroba le digo que la trate como arreglo
}			#Imprime los elementos del arreglo

