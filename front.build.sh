#!/bin/bash

# Read the value of AREX_VERSION from .env file
if [[ -f .env ]]; then
    source .env
else
    echo "Error: .env file not found. Exiting."
    exit 1
fi

printf "current AREX Version: $AREX_VERSION "

cd ../arex-front-end
cp ../deployments/dockerfile/front.Dockerfile ./Dockerfile
docker build -t arexadmin01/arex:$AREX_VERSION  .  --build-arg http_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 --build-arg https_proxy=http://ntproxy.qa.nt.ctripcorp.com:8080 
rm -rf ./Dockerfile

cd ..
