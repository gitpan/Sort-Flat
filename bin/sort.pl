#!/usr/bin/perl

use strict;
use warnings;

use Sort::Flat;

my @arr = qw(ABC def JKL ghi PQRS mno);

$, = "\n";
print sort @arr; print "\n";
