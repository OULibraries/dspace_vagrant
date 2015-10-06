#
# Load a copy of the SHAREOK db and then upgrade it 
#
. /vagrant/etc/conf.sh



# Remove existing DB and install fresh export
$DSPACE_RUN/bin/dspace database clean
psql -W -U $DB_NAME -h $DB_HOST $DB_NAME < $DB_EXPORT



$DSPACE_RUN/bin/dspace update-discovery-index -b 
