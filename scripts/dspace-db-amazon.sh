#!/bin/bash



DB_HOST=
DB_ADMIN=
DB_NAME=

# DSpace Database Installation and Setup
# yum install -y postgresql postgresql-jdbc

yum install http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
yum install -y postgresql94 postgresql94-jdbc



# Create the dspace db user and database
# requires interactive run to specify passwords

createuser --username=$DB_ADMIN --host=$DB_HOST --pwprompt $DB_NAME
createdb   --username=$DB_ADMIN --host=$DB_HOST --owner=$DB_NAME --encoding=UNICODE $DB_NAME




