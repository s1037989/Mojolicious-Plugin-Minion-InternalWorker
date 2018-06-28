use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Minion::Worker',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Minion/Worker.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '7.85'},
  test         => {TESTS => 't/*.t'}
);
