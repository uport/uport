#! /bin/bash


for json in generated/*.json; do
   
    REPO_ID=${json#generated/}
    REPO_ID=${REPO_ID%.json}
    echo "deleting repository $REPO_ID"
    curl http://127.0.0.1:8081/nexus/service/local/repositories/$REPO_ID -X DELETE -u "admin:admin123"
done

