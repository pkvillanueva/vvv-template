#!/usr/bin/env bash

# Provision default template init
PROJECT_REPO=`get_config_value 'project_repo'`
echo -e "\nCloning project repository '${PROJECT_REPO}'"

# Nginx Logs
mkdir -p ${VVV_PATH_TO_SITE}/log
touch ${VVV_PATH_TO_SITE}/log/error.log
touch ${VVV_PATH_TO_SITE}/log/access.log
