# !/bin/bash

# AREX Agent install script for macOS/linux.
set -e
install_script_version=0.1.0
dmg_file=/tmp/arex-agent.dmg
dmg_base_url="https://s3.amazonaws.com/arex-agent"
etc_dir=/opt/arex-agent/etc
log_dir=/opt/arex-agent/logs
run_dir=/opt/arex-agent/run
service_name="com.arex.agent"
systemwide_servicefile_name="/Library/LaunchDaemons/${service_name}.plist"

printf "\033[32m
Welcome to use AREX in macPro.
\033[0m"

# Check if Docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Error: Docker is not installed." >&2
  exit 1
fi

# Check if Docker Compose is installed
if ! [ -x "$(command -v docker compose)" ]; then
  echo "Error: Docker Compose is not installed." >&2
  exit 1
fi

if [ -n "$AREX_REPO_URL" ]; then
    dmg_base_url=$AREX_REPO_URL
fi

upgrade=
if [ -n "$AREX_UPGRADE" ]; then
    upgrade=$AREX_UPGRADE
fi

# Root user detection
if [ "$(echo "$UID")" = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi

apikey=
if [ -n "$AREX_API_KEY" ]; then
    apikey=$AREX_API_KEY
fi

site=
if [ -n "$AREX_SITE" ]; then
    site=$AREX_SITE
fi

printf "\033[32m
Download AREX Install files:
1. Docker-compose.yaml  
2. .env (config version file)
3. 
\033[0m"
env_url="https://raw.githubusercontent.com/arextest/deployments/main/.env"
curl -L -O $env_url

initjs_url="https://raw.githubusercontent.com/arextest/deployments/main/mongo-allone-init.js"
curl -L -O $initjs_url

yaml_url="https://raw.githubusercontent.com/arextest/deployments/main/docker-compose.yml"
curl -L -O $yaml_url

if [ -n "$AREX_API_KEY" ]; then
   printf "\033[34m
   AREX Config. HOST: $AREX_SITE TOKEN: $AREX_API_KEY VERSION: $AREX_AGENT_MAJOR_VERSION
\033[0m"
else
   printf "\033[34m
   AREX Config. HOST: arextest.com VERSION: Latest
\033[0m"
fi

current_dir=$(pwd)
printf "\033[34m
   Install success......
   Start arex-service: docker compose up -d 
   Stop  arex-service: docker compose down -v 
\033[0m"
