#!/bin/bash

. ${HOME}/bin/conf.sh

export JAVA_OPTS="-XX:MaxPermSize=256m -Xmx4096m -Xms512m -Dfile.encoding=UTF-8"
export  CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8800,server=y,suspend=n"

${TOMCAT}/bin/startup.sh
