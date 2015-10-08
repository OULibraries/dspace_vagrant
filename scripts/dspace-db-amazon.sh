#!/bin/bash
. /vagrant/etc/conf.sh


# DSpace Client-Only Installation and Setup
yum install http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
yum install -y postgresql94 postgresql94-jdbc

# DB admin account already exists, so don't create it


