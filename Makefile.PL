
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'DEPRECATED -- use Dist::Zilla::Plugin::Git::NextVersion instead',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>',
  'BUILD_REQUIRES' => {
    'Dist::Zilla::Tester' => '0',
    'File::Copy::Recursive' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'File::pushd' => '0',
    'Path::Class' => '0',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Dist-Zilla-Plugin-BumpVersionFromGit',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'Dist::Zilla::Plugin::BumpVersionFromGit',
  'PREREQ_PM' => {
    'Dist::Zilla' => '4',
    'Dist::Zilla::Role::VersionProvider' => '0',
    'Git::Wrapper' => '0',
    'Moose' => '0',
    'Version::Next' => '0',
    'namespace::autoclean' => '0.09',
    'version' => '0.80'
  },
  'VERSION' => '0.008',
  'test' => {
    'TESTS' => 't/*.t'
  }
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



