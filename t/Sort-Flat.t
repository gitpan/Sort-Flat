#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

use Sort::Flat qw(sort_f reverse_f);

ok (1, 'use Sort::Flat;');

my (@arr, $sort_f, $reverse_f);
@arr = qw(ABC def JKL ghi PQRS mno);
$sort_f = join '', sort_f @arr;
$reverse_f = join '', reverse_f @arr;

is($sort_f, 'ABCdefghiJKLmnoPQRS', 'sort_f @array;');
is ($reverse_f, 'PQRSmnoJKLghidefABC', 'reverse_f @array;');
