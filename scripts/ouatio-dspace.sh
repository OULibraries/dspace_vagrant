#!/bin/bash


#make the dspace web app location 
mkdir -p  /srv/ouatio/

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost



# cd ./ouatio_dspace
# mvn -Dmaven.repo.local=/vagrant/m2  package

# cd ./dspace/target/dspace-installer
# ant fresh_install





# systemctl restart tomcat.service






