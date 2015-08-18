#!/bin/bash

# make the dspace web app location 
mkdir -p  /srv/ouatio/

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost

# build the dspace install as the vagrant user
cd /home/vagrant/ouatio_dspace 
sudo -u vagrant  mvn -Dmaven.repo.local=/vagrant/m2 package

# install the files as root
cd /home/vagrant/ouatio_dspace/dspace/target/dspace-installer
ant fresh_install

#tomcat needs to own folders it will be writing to
sudo chown -R tomcat:tomcat assetstore/ solr/

# restart tomcat
systemctl restart tomcat






