#!/usr/bin/perl

use strict;

my @tests = `find . -name "*Test.java"`;
my %names;

foreach my $test (@tests) {
  $test =~ m/(.*\/)(.*?).java/;
  my $short = $2;
  my $fully = $1;
  next if ($short =~ /^Base/);
  $fully =~ s#./src/test/##;
  $fully =~ s#/#.#g;
  $fully .= $short;
  $names{$short} = $fully;
}

foreach my $n (sort keys %names) {
  my $short = $n;
  my $fully = $names{$n};
  my $pkg = $fully;
  $pkg =~ s/\.$//;

  print<<EOF
    <configuration default="false" name="$short" type="JUnit" factoryName="JUnit" enabled="false" merge="false">
      <module name="matchmaker" />
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" value="" />
      <option name="PACKAGE_NAME" value="$pkg" />
      <option name="MAIN_CLASS_NAME" value="$fully" />
      <option name="METHOD_NAME" value="" />
      <option name="TEST_OBJECT" value="class" />
      <option name="VM_PARAMETERS" value="-Dlog4j.configuration=file:target/test-classes/log4j.xml" />
      <option name="PARAMETERS" value="" />
      <option name="WORKING_DIRECTORY" value="file://\$PROJECT_DIR\$" />
      <option name="ADDITIONAL_CLASS_PATH" />
      <option name="TEST_SEARCH_SCOPE">
        <value defaultName="wholeProject" />
      </option>
      <RunnerSettings RunnerId="Debug">
        <option name="DEBUG_PORT" value="48653" />
        <option name="TRANSPORT" value="0" />
        <option name="LOCAL" value="true" />
      </RunnerSettings>
      <RunnerSettings RunnerId="JProfiler">
        <option name="WINDOW" value="false" />
        <option name="JVMPI" value="false" />
        <option name="INTERPRETED" value="false" />
      </RunnerSettings>
      <RunnerSettings RunnerId="Run" />
      <ConfigurationWrapper RunnerId="Debug" />
      <ConfigurationWrapper RunnerId="Run" />
      <method>
        <option name="Make" value="true" />
      </method>
    </configuration>
EOF
}
