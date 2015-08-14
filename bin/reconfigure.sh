## Configuration

. ${HOME}/bin/conf.sh


cd $HOME/src/dspace/target/dspace-*-build
if [ -d $HOME/dspace ];then
        $ANT  -Doverwrite=true update clean_backups
else
    echo "CAN'T RECONFIGURE, no dspace install dir"
fi
OUT=$?
if [ $OUT -eq 0 ];then
   echo "ANT Update successful"
else
   exit $OUT
fi
