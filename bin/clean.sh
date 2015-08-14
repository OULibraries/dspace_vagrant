## Configuration


. ${HOME}/bin/conf.sh


export ANT_OPTS="-Xms128m -Xmx800m"


cd $HOME/src
$MAVEN  -Denv=$MAVEN_PROFILE -Dskiptests clean 
OUT=$?
if [ $OUT -eq 0 ];then
   echo "Maven clear  successful"
else
   exit $OUT
fi

