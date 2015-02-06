#! /bin/bash

generate_repo_configs.sh

for json in generated/*.json; do
    echo $json
    curl -i -H "Accept: application/json" -H "Content-Type: application/json" -f -X POST -d @$json -u "admin:admin123" "http://172.17.42.1:8081/nexus/service/local/repositories"
done

#curl 'http://localhost:18081/nexus/service/local/repo_groups' -H 'Content-Type: application/json' -H 'accept: application/json' -u 'admin:admin123' -d @repo_group.json
