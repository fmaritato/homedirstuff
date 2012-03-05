#!/bin/bash

GROUP=
ARTIFACT=
while getopts g:a: x
do
  case $x in 
    g) GROUP=$OPTARG;;
    a) ARTIFACT=$OPTARG;;
  esac
done

if [ -z "$GROUP" -o -z "$ARTIFACT" ]; then
  echo "Usage: $0 -d <group> -a <artifact>"
  exit 1
fi

mvn archetype:create \
-DarchetypeGroupId=org.apache.struts \
-DarchetypeArtifactId=struts2-archetype-starter \
-DgroupId=$GROUP \
-DartifactId=$ARTIFACT
