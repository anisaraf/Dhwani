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



#my @all = ("2007,98","2006,100");
#my @all = ("2005,100","2004,100");
# my @all = ("2003,100","2001,100");
 my @all = ("2002,80 ","2000,80");

# my @all = ("2005,100","2004,100");
# my @all = ("2005,100","2004,100");


foreach my $getParams (@all) {
    my ($year,$maxCount) = split (/,/, $getParams);
    my $pages = getPages($year, $maxCount);
    
    foreach my $page (@$pages){
	print "Fetching Page $page. \n";
	my $albums = getAlbums($page);
	foreach my $albumUrl (@$albums){ ### Progress: 0...  100
	my $hData = Dhwani::Scrapers::Google::getAlbumMetaData("$albumUrl");
	#print Dumper($hData);
	Dhwani::DB::mi_insert($hData);
	#my $wait = <>;
	}
    }
}
#print Dumper($hData);






sub getPages {

    my $year = shift;
    my $maxCount = shift;
    my $originalUrl = "http://www.google.co.in/music/search?q=$year&source=all&view=grid&sort=relevance&start=SUB";

    my $aReturn = ();
    for (my $count = 0; $count <= $maxCount; $count = $count + 20) {
	my $url = $originalUrl;
	$url =~ s/SUB/$count/;
	push @$aReturn, $url;
    }

    return $aReturn;

}

sub getAlbums {
    my $url = shift;
    my @aReturn;
 

    print "Fetching Data for $url\n";
    $url = get($url);    
    my $dom_tree = new HTML::DOM;
    $dom_tree->write($url);
    $dom_tree->close;


    my @albums = $dom_tree->getElementsByClassName("result-title");

    foreach my $album (@albums){
	my ($albumLink) = $album->getElementsByTagName('a');
	$albumLink = "http://www.google.co.in".$albumLink->getAttribute('href');
	push @aReturn, $albumLink;
    }
    
    return \@aReturn;
}


