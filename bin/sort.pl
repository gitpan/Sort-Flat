#!/usr/bin/perl

use strict;
use warnings;

use Sort::Flat qw(sort_f reverse_f);

local $, = "\n";

my @arr = qw(ABC def JKL ghi PQRS mno);

print sort_f @arr;
print "\n\n";
print reverse_f @arr;
print "\n";
