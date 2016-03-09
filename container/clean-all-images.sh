#! /bin/bash
echo "clean all images..."

if [ ! -z $(docker images -q -a) ]
then
 docker rmi $(docker images -q -a)
fi
echo "finished cleaning all images"
