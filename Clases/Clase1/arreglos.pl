#Es necesario poner el shebang
#!perl
#pragmas, el use es como el import de java o el include de c
use warnings;
#Ayuda a definir ciertos alcances, da control sobre el programa, y previene
#El acceso de locaciones de memoria
use strict;

#Para saber que una variable es de tipo arreglo le ponemos @
#my es una palabra reservada
my @a;		#En perl un arreglo puede usarse sin declarar su longitud
#@a[5]=4;	#Esto no se hace 
$a[0]=5;	#El $ hace referencia a un escalar, k
$a[1]=4;	
$a[10] = 7;	
#Por defecto los elementos no declarados perl los inicializa
#print @a;	#Con print @{arreglo} imprime todo el arreglo
#print $#a;	#Imprime el indice del ultimo elemento que existe en el arreglo
#@a = (1..10);	#Operador de rango, esto sobreescribe la definicion anterior del arr
@a=('a'..'z');	#Especificamos que son caracteres
#for (@a) {print $_};	#Especificamos que iterar , $_ es elemento actual del arr
#En perl funcionan los indices negativos (empiezan desde el final)
