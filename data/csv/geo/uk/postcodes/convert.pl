#!/usr/bin/perl -w

use strict;
use lib '/data/mysociety/perllib';
use mySociety::GeoUtil;

while (<>) {
    my @row = split /,/;
    my ($lat, $lon) = mySociety::GeoUtil::national_grid_to_wgs84($row[10], $row[11], "G");
    print "$row[0],$row[1],$lat,$lon,$row[12],$row[13],$row[14],$row[15],$row[16],$row[17]\n";
}
