#!/bin/bash

# Stop and remove containers
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

docker container prune -f
docker system prune -f
docker image prune -a -f
docker volume prune -f

