## Code to parse a csv file into a hash representing the database structure

package Dhwani;
use strict;
use Data::Dumper;
#use Smart::Comments;



my $usage = "filename";
my $fileName;

sub getSpreadhsheet($) {
    $fileName = shift;
    my $hData = ();
    $hData->{SongMetadata} = getColums('1', '[:alnum:]-\n., ');
    $hData->{Melody} = getColums('2-4');
    $hData->{TimeSignature} = getColums('5-6');
    $hData->{Rhythm} = getColums('7-14');
    $hData->{Tempo} = getColums('15-17');
    $hData->{Tonality} = getColums('18-23');
    $hData->{Lyrics} = getColums('24-29');
    $hData->{Voice} = getColums('30-34');
    $hData->{VocalQuality} = getColums('35-59');
    $hData->{Harmony} = getColums('60-66');
    $hData->{Mood} = getColums('67-85');
    $hData->{Theme} = getColums('86-104');
    $hData->{Structure} = getColums('105-111');
    $hData->{Influences} = getColums('113-143');
    $hData->{Instruments} = getColums('144-228');
    $hData->{RecordingTechnique} = getColums('229-236');
    $hData->{MixingStandard} = getColums('237-240');
    $hData->{RandomSongInfo} = getColums('241') ;
    return $hData;
}

sub getColums($){
    my $cols = shift;
    my $includeChars = shift || '[:digit:]\n.,';
    my @records= `tail --lines=+3 $fileName | cut -d ',' -f $cols | tr -c -d '$includeChars' `;
    chomp(@records);
    return \@records;
}

1;
