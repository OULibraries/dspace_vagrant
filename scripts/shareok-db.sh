
. /vagrant/etc/conf.sh



SHAREOK_EXPORT=/vagrant/downloads/shareokprod-20150922-dump.sql



# Remove existing DB and install fresh export
$DSPACE_RUN/bin/dspace database clean
psql -U $DB_NAME -h $DB_HOST $DB_NAME < $SHAREOK_EXPORT

# upgrade shareok db and rebuild indexes
$DSPACE_RUN/bin/dspace database migrate
$DSPACE_RUN/bin/dspace  index-discovery -b
