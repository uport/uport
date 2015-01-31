#! /bin/bash

REPO_ID=$1

curl http://127.0.0.1:18081/nexus/service/local/repositories/$REPO_ID -X DELETE -u "admin:admin123"

echo "deleted repository $REPO_ID"
