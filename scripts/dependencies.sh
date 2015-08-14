#!/bin/bash


# Create the dspace account
groupadd dspace
useradd -g dspace dspace




# Java, Tomcat and Related Tools

yum install -y java-1.8.0-openjdk maven ant

#cd /vagrant/downloads 
# wget --no-clobber --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
# wget --no-clobber http://apache.osuosl.org//ant/binaries/apache-ant-1.9.6-bin.tar.gz;
# wget --no-clobber http://apache.mirrors.hoobly.com/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz;

# rpm -i jdk-8u45-linux-x64.rpm

# sudo mkdir /opt/apache
# tar -xvzf apache-ant-1.9.6-bin.tar.gz -C /opt/apache/
# tar -xvzf apache-maven-3.3.3-bin.tar.gz -C /opt/apache/

# sudo mkdir /opt/bin
# ln -s /opt/apache/apache-ant-1.9.6/bin/ant /opt/bin/ant
# ln -s /opt/apache/apache-maven-3.3.3/bin/mvn /opt/bin/mvn






# Install the system tomcat 
yum install -y tomcat tomcat-webapps tomcat-admin-webapps 
systemctl enable tomcat.service
systemctl start tomcat


# Database Installation and Setup
yum install -y postgresql-server
postgresql-setup initdb;


sed -i.bak '/host    all             all             127.0.0.1\/32            ident/ i\host    dspace          dspace          127.0.0.1/32            md5' /var/lib/pgsql/data/pg_hba.conf

systemctl enable postgresql.service
systemctl start  postgresql.service

# Create the dspace db user and database
cat <<EOF | sudo -u postgres psql
-- Create the database user:
CREATE USER dspace WITH PASSWORD 'dspace';
EOF

sudo -u postgres createdb --username=postgres --owner=dspace --encoding=UNICODE dspace

systemctl restart  postgresql.service






