#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=2 sw=2 tw=0:
# vim: set expandtab:

package Rex::Virtualization::Docker::destroy;

use 5.010001;
use strict;
use warnings;

our $VERSION = '9999.99.99_99'; # VERSION

use Rex::Logger;
use Rex::Helper::Run;

sub execute {
  my ( $class, $arg1, %opt ) = @_;

  unless ($arg1) {
    die("You have to define the container ID!");
  }

  my $dom = $arg1;
  Rex::Logger::debug("destroying container $dom");

  unless ($dom) {
    die("VM $dom not found.");
  }

  i_run "docker kill \"$dom\"", fail_ok => 1;
  if ( $? != 0 ) {
    die("Error destroying container $dom");
  }

}

1;

