package Dhwani::Scrapers;

use strict;
use warnings;
use Data::Dumper;
use HTML::DOM;
use LWP::Simple;
use Hash::Merge qw(merge);
use Smart::Comments;

use mi_album;
use db_loader_meta;

my $param = shift || die "Please provide search term";
my $mode  = shift || "";

my $pages;

if ( $mode eq "album" ) {
    my $albumUrl = $param;
    my $hData    = Dhwani::Scrapers::Google::getAlbumMetaData("$albumUrl");
    Dhwani::DB::mi_insert($hData);
    exit;
}
else {
    my $pages = getPages($param);

    foreach my $page (@$pages) {
        print "Fetching Page $page. \n";
        my $albums = getAlbums($page);

        foreach my $albumUrl (@$albums) {
            next if ( Dhwani::DB::albumExits($albumUrl) );
            my $hData = Dhwani::Scrapers::Google::getAlbumMetaData("$albumUrl");
            Dhwani::DB::mi_insert($hData);
        }
    }
}

# parse search query into different pages
sub getPages
{

    my $search      = shift;
    my $originalUrl = "http://www.google.co.in/music/search?q=$search&source=all&view=grid&sort=relevance&start=SUB";
    my $aReturn     = ();

    for ( my $count = 0 ; $count <= 2000 ; $count = $count + 20 ) {
        my $url = $originalUrl;
        $url =~ s/SUB/$count/;
        my $purl = get($url);

        if ( $purl =~ m/did not match any documents/i ) {
            $count = 2000;
        }
        else {
            push @$aReturn, $url;
        }
    }
    return $aReturn;
}

# parse each page to get album listing
sub getAlbums
{
    my $url = shift;
    my @aReturn;

    print "Fetching Data for $url\n";
    $url = get($url);
    my $dom_tree = new HTML::DOM;
    $dom_tree->write($url);
    $dom_tree->close;

    my @albums = $dom_tree->getElementsByClassName("result-title");

    foreach my $album (@albums) {
        my ($albumLink) = $album->getElementsByTagName('a');
        $albumLink = "http://www.google.co.in" . $albumLink->getAttribute('href');
        push @aReturn, $albumLink;
    }

    return \@aReturn;
}

