use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    DISTNAME     => 'Sort-Flat',
    NAME         => 'Sort::Flat',
    VERSION_FROM => 'lib/Sort/Flat.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 ? 
       (ABSTRACT_FROM => 'lib/Sort/Flat.pm',
        AUTHOR        => 'Steven Schubiger') : ()),
);
