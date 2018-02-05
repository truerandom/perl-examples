my $var = "www-data:x:33:33:www-data:/var/www:/bin/sh/";
my @campos = ();
#split (separador,variable)
@campos = split ":",$var;
for(@campos){
	print $_,"\n";
}

print "usuario: ",$campos[0],"\n";
print "home: ",$campos[5],"\n";

#Usuario guardara la posicion 0, shell guardara la posicion 6
#Las / pueden ser usadas como comillas
my ($usuario,$shell) = (split /:/,$var)[0,6];
print "usuario: ",$usuario,"\n";
print "shell: ",$shell,"\n";
