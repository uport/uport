#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p  514:514 -p 5043:5043 -p 9292:9292 --name $CONTAINER uport/$CONTAINER
