# $Id: Flat.pm,v 0.16 2004/01/23 16:54:28 sts Exp $

package Sort::Flat;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.16';

use Filter::Simple;

FILTER_ONLY
    code => sub { 
        my ($stub) = /sort\s+(\w+)/;
	no warnings;
        unless (/sub\s+$stub/ || /sort\s+(?:\{|=)/) {
          s#sort#sort { lc(\$a) cmp lc(\$b) }#g
	}
    };
    
1;
__END__

=head1 NAME

Sort::Flat - a case-insensitive sort.

=head1 SYNOPSIS

 use Sort::Flat;        # case-insensitive

 @arr1 = qw(ABC def JKL ghi PQRS mno);

 @arr2 = sort @arr1;
 
 no Sort::Flat;         # case-sensitive

=head1 DESCRIPTION

C<Sort::Flat> filters the source for C<sort> at compile time 
and replaces it with its case-insensitive equivalent.

=cut
