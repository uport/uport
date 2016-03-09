#! /bin/bash

mkdir -p generated

# repositories

REPO_TIMEOUT=1440
P2_REPOS=()
M2_REPOS=()

while read repo_id repo_url
do
  repoId=(${repo_id//./ })
  REPO_TYPE=${repoId[0]}
  REPO_RELEASE=$(echo ${repoId[1]} | awk '{print toupper($0)}')
  REPO_KEEP=-1  

  if [ $REPO_RELEASE == "SNAPSHOT" ] || [ $REPO_RELEASE == "INT" ]; then
     REPO_KEEP=$REPO_TIMEOUT
  fi

  if [ $REPO_TYPE == "m2" ]; then
    sed -e "s;@REPO_ID@;$repo_id;g" \
        -e "s;@REPO_TIMEOUT@;$REPO_TIMEOUT;g" \
        -e "s;@REPO_KEEP@;$REPO_KEEP;g" \
        -e "s;@REPO_RELEASE@;$REPO_RELEASE;g" \
        -e "s;@REPO_URL@;$repo_url;g" \
        m2-repo-template.json > generated/"$repo_id".json
        M2_REPOS+=($repo_id)
  fi

  if [ $REPO_TYPE == "p2" ]; then
    sed -e "s;@REPO_ID@;$repo_id;g" \
        -e "s;@REPO_TIMEOUT@;$REPO_TIMEOUT;g" \
        -e "s;@REPO_KEEP@;$REPO_KEEP;g" \
        -e "s;@REPO_RELEASE@;$REPO_RELEASE;g" \
        -e "s;@REPO_URL@;$repo_url;g" \
        p2-repo-template.json > generated/"$repo_id".json
        P2_REPOS+=($repo_id)
  fi

done < "repos"

# repository groups
REPO_GROUP_ID="p2.public"
echo $P2_REPOS
for i in $P2_REPOS
do
	echo "{ \"id\": $i }"
done
  

#sed -e "s;@REPO_GROUP_ID@;$REPO_GROUP_ID;g" \
#        -e "s;@REPO_GROUP_REPOS@;$REPO_GROUP_REPOS;g" \
#        repo-group-template.json > generated/"group-repo-$REPO_GROUP_ID".json
