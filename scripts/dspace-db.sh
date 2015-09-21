#!/bin/bash

. /vagrant/etc/conf.sh

# Create the dspace db user and database
# requires interactive run to specify passwords

# createuser --username=$DB_ADMIN --host=$DB_HOST --pwprompt $DB_NAME


cat <<EOF | su - postgres -c psql
-- Create the database user:
CREATE USER $DB_NAME WITH PASSWORD '$DB_PASS';
EOF





createdb   --username=$DB_ADMIN --host=$DB_HOST --owner=$DB_NAME --encoding=UNICODE $DB_NAME
