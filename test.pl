#!perl
use strict;
use warnings;
use Test::More tests => 28;

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
is(mean(1,2,3),   2, "call mean - functional interface");
is(median(1,2,3), 2, "call median - functional interface");
is(mode(1,2,3),   2, "call mode - functional interface");

is(variance(1,2,3), 1, "call variance - functional interface");
is(stddev(1,2,3),   1, "call stddev - functional interface");

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


%stats= statshash(2,4,2,4);
ok($stats{variancep}, "call variancep - hash-based interface");
ok($stats{stddevp},   "call stddevp - hash-based interface");

%stats= frequencies(1,2,3,3);
is($stats{1},1, "frequencies matched correctly");
is($stats{2},1, "frequencies matched correctly");
is($stats{3},2, "frequencies matched correctly");
