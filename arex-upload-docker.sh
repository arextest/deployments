#!/bin/bash

# Read the value of AREX_VERSION from .env file
if [[ -f .env ]]; then
    source .env
    printf "current AREX Version: $AREX_VERSION "
else
    echo "Error: .env file not found. Exiting."
    exit 1
fi

docker push arexadmin01/arex:$AREX_VERSION
docker push arexadmin01/arex-report:$AREX_VERSION
docker push arexadmin01/arex-storage-serive:$AREX_VERSION
docker push arexadmin01/arex-replay-schedule:$AREX_VERSION
# docker push arexadmin01/arex-community-test:0.0.1
