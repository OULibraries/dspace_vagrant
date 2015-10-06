#!/bin/bash

#
# Load a copy of the SHAREOK db and then upgrade it 
#
. /vagrant/etc/conf.sh

mkdir -p /vagrant/downloads


## maven artifacts and git credentials required to checkout and build
## dspace 3.x stored at https://atmire.com/git/clients/oklahoma
# scp -F shareok-prod:/srv/migrate/* /vagrant/downloads

sudo -u vagrant tar -xovf /vagrant/downloads/dotstuff.tar  -C /home/vagrant
rsync -rv  /home/vagrant/.m2/  /vagrant/m2




