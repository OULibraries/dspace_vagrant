# Java Environment 
MAVEN_PROFILE=vagrant
MAVEN=mvn
ANT=ant
TOMCAT=/usr/share/tomcat
export ANT_OPTS="-Xms128m -Xmx800m"


# DSpace Paths
DSPACE_GIT="git@github.com:OULibraries/shareok_dspace"
DSPACE_SRC=/vagrant/shareok_dspace
DSPACE_RUN=/srv/shareok/dspace
DSPACE_DATA="/mnt/shareokdata/5x-assetstore0"

# DSpace Database Configuration
DB_HOST=localhost
DB_ADMIN=libacct
DB_ADMIN_PASS=libacct

# Currently using the same name for user and db 
DB_NAME=dspace
DB_PASS=dspace

DB_EXPORT="/vagrant/downloads/shareok-${MAVEN_PROFILE}-dump.sql"

# Read database config from dspace config
DS_CFG="${DSPACE_RUN}/config/dspace.cfg"
DS_DB_URL=`cat $DS_CFG | grep ^db.url | cut -d "=" -f 2 | xargs`
DS_DB_HOST=`echo $DS_DB_URL | cut -d "/" -f 3 | cut -d ":" -f 1`
DS_DB_PORT=`echo $DS_DB_URL | cut -d "/" -f 3 | cut -d ":" -f 2`
DS_DB=`echo $DS_DB_URL | cut -d "/" -f 4 | xargs`
DS_DB_USER=`cat $DS_CFG | grep ^db.username | cut -d "=" -f 2 | xargs`
DS_DB_PASS=`cat $DS_CFG | grep ^db.password | cut -d "=" -f 2 | xargs`
