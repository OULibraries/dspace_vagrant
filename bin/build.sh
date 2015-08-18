## Configuration

. /vagrant/bin/conf.sh


cd ${DSPACE_SRC}
$MAVEN -Dmaven.repo.local=/vagrant/m2 -Dmirage2.on=true -Denv=$MAVEN_PROFILE -Dskiptests package
OUT=$?
if [ $OUT -eq 0 ];then
   echo "Maven Update successful"
else
   exit $OUT
fi

cd ${DSPACE_SRC}/dspace/target/dspace-installer
if [ -d ${DSPACE_RUN} ];then
        sudo $ANT  -Doverwrite=true update clean_backups
else
        sudo $ANT fresh_install
fi
OUT=$?
if [ $OUT -eq 0 ];then
   echo "ANT Update successful"
else
   exit $OUT
fi


sudo chown -R tomcat:tomcat ${DSPACE_RUN}/assetstore/ ${DSPACE_RUN}/solr/
