#!/usr/bin/env bash

# Provision default template init
PROJECT_REPO=`get_config_value 'project_repo' ''`
DOMAIN=`get_primary_host "${VVV_SITE_NAME}".test`
DOMAINS=`get_hosts "${DOMAIN}"`
DB_NAME=`get_config_value 'db_name' "${VVV_SITE_NAME}"`
DB_NAME=${DB_NAME//[\\\/\.\<\>\:\"\'\|\?\!\*-]/}

# Create database if not exists
echo -e "\nCreating database '${DB_NAME}' (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO wp@localhost IDENTIFIED BY 'wp';"
echo -e "\nDB operations done.\n\n"

# Nginx logs
mkdir -p ${VVV_PATH_TO_SITE}/log
touch ${VVV_PATH_TO_SITE}/log/error.log
touch ${VVV_PATH_TO_SITE}/log/access.log

# Cloning project repository if public html folder not exists
if [[ ! -d "${VVV_PATH_TO_SITE}/public_html" ]] && [[ -n ${PROJECT_REPO} ]]; then
	echo -e "\nProject repository to clone '${PROJECT_REPO}'"
	echo -e "\nCloning project repository inside public_html folder '${VVV_PATH_TO_SITE}'"
	noroot git clone ${PROJECT_REPO} ${VVV_PATH_TO_SITE}/public_html
	echo -e "\nCompleted cloning repository.\n\n"
fi

# Copy nginx template and paste server names into a new file
cp -f "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf.tmpl" "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf"
sed -i "s#{{DOMAINS_HERE}}#${DOMAINS}#" "${VVV_PATH_TO_SITE}/provision/vvv-nginx.conf"
