#!/bin/bash
docker images | sed -n '/x86_64/p' | awk '{print $1" "$2" "$3}' > rm-docker.txt 

while read a b c
do
    #echo $c
    #docker rmi  $c
    docker rmi $a:$b
done < rm-docker.txt


docker images | sed -n '/latest/p' | awk '{print $1" "$2" "$3}' > rm-docker.txt

while read a b c
do
    #echo $c
    #docker rmi  $c
    docker rmi $a:$b
done < rm-docker.txt


docker images | awk '{print $1" "$2" "$3}' > rm-docker.txt

while read a b c
do
    #echo $c
    #docker rmi  $c
    docker rmi $a:$b
done < rm-docker.txt

