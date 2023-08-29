#!/bin/bash

printf "\033[32m
Welcome to use AREX. Now Download AREX Agent jar
\033[0m"

agent_url="https://github.com/arextest/deployments/blob/dev/arex-agent-jar/arex-agent-0.3.8.jar"
curl -L -O $agent_url

agent_bootstrap_url="https://github.com/arextest/deployments/blob/dev/arex-agent-jar/arex-agent-bootstrap-0.3.8.jar"
curl -L -O $agent_bootstrap_url

if [ -n "$AREX_API_KEY" ]; then
   printf "\033[34m
   AREX Standalone Config. HOST: $AREX_SITE TOKEN: $AREX_API_KEY VERSION: $AREX_AGENT_MAJOR_VERSION
\033[0m"
else
   printf "\033[34m
   AREX Standalone Config. HOST: arextest.com VERSION: Latest
\033[0m"
fi

echo "arex.service.name=your-service-name" >> arex.agent.conf
echo "arex.storage.service.host=<storage.service.host:port>" >> arex.agent.conf

current_dir=$(pwd)
printf "\033[34m
   Install success.
   1. vim ./arex.agent.conf, update service name and storage service address.
   2. run command
   export JAVA_OPTS=\"-javaagent:$current_dir/arex-agent-0.3.8.jar -Darex.config.path=$current_dir/arex.agent.conf\"
\033[0m"

