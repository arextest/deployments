#!/bin/bash
if [ ! $AREX_VERSION ]
then
  printf "current AREX Version: $AREX_VERSION
  Run shell: export AREX_VERSION=0.2.9 (set arex version)
  or unset AREX_VERSION (unset arex version)
  "
  exit
fi

docker push arexadmin01/arex:$AREX_VERSION
docker push arexadmin01/arex-report:$AREX_VERSION
docker push arexadmin01/arex-storage-serive:$AREX_VERSION
docker push arexadmin01/arex-replay-schedule:$AREX_VERSION
docker push arexadmin01/arex-community-test:0.0.1
