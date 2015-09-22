#!/bin/bash

. /vagrant/etc/conf.sh

# Java, Tomcat and Related Tools

yum install -y java-1.8.0-openjdk maven ant
yum install -y tomcat tomcat-webapps tomcat-admin-webapps 

systemctl enable tomcat.service
systemctl start tomcat