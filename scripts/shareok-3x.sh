#!/bin/bash

# Load a copy of the SHAREOK db and then upgrade it 
. /vagrant/etc/conf.sh

## maven artifacts and git credentials required to checkout and build

sudo -u vagrant tar -xovf /vagrant/downloads/dotstuff.tar  -C /home/vagrant
rsync -rv  /home/vagrant/.m2/  /vagrant/m2
