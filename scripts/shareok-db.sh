
. /vagrant/etc/conf.sh


$DSPACE_RUN/bin/dspace database clean

psql -U $DB_NAME -h $DB_HOST $DB_NAME < /vagrant/downloads/shareokprod-20150922-dump.sql

$DSPACE_RUN/bin/dspace database migrate
