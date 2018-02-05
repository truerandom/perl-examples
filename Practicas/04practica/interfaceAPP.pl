#!/usr/bin/perl -w
#instalamos apt-get install libapache2-mod-perl2 libapache2-mod-perl2-dev libcgi-pm-perl
#El modulo permite que la ejecucion sea mas eficiente
#
use strict;
use lib '.';
use interfaces;

my $app = interfaces->new();
$app->run();
