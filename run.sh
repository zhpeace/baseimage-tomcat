#!/bin/bash


INAME=yuqs/tomcat


docker ps -a |grep yuqs |awk '{print $1 }' |xargs docker rm -f

docker rmi $INAME

docker build -t $INAME .
