package Sort::Flat;

$VERSION = '0.17';

use strict;
use Filter::Simple;

FILTER_ONLY
    code => sub { 
        my ($stub) = m#sort\s+(\w+)#; $stub ||= '';
        unless (m#sub\s+$stub# || m#sort\s+(?:\{|=)#) {
            s#sort#sort { lc(\$a) cmp lc(\$b) }#g
	}
    };
    
1;
__END__

=head1 NAME

Sort::Flat - Case-insensitive sort

=head1 SYNOPSIS

Within some code:

 use Sort::Flat;        # case-insensitive
 
 @sorted = sort qw(ABC def JKL ghi PQRS mno);
 
 no Sort::Flat;         # case-sensitive

From the command-line:

 perl -MSort::Flat ./script.pl

=head1 DESCRIPTION

Sort::Flat filters the source for C<sort> at compile time 
and replaces it with its case-insensitive equivalent.
Existing sorts that have attached blocks and subs will 
remain unchanged.

=head1 SEE ALSO

L<Filter::Simple>, L<perlfunc/sort>

=cut
