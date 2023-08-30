# Testing
# !/bin/bash
# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.arextest.com/).
# Copyright 2023 arextest.

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
Welcome to use AREX Standalone.
\033[0m"

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

url="https://github.com/arextest/arex-standalone/releases/latest/download/arex-standalone-all.zip"
curl -L -O $url
unzip arex-standalone-all.zip

if [ -n "$AREX_API_KEY" ]; then
   printf "\033[34m
   AREX Standalone Config. HOST: $AREX_SITE TOKEN: $AREX_API_KEY VERSION: $AREX_AGENT_MAJOR_VERSION
\033[0m"
else
   printf "\033[34m
   AREX Standalone Config. HOST: arextest.com VERSION: Latest
\033[0m"
fi

current_dir=$(pwd)
printf "\033[34m
   Install success.
   Execute AREX Standalone command line
     cd $current_dir/arex-standalone-all
     chmod 700 ./arex-cli.sh 
     ./arex-cli.sh 
   OR
     cd ./arex-standalone-all 
     chmod 700 ./arex-cli.sh 
     ./arex-cli.sh 
\033[0m"

# if [ "$systemdaemon_install" = false ]; then
#     printf "\033[32m
# If you ever want to stop the Agent, please use the AREX Agent App or
# the launchctl command. It will start automatically at login.
# \033[0m"
# else
#     printf "\033[32m
# If you ever want to stop the Agent, please use the the launchctl command.
# The Agent will start automatically at system startup.
# \033[0m"
# fi

