#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p 18080:8080 -p 8081:8081 --privileged --name $CONTAINER uport/$CONTAINER
