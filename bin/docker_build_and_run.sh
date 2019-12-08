#!/usr/bin/env bash

export VERSION=${VERSION:-"1.10.3_1"}

./build.sh
docker stop airflow
docker rm airflow
docker run -d -p 8080:8080 \
  --name airflow \
  -e OT_ENV='local' -e OT_ENV_FLAVOR='master' \
  -it docker.otenv.com/dag-airflow:$VERSION
docker exec -i -t airflow /bin/bash
