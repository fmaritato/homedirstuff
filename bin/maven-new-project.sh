#!/bin/bash

GROUP=
ARTIFACT=
VERSION=1.0.0.0-SNAPSHOT
ARCH_VERSION=1.1
while getopts v:g:a: x
do
  case $x in 
    g) GROUP=$OPTARG
      ;;
    a) ARTIFACT=$OPTARG
      ;;
    v) VERSION=$OPTARG
      ;;
    r) ARCH_VERSION=$OPTARG
      ;;
  esac
done

if [ -z "$GROUP" -o -z "$ARTIFACT" ]; then
  echo "Usage: $0 -g <group> -a <artifact>"
  exit 1
fi

mvn archetype:generate                         \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DarchetypeVersion=$ARCH_VERSION             \
  -DinteractiveMode=false                      \
  -DgroupId=$GROUP                             \
  -DartifactId=$ARTIFACT                       \
  -Dversion=$VERSION
