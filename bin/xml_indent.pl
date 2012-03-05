#!/usr/bin/perl

use strict;
use IO::File;

while (my $line = STDIN->getline()) {
  for ($line) {
    s/>\s*</>\n</g;
  }
  print $line;
}
