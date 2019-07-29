#!/bin/bash

# This script runs the following scripts one after the other

SCRIPTS=( ./dotnet-publish-all.sh 
	  ./docker-build-local-all.sh 
	  ./docker-run-infrastructure.sh 
	  ./docker-run-all-services.sh )

for SCRIPT in ${SCRIPTS[*]}
do
	 echo ========================================================
	 echo Executing script: $SCRIPT
	 echo ========================================================
     
	$SCRIPT
done

# Beep to indicate successful compeletion
echo -ne '\007'