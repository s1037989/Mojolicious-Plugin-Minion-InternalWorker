package Mojolicious::Plugin::Minion::InternalWorker;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

use Mojo::IOLoop;

sub register {
  my ($self, $app) = @_;
  
  return unless $app->can('minion');
  while ( 1 ) {
    Mojo::IOLoop->subprocess(
      sub {
        my $subprocess = shift;
        $app->minion->worker->run;
      },
      sub {
        my ($subprocess, $err, @results) = @_;
        $app->log->error("Restarting worker");
      }
    );
  }
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Minion::InternalWorker - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Minion::InternalWorker');

  # Mojolicious::Lite
  plugin 'Minion::InternalWorker';

=head1 DESCRIPTION

L<Mojolicious::Plugin::Minion::InternalWorker> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Minion::InternalWorker> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<https://mojolicious.org>.

=cut
