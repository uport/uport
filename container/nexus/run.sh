#! /bin/bash
CONTAINER=$(basename `pwd`)
docker run -d -p 8081:8081 -v /opt/sonatype-work:/opt/sonatype-work --name $CONTAINER uport/$CONTAINER
