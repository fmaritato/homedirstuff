#!/usr/bin/perl

use strict;
use DateTime;


print "BEGIN:VCALENDAR\n";
print "VERSION:2.0\n";
print "PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n";

my $line = 0;
while (<STDIN>) {
  $line++;
  my ($date, $time, $field, $home, $away) = split(/,/);
  #my ($day, $date, $time, $field, $level, $home, $away) = split(/,/);
  #my ($day, $date, $time, $field, $home, $away) = split(/,/);
  #next if ($day eq "DAY");

  chomp $away;
  my ($month, $day_of_month, $year) = split(/\//, $date);
  my ($hour, $minute, $ampm) = $time =~ /(\d+):(\d+) (AM|PM)/;
  print $time," ",$hour,"\n";
  if ($ampm eq "PM" && $hour ne 12) {
    $hour += 12;
  }

  print "line: ", $line, "\n";
  my $dt = DateTime->new(
    year => $year+2000,
    month => $month,
    day => $day_of_month,
    hour => $hour,
    minute => $minute,
    time_zone => 'America/Los_Angeles',
  );
  my $start_time = $dt->strftime("%Y%m%dT%H%M%S");
  my $end_time = $dt->add(hours => 1)->strftime("%Y%m%dT%H%M%S");

  print "BEGIN:VEVENT\n";
  print "DTSTART;TZID=America/Los_Angeles:",$start_time,"\n";
  print "DTEND;TZID=America/Los_Angeles:",$end_time,"\n";
  print "SUMMARY: ", $away, " at ", $home, " (", $field, ")\n";
  print "END:VEVENT\n";

}
print "END:VCALENDAR\n";
