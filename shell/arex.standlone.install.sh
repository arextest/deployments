#!/bin/bash

url="https://github.com/arextest/arex-standalone/releases/latest/download/arex-standalone-all.zip"
curl -L -O $url
unzip arex-standalone-all.zip

current_dir=$(pwd)
echo "Execute AREX Standalone command line:\r\n\t$current_dir/bin/arex-cli.sh "