#!/usr/bin/env perl

# specify the --user --password --summary and --description, --assignee
my $ISSUE1=`/home/t/jira-cli/jira.sh --user fmaritato --password 'f@R89?V2' --action createIssue --project LMBRJK --priority 5 --type 1 "@ARGV"`;
if ($ISSUE1 =~ /Issue (.*) created./) {
  $LMBRJK_ISSUE=$1;
} else {
  print "Failed creating LMBRJK issue\n"; exit 1;
}

my $ISSUE2=`/home/t/jira-cli/jira.sh --user fmaritato --password 'f@R89?V2' --action createIssue --project GRID --priority 5 --type 3 "@ARGV"`;
if ($ISSUE2 =~ /Issue (.*) created./) {
  $GRID_ISSUE=$1;
} else {
  print "Failed creating GRID issue\n"; exit 1;
}

my $LINK=`/home/t/jira-cli/jira.sh --user fmaritato --password 'f@R89?V2' --action linkIssue --issue $GRID_ISSUE --toIssue $LMBRJK_ISSUE --link "Blocked by" --comment "For time tracking purposes"`;


