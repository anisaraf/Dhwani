package Dhwani::Utilities;
use strict;

#use warnings;

use DBI;
use Data::Dumper;
use Smart::Comments '###';
use Template;
use XML::Simple;
use config;

sub getDBHandle
{

    my $conf = Dhwani::Config::get();
    my $dsn      = $conf->{database}->{dsn};
    my $user     = $conf->{database}->{user};
    my $password = $conf->{database}->{pass};
    my $dbh      = DBI->connect( $dsn, $user, $password, {AutoCommit => 1} );
    return $dbh;
}

1;
