#!/usr/bin/perl

use strict;
use warnings;

use Sort::Flat;

my (@arr, @sort, @reverse, $i);

@arr = qw(ABC def JKL ghi PQRS mno);

@sort = sort @arr;
@reverse = reverse @arr;

format =
@<<<< @<<<< 
$sort[$i], $reverse[$i]
.

for ($i = 0; $i < @arr; $i++) { write }
