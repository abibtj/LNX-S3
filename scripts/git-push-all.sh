#!/bin/bash

# Move to the root directory
cd .. 
cd ..

	read -p "Enter a commit message: " COMMIT_MESSAGE

	read -sp "Enter password: " PASSWORD

PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX $PREFIX.ApiGateway $PREFIX.Common $SERVICE.Identity $SERVICE.Record $SERVICE.Registration)

    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Pushing repository: $REPOSITORY to remote server
      echo ========================================================

      cd $REPOSITORY
      git add --all
      git commit -m $COMMIT_MESSAGE
      git push https://abibtj:$PASSWORD@bitbucket.org/abibtj/$REPOSITORY.git --all
      cd ..
    done


# Beep to indicate successful compeletion
echo -ne '\007'