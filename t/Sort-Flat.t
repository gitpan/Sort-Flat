#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

use Sort::Flat;

BEGIN {
    my $PACKAGE = 'Sort::Flat';
    use_ok($PACKAGE);
}

my @arr = qw(ABC def JKL ghi PQRS mno);
is((join '', sort @arr), 'ABCdefghiJKLmnoPQRS', 'sort @arr;');
