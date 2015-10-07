#!/bin/bash

# DSpace Server Installation and Setup
. /vagrant/etc/shareok.conf.sh

# Postgresql server already installed 

# create admin user
cat <<EOF | su - postgres -c psql
CREATE USER $DB_ADMIN WITH PASSWORD '$DB_ADMIN_PASS' SUPERUSER;
EOF
