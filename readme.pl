#!/usr/bin/perl
use Pod::Markdown;
open README, '>README.md' or die $!;
print README Pod::Markdown->new->filter('Lite.pm');
close README;
