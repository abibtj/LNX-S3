#!/bin/bash

PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.ApiGateway $SERVICE.Identity $SERVICE.Registration)

if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nUpdating repository: {}\n========================================================\n"; git -C {} checkout develop; git -C {} pull; git -C {} checkout master; git -C {} pull;git -C {} checkout develop;'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Pushing repository: $REPOSITORY to remote server
      echo ========================================================
      cd $REPOSITORY
      git add --all
      git commit -m "Second commit."
      git remote add origin https://bitbucket.com/abibtj/$REPOSITORY.git
      git push origin master
      cd ..
    done
fi