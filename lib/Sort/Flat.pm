# $Id: Flat.pm,v 0.13 2004/01/22 22:13:26 sts Exp $

package Sort::Flat;

use 5.006;
use base qw(Exporter);
use strict;
use warnings;

our $VERSION = '0.13';

use Filter::Simple;

FILTER_ONLY
    executable => sub { 
        s#\s+sort\s+#sort {lc(\$a) cmp lc(\$b)}#g if m#\s+sort\s+#;
	s#\s+reverse\s+#sort {lc(\$b) cmp lc(\$a)}#g if m#\s+reverse\s+#;
    };
    
1;
__END__

=head1 NAME

Sort::Flat - a case-insensitive sort.

=head1 SYNOPSIS

 use Sort::Flat;        # case-insensitive

 @arr1 = qw(ABC def JKL ghi PQRS mno);

 @arr2 = sort @arr1;
 @arr2 = reverse @arr1;
 
 no Sort::Flat;         # case-sensitive

=head1 DESCRIPTION

C<Sort::Flat> filters the source for C<sort> and C<reverse>
at compile time and replaces them with their case-insensitive 
equivalents.

=cut
