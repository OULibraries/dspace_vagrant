#
# Load a copy of the SHAREOK db and then upgrade it 
#
. /vagrant/etc/conf.sh
SHAREOK_EXPORT=/vagrant/downloads/shareokprod-20150922-dump.sql

# Remove existing DB and install fresh export
$DSPACE_RUN/bin/dspace database clean
psql -U $DB_NAME -h $DB_HOST $DB_NAME < $SHAREOK_EXPORT

# Upgrade Database
$DSPACE_RUN/bin/dspace database migrate

# Remove deprecated Database Browse Tables
$DSPACE_RUN/bin/dspace index-db-browse -f -d

# Delete contents of legacy browse table
cat <<EOF | psql -U $DB_NAME -h $DB_HOST $DBNAME
DELETE FROM COMMUNITIES2ITEM
EOF


# update the discovery index with the new data
$DSPACE_RUN/bin/dspace  index-discovery -b
