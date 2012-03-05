#!/usr/bin/perl

use strict;
use IO::File;

my $property_file = "$ENV{'HOME'}/projects/work/singles/4.6.WebLogic/ehweb_app/src/conf/default.properties";
my %resources = {};
my %bad_resources = {};

## Load the properties file first
my $prop_fh = new IO::File($property_file, "r");
while (<$prop_fh>) {
  my ($key, $value) = split(/=/);
  if ($key !~ /^#/ && $key !~ /^\s+$/) {
    $resources{$key} = $value;
  }
}

## Go Through all jsp files and check resource keys for existence in the
## properties file.
while (<STDIN>) {
  my $file = $_;
  chomp($file);
  my $fh = new IO::File($file);
  foreach my $line (<$fh>) {
    chomp($line);
    if ($line =~ /altKey="(.*?)"/) {
      my $resource = $1;
      if ($resource =~ /\${/) {
        next;
      }
      if (! defined($resources{$resource})) {
        $bad_resources{$resource} = $file;
      }
    }
  }
}

foreach my $bad (keys %bad_resources){
  print $bad, "(", $bad_resources{$bad}, ")\n";
}


