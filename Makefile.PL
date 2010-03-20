
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
                       'VERSION' => '0.003',
                       'PREREQ_PM' => {
                                        'Test::Exception' => '0.290',
                                        'namespace::autoclean' => '0.090',
                                        'version' => '0.800',
                                        'Git::Wrapper' => '0.007',
                                        'Test::More' => '0.88',
                                        'Dist::Zilla' => '1.100711',
                                        'Path::Class' => '0.170',
                                        'Dist::Zilla::Role::VersionProvider' => '1.100711',
                                        'Moose' => '0.990',
                                        'Version::Next' => '0.001'
                                      },
                       'LICENSE' => 'apache'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



