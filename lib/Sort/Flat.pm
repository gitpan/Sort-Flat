# $Id: Flat.pm,v 0.01 2004/01/16 22:53:40 sts Exp $

package Sort::Flat;

use strict 'vars';
use warnings;

our $VERSION = '0.01';

our $cmp;

sub import {
    shift;
    if (@_ == 0) {
        require Carp;
	Carp::croak __PACKAGE__, q~ requires arguments~;
    }
    
    my $caller = caller(0);
    while ($_ = shift @_) {
        if ($_ eq 'sort_f') {
            *{$caller."::$_"} = \&{_."$_"};
        }
   	elsif ($_ eq 'reverse_f') {
            *{$caller."::$_"} = \&{_."$_"};
    	}
    	else {
            require Carp;
	    Carp::croak qq~Unknown import $_~;
    	}
    }   
    
}

sub unimport {
    shift;
    my $caller = caller(0);  
    foreach (@_) { delete ${$caller.'::'}{$_} }
}

sub _sort_f { local $cmp = '+'; &_sort_flat; }
sub _reverse_f { &_sort_flat }

sub _sort_flat {
    no warnings;
    @_ = $cmp eq '+'
      ? sort {lc($a) cmp lc($b)} @_
      : sort {lc($b) cmp lc($a)} @_;

    return @_;
}

1;
__END__

=head1 NAME

Sort::Flat - a case-insensitive sort.

=head1 SYNOPSIS

 use Sort::Flat qw/sort_f reverse_f/;

 @arr1 = qw(ABC def JKL ghi PQRS mno);
 
 @arr2 = sort_f @arr1;
 @arr2 = reverse_f @arr1;
 
 no Sort::Flat 'sort_f';
 
 # will trigger an error
 @arr2 = sort_f @arr1;

=head1 DESCRIPTION

C<Sort::Flat> implements case-insensitive sorting by lowercasering 
items within an array each time an array has to be sorted; 
I<sort_f & reverse_f> are shortcuts to perl's built-in function I<sort>.

I<sort_f> is equivalent to using I<sort {lc($a) cmp lc($b)}>,
while I<reverse_f> is equivalent to using I<sort {lc($b) cmp lc($a)}>.

=head1 EXPORT

Typeglobs C<sort_f & reverse_f> upon request.

=cut

=head1 SEE ALSO

perl(1)

=head1 LICENSE

This program is free software; 
you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Steven Schubiger

=cut
