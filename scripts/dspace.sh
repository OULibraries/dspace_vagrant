#!/bin/bash

. /vagrant/etc/conf.sh


# make the dspace web app location 
mkdir -p  "$DSPACE_RUN"

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost

# build the dspace install as the vagrant user
cd "$DSPACE_SRC" 
sudo -u vagrant  /vagrant/bin/build.sh

# restart tomcat
systemctl restart tomcat







