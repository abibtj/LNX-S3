#!/bin/bash

# Move to the root directory
cd .. 
cd ..

export ASPNETCORE_ENVIRONMENT=local
DOTNET_RUN=./scripts/dotnet-run.sh
PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.ApiGateway $SERVICE.Identity $SERVICE.Record $SERVICE.Registration)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Starting a service: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $DOTNET_RUN &
     cd ..
done