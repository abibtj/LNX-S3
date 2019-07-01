#!/bin/bash

# Move to the root directory
cd .. 
cd ..

BUILD=./scripts/docker-build-local.sh
PREFIX=LNX-S3
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.ApiGateway $SERVICE.Identity $SERVICE.Registration)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a local Docker image: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done