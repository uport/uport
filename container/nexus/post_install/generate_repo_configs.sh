#! /bin/bash

mkdir -p generated

REPO_TIMEOUT=1440

while read repo_id repo_url
do
  repoId=(${repo_id//./ })
  REPO_TYPE=${repoId[0]}
  REPO_RELEASE=$(echo ${repoId[1]} | awk '{print toupper($0)}')
  REPO_KEEP=-1  

  if [ $REPO_RELEASE == "SNAPSHOT" ]; then
     REPO_KEEP=$REPO_TIMEOUT
  fi

  if [ $REPO_TYPE == "m2" ]; then
    sed -e "s;@REPO_ID@;$repo_id;g" \
        -e "s;@REPO_TIMEOUT@;$REPO_TIMEOUT;g" \
        -e "s;@REPO_KEEP@;$REPO_KEEP;g" \
        -e "s;@REPO_RELEASE@;$REPO_RELEASE;g" \
        -e "s;@REPO_URL@;$repo_url;g" \
        m2-repo-template.json > generated/"$repo_id".json
  fi
done < "repos"
