#
# Load a copy of the SHAREOK db and then upgrade it 
#
. /vagrant/etc/conf.sh

mkdir -p /vagrant/downloads


# maven artifacts and git credentials required to checkout and build
# dspace 3.x stored at https://atmire.com/git/clients/oklahoma
scp shareok-prod:/srv/migrate/dotstuff.tar /vagrant/downloads
sudo -u vagrant tar -xvf /srv/migrate/dotstuff.tar  -C /home/vagrant

# Remove existing DB and install fresh export
$DSPACE_RUN/bin/dspace database clean
psql -U $DB_NAME -h $DB_HOST $DB_NAME < $DB_EXPORT
