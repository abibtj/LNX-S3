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
      #git remote add origin_$REPOSITORY https://bitbucket.com/abibtj/$REPOSITORY.git
      git remote add origin_$REPOSITORY https://abibtj@bitbucket.org/abibtj/$REPOSITORY.git
	git push origin master
      cd ..
    done
