# $Id: Flat.pm,v 0.08 2004/01/19 07:48:36 sts Exp $

package Sort::Flat;

use base qw(Exporter);
use strict 'vars';
use warnings;

our $VERSION = '0.08';

our @EXPORT_OK = qw(sortf reversef);

our $cmp;

sub sortf { local $cmp = '+'; &_sort_flat; }
sub reversef { &_sort_flat }

sub _sort_flat {
    no warnings;
    return $cmp eq '+'
      ? sort {lc($a) cmp lc($b)} @_
      : sort {lc($b) cmp lc($a)} @_;
}

1;
__END__

=head1 NAME

Sort::Flat - a case-insensitive sort.

=head1 SYNOPSIS

 use Sort::Flat qw(sortf reversef);

 @arr1 = qw(ABC def JKL ghi PQRS mno);

 @arr2 = sortf @arr1;
 @arr2 = reversef @arr1;

=head1 DESCRIPTION

C<Sort::Flat> implements case-insensitive sorting by lowercasering 
items within an array each time an array has to be sorted; 
C<sortf & reversef> are shortcuts to perl's C<sort>.

C<sortf> is equivalent to using C<sort {lc($a) cmp lc($b)}>,
while C<reversef> is equivalent to using C<sort {lc($b) cmp lc($a)}>.

=head1 EXPORT

C<sortf & reversef> upon request.

=cut

=head1 SEE ALSO

perl(1)

=head1 LICENSE

This program is free software; 
you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Steven Schubiger

=cut
