#!/bin/bash

GREEN="\033[0;32m"
RESET="\033[0m"

# start application
NAME_PREFIX="$1"
DEVOPS_DIR="$2"

# ensure that old containers are removed
echo -e "\n${GREEN}Stopping containers${RESET}"
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX stop
echo -e "\n${GREEN}Removing containers${RESET}"
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX rm -f

# start application
echo -e "\n${GREEN}Building images${RESET}"
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX build --pull
echo -e "\n${GREEN}Starting containers${RESET}"
docker-compose --project-directory ${DEVOPS_DIR} -f ${DEVOPS_DIR}/docker-compose.yml -p $NAME_PREFIX up -d --force-recreate