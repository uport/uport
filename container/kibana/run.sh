#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p  5601:5601 --name $CONTAINER uport/$CONTAINER
