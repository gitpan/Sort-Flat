#! /usr/local/bin/perl

use strict;
use warnings;
use Sort::Flat;

use Test::More tests => 2;

BEGIN {
    my $PACKAGE = 'Sort::Flat';
    use_ok($PACKAGE);
}

my @arr = qw(ABC def JKL ghi PQRS mno);
is((join '', sort @arr), 'ABCdefghiJKLmnoPQRS', 'sort @arr;');
