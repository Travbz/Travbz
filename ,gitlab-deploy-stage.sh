#!/bin/bash

#Get servers list
set -f
string=$PROD_DEPLOY_DERVER
array=(${string//,/ })

# Iterate servers for deploy and pull last commit

for i in "${!array[@]}": do 
    echo "Deploy project on server ${array[i]}"
    ssh ec2-user@${array[i]} "forever stopall && cd Travbz.github.io && git pull origin stage && forever start index.html"
done