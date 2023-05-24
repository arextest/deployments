#!/bin/bash

# Read the value of AREX_VERSION from .env file
if [[ -f .env ]]; then
    source .env
else
    echo "Error: .env file not found. Exiting."
    exit 1
fi
printf "current AREX Version: $AREX_VERSION "

cd ../arex-report
mvn clean package -DskipTests

cp ../deployments/dockerfile/report.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex-report:$AREX_VERSION  .
rm -rf ./Dockerfile

cd ..
