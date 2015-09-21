# DSpace Server Installation and Setup
. /vagrant/etc/conf.sh








yum install -y postgresql-server
postgresql-setup initdb;


cp /vagrant/etc/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
chown postgres:postgres /var/lib/pgsql/data/pg_hba.conf

systemctl enable postgresql.service
systemctl start  postgresql.service


cat <<EOF | su - postgres -c psql
-- Create the database user:
CREATE USER libacct WITH PASSWORD 'libacct' SUPERUSER;
EOF
