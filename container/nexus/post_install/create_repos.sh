#! /bin/bash


for json in generated/*.json; do
    echo $json
    curl -i -H "Accept: application/json" -H "Content-Type: application/json" -f -X POST -d @$json -u "admin:admin123" "http://localhost:18081/nexus/service/local/repositories"
done
