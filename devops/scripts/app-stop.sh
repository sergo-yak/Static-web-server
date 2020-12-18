#!/bin/bash

NAME_PREFIX="$1"
DEVOPS_DIR="$2"

# ensure that old containers are removed
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX stop
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX down -v
