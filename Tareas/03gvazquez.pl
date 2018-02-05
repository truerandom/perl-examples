#!/usr/bin/perl
#perl -MCPAN -e "install {nombrepaquete}"
use Net::Ifconfig::Wrapper;
use Data::Validate::IP;
use HTML::Template;
open FILE,">reporte.html" or die "Error";
print FILE &showForm();
close FILE;
sub showForm{
		my $output;
		my $template = HTML::Template->new(filename => './template.tmpl');
		my $info=&inet_info;
		my @loop_data=();
		#info es una referencia a un arreglo
		while(@{$info->[0]}){
				my %row_data;
				$row_data{user} = shift @{$info->[0]};				
				$row_data{pass} = shift @{$info->[1]};				
				$row_data{uid} = shift @{$info->[2]};				
				$row_data{gid} = shift @{$info->[3]};				
				$row_data{desc} = shift @{$info->[4]};								
				$row_data{home} = shift @{$info->[5]};								
				$row_data{shell} = shift @{$info->[6]};								
				#Metemos la referencia acabamos de crear (los hashes con info)
				push(@loop_data,\%row_data);
		}	
		$template->param(datos => \@loop_data);
		#Guardamos toda la salida del template
		$output.=$template->output();
		return $output;
}
sub inet_info{
	#Llamo a la funcion listIface
	my $list=&listIface();
	#Estos son los arreglos para guardar los datos
	my @usuarios;
	my @pass;
	my @uid;
	my @gid;
	my @desc;
	my @home;
	my @shell;
	#Dereferenciamos y guardamos las llaves (nombres) de las interfaces
	my @interface_name = keys %$list;
	foreach my $iface(keys %$list){
		my @tmp=$list->{$iface}->{user};
		push(@usuarios,@tmp);
		@tmp=$list->{$iface}->{uid};
		push(@uid,@tmp);
		@tmp=$list->{$iface}->{gid};
		push(@gid,@tmp);
		@tmp=$list->{$iface}->{desc};
		push(@desc,@tmp);
		@tmp=$list->{$iface}->{home};
		push(@home,@tmp);
		@tmp=$list->{$iface}->{shell};
		push(@shell,@tmp);
	}
	my @info=(\@usuarios,\@pass,\@uid,\@gid,\@desc,\@home,\@shell);
	#regresamos la referencia del arreglo info
	return \@info;
}
sub listIface{
	my %hash2;
        my $filename="datos.txt";
        open FILEIN,"<", $filename;
        my @file=(<FILEIN>);
        for (@file){
			my %hash;
            if(/(.*):(.*):(.*):(.*):(.*):(.*):(.*)/){
				$hash{"main"}=$&;
				$hash{"user"}=$1;
				$hash{"pass"}=$2;
				$hash{"uid"}=$3;
				$hash{"gid"}=$4;
				$hash{"desc"}=$5;
				$hash{"home"}=$6;
				$hash{"shell"}=$7;
			}
			my $temp=$hash{"main"};
            $hash2{$temp}=\%hash;
        }
	return \%hash2;
}
