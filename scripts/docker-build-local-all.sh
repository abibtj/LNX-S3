#!/bin/bash

# Move to the root directory
cd .. 
cd ..

BUILD=./scripts/docker-build-local.sh
PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.ApiGateway $SERVICE.Identity $SERVICE.Notification $SERVICE.Record $SERVICE.Registration $PREFIX.WebUI.cBlazor $PREFIX.WebUI.sBlazor)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a local Docker image: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done

# Beep to indicate successful compeletion
echo -ne '\007'