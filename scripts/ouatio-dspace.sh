#!/bin/bash


#make the dspace web app location 
mkdir -p  /srv/ouatio/
chown dspace:dspace /srv/ouatio/

# point tomcat at the dspace web app location
cp -r /vagrant/etc/Catalina/localhost/*.xml /usr/share/tomcat/conf/Catalina/localhost


# Get the Ouatio DSpace Code
sudo -s -u dspace -- <<EOF

cd /home/dspace/
git clone https://github.com/OULibraries/ouatio_dspace

cd ./ouatio_dspace
mvn -Dmaven.repo.local=/vagrant/m2  package

cd ./dspace/target/dspace-installer
ant fresh_install


EOF



systemctl restart tomcat.service






