#!perl
#
# This file is part of Dist-Zilla-Plugin-BumpVersionFromGit
#
# This software is Copyright (c) 2010 by David Golden.
#
# This is free software, licensed under:
#
#   The Apache License, Version 2.0, January 2004
#

use strict;
use warnings;
use lib 't/lib';

use Dist::Zilla::Tester;
use Git::Wrapper;
use Path::Class;
use File::pushd qw/pushd tempd/;
use File::Copy::Recursive qw/dircopy/;

use Test::More 0.88 tests => 6;

# we chdir around so make @INC absolute
BEGIN { 
  @INC = map {; ref($_) ? $_ : dir($_)->absolute->stringify } @INC;
}

# save absolute corpus directory path
my $corpus_dir = dir('corpus/version-regexp')->absolute;

# isolate repo directory from possible git actions from bugs
my $tempd = tempd;

## shortcut for new tester object
sub _new_zilla {
  my $root = shift;
  return Dist::Zilla::Tester->from_config({
    dist_root => $corpus_dir,
  });
}

## Tests start here

my ($zilla, $version);
$zilla = _new_zilla;
# enter the temp source dir and make it a git dir
my $wd = pushd( $zilla->tempdir->subdir('source')->stringify );

system "git init";
my $git   = Git::Wrapper->new('.');
$git->add(".");
$git->commit({ message => 'import' });

# with no tags and no initialization, should get default
$zilla = _new_zilla;
$version = $zilla->version;
is( $version, "0.01", "default is 0.01" ); # set in dist.ini

# initialize it
{
  local $ENV{V} = "1.23";
  $zilla = _new_zilla;
  is( $zilla->version, "1.23", "initialized with \$ENV{V}" );
}

# tag it
$git->tag("release-v1.2.3");
ok( (grep { /release-v1\.2\.3/ } $git->tag), "wrote v1.2.3 tag" );

{
  $zilla = _new_zilla;
  is( $zilla->version, "v1.2.4", "initialized from last tag" );
}

# tag it
$git->tag("release-1.23");
ok( (grep { /release-1\.23/ } $git->tag), "wrote v1.23 tag" );

{
  $zilla = _new_zilla;
  is( $zilla->version, "1.24", "initialized from last tag" );
}


done_testing;
