#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p 8081:8081 --name $CONTAINER uport/$CONTAINER
