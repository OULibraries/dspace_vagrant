#!/bin/bash
. /vagrant/etc/conf.sh





export PGPASSWORD=$DS_DB_PASS
pg_dump --encoding utf8 -ocv -U "$DS_DB_USER" -h "$DS_DB_HOST"  "$DS_DB" > "$DB_EXPORT"
