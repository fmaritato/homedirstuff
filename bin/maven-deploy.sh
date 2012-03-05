#!/bin/bash

GROUP_ID=
ARTIFACT=
VERSION=
FILE=
PKG=jar
REPO=yp_local
URL=http://maven.corp.atti.com:9999/nexus/content/repositories/thirdparty

while getopts "g:a:v:f:p:r:u:h" x
do
  case $x in
    g) GROUP_ID=$OPTARG ;;
    a) ARTIFACT=$OPTARG ;;
    v) VERSION=$OPTARG ;;
    f) FILE=$OPTARG ;;
    p) PKG=$OPTARG ;;
    r) REPO=$OPTARG ;;
    u) URL=$OPTARG ;;
    *) echo "Usage: $0 -g group -a artifact -v version -f file [-p packaging]
    [-r repo_id] [-u url]" && exit 0;;
  esac
done

mvn deploy:deploy-file \
 -DgroupId=${GROUP_ID} \
 -DartifactId=${ARTIFACT} \
 -Dversion=${VERSION} \
 -Dfile=${FILE} \
 -Dpackaging=${PKG} \
 -DrepositoryId=${REPO} \
 -Durl=${URL}

