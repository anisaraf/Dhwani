package Dhwani::Scrapers;

use strict;
use Data::Dumper;
use HTML::DOM;

use mi_album;


my $hData = Dhwani::Scrapers::Google::getAlbumMetaData('http://www.google.co.in/music/album?n=Rakht&id=20100520134546_k8urr9fyh0w0');


#print Dumper($hData);
print Dumper($hData);




