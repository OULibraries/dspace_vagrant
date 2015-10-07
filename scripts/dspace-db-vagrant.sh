#!/bin/bash

# DSpace Server Installation and Setup
. /vagrant/etc/shareok.conf.sh

# create admin user, and dspace db
cat <<EOF | su - postgres -c psql
CREATE USER $DB_ADMIN WITH PASSWORD $DB_ADMIN_PASS SUPERUSER;
CREATE USER $DB_NAME WITH PASSWORD '$DB_PASS';
CREATE DATABASE $DB_NAME WITH OWNER=$DB_NAME ENCODING='UNICODE'
EOF
