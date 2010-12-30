
package Dhwani::DB;
use strict;

#use warnings;

use DBI;
use Data::Dumper;
use Smart::Comments '###';
use utilities;

my $dbh = Dhwani::Utilities::getDBHandle();

sub albumExits
{

    my $data = shift;

    # add Album info - Either gLink or Id must be present

    my $searchId = $data;
    $searchId =~ s/'/''/g;

    my $albumId = $dbh->selectall_arrayref( "SELECT * from mi_Album WHERE GoogleLink='$searchId'", {Slice => {}} );
    return 1 if ( $albumId->[0]->{Id} );

    return 0;
}

sub mi_insert
{
    my $data = shift;

    # add Album info - Either gLink or Id must be present

    if ( !$data->{Album}->{Id} ) {
        my $searchId = $data->{Album}->{gLink};
        $searchId =~ s/'/''/g;

        my $albumId = $dbh->selectall_arrayref( "SELECT * from mi_Album WHERE GoogleLink='$searchId'", {Slice => {}} );
        if ( $albumId->[0]->{Id} ) {
            print "Exists: $data->{Album}->{Title} \n";
            $data->{Album}->{Id} = $albumId->[0]->{Id};
            return;
        }
        else {
            my $rv = $dbh->do( q {INSERT INTO mi_Album Values(0,?,?,?,?)},
                               undef,
                               $data->{Album}->{Title},
                               $data->{Album}->{gLink},
                               $data->{Album}->{Label},
                               $data->{Album}->{Released} );
            die if ( !$rv );
            print "Added:  $data->{Album}->{Title} \n";
            $data->{Album}->{Id} = $dbh->last_insert_id( undef, undef, undef, undef );
        }
    }

    foreach my $key ( keys %$data ) {
        my $artistData = {AlbumId => $data->{Album}->{Id}, Role => $key, $key => $data->{$key}};
        addArtistList($artistData) if ( $key =~ m/(Actors|Composers|Lyricists|Directors)/i );
        addSongs($artistData)    if ( $key eq "Songs" );
        addAlbumArt($artistData) if ( $key eq "AlbumArt" );
    }
}

sub addArtistList
{
    my $listData = shift;

    foreach my $data ( @{$listData->{$listData->{Role}}} ) {
        my $searchId = $data->{gLink};
        $searchId =~ s/'/''/g;

        my $artistId = $dbh->selectall_arrayref( "SELECT * from mi_$listData->{Role} WHERE GoogleLink='$searchId'", {Slice => {}} );
        if ( $artistId->[0]->{Id} ) {
            $data->{ArtistId} = $artistId->[0]->{Id};
        }
        else {
            my $rv = $dbh->do( "INSERT INTO mi_$listData->{Role} Values(0,?,?)", undef, $data->{name}, $data->{gLink} );
            die if ( !$rv );
            $data->{ArtistId} = $dbh->last_insert_id( undef, undef, undef, undef );
        }

        my $rv = $dbh->do( "INSERT INTO mla_$listData->{Role} Values(?,?)", undef, $listData->{AlbumId}, $data->{ArtistId} );
    }
}

sub addSongs
{

    my $listData = shift;
    foreach my $data ( @{$listData->{Songs}} ) {

        my $searchId = $data->{gLink};
        $searchId =~ s/'/''/g;

        my $songId = $dbh->selectall_arrayref( "SELECT * from mi_Songs WHERE GoogleLink='$searchId'", {Slice => {}} );
        if ( $songId->[0]->{Id} ) {
            $data->{SongId} = $songId->[0]->{Id};
        }
        else {
            my $rv = $dbh->do( "INSERT INTO mi_Songs Values(0,?,?,?)", undef, $data->{name}, $data->{duration}, $data->{gLink} );
            die if ( !$rv );
            $data->{SongId} = $dbh->last_insert_id( undef, undef, undef, undef );
        }

        my $rv = $dbh->do( "INSERT INTO mla_Songs Values(?,?)", undef, $listData->{AlbumId}, $data->{SongId} );

        my $artistData = {AlbumId => $data->{SongId}, Role => "Singers", Singers => $data->{Singers}};
        addArtistList($artistData);
    }
}

sub addAlbumArt
{
    my $listData = shift;
    my $data->{AlbumArt} = $listData->{AlbumArt};

    my $artId = $dbh->selectall_arrayref( "SELECT * from mi_AlbumArt WHERE GoogleLink='$data->{AlbumArt}'", {Slice => {}} );
    if ( $artId->[0]->{Id} ) {
        $data->{artId} = $artId->[0]->{Id};
    }
    else {
        my $rv = $dbh->do( "INSERT INTO mi_AlbumArt Values(0,?)", undef, $data->{AlbumArt} );
        die if ( !$rv );
        $data->{artId} = $dbh->last_insert_id( undef, undef, undef, undef );
    }

    my $rv = $dbh->do( "INSERT INTO mla_AlbumArt Values(?,?)", undef, $listData->{AlbumId}, $data->{artId} );

}

1;
