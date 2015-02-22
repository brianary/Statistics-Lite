#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 60;

BEGIN { use_ok( 'Statistics::Lite', ':all' ); }

######################### End of black magic.

# Insert your test code below (better if it prints "is 13"
# (correspondingly "not is 13") depending on the success of chunk 13
# of the test code):

is(min(1,2,3),    1, "call min - functional interface");
is(max(1,2,3),    3, "call max - functional interface");
is(range(1,2,3),  2, "call range - functional interface");
is(sum(1,2,3),    6, "call sum - functional interface");
is(count(1,2,3),  3, "call count - functional interface");
is(count(undef,1,2,3), 3, "call count with undef - functional interface");
is(mean(1,2,3),   2, "call mean - functional interface");
is(median(1,2,3), 2, "call median - functional interface");
is(median(2,4,6,8), 5, "call median with even number of values - functional interface");
is(mode(1,2,3),   2, "call mode - functional interface");

is(min(1,-5,8), -5, "call min with negative numbers" );
is(range(-6,-9), 3, "call range with negative values" );
is(range(6,-9), 15, "call range with data crossing 0" );

# undef checking
is(min(undef), undef, "call min with only single undefined value" );
is(max(undef), undef, "call max with only single undefined value" );
is(min(), undef, "call min without values" );
is(max(), undef, "call max without values" );
is(min(6,undef,10), 6, "call min with undefined value" );
is(max(-6,-10,undef), -6, "call max with undefined value" );
is(min(undef, 7, -5), -5, "call min with initial undefined value" );
is(max(undef, 7, -5), 7, "call max with initial undefined value" );
is(min(undef,undef,undef), undef, "call min with only undefined values" );
is(max(undef,undef,undef), undef, "call max with only undefined values" );
is(count(undef, 7, -5), 2, "call count with undefined value" );
is(sum(undef, 7, -5), 2, "call sum with undefined value" );
is(mean(undef, 7, -5), 1, "call mean with undefined value" );
is(count(undef,undef,undef), 0, "call count with only undefined values" );
is(mean(undef,undef,undef), undef, "call mean with only undefined values" );
is(range(6,9,undef), 3, "call range with undefined value" );
is(range(undef,6,9), 3, "call range with leading undefined value" );
is(range(undef,undef,undef,7), 0, "call range with single defined value" );
is(range(undef,undef,undef), undef, "call range with only undefined values" );

# unbiased sample test
my @values = (3, -10, 8, undef, 7, undef, 8, 3, 6, 3);
is(mean(@values), 3.5, "call unbiased sample set mean" );
is(median(@values), 4.5, "call unbiased sample set median" );
is(mode(@values), 3, "call unbiased sample set mode" );
is(variance(1,2,3), 1, "call unbiased sample set variance");
is(stddev(1,2,3),   1, "call unbiased sample set standard deviation");

# population sample test
is(variancep(2,4,2,4), 1, "call variancep - functional interface");
is(stddevp(2,4,2,4),   1, "call stddevp - functional interface");


my %stats= statshash(1,2,3);

is($stats{min},    1, "call min - hash-based interface");
is($stats{max},    3, "call max - hash-based interface");
is($stats{range},  2, "call range - hash-based interface");
is($stats{sum},    6, "call sum - hash-based interface");
is($stats{count},  3, "call count - hash-based interface");
is($stats{mean},   2, "call mean - hash-based interface");
is($stats{median}, 2, "call median - hash-based interface");
is($stats{mode},   2, "call mode - hash-based interface");

is($stats{variance}, 1, "call variance - hash-based interface");
is($stats{stddev},   1, "call stddev - hash-based interface");

# a tiny bit more substantial data set
%stats = statshash(0..10,1);
is($stats{sum},56,"call sum - hash-based");
is($stats{mean},4+2/3,"call mean - hash-based");
is($stats{variance},11+1/3,"call variance - hash-based");
is($stats{variancep},10.3+8/90,"call variancep - hash-based");


%stats= statshash(2,4,2,4);
ok($stats{variancep}, "call variancep - hash-based interface");
ok($stats{stddevp},   "call stddevp - hash-based interface");

%stats= frequencies(1,2,3,3);
is($stats{1}, 1, "frequencies matched correctly for 1");
is($stats{2}, 1, "frequencies matched correctly for 2");
is($stats{3}, 2, "frequencies matched correctly for 3");
is($stats{4}, undef, "frequencies matched correctly for 4");

