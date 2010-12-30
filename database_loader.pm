package Dhwani::DB;
use strict;

#use warnings;

use DBI;
use Data::Dumper;
use Smart::Comments '###';
use Template;
use XML::Simple;
use utilities;

my $dbh = Dhwani::Utilities::getDBHandle();

sub getRaterId($)
{
    my $name = shift;

    #### Getting raterid for: $name
    my $raterId = $dbh->selectall_arrayref( "SELECT * from dr_employees WHERE username='$name'", {Slice => {}} );
    return $raterId->[0]->{RaterId} if ( $raterId->[0]->{RaterId} );
    die("Please add user to database before adding his data in! \n\n");
}

sub addTableData($$$)
{

    my $tableName = shift;
    my $songId    = shift;
    my $tableData = shift;
    ### Loading Table: $tableName

    my $sth = $dbh->prepare("INSERT INTO $tableName  VALUES (?)") or die $dbh->errstr;

    foreach my $i ( 0 .. $#{$tableData} ) {
        chomp( $tableData->[$i] );
        $tableData->[$i] = $songId->[$i] . "," . $tableData->[$i];
        $tableData->[$i] =~ s/,/','/g;
        $tableData->[$i] = "'" . $tableData->[$i] . "'";

        #print $tableData->[$i];
        my $rv = $dbh->do("INSERT INTO $tableName  VALUES ($tableData->[$i])");
        print $tableData->[$i] if ( !$rv );
    }
}

sub addSongMetaData($$)
{
    my $songName = shift;
    my $userName = shift;
    my $raterId  = getRaterId($userName);

    ### Adding song: $songName

    my $songId = $dbh->selectall_arrayref( "SELECT * from SongMetadata WHERE SongName='$songName' AND RaterId='$raterId'", {Slice => {}} );
    return $songId->[0]->{SongId} if ( $songId->[0]->{SongId} );

    my $rv = $dbh->do( q {INSERT INTO SongMetadata Values(0,?,?)}, undef, $songName, $raterId );
    return $dbh->last_insert_id( undef, undef, undef, undef );

}

1;
