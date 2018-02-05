#!/usr/bin/perl
use strict;
package interfaces; 
use Net::Ifconfig::Wrapper;
use HTML::Template;
use parent 'CGI::Application';
use CGI::Application::Plugin::Forward;

sub setup { 
        my $self = shift; #Pasa la referencia del propio objeto, siempre en setup
        $self->run_modes( #Hash, 
                'view' => 'showForm', #Como se va a llamar el modo de ejecucion, nombre subrutina
                'controler' => 'changeIP', #Nombre => subrutina
                'menu' => 'menu',
                'suma' => 'suma',
		'resta' => 'resta',
		'mul' => 'mul',
		'divi' => 'divi',
        ); 
        $self->start_mode('menu');  #Lo primero que va a mostrar es, en este caso el view
        $self->mode_param('selector'); #el nombre que queramos, identifica el value para cambiar el modo de ejecucion
        #Cambia el modo de ejecucion
        #<input type=hidden name ="selector" value ="controler"/>, es este :v
}

sub menu {
	my $output;
	my $template = HTML::Template->new(filename => './plantilla.tmpl');
	$output.=$template->output();
	return $output;
}

sub suma {
        my $self = shift; 
	my $q = $self->query();
	my $a = $q->param('numero1');
	my $b = $q->param('numero2');
        my $res = $a+$b;
       	my $template = HTML::Template->new(filename => './resultado.tmpl');
        $template->param(resultado => $res);
        my $output.=$template->output();
        return $output;
}

sub resta {
        my $self = shift; 
	my $q = $self->query();
	my $a = $q->param('numero1');
	my $b = $q->param('numero2');
        my $res = $a-$b;
       	my $template = HTML::Template->new(filename => './resultado.tmpl');
        $template->param(resultado => $res);
        my $output.=$template->output();
        return $output;
	#my $self = shift; 
	#my $q = $self->query();
	#my $a = $q->param('numero1');
	#my $b = $q->param('numero2');
	#return $a - $b;
}

sub mul {
	my $self = shift; 
	my $q = $self->query();
	my $a = $q->param('numero1');
	my $b = $q->param('numero2');
        my $res = $a*$b;
       	my $template = HTML::Template->new(filename => './resultado.tmpl');
        $template->param(resultado => $res);
        my $output.=$template->output();
        return $output;

	#my $self = shift; 
	#my $q = $self->query();
	#my $a = $q->param('numero1');
	#my $b = $q->param('numero2');
	#return $a * $b;
}

sub divi {
	my $self = shift; 
	my $q = $self->query();
	my $a = $q->param('numero1');
	my $b = $q->param('numero2');
        my $res;
	if ($b == 0){
		$res="\nNo puedes dividir entre 0";
	}else{
		$res = $a/$b;
	}
       	my $template = HTML::Template->new(filename => './resultado.tmpl');
        $template->param(resultado => $res);
        my $output.=$template->output();
        return $output;
	#my $self = shift; 
	#my $q = $self->query();
	#my $a = $q->param('numero1');
	#my $b = $q->param('numero2');
	#if ($b == 0){
	#	return "\nNo puedes dividir entre 0";
	#}else{
	#	return $a / $b;
	#}
}

1
