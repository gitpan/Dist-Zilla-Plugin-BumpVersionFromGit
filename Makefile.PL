
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::BumpVersionFromGit',
                       'DISTNAME' => 'Dist-Zilla-Plugin-BumpVersionFromGit',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'David Golden <dagolden@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'provide a version number by bumping the last git release tag',
                       'EXE_FILES' => [],
                       'VERSION' => '0.006',
                       'PREREQ_PM' => {
                                        'namespace::autoclean' => '0',
                                        'File::pushd' => '1',
                                        'Git::Wrapper' => '0',
                                        'version' => '0.80',
                                        'Test::More' => '0.88',
                                        'Dist::Zilla' => '2.101170',
                                        'Path::Class' => '0',
                                        'File::Copy::Recursive' => '0',
                                        'Version::Next' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'apache'
                     );


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM}; 
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod}; 
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



