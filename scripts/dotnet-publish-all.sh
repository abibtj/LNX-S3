#!/bin/bash

# Move to the root directory
cd .. 
cd ..

export ASPNETCORE_ENVIRONMENT=local
PUBLISH=./scripts/dotnet-publish.sh
PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.ApiGateway $SERVICE.Identity $SERVICE.Notification $SERVICE.Record $SERVICE.Registration)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Publishing a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $PUBLISH
     cd ..
done

# Beep to indicate successful compeletion
echo -ne '\007'