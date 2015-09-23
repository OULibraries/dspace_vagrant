#!/bin/bash

. /vagrant/etc/conf.sh


# make the dspace web app location 
mkdir -p  "$DSPACE_RUN"

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost

# build the dspace install as the vagrant user
cd "$DSPACE_SRC" 
sudo -u vagrant  /vagrant/bin/build.sh

# install the files as root
cd "$DSPACE_SRC"/dspace/target/dspace-installer
ant fresh_install

# tomcat needs to write to some folders
mkdir -p "$DSPACE_RUN"/assetstore "$DSPACE_RUN"/solr "$DSPACE_RUN"/log
chown -R tomcat:tomcat "$DSPACE_RUN"

# restart tomcat
systemctl restart tomcat







