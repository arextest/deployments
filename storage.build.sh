#!/bin/bash

# Read the value of AREX_VERSION from .env file
if [[ -f .env ]]; then
    source .env
else
    echo "Error: .env file not found. Exiting."
    exit 1
fi
printf "current AREX Version: $AREX_VERSION "

cd ../arex-storage
mvn clean package -DskipTests

cp ../deployments/dockerfile/storage.Dockerfile ./Dockerfile
docker build -t   arexadmin01/arex-storage-serive:$AREX_VERSION .
rm -rf ./Dockerfile

cd ..
