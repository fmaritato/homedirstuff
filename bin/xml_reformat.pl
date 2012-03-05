#!/usr/bin/perl

use IO::Handle;

my $line;
while (($in = STDIN->getline())) {
  if ($in =~ /<?xml/) {
    print $in;
    next;
  }
  $line .= $in;
}

# Move first attribute to separate line
$line =~ s/(<(.*?)) ((.*?)="(.*?)")/$1\n$3/gm;

# Move all attributes to separate line
$line =~ s/ ((.*?)="(.*?)")/\n$1/gm;

# put closing /> on separate line
$line =~ s/\/>/\n\/>/gm;

# remove all tabs :)
$line =~ s/\t/ /gm;

# remove extraneous empty lines
$line =~ s/\n\n/\n/gm;

# remove all trailing whitespace
$line =~ s/\s+$//gm;

print $line;
