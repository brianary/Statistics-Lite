# NAME

Statistics::Lite - Small stats stuff.

# SYNOPSIS

        use Statistics::Lite qw(:all);

        $min= min @data;
        $mean= mean @data;

        %data= statshash @data;
        print "sum= $data{sum} stddev= $data{stddev}\n";

        print statsinfo(@data);

# DESCRIPTION

This module is a lightweight, functional alternative to larger, more complete,
object-oriented statistics packages.
As such, it is likely to be better suited, in general, to smaller data sets.

This is also a module for dilettantes. 

When you just want something to give some very basic, high-school-level statistical values, 
without having to set up and populate an object first, this module may be useful.

## NOTE

This module implements standard deviation and variance calculated by both the unbiased and biased estimators.

# FUNCTIONS

- `min(@data)`, `max(@data)`, `range(@data)`, `sum(@data)`, `count(@data)`

    Return the minimum value, maximum value, range (max - min),
    sum, or count of values in `@data`.
    (Count simply returns `scalar(@data)`. **Please note** that this module does not ignore undefined values in your
    data; instead those are treated as zero.)

- `mean(@data)`, `median(@data)`, `mode(@data)`

    Calculates the mean, median, or mode average of the values in `@data`.
    (In the event of ties in the mode average, their mean is returned.)

- `variance(@data)`, `stddev(@data)`

    Return the standard deviation or variance of `@data` for a sample (same as Excel's STDEV).
    This is also called the Unbiased Sample Variance and involves dividing the 
    sample's squared deviations by N-1 (the sample count minus 1).
    The standard deviation is just the square root of the variance.

- `variancep(@data)`, `stddevp(@data)`

    Return the standard deviation or variance of `@data` for the population (same as Excel's STDEVP).
    This involves dividing the squared deviations of the population by N (the population size).
    The standard deviation is just the square root of the variance.

- `statshash(@data)`

    Returns a hash whose keys are the names of all the functions listed above,
    with the corresponding values, calculated for the data set.

- `statsinfo(@data)`

    Returns a string describing the data set, using the values detailed above.

- `frequencies(@data)`

    Returns a hash, the keys are the distinct values in the data set,
    and the values are the number of times that value occurred in the data set.

## Import Tags

The `:all` import tag imports all functions from this module into the
current namespace (use with caution).
To import the individual statistical funcitons, use the import tag `:funcs`;
use `:stats` to import `statshash(@data)` and `statsinfo(@data)`.

# AUTHOR

Brian Lalonde <brian@webcoder.info>, 
`stddev(@data)`, `stddevp(@data)`, `variance(@data)`, `variancep(@data)`, 
and additional motivation by Nathan Haigh.

The project lives at https://github.com/brianary/Statistics-Lite

# COPYRIGHT AND LICENSE

Copyright 2000 Brian Lalonde <brian@webcoder.info> and Nathan Haigh,
with kind support from Alexander Zangerl.

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

# SEE ALSO

perl(1).
