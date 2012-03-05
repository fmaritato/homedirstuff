#!/usr/bin/perl
#############################################################################
# This program will "fix" annoying programming styles automatically so I can
# read the bloody code.
#
# TODO: move the { up a line if possible
# TODO: Get rid of annoying empty lines between last } and EOF
#############################################################################
use strict;
use IO::File;

while (my $line = STDIN->getline()) {
  for ($line) {
    # substitute tabs with space
    s/\t/ /g;

    # Fix the bean get/set badness
    s/\s*{\s*(\w)/ {\n$1/g;
    s/;\s*}/;\n}/g;
    s/([A-Za-z)])\n(\s*){/$1 {/g;

    # fix the no space badness between (){}
    # but take into account vector.size()
    s/(if|for|while|catch)\(/$1 \(/g;
    s/\)\{/\) \{/g;
    s/\}(else)/\}\n$1/g;
    s/(else)\{/$1 \{/g;

    # fix the no space badness between operators
    s/(\w|\))\s*(!=|==)\s*(\w)/$1 $2 $3/g;
    # Don't want to change lines where we are
    # defining variables
    if ($line !~ /(public|private|protected)/) {
      s/(\w)\s*(=)\s*(\w)/$1 $2 $3/g;
    }

    # semi colons
    # TODO: eol problem
    s/(\w)\s*[;]/$1;/g;

    # math operators
    # TODO: There are problems with this...
    # s/(\w)\s*(<|>)\s*(\w*)/$1 $2 $3/g;

    # Fix try{ and }catch annoyances
    s/(\w){/$1 {/g;
    s/}(\w)/}\n$1/g;

    # Reduce lines with only whitespace
    s/^\s+$/\n/;

    # Remove extra spaces before eol
    s/\s+$/\n/;
  }

  print $line;
}
