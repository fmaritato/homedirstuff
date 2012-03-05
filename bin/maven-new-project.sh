#!/bin/bash

GROUP=
ARTIFACT=
VERSION=1.0-SNAPSHOT
ARCH_VERSION=1.0.3
while getopts v:g:a: x
do
  case $x in 
    g) GROUP=$OPTARG;;
    a) ARTIFACT=$OPTARG;;
    v) VERSION=$OPTARG;;
  esac
done

if [ -z "$GROUP" -o -z "$ARTIFACT" ]; then
  echo "Usage: $0 -g <group> -a <artifact>"
  exit 1
fi

mvn archetype:create \
-DremoteRepositories=http://maven.corp.atti.com:9999/nexus/content/groups/public \
-DarchetypeGroupId=com.yellowpages.maven \
-DarchetypeArtifactId=yp-archetype \
-DarchetypeVersion=$ARCH_VERSION \
-DgroupId=$GROUP \
-Dversion=$VERSION \
-DartifactId=$ARTIFACT
