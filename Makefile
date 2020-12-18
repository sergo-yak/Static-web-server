ls -la.DEFAULT: help
.PHONY: start stop

RUN_ARGS=$(filter-out $@,$(MAKECMDGOALS))
DEVOPS_DIR=devops

$(shell cp -n ${DEVOPS_DIR}/.env.dist ${DEVOPS_DIR}/.env)

include ${DEVOPS_DIR}/.env

help:
	@echo ''
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo ''

##Commands:
##start       Start application
start:
	@bash ${DEVOPS_DIR}/scripts/app-start.sh $(APP_NAME) ${DEVOPS_DIR}

##stop        Stop application
stop:
	@bash ${DEVOPS_DIR}/scripts/app-stop.sh $(APP_NAME) ${DEVOPS_DIR}

%: ; @:
