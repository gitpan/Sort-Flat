#!/usr/bin/perl

use strict;
use warnings;

use Sort::Flat qw(sortf reversef);

$" = ' ';

my (@arr, @sortf, @reversef, $i);

@arr = qw(ABC def JKL ghi PQRS mno);

@sortf = sortf @arr;
@reversef = reversef @arr;

format =
@<<<< @<<<< 
$sortf[$i], $reversef[$i]
.

for ($i = 0; $i < @arr; $i++) { write }
