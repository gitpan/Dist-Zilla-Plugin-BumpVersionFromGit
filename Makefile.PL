
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::BumpVersionFromGit',
                       'DISTNAME' => 'Dist-Zilla-Plugin-BumpVersionFromGit',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'David Golden <dagolden@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'provide a version number by bumping the last git release tag',
                       'EXE_FILES' => [],
                       'VERSION' => '0.001',
                       'PREREQ_PM' => {},
                       'LICENSE' => 'apache'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



