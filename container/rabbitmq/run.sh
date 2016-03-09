#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p  5672:5672 -p 15672:15672 -p 4369:4369 --name $CONTAINER uport/$CONTAINER
