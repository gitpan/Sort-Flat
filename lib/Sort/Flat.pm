# $Id: Flat.pm,v 0.03 2004/01/17 15:30:09 sts Exp $

package Sort::Flat;

use strict 'vars';
use warnings;

our $VERSION = '0.03';

our (%export_ok, %exported, $cmp);

sub import {
    shift;
    if (@_ == 0) {
        require Carp;
	Carp::croak __PACKAGE__, q~ requires arguments~;
    }
    
    $export_ok{sort_f}    = '';
    $export_ok{reverse_f} = '';
    
    my $caller = caller(0);
    while ($_ = shift @_) {
        if (defined $export_ok{$_}) {
            *{$caller."::$_"} = \&{_.$_};
	    $exported{$_} = '';
        }
    	else {
            require Carp;
	    Carp::croak qq~Unknown import $_~;
    	}
    }   
}

sub unimport {
    shift;
    
    @_ = @_ ? @_ : keys %exported;
    
    my $caller = caller(0);
    foreach (@_) {
        if (defined $exported{$_}) { 
	    delete ${$caller.'::'}{$_}; 
	}
	else { 
	    require Carp; 
	    Carp::croak qq~Couldn't unimport $_~; 
        }
    } 
}

sub _sort_f { local $cmp = '+'; &_sort_flat; }
sub _reverse_f { &_sort_flat }

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

 use Sort::Flat qw(sort_f reverse_f);

 @arr1 = qw(ABC def JKL ghi PQRS mno);

 @arr2 = sort_f @arr1;
 @arr2 = reverse_f @arr1;

 no Sort::Flat 'sort_f';

 # will trigger an error
 @arr2 = sort_f @arr1;

=head1 DESCRIPTION

C<Sort::Flat> implements case-insensitive sorting by lowercasering 
items within an array each time an array has to be sorted; 
C<sort_f & reverse_f> are shortcuts to perl's built-in function C<sort>.

C<sort_f> is equivalent to using C<sort {lc($a) cmp lc($b)}>,
while C<reverse_f> is equivalent to using C<sort {lc($b) cmp lc($a)}>.

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
