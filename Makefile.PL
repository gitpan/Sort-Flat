use ExtUtils::MakeMaker;

WriteMakefile(
    DISTNAME     => 'Sort-Flat',
    NAME         => 'Sort::Flat',
    VERSION_FROM => 'lib/Sort/Flat.pm',
    PREREQ_PM    => { Filter::Simple => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 ? 
       (ABSTRACT_FROM => 'lib/Sort/Flat.pm',
        AUTHOR        => 'Steven Schubiger') : ()),
);
