#!/bin/bash



# DSpace Database Installation and Setup
yum install -y postgresql-server
postgresql-setup initdb;


sed -i.bak '/host    all             all             127.0.0.1\/32            ident/ i\host    dspace          dspace          127.0.0.1/32            md5' /var/lib/pgsql/data/pg_hba.conf

systemctl enable postgresql.service
systemctl start  postgresql.service

# Create the dspace db user and database
cat <<EOF | sudo -i -u postgres psql
-- Create the database user:
CREATE USER dspace WITH PASSWORD 'dspace';
EOF

sudo -i -u postgres createdb --username=postgres --owner=dspace --encoding=UNICODE dspace

systemctl restart  postgresql.service


#Drupal Database Installation and Setup





