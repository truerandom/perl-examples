@uno= ('a' ..'g');
@dos= (1..9);
@tres=(@uno,@dos);	#El tercer arreglo contiene a los otros dos , imprime una b
			#No se asignan en localidades diferentes, las listas se expanden
			#Entonces tres = ('a'..'g',1..9);
			#Cambio de contexto
print $tres[1];
