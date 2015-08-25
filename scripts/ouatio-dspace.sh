#!/bin/bash

. /vagrant/etc/conf.sh

# Java, Tomcat and Related Tools

yum install -y java-1.8.0-openjdk maven ant
yum install -y tomcat tomcat-webapps tomcat-admin-webapps 

systemctl enable tomcat.service
systemctl start tomcat

# make the dspace web app location 
mkdir -p  /srv/ouatio/

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost

# build the dspace install as the vagrant user
cd /vagrant/ouatio_dspace 
sudo -u vagrant  /vagrant/bin/build.sh

# install the files as root
cd /vagrant/ouatio_dspace/dspace/target/dspace-installer
ant fresh_install

# tomcat needs to write to some folders
chown -R tomcat:tomcat /srv/ouatio/dspace/assetstore/ /srv/ouatio/dspace/solr/ /srv/ouatio/dspace/log

# restart tomcat
systemctl restart tomcat







