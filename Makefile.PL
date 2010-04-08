
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
                       'VERSION' => '0.005',
                       'PREREQ_PM' => {
                                        'namespace::autoclean' => '0',
                                        'File::pushd' => '1',
                                        'Git::Wrapper' => '0',
                                        'version' => '0.80',
                                        'Dist::Zilla::Tester' => '2',
                                        'Test::More' => '0.88',
                                        'Dist::Zilla' => '2',
                                        'Dist::Zilla::Role::VersionProvider' => '2',
                                        'Path::Class' => '0',
                                        'File::Copy::Recursive' => '0',
                                        'Version::Next' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'apache'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



