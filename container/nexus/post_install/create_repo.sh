#! /bin/bash

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -f -X POST  -v -d @input.json -u "admin:admin123" "http://localhost:18081/nexus/service/local/repositories"
