package Dhwani::Scrapers::Google;

use strict;
use warnings;
use Data::Dumper;
use HTML::DOM;
use LWP::Simple;
use Hash::Merge qw(merge);


sub getAlbumMetaData($) {
    my $url = shift;
    my $hReturn = {GoogleLink=>"$url"};
    $hReturn->{GoogleLink} =~ s|http://www\.google\.co\.in||i;


    $url = get($url);    
    my $dom_tree = new HTML::DOM;
    $dom_tree->write($url);
    $dom_tree->close;
    $hReturn = merge($hReturn, albumMetaData( ($dom_tree->getElementsByClassName("album-metadata"))[0], ($dom_tree->getElementsByClassName("album-image") )[0] ));

    my @songList = $dom_tree->getElementsByClassName('song-row');

    $hReturn->{Songs} = albumSongs(\@songList);
    return $hReturn;
}

sub albumMetaData($$)
{

    my $albumMeta = shift;
    my $albumArt = shift;
    my $hReturn   = {};


    my ($albumTitle) = $albumMeta->getElementsByClassName('album-title');
    return if(!$albumTitle);
    $hReturn->{Title} = $albumTitle->innerHTML;
    chomp($hReturn->{Title});

    ($albumArt) = $albumArt->getElementsByTagName('img');
    $albumArt = $albumArt->getAttribute('src');
    $hReturn->{AlbumArt} = $albumArt if($albumArt);


    my @albumFields = $albumMeta->getElementsByClassName('album-field');
    foreach my $albumField (@albumFields) {
	my $hData = albumField($albumField);
        $hReturn = merge($hReturn,$hData) if(keys %$hData);
    }

    return $hReturn;

}

sub albumField($)
{
    my $albumField = shift;
    my $hReturn    = {};

    my ($artistRole) = $albumField->getElementsByClassName("artist-role");

    if ($artistRole) {
        $artistRole = $artistRole->innerHTML;
        $artistRole =~ s/://;
        $hReturn->{$artistRole} = ( artistField($albumField) );
    }
    else {
	$hReturn = albumLabel($albumField);
    }

    return $hReturn;
}

sub albumLabel($)
{
    my $albumField = shift;
    my $hReturn = {};
    
    
    my ($fieldKey) = $albumField->getElementsByClassName("album-field-name");
    return if(!$fieldKey);
    $fieldKey = $fieldKey->innerHTML;
    $fieldKey =~ s/://;


    my ($fieldValue) = $albumField->getElementsByClassName("album-field-value");
    return if(!$fieldValue);
    $hReturn->{$fieldKey} = $fieldValue->innerHTML;

    return $hReturn;

}

# input HTML Element album-field : assumes has artist-list
# return a arrayref of hashes containing GoogleLink and Artist Name;
sub artistField($)
{

    my $albumField = shift;
    my $aReturn=();

    my ( undef, $artistList ) = $albumField->getElementsByClassName("artist-list");
    return if ( !$artistList );

    my @artists = $artistList->getElementsByClassName('artist-name');

    foreach my $artist (@artists) {
        push @$aReturn, artistName($artist);
    }
    return $aReturn;
}

# input HTML Element artist-name
# return a hashref containing GoogleLink and Artist Name;
sub artistName($)
{
    my $artist = shift;
    my ($data) = $artist->getElementsByTagName('a');
    return if(!$data);
    return ( {GoogleLink => $data->getAttribute('href'), name => $data->innerHTML} );
}

# return songListing
sub albumSongs
{
    my $songsList = shift;
    my $aReturn = ();

    foreach my $song (@$songsList){
	my $hReturn = {};
	my (undef,$songLink) = $song->getElementsByTagName('a');
	next if(!$songLink);

	$hReturn->{name} = $songLink->innerHTML;
	$hReturn->{songLink} = $songLink->getAttribute('href');
	
	my ($temp) = $song->getElementsByClassName("song-field duration");
	$hReturn->{duration} = $temp->innerHTML if($temp);


	$hReturn->{Singers} = artistField($song);
	push @$aReturn, $hReturn;
    }

    return $aReturn;

}
1;
