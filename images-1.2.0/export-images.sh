#!/bin/bash
docker images | sed -n '/x86_64/p' | awk '{print $1" "$2" "$3}' > export.txt 

while read a b c
do
   #echo $a
   name=`echo $a | cut -d'/' -f2`
   #echo $name
   #echo $b
   #echo $c
   filename=$name"@"$b"@"$c".tar"
   echo $filename
   docker save $c > $filename
done < export.txt
rm -rf export.txt
