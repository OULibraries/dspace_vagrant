## Configuration

. ${HOME}/bin/conf.sh


cd $HOME/src
$MAVEN  -Denv=$MAVEN_PROFILE -Dskiptests package
OUT=$?
if [ $OUT -eq 0 ];then
   echo "Maven Update successful"
else
   exit $OUT
fi

cd dspace/target/dspace-*-build
if [ -d $HOME/dspace ];then
        $ANT  -Doverwrite=true update clean_backups
else
        $ANT fresh_install
fi
OUT=$?
if [ $OUT -eq 0 ];then
   echo "ANT Update successful"
else
   exit $OUT
fi
