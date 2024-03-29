#!/bin/bash

cd ..
cd compose

	echo ========================================================
		echo "Tearing down running containers (services)..."
	echo ========================================================

docker-compose -f services.yml down

	echo ========================================================
		echo "Building new containers..."
	echo ========================================================

docker-compose -f services.yml up

