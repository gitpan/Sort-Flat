#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

use Sort::Flat qw(sortf reversef);

ok(1, 'use Sort::Flat;');

my (@arr, $sortf, $reversef);
@arr = qw(ABC def JKL ghi PQRS mno);
$sortf = join '', sortf @arr;
$reversef = join '', reversef @arr;

is($sortf, 'ABCdefghiJKLmnoPQRS', 'sortf @array;');
is($reversef, 'PQRSmnoJKLghidefABC', 'reversef @array;');
