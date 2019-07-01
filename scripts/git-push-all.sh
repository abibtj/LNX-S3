#!/bin/bash

# Move to the root directory
cd .. 
cd ..

	echo "Enter commit message: "
	read COMMIT_MESSAGE

PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX $PREFIX.ApiGateway $PREFIX.Common $SERVICE.Identity $SERVICE.Registration)

    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Pushing repository: $REPOSITORY to remote server
      echo ========================================================

      cd $REPOSITORY
      git add --all
      git commit -m $COMMIT_MESSAGE
      #git remote add origin https://bitbucket.com/abibtj/$REPOSITORY.git
      git push https://bitbucket.com/abibtj/$REPOSITORY.git
      cd ..
    done
