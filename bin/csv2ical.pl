#!/usr/bin/perl

use strict;
use DateTime;
use Getopt::Long;

my $debug = 0;
# Length of game
my $length = 2;

my $ampm = "([aA].?[mM].?|[pP].?[mM].?)";

my $result = GetOptions (
    'debug'  => \$debug,
    'length' => \$length,
);

print "BEGIN:VCALENDAR\n";
print "VERSION:2.0\n";
print "PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n";

my $round;
my $line = 0;
while (<STDIN>) {
  $line++;
  print $_,"\n" if $debug;
  #my ($round, $game, $home, $away, $date, $time, $field) = split(/,/);
  #my ($date, $time, $home, $away, $field) = split(/,/);
  my ($date, $time, $field, $home, $away) = split(/,/);
  #my ($day, $date, $time, $field, $level, $home, $away) = split(/,/);
  #my ($day, $date, $time, $field, $home, $away) = split(/,/);

  next if $date =~ /^date/i; # Ignore header rows
  next if $round =~ /^round/i;
  next if $date eq ""; # Ignore empty rows

  #chomp $field;
  chomp $away;
  my ($month, $day_of_month, $year) = split(/\//, $date);
  my ($hour, $minute, $ampm) = $time =~ /(\d+):(\d+) $ampm/;
  print "Time:",$time," ",$hour,"\n" if $debug;
  if ($ampm =~ /[pP][mM]/ && $hour ne 12) {
    $hour += 12;
  }

  if ($year < 2000) {
      $year += 2000;
  }
  print "line: ", $line, "\n" if $debug;
  my $dt = DateTime->new(
    year => $year,
    month => $month,
    day => $day_of_month,
    hour => $hour,
    minute => $minute,
    time_zone => 'America/Los_Angeles',
  );
  my $start_time = $dt->strftime("%Y%m%dT%H%M%S");
  my $end_time = $dt->add(hours => $length)->strftime("%Y%m%dT%H%M%S");

  print "BEGIN:VEVENT\n";
  print "DTSTART;TZID=America/Los_Angeles:",$start_time,"\n";
  print "DTEND;TZID=America/Los_Angeles:",$end_time,"\n";
  print "SUMMARY: ", $away, " at ", $home, " (", $field, ")\n";
  print "END:VEVENT\n";

}
print "END:VCALENDAR\n";
