#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

use Sort::Flat;

BEGIN {
    my $PACKAGE = 'Sort::Flat';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}
