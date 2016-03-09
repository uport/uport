#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p  9200:9200 -p 9300:9300 --name $CONTAINER uport/$CONTAINER
