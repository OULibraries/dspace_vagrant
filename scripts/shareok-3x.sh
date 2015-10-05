#
# Load a copy of the SHAREOK db and then upgrade it 
#
. /vagrant/etc/conf.sh

mkdir -p /vagrant/downloads


## maven artifacts and git credentials required to checkout and build
## dspace 3.x stored at https://atmire.com/git/clients/oklahoma
# scp -F /vagrant/etc/ssh_config shareok-prod:/srv/migrate/dotstuff.tar /vagrant/downloads

sudo -u vagrant tar -xovf /vagrant/downloads/dotstuff.tar  -C /home/vagrant
mv /home/vagrant/.m2 /vagrant/m2
