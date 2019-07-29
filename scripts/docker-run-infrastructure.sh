#!/bin/bash

cd ..
cd compose

	echo ========================================================
		echo "Tearing down running containers (infrastructure)..."
	echo ========================================================

docker-compose -f infrastructure.yml down

	echo ========================================================
		echo "Building new containers..."
	echo ========================================================

docker-compose -f infrastructure.yml up -d

# Beep to indicate successful compeletion
echo -ne '\007'