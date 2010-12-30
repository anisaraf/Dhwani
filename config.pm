package Dhwani::Config;
use strict;
use warnings;
use Template;
use XML::Simple;
use Data::Dumper;

sub get
{
    my $xmlConfig = loadConfig("config.txt");

    my $conf = {
                database => {
                             dsn  => $xmlConfig->{databaseConnection}->{dsn},
                             user => $xmlConfig->{databaseConnection}->{user},
                             pass => $xmlConfig->{databaseConnection}->{pass},
                            }};

    return $conf;
}

sub loadConfig
{

    my $fileName = shift;
    my $vars     = shift;

    my $xmlData = loadTemplate( $fileName, $vars );
    my $xs = XML::Simple->new( KeyAttr => [], forcearray => 0 );
    my $config = $xs->XMLin($xmlData);
    print Dumper($config);
    return $config;
}

sub loadTemplate
{
    my $fileName = shift;
    my $vars     = shift;
    my $templateConfig = {
                          POST_CHOMP  => 1,
                          EVAL_PERL   => 1,
                          INTERPOLATE => 1,
                         };

    open( DAT, $fileName ) || die("Could not open config file $!");
    my $xmlData;
    my $template = Template->new($templateConfig);
    $template->process( \*DAT, $vars, \$xmlData );
    close(DAT);
    return $xmlData;
}

1;
