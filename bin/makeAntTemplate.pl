#!/usr/bin/perl

use strict;

my($dir,$class)=@ARGV;

print <<"End"
<project name="" default="all">

  <property name="src.path"          value="java" />
  <property name="dest.path"         value="dest" />
  <property name="dest.classes.path" value="${dest.path}/classes" />
  <property name="dest.lib.path"     value="${dest.path}/lib" />
  <property name="jar.path"          value="${dest.lib.path}/" />

  <target name="all" depends="jar" />

  <target name="init">
    <mkdir dir="${dest.path}" />
    <mkdir dir="${dest.classes.path}" />
    <mkdir dir="${dest.lib.path}" />
  </target>

  <target name="compile" depends="init">
    <javac
      srcdir="${src.path}"
      destdir="${dest.classes.path}"
      optimize="on"
      deprecation="true"
      debug="on"
      />
  </target>

  <target name="jar" depends="compile">
    <jar
      destfile="${jar.path}"
      basedir="${dest.classes.path}"
      />
  </target>

  <target name="clean">
    <delete dir="${dest.path}" />
  </target>

</project>
End
