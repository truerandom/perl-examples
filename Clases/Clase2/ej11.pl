@lines = `perldoc -u -f atan2`;
#Expresiones regulares en perl son conocidos como patrones
#https://www.debuggex.com/
#[a-z]+\.[a-z]*\.?			El punto puede o no aparecer
#pcre es el lenguaje regex de perl
foreach(@lines){
	s/\w<([^>]+)>/\U$1/g;		#La s es para sustituir
	#	([^>]+)			Cualquier caracter excepto >
	#				La U es para poner en mayusculas, todo lo que haya cazado
	#s/\w<([^]+)>/\u\L$1/g;		#Pone la primera letra en Mayus
	print;
}
