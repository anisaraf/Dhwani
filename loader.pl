use strict;

#use warnings;

use DBI;
use Data::Dumper;
use Smart::Comments;
use database_loader;
use parsecsv;

my $usage    = "<filename> <username>";
my $filename = shift;
my $username = shift;

#my $dbh = getDBHandle();

my $hData = Dhwani::getSpreadhsheet($filename);

my @songMeta = @{$hData->{SongMetadata}};

foreach my $i ( 0 .. $#songMeta ) {
    $songMeta[$i] = Dhwani::DB::addSongMetaData( $songMeta[$i], $username );
}

foreach my $key ( keys %$hData ) {
    next if ( $key eq "SongMetadata" );
    Dhwani::DB::addTableData( $key, \@songMeta, $hData->{$key} );
}

print Dumper( \@songMeta );
exit;

foreach my $songMeta ( @{$hData->{SongMetadata}} ) {

    foreach my $key ( keys %$hData ) {
        next if ( $key eq "SongMetadata" );
        print $key. "\n";
    }

}

