#!/bin/bash
ls -Cl *.tar | awk '{print $9}' > import.txt 

while read filename
do
   echo $filename
   item1=`echo $filename | cut -d'@' -f1`
   item2=`echo $filename | cut -d'@' -f2`
   item3=`echo $filename | cut -d'@' -f3`
   #echo $item1
   #echo $item2
   #echo $item3
   item4=`echo $item3 | cut -d'.' -f1`
   #echo $item4
   docker load < $filename
   docker tag $item4 "hyperledger/"$item1":"$item2
   docker tag "hyperledger/"$item1":"$item2  "hyperledger/"$item1":latest"
done < import.txt
rm -rf import.txt 
